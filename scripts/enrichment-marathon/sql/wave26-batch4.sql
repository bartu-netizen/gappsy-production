-- Enrichment marathon batch: Spectrum 2, Speechify, Spellbook, Spendesk, Sphinx, SpiceDB, Spike, Spinify

-- ── Spectrum 2 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Spectrum 2 is a free, open-source instant-messaging transport and gateway that lets an XMPP server bridge conversations with other messaging networks. It is unrelated to the different Spectrum community-chat platform that GitHub acquired and later shut down.$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Spectrum 2: Open-Source XMPP IM Transport Gateway$q$, seo_title),
  seo_meta_description = COALESCE($q$Spectrum 2 is a free, open-source instant-messaging transport that bridges XMPP servers with other IM networks. Self-hosted, C++ based, no licensing fees.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Spectrum 2 (spectrum.im) is a free, open-source instant-messaging transport and gateway software project originally developed by Jan Kaluža. It allows an XMPP (Jabber) server to bridge and exchange messages with other, otherwise incompatible instant-messaging networks by acting as a protocol translation layer, historically supporting networks such as ICQ, AIM, MSN, Gadu-Gadu, IRC, and SIMPLE. The project is hosted on GitHub under the SpectrumIM organization, is written primarily in C++ and C, and is distributed as free, self-hosted software rather than a commercial SaaS product. As of its last tracked release (version 2.2.1, mid-2023), the project has a modest but long-running open-source footprint of several hundred GitHub stars and roughly 90 forks, with development activity slowing in recent years. Important disambiguation: Spectrum 2 at spectrum.im is a completely different product from the consumer-facing Spectrum community-chat and forum platform (spectrum.chat, built by withspectrum), which GitHub acquired in December 2018 and shut down, moving to read-only in August 2021 in favor of GitHub Discussions. Anyone evaluating spectrum.im today should treat it as a niche, self-hosted developer tool for IM protocol bridging, not as an active consumer community platform, and should independently verify current maintenance status before adopting it for production use.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4c2a0403-bded-465c-89d4-44577324f0fc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4c2a0403-bded-465c-89d4-44577324f0fc' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '4c2a0403-bded-465c-89d4-44577324f0fc';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$XMPP transport and gateway$q$, $q$Bridges an XMPP (Jabber) server with other instant-messaging networks so users can chat across platforms.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Gateway and server modes$q$, $q$Can be deployed either as a lightweight gateway bridging a single network or as a fuller server-mode deployment.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Modular frontends and backends$q$, $q$Separates the client-facing frontend protocol from the backend network integration, making it extensible.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Docker installation support$q$, $q$Documented Docker-based setup simplifies self-hosted deployment.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Open-source codebase$q$, $q$Source is publicly available on GitHub under the SpectrumIM organization for inspection and modification.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Self-hosted control$q$, $q$Operators run and manage their own instance, keeping message routing and data under their own infrastructure.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '4c2a0403-bded-465c-89d4-44577324f0fc';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Free and open source with no licensing cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Self-hosted, giving operators full control over infrastructure and data$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Modular frontend and backend design supports multiple IM networks$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Long project history dating back over a decade$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '4c2a0403-bded-465c-89d4-44577324f0fc';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Not the same product as the GitHub-acquired Spectrum community chat platform, which can cause confusion$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Recent development activity appears to have slowed, with the last tracked release in mid-2023$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Requires self-hosting and technical setup rather than offering a managed cloud option$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Limited modern documentation and community support compared to newer messaging infrastructure tools$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '4c2a0403-bded-465c-89d4-44577324f0fc';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Is Spectrum 2 the same as the Spectrum community chat platform GitHub acquired$q$, $q$No. Spectrum 2 at spectrum.im is an open-source XMPP instant-messaging transport and gateway. The separate Spectrum community-chat and forum platform at spectrum.chat was built by a different team, acquired by GitHub in 2018, and shut down in 2021. They only share a name.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Is Spectrum 2 free to use$q$, $q$Yes. Spectrum 2 is free, open-source software that you self-host; there is no vendor subscription fee.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$What does Spectrum 2 actually do$q$, $q$It acts as a transport and gateway that lets an XMPP server exchange messages with users on other, otherwise incompatible instant-messaging networks.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Is Spectrum 2 actively maintained$q$, $q$Public release history shows its most recent tracked version was 2.2.1 in mid-2023, suggesting slower recent development activity. Anyone considering it for production should verify current maintenance status directly on the project's GitHub repository.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$What programming language is Spectrum 2 written in$q$, $q$The codebase is primarily C++ and C, with smaller amounts of Python, Objective-C++, and Lua.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Do I need my own server to use Spectrum 2$q$, $q$Yes. Spectrum 2 is self-hosted software that runs alongside an XMPP server rather than a hosted cloud service.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Who created Spectrum 2$q$, $q$It originated from work by developer Jan Kaluža and is maintained as an open-source project under the SpectrumIM organization on GitHub.$q$, 6, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '4c2a0403-bded-465c-89d4-44577324f0fc';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Bridging legacy IM networks to XMPP$q$, $q$Organizations running an XMPP server can use Spectrum 2 to let users reach contacts on other IM networks without switching clients.$q$, $q$Self-hosted messaging administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Open-source messaging infrastructure experimentation$q$, $q$Developers exploring protocol bridging or building on XMPP infrastructure can study or extend Spectrum 2's modular transport architecture.$q$, $q$Developers and open-source contributors$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Privacy-focused, self-hosted chat federation$q$, $q$Teams that want to avoid third-party hosted chat platforms can run Spectrum 2 to federate messaging under their own infrastructure control.$q$, $q$Privacy-conscious IT teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '4c2a0403-bded-465c-89d4-44577324f0fc';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Open Source$q$, $q$Free$q$, $q$N/A (self-hosted)$q$, NULL, $q$["Full source code access","Self-hosted deployment","Gateway and server modes","Docker installation support"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '4c2a0403-bded-465c-89d4-44577324f0fc';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$overview$q$, $q$What Is Spectrum 2$q$, 2, ARRAY[$q$Spectrum 2 is an open-source instant-messaging transport and gateway. It sits alongside an XMPP (Jabber) server and translates messages so that users on one network can communicate with contacts on other, otherwise incompatible IM networks. It began life as the original Spectrum transport built by developer Jan Kaluža and was later rewritten as Spectrum 2 to support a more modular set of frontends and backends.$q$, $q$This is a self-hosted, developer-oriented open-source project rather than a hosted consumer product. It is distributed through GitHub under the SpectrumIM organization and is documented at spectrum.im.$q$, $q$Disambiguation is important here: Spectrum 2 (spectrum.im) should not be confused with the separate Spectrum community chat and forum platform (spectrum.chat) built by the withspectrum team, which GitHub acquired in 2018 and subsequently shut down, moving the service to read-only in August 2021. The two products share only a name; they were built by different teams for different purposes.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Spectrum 2 functions as an XMPP frontend paired with pluggable backends for different IM networks, letting a self-hosted XMPP server exchange messages with users on other systems. It supports both gateway mode and server mode deployment, Docker-based installation for easier setup, and a modular architecture that separates the frontend (how clients connect) from the backend (which network is being bridged).$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Spectrum 2 is free, open-source software with no licensing fee. Because it is self-hosted, adopters bear their own infrastructure and maintenance costs rather than paying a subscription to a vendor.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Speechify ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Speechify is an AI text-to-speech app that converts text, PDFs, articles, and documents into natural-sounding spoken audio, built to help people read faster and support learners with dyslexia.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Premium from $11.58/month billed annually)$q$, starting_price),
  founded_year = COALESCE(2017, founded_year),
  company_size = COALESCE($q$51-200 employees$q$, company_size),
  headquarters = COALESCE($q$Miami, Florida, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Speechify Review: Pricing, Features and How It Works$q$, seo_title),
  seo_meta_description = COALESCE($q$Speechify turns text, PDFs, and articles into natural AI speech. Compare free vs Premium pricing, features, and use cases in this in-depth guide.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Speechify is an AI-powered text-to-speech application that converts written content such as PDFs, web articles, ebooks, and documents into natural-sounding spoken audio. It was founded in 2017 by Cliff Weitzman, who built the product after struggling with dyslexia himself, and the company is headquartered in Miami, Florida, operating largely as a distributed team of roughly 150 to 190 employees. Speechify offers a free plan with 10 robotic-sounding voices at up to 1.5x speed, and a Premium plan priced at $29 per month billed monthly or roughly $11.58 per month ($139 per year) billed annually, unlocking 1,000-plus natural-sounding voices, 60-plus languages, listening speeds up to 5x, AI summaries and chat, voice typing dictation, AI podcast creation, and integrations with Google Drive, Dropbox, and Microsoft OneDrive. Beyond the core reading app, Speechify also sells separate product lines: Speechify Studio for AI voiceover and dubbing production (credit-based pricing starting around $19 per month), an Audiobooks subscription, and a developer API for embedding AI voices into other applications. Speechify is commonly used by students, professionals, and people with dyslexia or ADHD who want to consume written content by listening rather than reading, and it is available as a mobile app, browser extension, and desktop application.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6ef381d0-f2eb-4c4f-bf13-583a63f2091b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6ef381d0-f2eb-4c4f-bf13-583a63f2091b' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '6ef381d0-f2eb-4c4f-bf13-583a63f2091b';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$AI text-to-speech narration$q$, $q$Converts PDFs, articles, documents, and photos of text into natural-sounding spoken audio.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$1,000-plus natural voices$q$, $q$Premium subscribers can choose from a large library of natural-sounding AI voices across 60-plus languages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Adjustable playback speed$q$, $q$Listen at up to 5x speed on Premium, helping users consume content faster than by reading.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$AI summaries and chat$q$, $q$Generates summaries of long content and lets users ask questions about what they are reading or listening to.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Voice typing dictation$q$, $q$Lets users write by speaking, using AI-powered voice-to-text dictation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$AI podcast creation$q$, $q$Turns written content into natural-sounding AI-generated podcast-style audio.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Cloud storage integrations$q$, $q$Connects with Google Drive, Dropbox, and Microsoft OneDrive to import documents directly.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Cross-platform availability$q$, $q$Available as a mobile app, browser extension, and desktop application.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '6ef381d0-f2eb-4c4f-bf13-583a63f2091b';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Generous free tier for casual users to test the product$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Large natural-voice library and broad language support on Premium$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Useful accessibility tool for dyslexia, ADHD, and visual reading fatigue$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Additional AI features like summaries, chat, and voice typing add value beyond basic narration$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Available across mobile, browser extension, and desktop$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '6ef381d0-f2eb-4c4f-bf13-583a63f2091b';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Free plan is limited to robotic-sounding voices and slower playback speeds$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Premium, Studio, and Audiobooks are separate paid products, which can be confusing to compare$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Monthly pricing is notably higher than the discounted annual rate$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Voice quality and accuracy can vary by language and content type$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '6ef381d0-f2eb-4c4f-bf13-583a63f2091b';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$What is Speechify used for$q$, $q$Speechify converts written text such as PDFs, articles, documents, and ebooks into natural-sounding spoken audio so users can listen instead of read.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Is Speechify free$q$, $q$Yes, Speechify offers a free plan with 10 basic voices at up to 1.5x speed. A Premium subscription unlocks natural voices, more languages, and additional AI features.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$How much does Speechify Premium cost$q$, $q$Speechify Premium costs $29 per month billed monthly, or about $11.58 per month when billed annually at $139 per year.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Who founded Speechify$q$, $q$Speechify was founded in 2017 by Cliff Weitzman, who built the app after struggling with dyslexia.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Is Speechify good for people with dyslexia$q$, $q$Yes, Speechify was originally built to help people with dyslexia and similar reading challenges consume written content by listening rather than reading.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Does Speechify support multiple languages$q$, $q$The Premium plan supports 60-plus languages with natural-sounding AI voices.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$What is the difference between Speechify Premium and Speechify Studio$q$, $q$Premium is for everyday reading and listening to text content, while Studio is a separate product for creating AI voiceovers and dubbing for video and audio production, priced separately on a credit basis.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Where is Speechify headquartered$q$, $q$Speechify is headquartered in Miami, Florida, and operates largely as a distributed team.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '6ef381d0-f2eb-4c4f-bf13-583a63f2091b';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Faster reading and studying$q$, $q$Students and professionals use Speechify to listen to textbooks, articles, and documents at increased speed to save time.$q$, $q$Students and knowledge workers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Accessibility for dyslexia and ADHD$q$, $q$People with reading-related conditions use Speechify to consume written content by listening, reducing reading fatigue.$q$, $q$People with dyslexia, ADHD, or low vision$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Content creator voiceovers$q$, $q$Creators use the related Speechify Studio product to generate AI voiceovers and dubbing for videos and podcasts.$q$, $q$Content creators and video producers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '6ef381d0-f2eb-4c4f-bf13-583a63f2091b';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["10 basic voices","Up to 1.5x playback speed","Core text-to-speech reading"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$Premium$q$, $q$$29/month (or ~$11.58/month billed annually at $139/year)$q$, $q$Monthly or annual$q$, NULL, $q$["1,000-plus natural voices","60-plus languages","Up to 5x playback speed","AI summaries and chat","Voice typing dictation","AI podcast creation","Google Drive, Dropbox, and OneDrive integrations"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '6ef381d0-f2eb-4c4f-bf13-583a63f2091b';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$overview$q$, $q$What Is Speechify$q$, 2, ARRAY[$q$Speechify is a text-to-speech platform that converts written content, including PDFs, web pages, Google Docs, emails, and ebooks, into natural-sounding spoken audio. The core promise is to let people listen to text rather than read it, whether to save time, multitask, or work around a reading-related condition such as dyslexia.$q$, $q$Founder Cliff Weitzman created Speechify after struggling with dyslexia in college, building an app that reads any text aloud in a natural voice. The company is headquartered in Miami, Florida, and operates with a largely distributed team.$q$, $q$Speechify has grown beyond a single reading app into a family of products, including Speechify Premium for everyday reading and listening, Speechify Studio for AI voiceover and video dubbing, an Audiobooks subscription, and a developer API for embedding its voice technology into other software.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Speechify's core app scans and reads text from PDFs, web articles, documents, and even photos of printed pages, using natural AI voices across dozens of languages. Premium unlocks faster playback speeds, AI-generated summaries, an AI chat assistant that can answer questions about the content being read, voice typing for dictation, AI podcast generation, and cloud storage integrations.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6ef381d0-f2eb-4c4f-bf13-583a63f2091b', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Speechify offers a free plan limited to 10 basic voices and 1.5x playback speed. The Premium plan costs $29 per month billed monthly, or about $11.58 per month ($139 billed annually) when paid yearly, and includes 1,000-plus natural voices, 60-plus languages, up to 5x playback speed, and the full suite of AI features. Speechify Studio and Speechify Audiobooks are priced and billed separately from the core Premium reading plan.$q$]::text[], 2);


-- ── Spellbook ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Spellbook is an AI-powered contract drafting and review copilot for lawyers, delivered as a Microsoft Word add-in that flags risks, suggests redlines, and benchmarks clauses against thousands of contract examples.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2021, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$Toronto, Ontario, Canada$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Spellbook: AI Contract Drafting and Review for Lawyers$q$, seo_title),
  seo_meta_description = COALESCE($q$Spellbook is an AI copilot inside Microsoft Word for contract drafting, redlining, and review. See features, pricing, and FAQs for legal teams.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Spellbook is an AI-powered legal technology product that helps lawyers draft, review, and redline contracts directly inside Microsoft Word. Originally launched by the company Rally in 2022 and now operating under the brand Spellbook (spellbook.com, previously spellbook.legal), the company was founded in 2021 and is headquartered in Toronto, Ontario, Canada, with a team in the roughly 11-50 employee range. Spellbook works as a Word add-in that drafts and redlines clauses, benchmarks contract language against a large dataset of comparable agreements, flags risky or unusual terms, and lets legal teams build and enforce custom playbooks across contract review. It is used by thousands of legal teams worldwide, including both law firms and in-house legal departments, and the company reports its product is trusted by over 4,500 legal teams. Spellbook does not publish standard self-serve pricing; instead, pricing is based on the number of licensed users and is provided through a custom quote after a demo, with a 7-day free trial available for lawyers evaluating the tool. The product emphasizes enterprise-grade security and compliance, including SOC 2 Type II certification and GDPR and CCPA compliance, along with zero data retention options for law firms and legal departments handling sensitive contract data.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4518f944-7168-437d-a54e-83df3dc6c03e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4518f944-7168-437d-a54e-83df3dc6c03e' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '4518f944-7168-437d-a54e-83df3dc6c03e';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$AI contract drafting$q$, $q$Generates and suggests contract language directly inside Microsoft Word based on context and instructions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$AI-assisted redlining$q$, $q$Suggests and applies redline edits to incoming or existing contracts to speed up review cycles.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Clause benchmarking$q$, $q$Compares contract language against a large dataset of comparable clauses to flag unusual or risky terms.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Multi-document review$q$, $q$Reviews multiple related contracts at once for consistency across a deal or portfolio.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Custom playbooks$q$, $q$Lets legal teams encode their own negotiation standards so the AI applies firm- or company-specific preferences.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Microsoft Word integration$q$, $q$Works as a native add-in inside Word so lawyers do not have to leave their existing drafting environment.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Enterprise security and compliance$q$, $q$SOC 2 Type II certified with GDPR and CCPA compliance, plus zero data retention options.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Team training and support$q$, $q$Offers group training sessions and dedicated support for larger legal teams.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '4518f944-7168-437d-a54e-83df3dc6c03e';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Works inside Microsoft Word rather than requiring a separate platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Clause benchmarking against a large contract dataset helps catch unusual terms$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Custom playbooks let teams enforce their own standards automatically$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$SOC 2 Type II, GDPR, and CCPA compliance suit sensitive legal work$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Adopted broadly across both law firms and in-house legal teams$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '4518f944-7168-437d-a54e-83df3dc6c03e';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Pricing is not publicly listed and requires a custom quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Best suited to Word-based workflows, less useful for teams on other document platforms$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$AI-suggested language still requires attorney review before use$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Enterprise-tier commitments have reportedly required longer minimum terms$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '4518f944-7168-437d-a54e-83df3dc6c03e';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$What is Spellbook used for$q$, $q$Spellbook is an AI copilot for lawyers that drafts, redlines, and reviews contracts directly inside Microsoft Word.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$How much does Spellbook cost$q$, $q$Spellbook does not publish fixed pricing. Cost is based on the number of licensed users and is provided as a custom quote after a demo.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Does Spellbook offer a free trial$q$, $q$Yes, Spellbook offers a 7-day free trial for lawyers and legal teams, with extended trials sometimes available for larger organizations.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Is Spellbook a standalone application or a Word add-in$q$, $q$Spellbook runs as an add-in inside Microsoft Word rather than as a separate standalone application.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Who is Spellbook designed for$q$, $q$Spellbook is designed for transactional lawyers at law firms and in-house legal departments who draft and review contracts.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Is Spellbook secure for confidential legal documents$q$, $q$Spellbook is SOC 2 Type II certified and GDPR and CCPA compliant, and offers zero data retention agreements for sensitive contract data.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Where is Spellbook headquartered$q$, $q$Spellbook is headquartered in Toronto, Ontario, Canada.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$How many legal teams use Spellbook$q$, $q$Spellbook reports being used by over 4,500 legal teams worldwide.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '4518f944-7168-437d-a54e-83df3dc6c03e';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Faster contract drafting$q$, $q$Lawyers use Spellbook to generate first-draft contract language and clauses directly in Word, reducing drafting time.$q$, $q$Transactional lawyers at law firms$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Contract review and risk flagging$q$, $q$In-house legal teams use Spellbook to review incoming vendor or customer contracts and flag risky or non-standard terms.$q$, $q$In-house legal and general counsel teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Standardizing negotiation positions$q$, $q$Legal teams build custom playbooks in Spellbook so the AI consistently applies the organization's preferred contract language across deals.$q$, $q$Legal operations and contract management teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '4518f944-7168-437d-a54e-83df3dc6c03e';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Law Firms$q$, $q$Custom quote$q$, $q$Per licensed user$q$, NULL, $q$["Spellbook Suite (Word add-in)","Group training sessions","Online customer support","Dedicated support for teams over 10 users"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$In-House Teams$q$, $q$Custom quote$q$, $q$Per licensed user$q$, NULL, $q$["Spellbook Suite (Word add-in)","Team training sessions and online support","Playbook build service","Dedicated support for teams over 10 users"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '4518f944-7168-437d-a54e-83df3dc6c03e';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$overview$q$, $q$What Is Spellbook$q$, 2, ARRAY[$q$Spellbook is an AI copilot for contract work that runs as an add-in inside Microsoft Word. It helps lawyers draft new contract language, redline existing agreements, and review incoming contracts faster by suggesting edits and flagging risk directly in the document a lawyer is already working in.$q$, $q$The company was founded in 2021 in Toronto, Canada, and launched its product in 2022. It has since become one of the more widely adopted AI tools in legal technology, reporting adoption by thousands of legal teams across law firms and in-house departments worldwide.$q$, $q$Spellbook's approach centers on staying inside the lawyer's existing workflow, Microsoft Word, rather than requiring lawyers to move contract work into a separate platform.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Spellbook drafts and redlines contract language, benchmarks clauses against a large library of comparable contract types, and reviews multiple documents at once for consistency and risk. Legal teams can build custom playbooks that encode their own negotiation positions and standards so the AI applies firm- or company-specific preferences automatically during review.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Spellbook does not list fixed self-serve pricing on its website. Pricing is based on the number of team members licensed and is provided as a custom quote after booking a demo. A 7-day free trial is available for lawyers and legal teams who want to evaluate the product before committing, with extended trials sometimes available for larger organizations.$q$]::text[], 2);


-- ── Spendesk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Spendesk is an all-in-one spend management platform that combines company cards, expense reimbursements, invoice payments, budgets, and approval workflows in a single system.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2016, founded_year),
  company_size = COALESCE($q$201-500 employees$q$, company_size),
  headquarters = COALESCE($q$Paris, France$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$German$q$]::text[],
  seo_title = COALESCE($q$Spendesk: All-in-One Spend Management Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Spendesk combines company cards, expenses, invoices, and budgets into one spend management platform. See features, plans, and pricing details.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Spendesk is a French spend management platform that unifies company cards, expense reimbursements, invoice payments, budget tracking, and approval workflows into one system for finance teams. It was founded in 2016 out of the Paris-based startup studio eFounders by Rodolphe Ardant, Guilhem Bellion, and Jordane Giuly, and it is headquartered in Paris, France, with additional offices in London, Berlin, Hamburg, and San Francisco. As of 2026 the company employs roughly 300 people across Europe, North America, and Asia. Spendesk targets mid-market and enterprise finance and operations teams that need to control and automate company spending, offering unlimited physical and virtual cards, receipt automation via OCR, real-time budget monitoring, multi-entity workflows, SSO and SAML integration, and optional add-on modules for procure-to-pay and accounts payable automation. Pricing is not publicly listed; Spendesk uses a two-part model combining a fixed monthly subscription fee for platform access with a variable, transaction-based fee for card purchases, invoice payments, and expense claims, and prospective customers must request a custom quote. The company has raised over 300 million dollars in funding and reported a 2025 valuation of roughly 1.5 billion dollars, with 2025 annual recurring revenue of about 52 million dollars.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7ba07fd5-6473-4fc4-82ad-f56d8e4becca';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7ba07fd5-6473-4fc4-82ad-f56d8e4becca' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '7ba07fd5-6473-4fc4-82ad-f56d8e4becca';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Company cards$q$, $q$Issues unlimited physical and virtual cards for employee and team spending with built-in controls.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Expense reimbursements$q$, $q$Automates employee expense claims and reimbursement workflows.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Invoice payments$q$, $q$Manages supplier invoice approval and payment in the same platform as card and expense spend.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Real-time budgets$q$, $q$Tracks spending against department or project budgets in real time.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Receipt OCR automation$q$, $q$Automatically captures and processes receipt data to reduce manual expense entry.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Multi-entity workflows$q$, $q$Supports companies operating across multiple legal entities or countries with unified controls.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$SSO and SAML integration$q$, $q$Connects with enterprise identity providers for centralized access management.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Procure-to-pay and AP add-ons$q$, $q$Optional modules extend the platform into purchase requisitions and accounts payable automation.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '7ba07fd5-6473-4fc4-82ad-f56d8e4becca';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Combines cards, expenses, invoices, and budgets in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Real-time budget visibility helps finance teams control spend proactively$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Multi-entity support suits companies operating across several countries$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Strong European fintech presence with local compliance experience$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Optional add-ons let companies scale up functionality as needed$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '7ba07fd5-6473-4fc4-82ad-f56d8e4becca';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Pricing is not published and requires contacting sales for a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Transaction-based variable fees can make total cost harder to predict$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Some advanced workflow and integration features are gated behind higher-tier add-ons$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Primarily built for mid-market and larger companies rather than very small businesses$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '7ba07fd5-6473-4fc4-82ad-f56d8e4becca';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$What is Spendesk used for$q$, $q$Spendesk is used by finance teams to manage company cards, expense reimbursements, invoice payments, and budgets in one platform.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$How much does Spendesk cost$q$, $q$Spendesk does not publish fixed pricing. It combines a fixed monthly subscription fee with variable transaction-based fees, and pricing is provided as a custom quote.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$When was Spendesk founded$q$, $q$Spendesk was founded in 2016 within the Paris-based startup studio eFounders.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Where is Spendesk headquartered$q$, $q$Spendesk is headquartered in Paris, France, with additional offices in London, Berlin, Hamburg, and San Francisco.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Does Spendesk support multiple countries or entities$q$, $q$Yes, Spendesk offers multi-entity workflows for companies operating across multiple legal entities or countries.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Does Spendesk offer physical and virtual cards$q$, $q$Yes, Spendesk issues unlimited physical and virtual company cards with built-in spend controls.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Is Spendesk suitable for small businesses$q$, $q$Spendesk is primarily positioned for mid-market and enterprise finance teams rather than very small businesses, though smaller teams can still use its Foundations plan.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Does Spendesk integrate with accounting or ERP systems$q$, $q$Spendesk offers HR and ERP integrations as part of its Business tier add-ons, along with SSO and SAML support.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '7ba07fd5-6473-4fc4-82ad-f56d8e4becca';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Centralizing company card spending$q$, $q$Finance teams issue and control physical and virtual cards for employees and departments through a single dashboard.$q$, $q$Finance and operations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Automating expense and invoice workflows$q$, $q$Companies use Spendesk to automate expense reimbursement and supplier invoice approval and payment.$q$, $q$Accounts payable and finance operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Multi-entity spend control$q$, $q$Enterprises with several legal entities or country operations use Spendesk to standardize spend policy and budgets across the group.$q$, $q$Enterprise finance teams and CFOs$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '7ba07fd5-6473-4fc4-82ad-f56d8e4becca';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Foundations$q$, $q$Custom quote$q$, $q$Monthly subscription plus variable transaction fees$q$, NULL, $q$["Unlimited cards and users","Spend controls and approvals","Receipt OCR automation"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Business$q$, $q$Custom quote$q$, $q$Monthly subscription plus variable transaction fees$q$, NULL, $q$["Advanced workflows","Multi-entity management","HR and ERP integrations","AI-based automation"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Procure-to-Pay add-on$q$, $q$Custom quote$q$, $q$Add-on to base plan$q$, NULL, $q$["Purchase requisition workflows","Supplier and purchase order management"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$Accounts Payable add-on$q$, $q$Custom quote$q$, $q$Add-on to base plan$q$, NULL, $q$["Invoice approval automation","AP payment workflows"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '7ba07fd5-6473-4fc4-82ad-f56d8e4becca';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$overview$q$, $q$What Is Spendesk$q$, 2, ARRAY[$q$Spendesk is a spend management platform built to give finance teams a single system for controlling how a company spends money. It combines company payment cards, expense reimbursement, supplier invoice payment, budget management, and approval workflows rather than treating each of those as a separate tool.$q$, $q$The company was founded in 2016 within the Paris startup studio eFounders and is headquartered in Paris, France, with offices in London, Berlin, Hamburg, and San Francisco. Spendesk has grown into a mid-sized European fintech company with roughly 300 employees as of 2026.$q$, $q$Spendesk is primarily aimed at mid-market and enterprise finance teams that need better visibility and control over company spending across multiple departments, entities, or countries.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Spendesk provides unlimited physical and virtual company cards, automated receipt capture with OCR, real-time budget monitoring, multi-entity spend workflows for companies with several legal entities, and SSO and SAML integration for enterprise identity management. Optional add-on modules extend the platform into procure-to-pay and accounts payable automation.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7ba07fd5-6473-4fc4-82ad-f56d8e4becca', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Spendesk does not publish fixed pricing. The platform uses a two-part pricing model: a fixed monthly subscription fee for access to the chosen platform plan, plus a variable fee based on transaction volume such as card purchases, invoice payments, and expense claims. Businesses must request a custom quote tailored to their size and usage.$q$]::text[], 2);


-- ── Sphinx ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Sphinx is a free, open-source documentation generator originally built for the Python project that turns reStructuredText or Markdown source files into HTML, PDF, and other output formats.$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2007, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Sphinx: Open-Source Python Documentation Generator$q$, seo_title),
  seo_meta_description = COALESCE($q$Sphinx is a free, open-source documentation generator used for Python's official docs and countless technical projects. Learn features and use cases.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Sphinx is a free, open-source documentation generator originally created in 2007 by Georg Brandl, a longtime core developer of the Python programming language, to replace the ad hoc scripts and LaTeX toolchain that had produced Python's official documentation. Sphinx is written in Python and released under the BSD 2-Clause license, with copyright held collectively by the Sphinx team and current maintainers including Adam Turner and Takeshi Komiya. It takes documentation source written primarily in reStructuredText (with support for Markdown via extensions) and compiles it into HTML, PDF, ePub, and other output formats, with particular strength in cross-referencing, multi-format output, and generating API reference documentation automatically from Python docstrings through its autodoc extension. Sphinx remains the documentation tool that produces Python's own official docs and is widely used across the Python ecosystem and beyond for technical, API, and software documentation, powering many projects hosted on Read the Docs. As an open-source project rather than a company, Sphinx has no pricing, no headquarters, and no employee count; it is maintained by a volunteer community and distributed for free via PyPI and GitHub.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a5b8e104-a176-4bca-a581-3d1e42859374';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a5b8e104-a176-4bca-a581-3d1e42859374' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'a5b8e104-a176-4bca-a581-3d1e42859374';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$reStructuredText and Markdown support$q$, $q$Authors documentation primarily in reStructuredText, with Markdown support available through extensions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Autodoc for API references$q$, $q$Automatically generates API documentation from Python docstrings via the autodoc extension.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Multi-format output$q$, $q$Compiles source documentation into HTML, PDF, ePub, and other formats from a single source.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Cross-referencing system$q$, $q$Links pages, modules, and external projects together with a built-in cross-reference system.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Extensible architecture$q$, $q$Supports a large ecosystem of extensions and themes to customize behavior and appearance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Read the Docs integration$q$, $q$Widely supported by hosting platforms such as Read the Docs for building and publishing documentation automatically.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'a5b8e104-a176-4bca-a581-3d1e42859374';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Completely free and open source under the permissive BSD license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Powers Python's own official documentation, proving long-term reliability$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Strong autodoc support for generating API references from code$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Large extension and theme ecosystem for customization$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Well integrated with Read the Docs and CI-based documentation pipelines$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'a5b8e104-a176-4bca-a581-3d1e42859374';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$reStructuredText syntax has a learning curve compared to plain Markdown$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Initial setup and configuration can be more involved than simpler documentation tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$No official commercial support channel since it is a volunteer-maintained project$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Primarily oriented toward Python projects, though usable more broadly$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'a5b8e104-a176-4bca-a581-3d1e42859374';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$What is Sphinx used for$q$, $q$Sphinx is used to generate technical and API documentation from source text, compiling it into formats such as HTML and PDF.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Is Sphinx free$q$, $q$Yes, Sphinx is free, open-source software released under the BSD 2-Clause license.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Who created Sphinx$q$, $q$Sphinx was created in 2007 by Georg Brandl, a core Python developer, to replace Python's earlier documentation toolchain.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Does Sphinx support Markdown$q$, $q$Sphinx's primary markup language is reStructuredText, but Markdown is supported through extensions such as MyST.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Is Sphinx only for Python projects$q$, $q$Sphinx was originally built for Python's documentation but is used across many languages and types of technical documentation.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$What is Sphinx autodoc$q$, $q$Autodoc is a Sphinx extension that automatically generates API reference documentation from Python docstrings.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Does Sphinx work with Read the Docs$q$, $q$Yes, Sphinx is widely supported by Read the Docs and other documentation hosting platforms for automated building and publishing.$q$, 6, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'a5b8e104-a176-4bca-a581-3d1e42859374';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Python project documentation$q$, $q$Open-source and commercial Python projects use Sphinx to produce official documentation and API references.$q$, $q$Python library and framework maintainers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Automated API reference generation$q$, $q$Development teams use Sphinx's autodoc extension to keep API documentation in sync with code docstrings.$q$, $q$Software engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Multi-format technical publishing$q$, $q$Technical writers use Sphinx to produce documentation in HTML for the web and PDF or ePub for offline distribution from a single source.$q$, $q$Technical writers and documentation teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'a5b8e104-a176-4bca-a581-3d1e42859374';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Open Source$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full source access under BSD 2-Clause license","reStructuredText and Markdown support","Autodoc API generation","Multi-format output (HTML, PDF, ePub)"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'a5b8e104-a176-4bca-a581-3d1e42859374';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$overview$q$, $q$What Is Sphinx$q$, 2, ARRAY[$q$Sphinx is an open-source documentation generator originally built in 2007 by Georg Brandl, a core Python developer, to replace the informal scripts and LaTeX-based toolchain that had produced Python's official documentation up to that point.$q$, $q$Sphinx takes structured source text, primarily written in reStructuredText, and compiles it into polished output formats such as HTML, PDF, and ePub. It has become the de facto standard documentation tool across much of the Python ecosystem and is also used for documentation in other languages and projects.$q$, $q$The project is licensed under the permissive BSD 2-Clause license and maintained by a community of contributors known collectively as the Sphinx team, with maintainers including Adam Turner and Takeshi Komiya.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Sphinx supports reStructuredText as its primary markup language, with Markdown support available through extensions such as MyST. Its autodoc extension can automatically generate API reference documentation directly from Python docstrings, and its cross-referencing system lets documentation link cleanly across pages, modules, and external projects.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Sphinx is completely free and open source. There is no paid tier, subscription, or license fee; it is distributed via PyPI and can be installed and used without restriction under the BSD 2-Clause license.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── SpiceDB ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$SpiceDB is an open-source, Google Zanzibar-inspired database for storing and querying fine-grained authorization and permissions data, built and maintained by AuthZed.$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free (open source); managed Cloud from $2/hour$q$, starting_price),
  founded_year = COALESCE(2020, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$New York, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SpiceDB: Open-Source Authorization Database by AuthZed$q$, seo_title),
  seo_meta_description = COALESCE($q$SpiceDB is an open-source, Zanzibar-inspired permissions database from AuthZed. Compare self-hosted vs managed Cloud pricing and key features.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SpiceDB is an open-source database purpose-built for storing and querying fine-grained authorization and permissions data, modeled on the design described in Google's internal Zanzibar authorization system paper. It is developed and maintained by AuthZed, a company founded in 2020 by engineers who previously worked at CoreOS and Red Hat, headquartered in New York with a team in the roughly 11-50 employee range. SpiceDB is fully open source under the Apache 2.0 license and free to self-host, letting engineering teams model complex permission relationships, such as role-based, relationship-based, and attribute-based access control, and query them at scale with strong consistency guarantees. AuthZed monetizes SpiceDB through a managed product line rather than the open-source core: AuthZed Cloud is a self-service, pay-as-you-go option starting around $2 per hour for a managed permissions system, while Dedicated and Self-Hosted enterprise tiers are sold on custom, quote-based annual contracts with premium support, dedicated account teams, and private or multi-region deployment options. SpiceDB is used by companies building AI applications, SaaS platforms, and other systems that need centralized, auditable, and scalable authorization logic instead of hardcoding permission checks into application code, and it competes most directly with the CNCF project OpenFGA as one of the two leading Zanzibar-style open-source authorization systems.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ce745a19-20cd-4b81-bc11-a6593524a8d1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ce745a19-20cd-4b81-bc11-a6593524a8d1' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ce745a19-20cd-4b81-bc11-a6593524a8d1';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Zanzibar-inspired permissions model$q$, $q$Models authorization as relationships between users and resources, following the design principles of Google's Zanzibar paper.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Fine-grained access control$q$, $q$Supports role-based, relationship-based, and attribute-based access control patterns in one system.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Strong consistency guarantees$q$, $q$Provides consistency controls so permission checks reflect the latest authorization state when needed.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Schema-driven permissions$q$, $q$Lets teams define authorization logic declaratively in a schema rather than hardcoding it into application code.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Open-source core$q$, $q$Fully open source under Apache 2.0, free to self-host and inspect.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Managed Cloud option$q$, $q$AuthZed Cloud offers pay-as-you-go managed infrastructure so teams do not have to operate SpiceDB themselves.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Dedicated and Self-Hosted enterprise tiers$q$, $q$Offers private, multi-region deployments and enterprise support for regulated or large-scale organizations.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$AI agent permissions tooling$q$, $q$AuthZed has extended the ecosystem with tools like SpiceBox and spicedb-dev aimed at adding permissions for AI coding agents.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'ce745a19-20cd-4b81-bc11-a6593524a8d1';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Fully open source and free to self-host under Apache 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Based on a proven design pattern from Google's Zanzibar system$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Supports multiple access control models in a single system$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Managed Cloud option removes the operational burden of self-hosting$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Backed by a company with deep authorization and infrastructure engineering experience$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'ce745a19-20cd-4b81-bc11-a6593524a8d1';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Enterprise Self-Hosted and Dedicated tiers require custom, quote-based pricing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Schema-driven permissions modeling has a learning curve for teams new to relationship-based access control$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Self-hosting requires operational expertise to run reliably at scale$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Smaller company size relative to larger identity and access management vendors$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'ce745a19-20cd-4b81-bc11-a6593524a8d1';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$What is SpiceDB used for$q$, $q$SpiceDB is used to store and evaluate fine-grained authorization and permissions data for applications, replacing hardcoded permission logic with a centralized, queryable system.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Is SpiceDB free$q$, $q$Yes, the open-source core of SpiceDB is free to self-host under the Apache 2.0 license. AuthZed also sells managed Cloud, Dedicated, and Self-Hosted enterprise options.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Who makes SpiceDB$q$, $q$SpiceDB is developed and maintained by AuthZed, a company founded in 2020 and headquartered in New York.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$What is Zanzibar and how does it relate to SpiceDB$q$, $q$Zanzibar is the authorization system Google described in an engineering paper. SpiceDB is an open-source database inspired by that design for modeling permissions as relationships.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$How much does AuthZed Cloud cost$q$, $q$AuthZed Cloud is a pay-as-you-go managed offering starting at around $2 per hour, with premium and enterprise support tiers available.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$What access control models does SpiceDB support$q$, $q$SpiceDB supports role-based, relationship-based, and attribute-based access control patterns within a single permissions system.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$What is a competitor to SpiceDB$q$, $q$OpenFGA, a CNCF project, is one of the other leading open-source, Zanzibar-inspired authorization systems and a direct alternative to SpiceDB.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Can SpiceDB be self-hosted$q$, $q$Yes, SpiceDB can be self-hosted for free using the open-source release, or run through AuthZed's paid Self-Hosted enterprise license with support.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ce745a19-20cd-4b81-bc11-a6593524a8d1';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Centralizing application permissions$q$, $q$Engineering teams use SpiceDB to move authorization logic out of scattered application code into a centralized, queryable permissions system.$q$, $q$Backend and platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Fine-grained SaaS access control$q$, $q$SaaS companies use SpiceDB to model complex, multi-tenant permission structures such as team, project, and document-level access.$q$, $q$SaaS product engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Authorization for AI agents and applications$q$, $q$Teams building AI-powered applications use SpiceDB and related AuthZed tooling to govern what data and actions AI agents are permitted to access.$q$, $q$AI application developers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'ce745a19-20cd-4b81-bc11-a6593524a8d1';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Open Source$q$, $q$Free$q$, $q$N/A (self-hosted)$q$, NULL, $q$["Apache 2.0 licensed","Community support via Discord and GitHub","Full self-hosting capability"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$AuthZed Cloud$q$, $q$From $2/hour$q$, $q$Pay-as-you-go$q$, NULL, $q$["Managed infrastructure","Cloud control plane with workload isolation","Standard support","Self-service resource management"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Self-Hosted (Enterprise)$q$, $q$Custom quote$q$, $q$Annual license$q$, NULL, $q$["Enterprise self-managed deployment","Professional support","Dedicated account team"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Dedicated Cloud$q$, $q$Custom quote$q$, $q$Annual, resource-based$q$, NULL, $q$["Private infrastructure","Multi-region deployments","Premium support","Dedicated account team"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'ce745a19-20cd-4b81-bc11-a6593524a8d1';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$overview$q$, $q$What Is SpiceDB$q$, 2, ARRAY[$q$SpiceDB is an open-source database designed specifically for storing and evaluating authorization and permissions data. Its design is inspired by Zanzibar, the internal authorization system Google described in a widely cited engineering paper, which models permissions as relationships between users and resources rather than as scattered if-statements in application code.$q$, $q$SpiceDB is built and maintained by AuthZed, founded in 2020 by a team that previously worked on CoreOS and at Red Hat. The company is headquartered in New York and describes itself as building authorization infrastructure for AI and modern applications.$q$, $q$The core SpiceDB project is fully open source and free to self-host, while AuthZed sells managed hosting and enterprise support around it as its commercial product.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$SpiceDB lets teams define a permissions schema that models roles, relationships, and hierarchies, then query whether a given user has access to a given resource with strong consistency guarantees. It supports role-based, relationship-based, and attribute-based access control patterns in a single system, and is designed to scale to large, complex permission graphs.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Open-source SpiceDB is free to self-host under the Apache 2.0 license with community support via Discord and GitHub. AuthZed Cloud offers pay-as-you-go managed hosting starting around $2 per hour. Self-Hosted enterprise licenses and Dedicated Cloud, which provides private, multi-region managed infrastructure, are both sold as custom annual quotes with tiered support levels.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Spike ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Spike is an AI-powered email and productivity app that turns cluttered inboxes into a chat-like conversational interface, combining email, team messaging, docs, and video calls in one place.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Pro from $8/user/month)$q$, starting_price),
  founded_year = COALESCE(2014, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$Herzliya, Israel$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Spike: AI Email App With Chat-Style Inbox and Pricing$q$, seo_title),
  seo_meta_description = COALESCE($q$Spike turns email into a chat-like conversational inbox with AI tools, docs, and team chat. Compare Free, Pro, and Business pricing plans.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Spike, formerly known as Spike Email, is an AI-powered email and team productivity application built around a conversational, chat-like inbox instead of a traditional threaded email view. The company was founded in 2014 by Dvir Ben-Aroya and Erez Pilosof and is headquartered in Herzliya, Israel, operating with a small team in the roughly 11-50 employee range and having raised about 13 million dollars in funding from investors including Wix, Insight Partners, and KOA Labs. Spike layers AI features, priority inbox triage, collaborative docs, team chat, video calls, and task management on top of standard email accounts, letting users manage Gmail, Outlook, and other email providers from a single unified interface. Pricing starts with a free plan covering one email account, 60 days of search history, and core features like instant unsubscribe, scheduled send, and snooze. The Pro plan costs $8 per user per month (or $60 per year with annual billing) and supports up to three email addresses with 5GB of storage, while the Business plan costs $16 per user per month (or $120 per year annually) and supports unlimited email addresses, 20GB of storage, and larger video calls. Spike also offers a separate Teamspace product with a free custom @spike.team email domain option and paid team plans for organizations. It is aimed at professionals, small teams, and remote-first companies that want a faster, more conversational way to manage email and team communication together.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Chat-like conversational inbox$q$, $q$Displays email as a chat-style conversation rather than a traditional threaded list.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Priority inbox triage$q$, $q$Surfaces important messages first to help users work through email faster.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$AI-powered tools$q$, $q$Uses AI to help summarize, triage, and manage inbox content more efficiently.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Collaborative docs$q$, $q$Includes built-in collaborative documents alongside email and messaging.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Team chat and video calls$q$, $q$Combines internal team messaging and video calling within the same app as email.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Task management$q$, $q$Lets users turn emails and messages directly into tasks.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Multi-provider email support$q$, $q$Connects with Gmail, Outlook, and other email providers into one unified inbox.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Custom team email domains$q$, $q$Teamspace plans support a free @spike.team address or custom company domains.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Conversational inbox format can feel faster and more intuitive than traditional email$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Combines email, chat, docs, and video calls in one app$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Generous free plan for individual users$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Reasonably priced Pro and Business tiers compared to bundling separate tools$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Supports multiple email providers in one unified interface$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Free plan limited to a single email account$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Team-oriented features add most value at the paid tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Smaller company size than major email and productivity competitors$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Conversational format may require an adjustment period for users used to traditional threaded email$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$What is Spike used for$q$, $q$Spike is used as an email and team productivity app that presents email in a chat-like conversational interface alongside docs, team chat, and video calls.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Is Spike free to use$q$, $q$Yes, Spike has a free plan for one email account with core features. Paid Pro and Business plans add more email addresses, storage, and features.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$How much does Spike Pro cost$q$, $q$Spike Pro costs $8 per user per month, or $60 per year when billed annually.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$How much does Spike Business cost$q$, $q$Spike Business costs $16 per user per month, or $120 per year when billed annually.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Which email providers does Spike support$q$, $q$Spike works with Gmail, Outlook, and other standard email providers, unifying them into one inbox.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Who founded Spike$q$, $q$Spike was founded in 2014 by Dvir Ben-Aroya and Erez Pilosof.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Where is Spike headquartered$q$, $q$Spike is headquartered in Herzliya, Israel.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Does Spike offer team collaboration features$q$, $q$Yes, Spike includes team chat, collaborative docs, video calls, and task management alongside email.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Faster personal email management$q$, $q$Individuals use Spike's conversational inbox and AI triage tools to get through email more quickly than with a traditional client.$q$, $q$Individual professionals and freelancers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Unified team communication$q$, $q$Small teams use Spike to combine email, chat, docs, and video calls in a single app instead of juggling separate tools.$q$, $q$Small businesses and remote teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Custom team email domains$q$, $q$Organizations use Spike Teamspace to set up shared or custom-domain team email alongside collaborative workspace features.$q$, $q$Startups and growing companies$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["1 email account","60 days of search history","Chat-like email interface","Priority inbox triage","Instant unsubscribe, scheduled send, and snooze"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Pro$q$, $q$$8/user/month ($60/year billed annually)$q$, $q$Monthly or annual$q$, NULL, $q$["Up to 3 email addresses","5GB storage","100MB file upload limit"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$Business$q$, $q$$16/user/month ($120/year billed annually)$q$, $q$Monthly or annual$q$, NULL, $q$["Unlimited email addresses","20GB storage","1GB file upload limit","Video calls with up to 10 participants"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$overview$q$, $q$What Is Spike$q$, 2, ARRAY[$q$Spike is an email and productivity application that reimagines the inbox as a chat-like conversation instead of a traditional list of threaded messages. Users connect their existing email accounts, such as Gmail or Outlook, and Spike layers a conversational interface, AI tools, and collaboration features on top.$q$, $q$The company, originally called Spike Email, was founded in 2014 by Dvir Ben-Aroya and Erez Pilosof and is headquartered in Herzliya, Israel. It has raised roughly 13 million dollars in funding from investors including Wix, Insight Partners, and KOA Labs.$q$, $q$Beyond email, Spike bundles in collaborative docs, team chat, video calls, and task management, positioning itself as a broader productivity hub rather than a single-purpose email client.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Spike's conversational inbox groups email into a chat-like format, with AI tools for triage, priority inbox sorting, instant unsubscribe, scheduled send, and snooze. Paid plans add more storage, larger file uploads, additional connected email addresses, and video calling with more participants, plus a Teamspace option for teams that want a shared custom email domain and collaborative workspace.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5bc5e5ac-f3fd-4a2a-9044-5288a6b4cd79', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Spike offers a free plan for one email account with 60 days of search history and core productivity features. The Pro plan costs $8 per user per month, or $60 per year billed annually, and supports up to three email addresses with 5GB of storage. The Business plan costs $16 per user per month, or $120 per year billed annually, and supports unlimited email addresses, 20GB of storage, and larger video calls.$q$]::text[], 2);


-- ── Spinify ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Spinify is an AI-powered sales gamification platform that uses real-time leaderboards, contests, and rewards to motivate and coach sales and service teams.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$Custom pricing (contact sales)$q$, starting_price),
  founded_year = COALESCE(2016, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$Canberra, Australia$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Spinify: AI Sales Gamification and Leaderboard Software$q$, seo_title),
  seo_meta_description = COALESCE($q$Spinify is an AI-powered sales gamification platform with leaderboards, contests, and rewards. See features, pricing tiers, and use cases.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Spinify is a sales gamification platform that uses real-time leaderboards, contests, scorecards, and reward stores to motivate and coach sales and customer-facing teams. It was founded in 2016 by Matt Bullock, following his earlier sale of the payments company eWay, and the company operates out of Canberra, Australia, with an additional office in Toronto, Canada, and a small team in the roughly 11-50 employee range. Spinify has evolved from a pure leaderboard tool into an AI-powered performance platform, adding AI agents, real-time KPI monitoring, goal tracking, customizable dashboards, and integrations with over 50 CRM and business tools, and it is also listed on the Salesforce AppExchange. The company uses a single flat-access pricing philosophy rather than tiered feature packages: its Business Edition is priced per user per month, billed monthly or annually, with a minimum of 5 users, and includes unlimited TV displays, all AI agents, and full feature access from day one. An Enterprise Edition is available for organizations with 200 or more seats, offering custom flat-rate pricing, SSO, dedicated support, and full API access, and Spinify additionally offers specialized Real Estate Starter and Real Estate Agency plans built around real estate CRM integrations such as Agentbox, VaultRE, and Rex Software. Spinify does not publish exact per-user dollar pricing on its website, and prospective customers are directed to request a quote or demo.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '656fe56e-f1ca-45b7-816b-0d5e43b18a06';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '656fe56e-f1ca-45b7-816b-0d5e43b18a06' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '656fe56e-f1ca-45b7-816b-0d5e43b18a06';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Real-time leaderboards$q$, $q$Displays live, updating leaderboards to show individual and team sales performance.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Sales contests and competitions$q$, $q$Runs customizable contests and competitions to drive short-term performance pushes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$AI agents and coaching$q$, $q$Uses AI agents to provide personalized recognition, coaching, and performance insights.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Reward stores$q$, $q$Lets organizations set up personalized reward stores tied to performance achievements.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Unlimited TV displays$q$, $q$Supports unlimited TV and screen displays for showcasing leaderboards across offices.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$CRM and business tool integrations$q$, $q$Connects with 50-plus CRM, sales, and business systems to pull performance data automatically.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Real estate-specific integrations$q$, $q$Offers dedicated plans integrating with real estate CRMs such as Agentbox, VaultRE, LockedOn, Rex Software, and Box+Dice.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Enterprise governance and API access$q$, $q$Enterprise Edition adds SSO, full API access, and multi-department configuration for larger rollouts.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '656fe56e-f1ca-45b7-816b-0d5e43b18a06';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Flat, all-inclusive feature access rather than gated tiers on the core plan$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Strong integration library covering 50-plus CRM and business tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Dedicated Real Estate plans tailored to a specific vertical$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$AI agents add coaching and personalization beyond basic leaderboards$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$30-day money-back guarantee offered on plans$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '656fe56e-f1ca-45b7-816b-0d5e43b18a06';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Exact per-user pricing is not published on the website$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Business Edition requires a minimum number of users to get started$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Enterprise Edition requires a large minimum seat count of 200-plus users$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Small company size relative to broader sales performance management vendors$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '656fe56e-f1ca-45b7-816b-0d5e43b18a06';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$What is Spinify used for$q$, $q$Spinify is used to gamify sales and service team performance through real-time leaderboards, contests, and rewards.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$How much does Spinify cost$q$, $q$Spinify does not publish exact per-user pricing publicly. Its Business Edition is billed per user per month or annually with a 5-user minimum, and prospective customers can request a quote.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Who founded Spinify$q$, $q$Spinify was founded in 2016 by Matt Bullock, following the sale of his previous company, eWay.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Where is Spinify based$q$, $q$Spinify is based in Canberra, Australia, with an additional office in Toronto, Canada.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Does Spinify offer an enterprise plan$q$, $q$Yes, Spinify's Enterprise Edition is available for organizations with 200 or more seats, with custom flat-rate pricing and added governance features.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Does Spinify have industry-specific plans$q$, $q$Yes, Spinify offers dedicated Real Estate Starter and Real Estate Agency plans with integrations for real estate CRMs.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Is Spinify available on Salesforce AppExchange$q$, $q$Yes, Spinify is listed on the Salesforce AppExchange.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Does Spinify use AI$q$, $q$Yes, Spinify includes AI agents for personalized coaching, recognition, and performance insights as part of its platform.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '656fe56e-f1ca-45b7-816b-0d5e43b18a06';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Motivating sales teams with leaderboards$q$, $q$Sales organizations use Spinify's real-time leaderboards and contests to drive daily and weekly performance.$q$, $q$Sales teams and sales managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Recognizing and rewarding performance$q$, $q$Companies use Spinify's reward stores and recognition tools to celebrate achievements and reinforce desired behaviors.$q$, $q$Sales operations and HR teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Real estate agency performance tracking$q$, $q$Real estate agencies use Spinify's dedicated Real Estate plans, integrated with tools like Agentbox and VaultRE, to track agent performance.$q$, $q$Real estate agencies and brokerages$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '656fe56e-f1ca-45b7-816b-0d5e43b18a06';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Business Edition$q$, $q$Per user/month (custom quote)$q$, $q$Monthly or annual (annual saves 2 months)$q$, NULL, $q$["Minimum 5 users","Unlimited TV displays","All AI agents","50-plus integrations","Multi-language support","Personalized reward stores"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Enterprise Edition$q$, $q$Custom flat rate$q$, $q$Annual$q$, NULL, $q$["200-plus seats","Flat-rate pricing (no per-user fees)","SSO and enterprise governance","Dedicated success partner with SLAs","Full API access"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Real Estate Starter$q$, $q$Per user/month (custom quote)$q$, $q$Annual$q$, NULL, $q$["Minimum 5 users","10 active competitions","3 TV displays","Real estate CRM integrations"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$Real Estate Agency$q$, $q$Per user/month (custom quote)$q$, $q$Annual$q$, NULL, $q$["Minimum 50 users","Unlimited competitions and TV displays","5 personalized reward stores","VIP concierge service"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '656fe56e-f1ca-45b7-816b-0d5e43b18a06';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$overview$q$, $q$What Is Spinify$q$, 2, ARRAY[$q$Spinify is a sales gamification and performance platform that helps sales and service organizations motivate teams through real-time leaderboards, contests, recognition, and rewards. It is designed to make individual and team performance visible and celebrated, typically displayed on office TVs, dashboards, or shared digital displays.$q$, $q$The company was founded in 2016 by Matt Bullock, who started Spinify after selling the payments company eWay. Spinify is based in Canberra, Australia, with an additional office in Toronto, Canada.$q$, $q$Over time Spinify has expanded from a leaderboard and contest tool into a broader AI-powered coaching and performance platform, adding AI agents, real-time KPI monitoring, and integrations with more than 50 CRM and business systems.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Spinify provides dynamic leaderboards, sales contests, scorecards, and customizable reward stores, along with real-time KPI monitoring and goal tracking. Its AI agents are built to provide personalized coaching and recognition, and the platform supports unlimited TV displays, custom competitions, and branded themes for visual engagement across an office or remote team.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('656fe56e-f1ca-45b7-816b-0d5e43b18a06', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Spinify does not publish exact per-user dollar pricing. Its core Business Edition is billed per user per month or annually, requires a minimum of 5 users, and includes full access to all features, including AI agents, integrations, and unlimited TV displays, from day one. An Enterprise Edition with flat-rate custom pricing is available for organizations with 200 or more seats. Spinify also offers specialized Real Estate Starter and Real Estate Agency plans for real estate sales teams, both billed annually with their own minimum user counts.$q$]::text[], 2);



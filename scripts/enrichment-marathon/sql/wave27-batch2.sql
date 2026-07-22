-- Enrichment marathon batch: Sunshine, Supabase, Super Productivity, SuperAnnotate, Supercast, Superdesk, Superhuman, Superlist

-- ── Sunshine ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Sunshine is a free, open-source, self-hosted game streaming host that lets you stream games and your full desktop from a Windows, Linux, macOS, or FreeBSD PC to Moonlight clients on almost any device.$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Sunshine Review: Open-Source Game Streaming Host$q$, seo_title),
  seo_meta_description = COALESCE($q$Sunshine is a free, open-source game streaming host for Moonlight. See its features, GPU support, setup basics, pros, cons, and alternatives.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Sunshine is a free and open-source, self-hosted game streaming server maintained by the LizardByte open-source community that lets users stream PC games and full desktops to Moonlight client apps on phones, tablets, laptops, smart TVs, and handhelds such as the Steam Deck. Released under the GPL-3.0 license, Sunshine supports hardware-accelerated encoding on Nvidia, AMD, and Intel GPUs, with a software encoding fallback for systems without dedicated encoding hardware. It runs on Windows 11 and later, Linux distributions such as Ubuntu, Fedora, and Debian, macOS 14.2 and later, and FreeBSD, making it one of the most cross-platform self-hosted game streaming hosts available. Configuration and client pairing are handled through a built-in web interface, and Sunshine supports gamepad emulation, HDR streaming, and low-latency performance comparable to commercial services like NVIDIA GameStream, which it was originally built to replace after GameStream was discontinued. Because Sunshine has no company behind it, there is no subscription fee, account requirement, or vendor lock-in; it is developed entirely by open-source contributors and documented on Read the Docs. It is best suited for gamers who own a capable Windows, Linux, or macOS gaming PC and want to stream their own games to other devices on their local network or, with extra VPN or port-forwarding configuration, over the internet.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '082de0e2-a5b9-4328-a2b9-bb364605a75a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '082de0e2-a5b9-4328-a2b9-bb364605a75a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '082de0e2-a5b9-4328-a2b9-bb364605a75a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Hardware-accelerated encoding$q$, $q$Uses Nvidia NVENC, AMD AMF, or Intel QuickSync for low-latency video encoding, with a software fallback when no supported GPU encoder is available.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Cross-platform host support$q$, $q$Runs on Windows 11+, major Linux distributions, macOS 14.2+, and FreeBSD, covering far more host operating systems than most streaming hosts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Web-based configuration UI$q$, $q$A built-in browser interface handles setup, encoder selection, and Moonlight client pairing without extra software.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Broad Moonlight client compatibility$q$, $q$Works with Moonlight apps on Windows, macOS, Linux, Android, iOS, tvOS, and handhelds like the Steam Deck.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Gamepad and controller emulation$q$, $q$Remote controller input is emulated on the host so games see it as a native connected gamepad.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$HDR streaming support$q$, $q$Streams HDR content to compatible Moonlight clients for closer-to-native picture quality.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Low-latency local and remote streaming$q$, $q$Designed for responsive, near real-time play on a local network, with remote play possible via additional network configuration.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Docker and container support$q$, $q$Can be deployed in a Docker container for easier setup and updates on Linux hosts.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '082de0e2-a5b9-4328-a2b9-bb364605a75a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Completely free and open source with no subscription$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Works across Windows, Linux, macOS, and FreeBSD hosts$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Broad GPU support across Nvidia, AMD, and Intel plus a software fallback$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Active open-source community with frequent updates$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$No account creation or vendor lock-in required$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '082de0e2-a5b9-4328-a2b9-bb364605a75a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Requires self-hosting and some technical setup$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$No official cloud-hosted version is offered$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Streaming outside your home network requires extra network configuration$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Support is community-based only, with no dedicated customer support team$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Stream quality depends heavily on host hardware and network conditions$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '082de0e2-a5b9-4328-a2b9-bb364605a75a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$What is Sunshine used for?$q$, $q$Sunshine turns a Windows, Linux, macOS, or FreeBSD PC into a game streaming server so you can play its games or use its desktop remotely from another device running the Moonlight client.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Is Sunshine free?$q$, $q$Yes. Sunshine is fully free and open source under the GPL-3.0 license, with no subscription or paid tiers.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$What is Moonlight and how does it relate to Sunshine?$q$, $q$Moonlight is the open-source client app used to connect to a Sunshine host. Sunshine is the server-side software that Moonlight streams from.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Does Sunshine require a dedicated GPU?$q$, $q$A dedicated GPU with hardware encoding (Nvidia, AMD, or Intel) gives the best performance, but Sunshine can fall back to software encoding on systems without one.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Can I stream games from Sunshine over the internet?$q$, $q$Yes, though it typically requires extra setup such as port forwarding or a VPN, since Sunshine is designed primarily for local network streaming out of the box.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Is Sunshine safe and legal to use?$q$, $q$Yes. Sunshine is open-source software you run on hardware you own, streaming only content you already have access to, similar to remote desktop tools.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$What operating systems does Sunshine support?$q$, $q$Sunshine supports Windows 11 and later, several Linux distributions, macOS 14.2 and later, and FreeBSD 14.4 and later.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$How is Sunshine different from Steam Link or Parsec?$q$, $q$Sunshine is open source, self-hosted, and free with no company behind it, whereas Steam Link is tied to Steam and Parsec is a commercial product with its own pricing and hosted infrastructure.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '082de0e2-a5b9-4328-a2b9-bb364605a75a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Home cloud gaming$q$, $q$Stream games from a gaming PC to a laptop, tablet, or TV elsewhere in the house without buying a second gaming machine.$q$, $q$PC gamers with multiple devices$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Handheld and Steam Deck streaming$q$, $q$Play PC games on a Steam Deck or other handheld by streaming from a more powerful desktop.$q$, $q$Handheld PC gamers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Remote access to a gaming PC while traveling$q$, $q$Connect back to a home gaming PC from a laptop while away, using additional VPN or port-forwarding setup.$q$, $q$Gamers who travel frequently$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '082de0e2-a5b9-4328-a2b9-bb364605a75a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Open Source$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full access to all Sunshine features","GPL-3.0 licensed source code","Community support via GitHub and Discord","No account or subscription required"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '082de0e2-a5b9-4328-a2b9-bb364605a75a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$overview$q$, $q$What Is Sunshine$q$, 2, ARRAY[$q$Sunshine is a self-hosted game stream host built to work with Moonlight, the open-source client originally designed for NVIDIA GameStream. When NVIDIA discontinued GameStream, the LizardByte community built Sunshine as a free, cross-platform replacement that anyone can run on their own PC.$q$, $q$Unlike commercial cloud gaming services, Sunshine does not run on rented servers. It runs directly on a computer you own, capturing the screen and game audio, encoding the stream, and sending it to a Moonlight client running on another device over your local network or the internet.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Sunshine supports hardware-accelerated video encoding through Nvidia NVENC, AMD AMF, and Intel QuickSync, with a software encoding fallback for machines without a supported GPU encoder.$q$, $q$It offers a web-based configuration UI for setup and client pairing, gamepad and controller emulation so remote input feels native, HDR passthrough, and support for four operating systems: Windows, Linux, macOS, and FreeBSD.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Sunshine is completely free and open source under the GPL-3.0 license. There are no paid tiers, subscriptions, or account requirements; the project is sustained by volunteer contributors and community support channels such as GitHub and Discord rather than a commercial company.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Supabase ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Supabase is an open-source Firebase alternative that gives developers a hosted Postgres database, authentication, instant APIs, edge functions, realtime subscriptions, and file storage in one platform.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Pro plan from $25/month)$q$, starting_price),
  founded_year = COALESCE(2020, founded_year),
  company_size = COALESCE($q$201-500 employees$q$, company_size),
  headquarters = COALESCE($q$Singapore$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Supabase Review: Open-Source Firebase Alternative$q$, seo_title),
  seo_meta_description = COALESCE($q$Supabase is an open-source Firebase alternative with Postgres, auth, edge functions, and realtime APIs. See pricing, features, pros, and cons.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Supabase is an open-source backend-as-a-service platform, often described as an open-source alternative to Google Firebase, founded in 2020 by Paul Copplestone and Ant Wilson. Built around a standard hosted Postgres database, Supabase adds authentication, auto-generated REST and GraphQL APIs, Edge Functions built on Deno, realtime subscriptions, file storage, and vector embedding support through the pgvector extension, making it popular for both traditional web apps and AI applications. Because it is built on Postgres rather than a proprietary database, developers can avoid vendor lock-in and self-host the open-source stack if desired. Supabase offers a free tier for prototyping, a Pro plan starting at $25 per month with usage-based overages, a Team plan at $599 per month adding compliance and SSO features, and custom Enterprise pricing. The company has raised more than $1 billion in total funding, including a $500 million Series F in June 2026 at a $10.5 billion valuation led by GIC with participation from Stripe and Salesforce Ventures. Headquartered in Singapore with a globally distributed team of roughly a few hundred employees, Supabase is widely used by startups, indie developers, and AI-assisted 'vibe coding' tools that need a fast, production-ready backend without building one from scratch.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '84e314ac-4d36-41da-911b-9eb00173a757';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '84e314ac-4d36-41da-911b-9eb00173a757' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '84e314ac-4d36-41da-911b-9eb00173a757';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Managed Postgres database$q$, $q$A full, standard Postgres database with no proprietary query language, so existing Postgres skills and tools carry over directly.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Built-in authentication$q$, $q$Supabase Auth handles email, password, magic link, and social login flows out of the box.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Auto-generated REST and GraphQL APIs$q$, $q$Database tables are instantly exposed as REST and GraphQL endpoints without writing boilerplate API code.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Edge Functions$q$, $q$Deno-based serverless functions for running custom backend logic close to users.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Realtime subscriptions$q$, $q$Listen to database changes and broadcast them to connected clients for live, collaborative features.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$File storage$q$, $q$Object storage for images, videos, and other files, integrated with the same access-control system as the database.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Vector embeddings for AI$q$, $q$Native support for the pgvector extension enables similarity search for AI and machine learning applications.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Row Level Security$q$, $q$Fine-grained, Postgres-native policies control exactly which rows each user can read or write.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '84e314ac-4d36-41da-911b-9eb00173a757';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Built on standard Postgres, avoiding proprietary database lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Generous free tier that is useful for real prototyping, not just demos$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Open source, with the option to self-host the full stack$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Combines database, auth, storage, functions, and realtime in one platform$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Strong developer experience that has made it popular with AI-assisted coding tools$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '84e314ac-4d36-41da-911b-9eb00173a757';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Costs can scale quickly once usage-based overages kick in$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Free-tier projects pause automatically after a period of inactivity$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Some enterprise features such as SSO and HIPAA support require higher-tier plans$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Realtime and edge function limits can require careful architecture at higher scale$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Younger ecosystem than long-established platforms like Firebase in some areas$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '84e314ac-4d36-41da-911b-9eb00173a757';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$What is Supabase?$q$, $q$Supabase is an open-source backend-as-a-service platform built on Postgres, offering a database, authentication, instant APIs, edge functions, realtime updates, and file storage.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Is Supabase free?$q$, $q$Yes, Supabase has a free plan with limited database size and monthly active users, with paid plans starting at $25 per month for higher limits and more features.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Is Supabase open source?$q$, $q$Yes, the core Supabase stack is open source and can be self-hosted, though most users use the managed hosted platform.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Can I self-host Supabase?$q$, $q$Yes, the entire Supabase stack can be self-hosted using Docker, though the hosted platform handles scaling and maintenance automatically.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$What database does Supabase use?$q$, $q$Supabase uses standard Postgres, extended with tools for authentication, storage, and realtime functionality.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$How does Supabase compare to Firebase?$q$, $q$Supabase is often described as an open-source Firebase alternative; the key difference is that Supabase is built on relational Postgres rather than Firebase's proprietary NoSQL database.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Does Supabase support authentication?$q$, $q$Yes, Supabase Auth supports email and password, magic links, and social login providers out of the box.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$What is Supabase pricing?$q$, $q$Supabase offers a Free plan, a Pro plan at $25 per month, a Team plan at $599 per month, and custom Enterprise pricing.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '84e314ac-4d36-41da-911b-9eb00173a757';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Startup MVP backend$q$, $q$Spin up a production-ready database, auth, and API layer quickly without building backend infrastructure from scratch.$q$, $q$Startup founders and developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$AI application backend with vector search$q$, $q$Store embeddings alongside application data and run similarity search for AI features using pgvector.$q$, $q$AI and machine learning developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Mobile and web app authentication and storage$q$, $q$Handle user sign-up, login, and file uploads for mobile or web apps using Supabase Auth and Storage.$q$, $q$App developers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '84e314ac-4d36-41da-911b-9eb00173a757';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Free$q$, $q$$0$q$, $q$monthly$q$, NULL, $q$["Unlimited API requests","50,000 monthly active users","500 MB database storage","5 GB egress and 5 GB cached egress","1 GB file storage","Community support only","Pauses after 1 week of inactivity","Limited to 2 active projects"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Pro$q$, $q$$25$q$, $q$monthly$q$, NULL, $q$["100,000 monthly active users with overage pricing","8 GB disk per project with overage pricing","250 GB egress and 250 GB cached egress","100 GB file storage","Email support","7-day automatic backups and 7-day log retention","$10 monthly compute credit included"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Team$q$, $q$$599$q$, $q$monthly$q$, NULL, $q$["Same base limits as Pro with overages","SOC2 and ISO 27001 compliance included","Project-scoped and read-only access roles","HIPAA available as an add-on","SSO for the dashboard","Priority email support with SLAs","14-day automatic backups and 28-day log retention"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["Designated support manager","Uptime SLAs and bring-your-own-cloud support","24/7 premium support with a private Slack channel","Custom security questionnaires"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '84e314ac-4d36-41da-911b-9eb00173a757';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$overview$q$, $q$What Is Supabase$q$, 2, ARRAY[$q$Supabase is a backend-as-a-service platform built on top of Postgres. Instead of stitching together a database, authentication provider, storage service, and API layer separately, developers get all of these as one integrated product with a generous free tier.$q$, $q$Since launching in 2020, Supabase has grown into one of the most widely used backend platforms for startups and AI-assisted development, largely because it uses standard, open-source Postgres rather than a proprietary database format.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Core features include a managed Postgres database, Supabase Auth for user sign-up and login, instant auto-generated REST and GraphQL APIs, Edge Functions for serverless logic, realtime data subscriptions, and object storage for files and media.$q$, $q$Supabase also supports AI workloads through the pgvector extension for storing and querying vector embeddings, and it enforces fine-grained data access through Postgres Row Level Security policies.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Supabase offers a Free plan with limited database size and monthly active users, a Pro plan at $25 per month with usage-based overages for storage, egress, and active users, a Team plan at $599 per month adding SOC2 and SSO features, and custom Enterprise pricing with SLAs and dedicated support.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('84e314ac-4d36-41da-911b-9eb00173a757', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Super Productivity ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Super Productivity is a free, open-source task manager and time tracker built for developers and focused deep work, combining to-do lists, Kanban boards, Pomodoro timers, and issue-tracker integrations in one offline-first app.$q$, short_description),
  pricing_model = COALESCE($q$free / open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2016, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Super Productivity: Free Open-Source Task Manager$q$, seo_title),
  seo_meta_description = COALESCE($q$Super Productivity is a free, open-source task manager with time tracking, Kanban boards, Pomodoro timers, and GitHub, Jira, and GitLab integrations.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Super Productivity is a free and open-source task management and time-tracking application created in 2016 by German developer Johannes Millan. It is aimed primarily at developers and other deep-work focused professionals who want a single tool for tasks, time tracking, and focus sessions without giving up their data to a cloud company. The app is offline-first, requires no account, and stores data locally on the user's device by default, with optional WebDAV or Dropbox sync for use across desktop, web, and mobile. Core features include quick task capture with subtasks and notes, one-click time tracking, a Pomodoro timer and distraction-blocking focus mode, multiple board layouts including Kanban and an Eisenhower matrix, and smart repeat scheduling for recurring tasks. It integrates bidirectionally with developer tools such as GitHub, GitLab, Jira, Azure DevOps, CalDAV, and OpenProject, automatically importing issues and syncing status changes. Data can be exported at any time in JSON or CSV format, and the app can generate timesheets and work reports, making it useful for freelancers who bill by the hour. Super Productivity is completely free forever, with no premium tier, no tracking, and no vendor lock-in, and it is available as a desktop application for Windows, macOS, and Linux as well as a web app and mobile apps.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '17662ee8-4f5f-4a4b-9002-5343fb4b960a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '17662ee8-4f5f-4a4b-9002-5343fb4b960a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '17662ee8-4f5f-4a4b-9002-5343fb4b960a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Task and subtask management$q$, $q$Create tasks with subtasks, notes, due dates, and time estimates, organized by tags and projects.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Built-in time tracking$q$, $q$One-click time tracking on any task, with automatic logging usable for timesheets and billing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Pomodoro timer and focus mode$q$, $q$A built-in Pomodoro timer plus a distraction-blocking focus mode to support sustained concentration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Multiple board views$q$, $q$Switch between Kanban, an Eisenhower priority matrix, compact lists, or custom layouts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Issue tracker integrations$q$, $q$Bidirectional sync with GitHub, GitLab, Jira, Azure DevOps, CalDAV, and OpenProject.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Offline-first and privacy-focused$q$, $q$No account required and data stays on-device by default, with zero tracking.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$WebDAV and Dropbox sync$q$, $q$Optional sync methods to use the app across desktop, web, and mobile devices.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Timesheets and work reports$q$, $q$Generate timesheets and reports from tracked time, useful for freelancers and consultants.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '17662ee8-4f5f-4a4b-9002-5343fb4b960a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Completely free with no paywalls or premium tier$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Open source and privacy-respecting, with data kept local by default$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Deep integrations for developers with tools like GitHub and Jira$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Highly customizable board layouts and a plugin system$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Works fully offline$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '17662ee8-4f5f-4a4b-9002-5343fb4b960a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Interface can feel less polished than some commercial competitors$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Mobile apps are less feature-complete than the desktop version$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Sync relies on self-managed WebDAV or Dropbox rather than built-in cloud sync$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Support is community-driven since it originated as largely a one-developer project$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$The breadth of features creates a steeper learning curve for new users$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '17662ee8-4f5f-4a4b-9002-5343fb4b960a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$What is Super Productivity?$q$, $q$Super Productivity is a free, open-source task manager and time tracker aimed at developers and deep-work focused professionals.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Is Super Productivity free?$q$, $q$Yes, it is completely free and open source with no paid tier or in-app purchases.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Is Super Productivity open source?$q$, $q$Yes, the full source code is publicly available and maintained on GitHub.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Does Super Productivity work offline?$q$, $q$Yes, it is offline-first, requires no account, and stores data locally by default.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$What platforms does Super Productivity support?$q$, $q$It is available as a desktop app for Windows, macOS, and Linux, as a web app, and on mobile devices.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Can Super Productivity sync between devices?$q$, $q$Yes, through optional WebDAV or Dropbox sync configured by the user.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Does Super Productivity integrate with Jira or GitHub?$q$, $q$Yes, it offers bidirectional integrations with Jira, GitHub, GitLab, Azure DevOps, and CalDAV.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Who makes Super Productivity?$q$, $q$It was created in 2016 by German developer Johannes Millan and is now maintained with community contributions.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '17662ee8-4f5f-4a4b-9002-5343fb4b960a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Developer daily task and time tracking$q$, $q$Track coding tasks alongside GitHub or Jira issues, with automatic time logging per task.$q$, $q$Software developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Freelancer timesheets and client billing$q$, $q$Generate timesheets and work reports from tracked time to support hourly client billing.$q$, $q$Freelancers and consultants$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Personal deep work and focus sessions$q$, $q$Use the Pomodoro timer and focus mode to structure individual work sessions and reduce distraction.$q$, $q$Individual productivity users$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '17662ee8-4f5f-4a4b-9002-5343fb4b960a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$Open Source$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full access to all features on desktop, web, and mobile","Offline-first with local data storage","Optional WebDAV or Dropbox sync","JSON and CSV data export","No account required"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '17662ee8-4f5f-4a4b-9002-5343fb4b960a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$overview$q$, $q$What Is Super Productivity$q$, 2, ARRAY[$q$Super Productivity is an open-source task manager and time tracker designed around the idea of deep, focused work rather than generic project management. It was built by a single developer, Johannes Millan, starting in 2016, and has since grown into a community-supported project.$q$, $q$The app is offline-first and privacy-focused: there is no required account, and by default all data stays on the user's device, with optional sync methods for those who want to use it across multiple machines.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Super Productivity combines task and subtask management, tags, and projects with built-in time tracking, a Pomodoro timer, and a distraction-blocking focus mode built on cognitive-behavioral techniques.$q$, $q$It offers multiple board layouts such as Kanban and an Eisenhower matrix, plus deep integrations with developer tools including GitHub, GitLab, Jira, Azure DevOps, and CalDAV, so issues and tasks stay in sync automatically.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Super Productivity is completely free and open source, with no paid tier, subscription, or in-app purchases. Users can export their data at any time in JSON or CSV format, and there is no vendor lock-in.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('17662ee8-4f5f-4a4b-9002-5343fb4b960a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── SuperAnnotate ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$SuperAnnotate is an AI data annotation and AI DataOps platform that helps teams label, curate, and manage image, video, text, and audio data to train and fine-tune machine learning and LLM models.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Starter plan); Pro and Enterprise are custom-priced$q$, starting_price),
  founded_year = COALESCE(2018, founded_year),
  company_size = COALESCE($q$51-200 employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SuperAnnotate Review: AI Data Annotation Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$SuperAnnotate is an AI data annotation and DataOps platform for image, video, text, and audio labeling. See features, pricing, pros, and cons.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SuperAnnotate is an AI data annotation and AI DataOps platform founded in 2018 by brothers Vahan Petrosyan, who serves as CEO, and Tigran Petrosyan, who serves as President. Vahan's PhD research in image segmentation at Sweden's KTH Royal Institute of Technology formed the basis of the company's early annotation algorithms. The platform provides a fully customizable multimodal editor for annotating images, video, text, and audio, along with data curation, analytics, team and project management, and an orchestration layer for automating annotation and machine learning pipelines. SuperAnnotate also runs a managed annotation workforce marketplace called WForce that connects customers with vetted labeling teams. It is used by AI and machine learning teams, from academic researchers to large enterprises, to prepare and manage training data for computer vision and large language models. SuperAnnotate offers a free Starter plan for small projects and academic use, with Pro and Enterprise plans priced individually based on usage and support needs; public sources cite Pro pricing around $39 per user per month, though current published pricing should be confirmed directly with SuperAnnotate. The company has raised roughly $73.7 million in total funding across seed, Series A, and Series B rounds, with investors including Point Nine Capital, Base10 Partners, NVIDIA, and Databricks. It is headquartered in San Francisco, California.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '53a0cb41-3c1b-499b-a369-31d2bb36357e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '53a0cb41-3c1b-499b-a369-31d2bb36357e' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '53a0cb41-3c1b-499b-a369-31d2bb36357e';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Multimodal annotation editor$q$, $q$A fully customizable editor for labeling image, video, text, and audio data in one interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Data curation and exploration$q$, $q$Tools to explore, filter, and curate large datasets before and after annotation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Analytics and quality insights$q$, $q$Dashboards for tracking annotation quality, throughput, and project progress.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Team and project management$q$, $q$Role-based access, task assignment, and project organization for annotation teams.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Orchestrate pipeline automation$q$, $q$Automates annotation and machine learning data pipelines with allotted compute hours per plan.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$WForce managed workforce marketplace$q$, $q$Connects customers with vetted, professionally managed annotation teams for outsourced labeling.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Single sign-on$q$, $q$SSO support on Pro and Enterprise plans for centralized access control.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Dedicated customer success support$q$, $q$Pro and Enterprise customers get dedicated Slack channels and customer success or solutions engineering support.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '53a0cb41-3c1b-499b-a369-31d2bb36357e';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Supports image, video, text, and audio annotation in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Includes both self-serve tools and a managed annotation workforce option$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Strong automation features for scaling annotation pipelines$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Backed by investors including NVIDIA and Databricks$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Free Starter plan available for small projects and academic use$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '53a0cb41-3c1b-499b-a369-31d2bb36357e';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Pro and Enterprise pricing is not published and requires a sales conversation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Advanced automation and support features are gated behind higher, custom-priced tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Can be more complex than lightweight annotation tools for very small projects$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Compute-hour based limits on Orchestrate may require plan upgrades for heavy automation use$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Best suited to teams with real MLOps or AI DataOps needs rather than one-off tasks$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '53a0cb41-3c1b-499b-a369-31d2bb36357e';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$What is SuperAnnotate?$q$, $q$SuperAnnotate is a platform for annotating and managing image, video, text, and audio data used to train and fine-tune AI and machine learning models.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Is SuperAnnotate free?$q$, $q$SuperAnnotate offers a free Starter plan for small projects and academic use; Pro and Enterprise plans require custom pricing.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Who founded SuperAnnotate?$q$, $q$SuperAnnotate was founded in 2018 by brothers Vahan Petrosyan (CEO) and Tigran Petrosyan (President).$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Does SuperAnnotate offer outsourced annotation teams?$q$, $q$Yes, through its WForce marketplace, which connects customers with vetted, professionally managed annotation workforces.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$What data types can SuperAnnotate annotate?$q$, $q$SuperAnnotate supports image, video, text, and audio annotation within a single multimodal editor.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Does SuperAnnotate support LLM and multimodal AI projects?$q$, $q$Yes, its Pro and Enterprise plans include annotation services and tooling for LLM and multimodal data types.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Where is SuperAnnotate headquartered?$q$, $q$SuperAnnotate is headquartered in San Francisco, California.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$How much funding has SuperAnnotate raised?$q$, $q$SuperAnnotate has raised roughly $73.7 million across seed, Series A, and Series B funding rounds.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '53a0cb41-3c1b-499b-a369-31d2bb36357e';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Computer vision model training$q$, $q$Annotate large image and video datasets to train object detection, segmentation, or classification models.$q$, $q$Computer vision teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$LLM and multimodal data preparation$q$, $q$Curate and label text and multimodal data for fine-tuning large language models.$q$, $q$AI and LLM teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Outsourced annotation at scale$q$, $q$Use the WForce marketplace to access managed annotation teams for high-volume labeling projects.$q$, $q$Enterprises without in-house labeling capacity$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '53a0cb41-3c1b-499b-a369-31d2bb36357e';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Starter$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Fully customizable multimodal editor","Image, video, text, and audio editors","Data curation and exploration","Analytics and insights","Team and project management","Orchestrate with 1,000 compute hours","Platform onboarding"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Pro$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["All Starter features","Orchestrate with 2,500 compute hours","Single sign-on","Dedicated Slack channel","Dedicated customer success manager"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["All Pro features","Advanced analytics and insights","Orchestrate with 10,000 compute hours","Dedicated solutions engineer","AI DataOps consulting"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '53a0cb41-3c1b-499b-a369-31d2bb36357e';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$overview$q$, $q$What Is SuperAnnotate$q$, 2, ARRAY[$q$SuperAnnotate is a platform for labeling and managing the training data used to build and fine-tune AI and machine learning models. It was founded in 2018 by brothers Vahan and Tigran Petrosyan, growing out of Vahan's academic research into image segmentation.$q$, $q$The platform is designed for teams that need to annotate large volumes of image, video, text, or audio data accurately and consistently, then track and manage that data through the full lifecycle of a machine learning or LLM project.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$SuperAnnotate provides a fully customizable multimodal editor supporting image, video, text, and audio annotation, along with data curation and exploration tools, analytics and quality insights, and team and project management features.$q$, $q$Its Orchestrate feature automates annotation and data pipelines with allotted compute hours per plan, and the WForce marketplace connects customers with professionally managed, vetted annotation teams for projects that need outsourced labeling capacity.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$SuperAnnotate offers a free Starter plan intended for getting started and small projects, along with Pro and Enterprise plans that scale up compute hours, single sign-on, dedicated support, and advanced analytics. Pro and Enterprise pricing is not published and requires contacting SuperAnnotate's sales team for a quote.$q$]::text[], 2);


-- ── Supercast ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Supercast is a podcast subscription and monetization platform that lets podcasters sell premium, ad-free, and bonus content directly to listeners through branded subscription feeds.$q$, short_description),
  pricing_model = COALESCE($q$usage-based (flat per-subscriber fee)$q$, pricing_model),
  starting_price = COALESCE($q$$0.59 per subscriber per month$q$, starting_price),
  founded_year = COALESCE(2019, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$Victoria, Canada$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Supercast Review: Podcast Subscription Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Supercast helps podcasters monetize shows with premium subscriptions for a flat per-subscriber fee. See pricing, features, pros, cons, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Supercast is a podcast subscription and monetization platform founded in 2019, originally built for Sam Harris's podcast Making Sense in partnership with Andrew Wilkinson's holding company Tiny before becoming a standalone product under CEO Jason Sew Hoy. It lets podcasters sell premium, ad-free, or bonus content directly to listeners through a branded subscription landing page with a simplified two-tap checkout. Rather than taking a percentage of revenue, Supercast charges a flat fee of $0.59 per subscriber per month, on top of standard Stripe payment processing fees, so podcasters keep a predictable share of subscription revenue regardless of price point. Key features include feed security to deter unauthorized sharing, built-in email marketing tools, Ask Me Anything interactive features, YouTube video feed support, multiple subscription tiers such as monthly, annual, and lifetime plans, free trials and promo codes, and subscriber analytics dashboards. Larger networks can use a custom-priced plan that adds multi-show support and bundled subscriptions across shows. In February 2026, Supercast was acquired by Red Seat Ventures, a division of Fox Corporation's Tubi Media Group, while continuing to operate independently. The company is headquartered in Victoria, British Columbia, Canada, with a small team, and its top ten podcasters collectively gross more than $26 million per year in subscription revenue.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '438b1e2a-2db1-4fa1-aace-e651c95f62cf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '438b1e2a-2db1-4fa1-aace-e651c95f62cf' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '438b1e2a-2db1-4fa1-aace-e651c95f62cf';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Branded subscriber landing page$q$, $q$A dedicated, customizable page where listeners sign up for premium content.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Two-tap subscription checkout$q$, $q$A simplified checkout flow designed to reduce friction and drop-off for listeners subscribing on mobile.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Feed security$q$, $q$Protections and alerting designed to deter unauthorized sharing of private premium feeds.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Built-in email marketing$q$, $q$Tools to email subscribers directly from the platform without a separate email service.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Ask Me Anything features$q$, $q$Interactive AMA tools podcasters can use to engage paying subscribers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$YouTube video feed support$q$, $q$Supports offering premium video content alongside audio subscriptions.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Multiple subscription tiers$q$, $q$Supports monthly, annual, and lifetime subscription options, plus free trials and promo codes.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Subscriber analytics dashboards$q$, $q$Reporting on subscriber growth, churn, and revenue to track monetization performance.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '438b1e2a-2db1-4fa1-aace-e651c95f62cf';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Flat per-subscriber pricing instead of a percentage of revenue$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$No platform take-rate beyond the flat fee and standard Stripe processing$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Purpose-built for podcast monetization rather than a generic membership tool$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Proven results, with top podcasters earning millions in annual subscription revenue$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Supports multiple pricing tiers, trials, and promotions out of the box$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '438b1e2a-2db1-4fa1-aace-e651c95f62cf';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$The per-subscriber fee can add up for shows with a large base of low-paying subscribers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Primarily focused on podcasting, offering less flexibility for other content formats$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Multi-show and network pricing requires contacting sales rather than transparent published rates$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Small company size may mean more limited support bandwidth than larger platforms$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Stripe processing fees apply on top of the flat platform fee$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '438b1e2a-2db1-4fa1-aace-e651c95f62cf';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$What is Supercast?$q$, $q$Supercast is a subscription platform that lets podcasters sell premium, ad-free, or bonus content directly to listeners.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$How much does Supercast cost?$q$, $q$Supercast charges a flat $0.59 per subscriber per month on its main plan, plus standard Stripe payment processing fees.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Does Supercast take a percentage of my revenue?$q$, $q$No, Supercast uses a flat per-subscriber fee rather than taking a percentage share of subscription revenue.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Can I offer free trials on Supercast?$q$, $q$Yes, Supercast supports free trials and promotional codes for subscription plans.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Does Supercast support YouTube content?$q$, $q$Yes, Supercast supports YouTube video feeds alongside standard audio podcast feeds.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Who owns Supercast?$q$, $q$Supercast was acquired in February 2026 by Red Seat Ventures, a division of Fox Corporation's Tubi Media Group, and continues to operate under founder and CEO Jason Sew Hoy.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Is Supercast only for independent podcasters?$q$, $q$No, Supercast serves both independent podcasters and larger podcast networks through its Custom plan.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$How do listeners subscribe through Supercast?$q$, $q$Listeners subscribe through a branded landing page using a simplified two-tap checkout flow.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '438b1e2a-2db1-4fa1-aace-e651c95f62cf';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Independent podcaster premium feed$q$, $q$Offer an ad-free or bonus-content subscription feed directly to a show's existing audience.$q$, $q$Independent podcasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Podcast network multi-show subscriptions$q$, $q$Bundle subscriptions across multiple shows under one network-wide offering.$q$, $q$Podcast networks$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Creator AMAs and bonus content$q$, $q$Use interactive AMA tools and bonus episodes to deepen engagement with paying subscribers.$q$, $q$Content creators and hosts$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '438b1e2a-2db1-4fa1-aace-e651c95f62cf';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$All-in Plan$q$, $q$$0.59 per subscriber$q$, $q$monthly, per subscriber$q$, NULL, $q$["Hosting of all premium content","Dedicated subscriber landing page","Two-tap subscription checkout for listeners","Auto-sync of public episodes","Ask Me Anything platform","Built-in email marketing tools","YouTube video feed support","Subscriber analytics and reporting dashboards"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Custom$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["Everything in the All-in plan","Multi-show support","Multi-show bundle subscriptions","Integration with your own website or membership system"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '438b1e2a-2db1-4fa1-aace-e651c95f62cf';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$overview$q$, $q$What Is Supercast$q$, 2, ARRAY[$q$Supercast is a subscription platform purpose-built for podcasters who want to sell premium or ad-free content directly to listeners. It began in early 2019 when podcaster Sam Harris approached Andrew Wilkinson's company Tiny about building a custom subscription system for his show, Making Sense.$q$, $q$After proving successful with Harris and other independent podcasters, the project became a standalone company under founder and CEO Jason Sew Hoy, and it now serves everyone from single-host shows to large podcast networks.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Supercast provides a branded subscriber landing page, a simplified two-tap checkout for listeners, and feed security features designed to prevent unauthorized sharing of premium content.$q$, $q$It also includes built-in email marketing tools, Ask Me Anything interactive features, YouTube video feed support, multiple subscription tiers including monthly, annual, and lifetime options, free trials and promo codes, and subscriber analytics and reporting dashboards.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Supercast's main All-in plan charges a flat $0.59 per subscriber per month, with no percentage-of-revenue share, plus standard Stripe processing fees of 2.9% plus $0.30 per transaction and a 0.7% recurring billing fee. A Custom plan with negotiated pricing is available for podcast networks that need multi-show support and bundled subscriptions.$q$]::text[], 2);


-- ── Superdesk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Superdesk is a free, open-source, headless newsroom content management system built by Sourcefabric that lets news organizations create, curate, and publish content across web, print, mobile, and social channels from one workflow.$q$, short_description),
  pricing_model = COALESCE($q$open-source (free self-hosted; paid implementation and hosting services available)$q$, pricing_model),
  starting_price = COALESCE($q$Free (self-hosted)$q$, starting_price),
  founded_year = COALESCE(2016, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$Prague, Czech Republic$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Superdesk Review: Open-Source Newsroom CMS$q$, seo_title),
  seo_meta_description = COALESCE($q$Superdesk is a free, open-source newsroom CMS by Sourcefabric for multi-channel news publishing. See features, licensing, pros, cons, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Superdesk is an open-source, headless newsroom content management system developed and maintained by Sourcefabric, a nonprofit organization headquartered in Prague, Czech Republic, with additional offices and representatives across Europe and North America. Superdesk had its first public release in spring 2016 and is licensed under the GNU Affero General Public License version 3, making it free to use, modify, and self-host. The platform follows a create-once-publish-everywhere model, letting newsrooms ingest content from wire services, RSS feeds, social media, and SMS, then manage text, images, video, and audio through a unified editorial workflow that includes planning, desk assignment, and templated automation for recurring publishing tasks. Its API-centric, modular architecture allows integration with legacy newsroom systems and third-party tools, and it is designed to scale from small teams of five users publishing to one site up to large operations with 500 users publishing across 30 or more sites. Superdesk is used by national news agencies as well as small and boutique publishers. It can be self-hosted via manual installation or Docker at no cost, and Sourcefabric also offers paid implementation, hosting, and support services for organizations that want a managed deployment. Sourcefabric employs a small team, generally cited in the range of roughly 30 to 50 people worldwide.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '21706d7e-fb96-4cf7-b074-0ee12931d3ca';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '21706d7e-fb96-4cf7-b074-0ee12931d3ca' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '21706d7e-fb96-4cf7-b074-0ee12931d3ca';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Create-once-publish-everywhere workflow$q$, $q$Produce content once and distribute it across web, print, mobile, and social channels without duplicating work.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Multi-source content ingestion$q$, $q$Aggregates incoming content from wire services, RSS feeds, social media, and SMS into one workflow.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Unified multimedia content management$q$, $q$Manages text, images, video, audio, metadata, and author rights within a single system.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Editorial planning and desk assignment$q$, $q$Tools for scheduling coverage and assigning stories to specific editorial desks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Flexible publishing templates$q$, $q$Automates recurring publishing tasks with reusable templates.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$API-centric, headless architecture$q$, $q$A modular design that integrates with legacy newsroom systems and third-party applications.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Docker-based self-hosted deployment$q$, $q$Can be installed manually or via Docker for organizations that want to run it on their own infrastructure.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Scales from small to national-scale newsrooms$q$, $q$Supports deployments ranging from five users publishing to one site up to 500 users publishing across 30-plus sites.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '21706d7e-fb96-4cf7-b074-0ee12931d3ca';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Completely free and open source under the AGPLv3 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Purpose-built for professional newsroom editorial workflows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Highly scalable, used by both small publishers and national news agencies$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$API-centric design integrates with legacy and third-party systems$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Backed by an established nonprofit focused specifically on journalism software$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '21706d7e-fb96-4cf7-b074-0ee12931d3ca';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Requires technical resources to self-host and maintain$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$No official low-cost cloud tier; managed hosting is a custom-priced service$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Steeper learning curve for non-technical newsroom staff$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Smaller community and ecosystem than mainstream commercial CMS platforms$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Documentation and support are more limited outside of paid engagements with Sourcefabric$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '21706d7e-fb96-4cf7-b074-0ee12931d3ca';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$What is Superdesk?$q$, $q$Superdesk is an open-source, headless content management system built for newsrooms to create, curate, and publish content across multiple channels.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Is Superdesk free?$q$, $q$Yes, Superdesk is free and open source under the AGPLv3 license and can be self-hosted at no licensing cost.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Who develops Superdesk?$q$, $q$Superdesk is developed and maintained by Sourcefabric, a nonprofit organization headquartered in Prague, Czech Republic.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Can Superdesk be self-hosted?$q$, $q$Yes, Superdesk can be installed manually or deployed using Docker on your own infrastructure.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$What license does Superdesk use?$q$, $q$Superdesk is released under the GNU Affero General Public License version 3 (AGPLv3).$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Who uses Superdesk?$q$, $q$Superdesk is used by organizations ranging from national news agencies and wire services to small and boutique publishers.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Does Superdesk support publishing to multiple channels?$q$, $q$Yes, its create-once-publish-everywhere model supports distributing content across web, print, mobile, and social channels.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Does Sourcefabric offer paid support for Superdesk?$q$, $q$Yes, Sourcefabric offers paid implementation, hosting, and support services for organizations that want a managed deployment.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '21706d7e-fb96-4cf7-b074-0ee12931d3ca';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$National news agency multi-channel publishing$q$, $q$Manage large-scale editorial operations distributing content across dozens of sites and channels.$q$, $q$Large news organizations and wire services$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Boutique newsroom content management$q$, $q$Run a smaller editorial operation with a unified workflow for authoring and publishing content.$q$, $q$Independent and boutique publishers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Wire service content aggregation$q$, $q$Ingest and distribute content from multiple wire, RSS, and social sources through one system.$q$, $q$News agencies and wire services$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '21706d7e-fb96-4cf7-b074-0ee12931d3ca';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Self-Hosted (Open Source)$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full Superdesk source code","AGPLv3 license","Manual or Docker-based installation","Community documentation"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Managed Implementation (via Sourcefabric)$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["Hosting and infrastructure setup","Implementation and migration services","Ongoing technical support","Training for newsroom staff"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '21706d7e-fb96-4cf7-b074-0ee12931d3ca';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$overview$q$, $q$What Is Superdesk$q$, 2, ARRAY[$q$Superdesk is an open-source, headless content management system built specifically for newsrooms. It is developed by Sourcefabric, a Czech nonprofit that builds open-source software for independent journalism, and had its first public release in spring 2016.$q$, $q$The platform is designed to handle the entire news production lifecycle, from sourcing and creating content to editorial planning, production, and distribution across multiple channels, all from a single system.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Superdesk follows a create-once-publish-everywhere approach, letting newsrooms produce content once and distribute it across web, print, mobile, and social channels without duplicating work. It ingests content from wire services, RSS, social media, and SMS into a unified workflow.$q$, $q$It includes planning and desk assignment tools for scheduling coverage, flexible templates for automating recurring publishing tasks, and an API-centric, modular architecture that integrates with legacy systems and third-party applications.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Superdesk itself is free and open source under the AGPLv3 license, and can be self-hosted through manual installation or Docker at no licensing cost. Organizations that prefer a managed deployment can engage Sourcefabric directly for paid implementation, hosting, and support services, which are priced individually per engagement.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Superhuman ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Superhuman is a premium, AI-powered email client for Gmail and Outlook that focuses on speed, keyboard shortcuts, and inbox-zero workflows for professionals and sales teams.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$$25/month per user (billed annually)$q$, starting_price),
  founded_year = COALESCE(2015, founded_year),
  company_size = COALESCE($q$51-200 employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Superhuman Review: Premium AI Email Client$q$, seo_title),
  seo_meta_description = COALESCE($q$Superhuman is a fast, AI-powered email client for Gmail and Outlook. See pricing plans, features, pros, cons, and how it compares to alternatives.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Superhuman is a premium email client for Gmail and Outlook, founded in 2015 by Rahul Vohra, Conrad Irwin, and Vivek Sodera in San Francisco. The product is built around speed and keyboard-shortcut-driven workflows, aiming to make every action feel close to instant, and it includes a Split Inbox for prioritizing important senders, scheduled send, read status tracking, snippets, and undo send. Its Business plan adds AI features such as Auto Draft, Auto Labels, and Smart Write, Grammarly-powered writing assistance, a Coda workspace, CRM integrations with Salesforce, HubSpot, and Pipedrive, an AI agent called Superhuman Go, and priority support. Pricing starts at $25 per user per month on the Starter plan when billed annually (or $30 per month billed monthly), rising to $33 per user per month on the Business plan billed annually (or $40 per month billed monthly). Superhuman raised more than $100 million in venture funding, including a $75 million round in 2021, before being acquired by Grammarly in a deal announced in July 2025 and completed in October 2025 for a reported price in the hundreds of millions of dollars. It is positioned for busy executives, founders, and sales professionals who process large volumes of email and want a faster, more automated inbox than standard Gmail or Outlook clients provide.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '331db11d-c5e0-4d89-b61b-3caeaaa512ad';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '331db11d-c5e0-4d89-b61b-3caeaaa512ad' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '331db11d-c5e0-4d89-b61b-3caeaaa512ad';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Speed-focused interface$q$, $q$Designed so common actions feel close to instant, backed by extensive keyboard shortcuts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Split Inbox$q$, $q$Automatically separates important senders from lower-priority email for faster triage.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$AI Auto Draft and Smart Write$q$, $q$AI-generated draft replies and writing assistance to speed up composing email.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Scheduled send and follow-up reminders$q$, $q$Schedule emails to send later and get reminded to follow up if there is no reply.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Read status tracking$q$, $q$See when recipients have opened an email.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Snippets and templates$q$, $q$Reusable text blocks for frequently sent messages.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$CRM integrations$q$, $q$Connects with Salesforce, HubSpot, and Pipedrive on the Business plan.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Superhuman Go$q$, $q$An AI agent included on the Business plan for automating parts of the email workflow.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '331db11d-c5e0-4d89-b61b-3caeaaa512ad';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Extremely fast, polished interface built around keyboard shortcuts$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Strong AI writing, drafting, and triage features$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$CRM integrations that are useful for sales-focused teams$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$High reported satisfaction among power users who process heavy email volume$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Backed by Grammarly's resources following the 2025 acquisition$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '331db11d-c5e0-4d89-b61b-3caeaaa512ad';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Expensive compared to standard email clients and built-in Gmail or Outlook apps$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Only supports Gmail and Outlook accounts, not other email providers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Learning curve required to master the keyboard-shortcut-driven workflow$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$No permanently free tier$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Recently acquired by Grammarly, which raises questions about long-term product direction$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '331db11d-c5e0-4d89-b61b-3caeaaa512ad';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$What is Superhuman?$q$, $q$Superhuman is a premium email client for Gmail and Outlook focused on speed, keyboard shortcuts, and AI-assisted email workflows.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$How much does Superhuman cost?$q$, $q$Superhuman starts at $25 per user per month on the Starter plan billed annually, with the Business plan at $33 per user per month billed annually.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Does Superhuman work with Gmail and Outlook?$q$, $q$Yes, Superhuman connects to existing Gmail and Outlook accounts rather than replacing your email provider.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Is there a free trial of Superhuman?$q$, $q$Superhuman has historically offered trial periods for new users; current trial availability should be confirmed on its official pricing page.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$What is Superhuman Go?$q$, $q$Superhuman Go is an AI agent included on the Business plan that helps automate parts of the email workflow.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Who owns Superhuman now?$q$, $q$Superhuman was acquired by Grammarly in a deal announced in July 2025 and completed in October 2025.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Is Superhuman worth it for individuals or just teams?$q$, $q$Superhuman is used by both individuals and teams, but its price point is aimed primarily at professionals who handle high email volume, such as executives and salespeople.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Does Superhuman have a mobile app?$q$, $q$Yes, Superhuman offers mobile apps in addition to its desktop and web experience.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '331db11d-c5e0-4d89-b61b-3caeaaa512ad';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Executives managing high email volume$q$, $q$Use Split Inbox, shortcuts, and AI drafting to process large amounts of email faster.$q$, $q$Executives and founders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Sales teams needing CRM-connected email$q$, $q$Sync email activity with Salesforce, HubSpot, or Pipedrive to keep CRM records up to date.$q$, $q$Sales professionals$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Inbox-zero focused professionals$q$, $q$Adopt keyboard-shortcut-driven triage and scheduled send to keep the inbox consistently clear.$q$, $q$Knowledge workers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '331db11d-c5e0-4d89-b61b-3caeaaa512ad';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Starter$q$, $q$$25/month per user (billed annually) or $30/month (billed monthly)$q$, $q$monthly or annual$q$, NULL, $q$["Split Inbox","Keyboard shortcuts","Read statuses","Scheduled send","Snippets","Undo send"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$Business$q$, $q$$33/month per user (billed annually) or $40/month (billed monthly)$q$, $q$monthly or annual$q$, NULL, $q$["Everything in Starter","AI Auto Draft, Auto Labels, and Smart Write","Grammarly writing AI","Coda workspace","CRM integrations with Salesforce, HubSpot, and Pipedrive","Superhuman Go AI agent","Priority support"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '331db11d-c5e0-4d89-b61b-3caeaaa512ad';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$overview$q$, $q$What Is Superhuman$q$, 2, ARRAY[$q$Superhuman is a paid email client that layers on top of existing Gmail and Outlook accounts, rebuilding the inbox experience around speed and keyboard shortcuts. It was founded in 2015 by Rahul Vohra, Conrad Irwin, and Vivek Sodera in San Francisco.$q$, $q$Rather than replacing a user's email provider, Superhuman connects to an existing Gmail or Outlook account and layers a faster interface, AI writing assistance, and workflow automation on top of it.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Core features include a Split Inbox for surfacing important messages, keyboard shortcuts for nearly every action, read status tracking, scheduled send, snippets and templates, and undo send.$q$, $q$The Business plan adds AI features such as Auto Draft, Auto Labels, and Smart Write, Grammarly-powered writing assistance, CRM integrations with Salesforce, HubSpot, and Pipedrive, and an AI agent called Superhuman Go.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('331db11d-c5e0-4d89-b61b-3caeaaa512ad', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Superhuman offers two paid plans. Starter costs $25 per user per month billed annually, or $30 per month billed monthly. Business costs $33 per user per month billed annually, or $40 per month billed monthly, and adds advanced AI features and CRM integrations. There is no permanently free tier.$q$]::text[], 2);


-- ── Superlist ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Superlist is a to-do list and task management app from the creators of Wunderlist, combining personal task lists, shared team lists, and AI features like meeting notes and task generation.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Basic plan from $5/month)$q$, starting_price),
  founded_year = COALESCE(2020, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$Berlin, Germany$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Superlist Review: To-Do App by Wunderlist Founders$q$, seo_title),
  seo_meta_description = COALESCE($q$Superlist is a to-do list app from Wunderlist co-founder Christian Reber. See pricing plans, AI features, pros, cons, and use cases.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Superlist is a task and to-do list app made by Superlist Software GmbH, founded in Berlin in 2020 by Christian Reber, co-founder of the earlier app Wunderlist, along with Ben Kubota, Brandon Arnold, Marcel Kading, and Niklas Jansen. Wunderlist was acquired by Microsoft in 2015 and later shut down, and after an unsuccessful attempt to buy it back, Reber built Superlist as its spiritual successor, launching it publicly in 2024. The app combines personal to-do lists with shared, collaborative lists that support real-time editing, task assignment, and in-task messaging, along with notes attached to tasks. It also includes AI features such as Voice AI for capturing tasks by speaking, AI Meeting Notes that automatically generate tasks from meeting transcripts, Make AI for AI-assisted task and list generation, and email or Slack summarization into tasks. Superlist is available on macOS, iOS, Android, and the web. It uses a freemium pricing model: a free plan supports up to five private and five shared lists with up to five people per shared list; a Basic plan costs $5 per person per month, or $59 per year, and unlocks unlimited lists and team members; and a Super plan costs $21 per person per month, or $249 per year, and adds unlimited AI Meeting Notes and AI chat. The company is a small, VC-backed team of roughly a dozen to two dozen employees based in Berlin, Germany.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7bb2a1c0-a8a2-4210-989c-3a4008f6840a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7bb2a1c0-a8a2-4210-989c-3a4008f6840a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '7bb2a1c0-a8a2-4210-989c-3a4008f6840a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Personal and shared to-do lists$q$, $q$Organize tasks in private lists or shared lists with sublists for collaborators.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Real-time collaboration$q$, $q$Multiple people can edit shared lists at once, with in-task messaging for discussion.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Voice AI$q$, $q$Capture tasks by speaking instead of typing them out.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$AI Meeting Notes$q$, $q$Automatically generates tasks from meeting notes or transcripts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Make AI$q$, $q$AI-assisted generation of tasks and lists from a simple prompt.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Cross-platform apps$q$, $q$Available on macOS, iOS, Android, and the web for consistent access across devices.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Notes attached to tasks$q$, $q$Add detailed notes directly to individual tasks or lists.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Email and Slack summarization$q$, $q$Turns email and Slack messages into tasks automatically on the Super plan.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '7bb2a1c0-a8a2-4210-989c-3a4008f6840a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Polished, modern interface from a team with prior experience building Wunderlist$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Generous free tier for personal use$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Strong AI features for meeting notes and hands-free task capture$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Solid real-time collaboration for shared lists$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Available across macOS, iOS, Android, and web$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '7bb2a1c0-a8a2-4210-989c-3a4008f6840a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Most advanced AI features are limited to the pricier Super plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Smaller company than larger to-do app competitors like Todoist or Microsoft To Do$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Some former Wunderlist users report missing features from the original app$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$The company is still relatively young and small$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Per-person pricing can get costly for larger teams on paid plans$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '7bb2a1c0-a8a2-4210-989c-3a4008f6840a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$What is Superlist?$q$, $q$Superlist is a to-do list and task management app with personal lists, shared collaborative lists, and AI features.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Is Superlist related to Wunderlist?$q$, $q$Yes, Superlist was founded by Christian Reber, co-founder of Wunderlist, as a spiritual successor after Wunderlist was shut down by Microsoft.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Is Superlist free?$q$, $q$Yes, Superlist has a free plan with up to five private and five shared lists; paid plans start at $5 per person per month for unlimited lists.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$What is included in the Super plan?$q$, $q$The Super plan, at $21 per person per month, adds unlimited AI Meeting Notes, unlimited AI chat, Make AI generation, and email and Slack task summarization.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Does Superlist support team collaboration?$q$, $q$Yes, shared lists support real-time collaboration, task assignment, and in-task messaging.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$What platforms does Superlist support?$q$, $q$Superlist is available on macOS, iOS, Android, and the web.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Who founded Superlist?$q$, $q$Superlist was founded in 2020 in Berlin by Christian Reber along with Ben Kubota, Brandon Arnold, Marcel Kading, and Niklas Jansen.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Does Superlist have AI features?$q$, $q$Yes, including Voice AI, AI Meeting Notes, Make AI task generation, and email or Slack summarization.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '7bb2a1c0-a8a2-4210-989c-3a4008f6840a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Personal task and to-do list management$q$, $q$Track personal tasks and notes across devices with a free, unlimited-task personal plan.$q$, $q$Individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Small team shared list collaboration$q$, $q$Coordinate shared tasks in real time with task assignment and in-task messaging.$q$, $q$Small teams and families$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Meeting-to-task automation$q$, $q$Use AI Meeting Notes to automatically turn meeting discussions into assigned tasks.$q$, $q$Managers and busy professionals$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '7bb2a1c0-a8a2-4210-989c-3a4008f6840a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Free$q$, $q$$0$q$, $q$monthly$q$, NULL, $q$["Up to 5 private lists","Up to 5 shared lists with up to 5 people each","Unlimited tasks and notes","Apps on macOS, iOS, Android, and web","25MB uploads and 500MB storage"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Basic$q$, $q$$5/person/month ($59/year)$q$, $q$monthly or annual$q$, NULL, $q$["Everything in Free","Unlimited lists, sublists, and shared lists","All integrations","Unlimited team members","Voice AI","100MB uploads and 25GB storage"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$Super$q$, $q$$21/person/month ($249/year)$q$, $q$monthly or annual$q$, NULL, $q$["Everything in Basic","Unlimited AI Meeting Notes","Unlimited AI Chat messages","AI generation with Make AI","Email and Slack task summarization"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '7bb2a1c0-a8a2-4210-989c-3a4008f6840a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$overview$q$, $q$What Is Superlist$q$, 2, ARRAY[$q$Superlist is a to-do list and task management app built by Superlist Software GmbH, founded in Berlin in 2020 by Christian Reber, who previously co-founded the popular to-do app Wunderlist before it was acquired by Microsoft in 2015 and eventually discontinued.$q$, $q$After an unsuccessful attempt to buy Wunderlist back from Microsoft, Reber and a small team built Superlist from scratch as a modern successor, publicly launching the app in 2024.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Superlist combines personal to-do lists with shared, real-time collaborative lists that support task assignment, in-task messaging, and notes attached to individual tasks or lists.$q$, $q$It also includes AI features such as Voice AI for hands-free task capture, AI Meeting Notes that automatically turn meeting transcripts into tasks, Make AI for generating tasks and lists, and automatic summarization of email and Slack messages into actionable items.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bb2a1c0-a8a2-4210-989c-3a4008f6840a', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Superlist uses a freemium model. The Free plan supports up to five private lists and five shared lists with up to five people each. The Basic plan costs $5 per person per month, or $59 per year, and removes list limits. The Super plan costs $21 per person per month, or $249 per year, and adds unlimited AI Meeting Notes and AI chat features.$q$]::text[], 2);



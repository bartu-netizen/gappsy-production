-- Enrichment batch: Eleventy, Nuxt, SvelteKit, Remix, Qwik, Theneo, Backstage, Port, Cortex, OpsLevel, Roadie, Gitea, Forgejo, RhodeCode, Gogs, SourceHut, OneDev, Woodpecker CI, Drone CI, Concourse CI, Buildbot, GoCD, CircleCI, Semaphore, Buildkite, Buddy, Harness, Flux, Rancher, Portainer, Coolify, CapRover, Dokku, Tsuru, Cloudron, YunoHost, CasaOS, Umbrel, OpenNebula, OpenStack, Harvester, KubeVirt, Nomad, HashiCorp Consul, Boundary, Authelia, Permify, Casbin, Open Policy Agent, Conjur, TheHive, MISP, OpenCTI, Velociraptor, FleetDM, osquery, Suricata, Zeek, Snort, DefectDojo, Faraday, Dependency-Track, OWASP Dependency-Check, Harbor, Quay, Verdaccio, Sonatype Nexus Repository, JFrog Artifactory, Pulp, Cloudsmith, Nagios, Checkmk, LibreNMS, Observium, Gatus
-- Publishes 75 bulk-imported tool(s) with full editorial content.

-- ── Eleventy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Eleventy (11ty) is a free, open-source static site generator that compiles templates into fast, JavaScript-free HTML.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Eleventy is a free open-source static site generator supporting 13+ template languages with zero-config, fast builds.$q$,
  og_description = $q$Eleventy is a free open-source static site generator supporting 13+ template languages with zero-config, fast builds.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd95e837c-ef43-455b-89b5-3d198bab18ed';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd95e837c-ef43-455b-89b5-3d198bab18ed' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$Multiple template languages$q$, $q$Supports HTML, Markdown, WebC, JavaScript, Liquid, Nunjucks, Handlebars, Mustache, EJS, Haml, Pug, TypeScript, JSX, and MDX in the same project.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$Fast builds$q$, $q$Compiles large sites quickly, with published benchmarks showing 4,000 Markdown files built in under 2 seconds.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$No client-side JavaScript by default$q$, $q$Eleventy ships plain HTML output with no required JavaScript framework or client-side runtime.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$Zero-config start$q$, $q$Works out of the box with no required configuration file, while still offering flexible configuration options.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$Works with existing directory structures$q$, $q$Designed for incremental adoption into existing projects rather than requiring a specific folder layout.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$Free and open source with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$Fast build performance on large sites$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$Supports many template languages side by side in one project$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$Ships no JavaScript to the browser by default$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$Requires Node.js 18 or newer to run$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$No official hosted/cloud product; deployment must be configured separately with a host of your choice$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$As a build tool rather than an application, it has no built-in UI for non-developers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$Is Eleventy free to use?$q$, $q$Yes, Eleventy is open source and free to use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$What template languages does Eleventy support?$q$, $q$13+ languages, including Markdown, Liquid, Nunjucks, Handlebars, EJS, Pug, JSX, and MDX.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$Does Eleventy require Node.js?$q$, $q$Yes, Eleventy requires Node.js 18 or newer and can be installed via npm, pnpm, or yarn.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$Who maintains Eleventy?$q$, $q$Eleventy was originally created by Zach Leat and is now part of the Font Awesome organization following an acquisition in September 2024.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$Static blogs and marketing sites$q$, $q$Compile Markdown and template content into pre-rendered HTML pages without a JavaScript framework.$q$, $q$Web developers and static-site builders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$Documentation sites$q$, $q$Generate documentation output from Markdown and templates with fast rebuild times.$q$, $q$Technical writers and developer teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$overview$q$, $q$What is Eleventy?$q$, 2, ARRAY[$q$Eleventy, also known as 11ty, is an open-source static site generator that compiles template files into a pre-rendered `_site` output folder. It supports 13+ template languages side by side, including Markdown, Liquid, Nunjucks, Handlebars, and JSX, and ships no client-side JavaScript by default.$q$, $q$The project was originally created by Zach Leat and is now maintained under the Font Awesome organization following a September 2024 acquisition. Eleventy is used across a large number of public GitHub repositories for blogs, documentation, and marketing sites.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', $q$who-its-for$q$, $q$Who Eleventy is for$q$, 2, ARRAY[$q$Eleventy suits developers who want a fast, framework-agnostic static site generator that can be adopted incrementally into an existing project without requiring a full JavaScript framework stack.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d95e837c-ef43-455b-89b5-3d198bab18ed', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Nuxt ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Nuxt is a free, open-source full-stack Vue.js framework with file-based routing, SSR/SSG, and a 200+ module ecosystem.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Nuxt is an open-source, MIT-licensed Vue framework offering file-based routing, SSR/SSG, and 200+ modules for full-stack apps.$q$,
  og_description = $q$Nuxt is an open-source, MIT-licensed Vue framework offering file-based routing, SSR/SSG, and 200+ modules for full-stack apps.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '18d961a0-d3f8-4b71-86cc-965236f0cda6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '18d961a0-d3f8-4b71-86cc-965236f0cda6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$File-based routing$q$, $q$Routes and auto-imports are configured automatically based on project file structure.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$Multiple rendering modes$q$, $q$Supports server-side rendering (SSR), client-side rendering (CSR), and static-site generation (SSG) in the same framework.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$Built on Vue, Vite, and Nitro$q$, $q$Uses Vue.js for the frontend, Vite as the bundler, and the Nitro server engine for the backend.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$Built-in TypeScript support$q$, $q$Ships with TypeScript support and automatically generated types.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$Modular architecture$q$, $q$Over 200 community modules extend Nuxt with additional functionality.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$SEO and meta tag management$q$, $q$Includes built-in tooling for managing meta tags and SEO-related settings.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$Free, open source, and MIT licensed$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$Large module ecosystem with 200+ available extensions$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$Supports SSR, SSG, and CSR from a single framework$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$Backed by sponsors including Vercel$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$Requires familiarity with Vue.js to use effectively$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$No dedicated managed pricing page was found describing paid enterprise support on the reviewed site content$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$Is Nuxt free to use?$q$, $q$Yes, Nuxt is 100% open source under the MIT License.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$What rendering modes does Nuxt support?$q$, $q$Server-side rendering (SSR), client-side rendering (CSR), and static-site generation (SSG).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$What does Nuxt use under the hood?$q$, $q$Vue.js for the frontend, Vite as the bundler, and Nitro as the server engine.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$Who uses Nuxt?$q$, $q$Nuxt's site lists enterprises such as Louis Vuitton, Blizzard, and NASA as users, alongside smaller startups.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$Server-rendered Vue applications$q$, $q$Build SSR Vue.js apps with file-based routing and automatic imports.$q$, $q$Vue.js developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$Static and hybrid sites$q$, $q$Generate statically rendered or hybrid-rendered sites using Nuxt's SSG mode.$q$, $q$Teams building marketing or content sites on Vue$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$overview$q$, $q$What is Nuxt?$q$, 2, ARRAY[$q$Nuxt is an open-source, full-stack framework for Vue.js that provides file-based routing, automatic auto-imports, and multiple rendering modes (SSR, CSR, and SSG). It is built on Vue.js, Vite, and the Nitro server engine.$q$, $q$Nuxt is 100% open source under the MIT License and has a modular architecture with more than 200 community-built modules covering things like content management, image optimization, and authentication.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', $q$who-its-for$q$, $q$Who Nuxt is for$q$, 2, ARRAY[$q$Nuxt is aimed at Vue.js developers who want an opinionated, batteries-included framework for building production web applications, from small projects to large-scale enterprise sites.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('18d961a0-d3f8-4b71-86cc-965236f0cda6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── SvelteKit ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SvelteKit is a free, open-source framework for building web applications with Svelte, offering routing, SSR, and SSG.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$SvelteKit is an open-source, MIT-licensed framework for building Svelte web apps with routing, SSR, SSG, and deployment adapters.$q$,
  og_description = $q$SvelteKit is an open-source, MIT-licensed framework for building Svelte web apps with routing, SSR, SSG, and deployment adapters.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c1bac24a-e6cf-4182-8ac7-8a3fd1004018';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c1bac24a-e6cf-4182-8ac7-8a3fd1004018' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Filesystem-based routing$q$, $q$Routes update the UI automatically when links are clicked, based on the project's file structure.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Server-side rendering and static generation$q$, $q$Supports rendering parts of an app on the server (SSR) or prerendering at build time (SSG).$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Adapter-based deployment$q$, $q$Deploys to Node servers, Cloudflare, Netlify, and Vercel through a configurable adapter system.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Built-in image optimization$q$, $q$Includes tooling for optimizing images as part of the build process.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Page preloading$q$, $q$Fetches pages before the user navigates to them for faster perceived performance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Offline support$q$, $q$Provides service worker functionality for offline use cases.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Vite-powered dev experience$q$, $q$Uses Vite with Svelte plugins for hot module replacement and fast local development.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Flexible deployment via adapters for multiple hosting platforms$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Fast development experience powered by Vite$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Built-in SSR, SSG, and CSR support$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Smaller ecosystem and community than React- or Vue-based frameworks$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Requires learning Svelte's compiler-based component model$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Is SvelteKit free to use?$q$, $q$Yes, SvelteKit is part of the Svelte ecosystem, which is free and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$What rendering modes does SvelteKit support?$q$, $q$Server-side rendering (SSR), client-side rendering (CSR), and static-site generation (SSG).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$How does SvelteKit handle deployment?$q$, $q$Through a configurable adapter system supporting Node servers, Cloudflare, Netlify, and Vercel.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$What build tool does SvelteKit use?$q$, $q$SvelteKit uses Vite for development and building.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Full-featured web applications$q$, $q$Build routed, server-rendered applications using Svelte components.$q$, $q$Svelte developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Statically generated sites$q$, $q$Prerender pages at build time for static hosting.$q$, $q$Teams building content or marketing sites with Svelte$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$overview$q$, $q$What is SvelteKit?$q$, 2, ARRAY[$q$SvelteKit is a framework for building web applications using Svelte, comparable in role to Next.js for React or Nuxt for Vue. It provides filesystem-based routing, SSR, SSG, and CSR, plus an adapter system for deploying to Node, Cloudflare, Netlify, and Vercel.$q$, $q$It is part of the Svelte project, which is free and open source under the MIT license, and is built on top of Vite for development tooling.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$who-its-for$q$, $q$Who SvelteKit is for$q$, 2, ARRAY[$q$SvelteKit is for developers who want to build performant web applications with Svelte and need routing, rendering, and deployment handled by a cohesive framework rather than assembled from separate tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Remix ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Remix is an open-source, full-stack JavaScript web framework maintained by Shopify, combining server, router, and data layer in one dependency.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Remix is a free, MIT-licensed full-stack JavaScript framework from Shopify with a built-in server, router, and data layer.$q$,
  og_description = $q$Remix is a free, MIT-licensed full-stack JavaScript framework from Shopify with a built-in server, router, and data layer.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '037448f0-d565-48e0-bfb8-ee13f7081535';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '037448f0-d565-48e0-bfb8-ee13f7081535' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('037448f0-d565-48e0-bfb8-ee13f7081535', $q$Full-stack in one dependency$q$, $q$Bundles a server, router, data layer, UI components, and testing tools into a single framework dependency.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('037448f0-d565-48e0-bfb8-ee13f7081535', $q$Web-standard components$q$, $q$UI components are built on web primitives such as EventTarget rather than being tied to React-only hooks.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('037448f0-d565-48e0-bfb8-ee13f7081535', $q$Interoperability$q$, $q$Designed to work with web components and third-party libraries.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('037448f0-d565-48e0-bfb8-ee13f7081535', $q$AI-agent-friendly design$q$, $q$The framework is positioned to work with AI coding agents and plain-language modifications.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('037448f0-d565-48e0-bfb8-ee13f7081535', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('037448f0-d565-48e0-bfb8-ee13f7081535', $q$Maintained and backed by Shopify$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('037448f0-d565-48e0-bfb8-ee13f7081535', $q$Combines frontend and backend concerns in a single dependency$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('037448f0-d565-48e0-bfb8-ee13f7081535', $q$Documentation and examples are openly licensed on GitHub$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('037448f0-d565-48e0-bfb8-ee13f7081535', $q$Remix 3 is currently available only as a beta release$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('037448f0-d565-48e0-bfb8-ee13f7081535', $q$Requires adopting Remix's full-stack conventions rather than a plain client-side setup$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('037448f0-d565-48e0-bfb8-ee13f7081535', $q$Is Remix free to use?$q$, $q$Yes, Remix is open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('037448f0-d565-48e0-bfb8-ee13f7081535', $q$Who maintains Remix?$q$, $q$Remix is owned and maintained by Shopify, Inc.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('037448f0-d565-48e0-bfb8-ee13f7081535', $q$Is Remix 3 stable?$q$, $q$As of the current release, Remix 3 is available as a beta.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('037448f0-d565-48e0-bfb8-ee13f7081535', $q$What is included in the Remix framework?$q$, $q$A server, router, data layer, UI components, and testing tools.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('037448f0-d565-48e0-bfb8-ee13f7081535', $q$Full-stack JavaScript applications$q$, $q$Build applications with server, routing, and data-fetching handled by a single framework.$q$, $q$Full-stack JavaScript developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('037448f0-d565-48e0-bfb8-ee13f7081535', $q$Rapid prototyping to production apps$q$, $q$Scale from quick prototypes to established production applications on the same framework.$q$, $q$Startups and established engineering teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('037448f0-d565-48e0-bfb8-ee13f7081535', $q$overview$q$, $q$What is Remix?$q$, 2, ARRAY[$q$Remix is an open-source, full-stack JavaScript framework that bundles a server, router, data layer, UI components, and testing tools into a single dependency. It is owned and maintained by Shopify, Inc.$q$, $q$Remix's components are built on web-standard primitives such as EventTarget rather than being exclusively tied to React hooks, and the framework is designed to interoperate with web components and third-party libraries. Remix 3 is currently available as a beta release.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('037448f0-d565-48e0-bfb8-ee13f7081535', $q$who-its-for$q$, $q$Who Remix is for$q$, 2, ARRAY[$q$Remix targets developers who want a single, cohesive full-stack framework covering routing, data loading, and UI rendering, from quick prototypes through to production applications.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('037448f0-d565-48e0-bfb8-ee13f7081535', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Qwik ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Qwik is an open-source web framework that uses resumability to skip hydration and make applications instantly interactive.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Qwik is a free, MIT-licensed web framework that uses resumability to skip hydration for instantly interactive apps.$q$,
  og_description = $q$Qwik is a free, MIT-licensed web framework that uses resumability to skip hydration for instantly interactive apps.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '06d2781b-fc8f-45ff-905b-0da1b9931d4e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '06d2781b-fc8f-45ff-905b-0da1b9931d4e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$Resumability$q$, $q$Skips traditional hydration so applications become instantly interactive, rather than re-executing app logic on the client.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$JSX syntax$q$, $q$Uses JSX and functional components, targeting developers already familiar with React.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$Built-in tooling$q$, $q$Includes Vite for development and Vitest and Playwright for testing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$Styling support$q$, $q$Works with Tailwind and PostCSS for styling.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$SSR and prerendering$q$, $q$Supports server-side rendering and prerendering with debugging tools.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$Resumability avoids the hydration cost typical of other frameworks$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$JSX syntax is familiar to developers coming from React$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$Sponsored by Builder.io$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$Smaller community and ecosystem compared to React or Vue$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$Newer framework with fewer third-party integrations and less production track record$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$Is Qwik free to use?$q$, $q$Yes, Qwik is open source under the MIT License.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$What is resumability in Qwik?$q$, $q$A technique that skips hydration so applications become interactive immediately, rather than waiting for client-side JavaScript to re-execute.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$Who sponsors Qwik?$q$, $q$Builder.io is listed as a special sponsor funding the project's development.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$What testing tools does Qwik include?$q$, $q$Vitest and Playwright are included as part of the standard tooling.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$High-performance web apps$q$, $q$Build applications that need to be interactive immediately without a hydration delay.$q$, $q$Performance-focused web developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$React-to-Qwik migrations$q$, $q$Adopt Qwik using familiar JSX and functional-component patterns.$q$, $q$Developers with React experience$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$overview$q$, $q$What is Qwik?$q$, 2, ARRAY[$q$Qwik is an open-source web framework built around resumability, a technique that skips traditional hydration so applications are instantly interactive. It uses JSX and functional components, and ships with Vite, Vitest, and Playwright as part of its standard tooling.$q$, $q$Qwik is MIT licensed and maintained by the Qwik team, with Builder.io listed as a special sponsor funding its development.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', $q$who-its-for$q$, $q$Who Qwik is for$q$, 2, ARRAY[$q$Qwik is aimed at web developers, particularly those with React experience, who want to build high-performance applications and avoid the hydration overhead common in other JavaScript frameworks.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06d2781b-fc8f-45ff-905b-0da1b9931d4e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Theneo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Theneo is an AI-powered API documentation and developer portal platform with real-time collaboration and a free starter plan.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$120/month per workspace (Business plan, billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Theneo is an AI-powered API documentation and developer portal platform with a free plan and paid tiers from $120/month.$q$,
  og_description = $q$Theneo is an AI-powered API documentation and developer portal platform with a free plan and paid tiers from $120/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '87dcb1df-40ff-447f-9953-e64d1561e834';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '87dcb1df-40ff-447f-9953-e64d1561e834' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$AI-powered documentation generation$q$, $q$Automatically generates documentation from API specs, plus an "Ask AI" search feature for developers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Real-time collaboration$q$, $q$Live cursors and presence indicators allow simultaneous editing across teams.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Developer portals$q$, $q$Private, authenticated portals with per-customer access controls.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Changelog management$q$, $q$Smart detection of breaking changes for changelog documentation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Markdown and WYSIWYG editors$q$, $q$Flexible editing options for engineers and non-technical users.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Version control$q$, $q$Rollback capabilities and full audit logs for documentation changes.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Multi-format API support$q$, $q$Supports REST, Async, SOAP, GraphQL, and gRPC API documentation.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Agent integration$q$, $q$Provides an MCP server and llms.txt support for AI agent compatibility.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Free Starter plan available (1 public project, 2 private projects, up to 20 team members)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$SOC 2 Type II and ISO 27001/9001 certified$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Self-hosting available on the Enterprise plan$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Supports multiple API spec formats (REST, Async, SOAP, GraphQL, gRPC)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Business and Growth tiers are priced per workspace, which can add up for multiple teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Enterprise pricing and self-hosting require a custom quote$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Monthly billing is notably more expensive than annual billing across all paid tiers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Does Theneo have a free plan?$q$, $q$Yes, the Starter plan is free, with limits on projects (1 public, 2 private) and up to 20 team members.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$What API formats does Theneo support?$q$, $q$REST, Async, SOAP, GraphQL, and gRPC.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Can Theneo be self-hosted?$q$, $q$Yes, self-hosting is available on the Enterprise plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Does Theneo offer AI features?$q$, $q$Yes, including AI-generated documentation from API specs and an "Ask AI" search assistant.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$How much does Theneo's Business plan cost?$q$, $q$$120/month per workspace billed annually, or $150/month billed monthly.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$API documentation for engineering teams$q$, $q$Generate and collaboratively maintain API reference documentation across REST, GraphQL, and other formats.$q$, $q$Engineering and developer relations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Partner and customer developer portals$q$, $q$Publish private, authenticated documentation portals with per-customer access controls.$q$, $q$B2B platforms, fintechs, and regulated industries$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Starter$q$, $q$Free$q$, $q$annual$q$, $q$["1 public project, 2 private projects","Up to 20 team members","Up to 100 AI-powered search results","2,000 AI Doc Builder uses","Changelog docs, API Explorer, analytics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Business$q$, $q$$120/month/workspace$q$, $q$annual$q$, $q$["Up to 7 projects, 50 team members","Unlimited searchAI and TheneoAI use","Custom domain, branding, and design templates"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Growth$q$, $q$$400/month/workspace$q$, $q$annual$q$, $q$["Up to 20 developer hubs","Custom CSS, ChatGPT configuration","Advanced security","Slack & Teams 1:1 support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Self-hosting","SAML SSO & OAuth 2.0","Unlimited usage with full customization"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$overview$q$, $q$What is Theneo?$q$, 2, ARRAY[$q$Theneo is a developer portal platform for creating and managing API documentation, changelogs, and private customer-facing portals. It combines AI-assisted documentation generation with real-time collaborative editing, and supports REST, Async, SOAP, GraphQL, and gRPC API formats.$q$, $q$The platform is SOC 2 Type II, ISO 27001, and ISO 9001 certified, and offers a free Starter plan alongside paid Business, Growth, and Enterprise tiers, with self-hosting available on Enterprise.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', $q$who-its-for$q$, $q$Who Theneo is for$q$, 2, ARRAY[$q$Theneo is built for engineering and developer relations teams that need to produce and maintain API documentation collaboratively, including B2B platforms, fintechs, and regulated industries that require authenticated, per-customer developer portals.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('87dcb1df-40ff-447f-9953-e64d1561e834', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Backstage ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Backstage is a free, open-source developer portal framework created at Spotify for building software catalogs and internal platforms.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Backstage is an open-source developer portal framework from Spotify offering a software catalog, templates, and TechDocs.$q$,
  og_description = $q$Backstage is an open-source developer portal framework from Spotify offering a software catalog, templates, and TechDocs.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e5009be9-697e-4348-8c21-f8adaa429ec5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e5009be9-697e-4348-8c21-f8adaa429ec5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Software Catalog$q$, $q$Tracks microservices, libraries, data pipelines, websites, and ML models in a central catalog.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Software Templates$q$, $q$Accelerates project creation while enforcing organizational standards through self-service templates.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$TechDocs$q$, $q$Facilitates technical documentation using a docs-as-code approach.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Extensible plugin ecosystem$q$, $q$Supports a growing collection of community-maintained plugins for customization.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$CNCF Incubation project, graduated from Sandbox status in March 2022$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Created and proven at Spotify before being open-sourced$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Large, extensible plugin ecosystem$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Self-hosted only; requires setup and ongoing maintenance by the adopting organization$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$No managed/hosted offering was found on the official site content reviewed$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Is Backstage free?$q$, $q$Yes, Backstage is open source and free to use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Who created Backstage?$q$, $q$Backstage was created at Spotify before being open-sourced and handed to community maintenance.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Is Backstage a CNCF project?$q$, $q$Yes, it graduated from CNCF Sandbox to Incubation status in March 2022.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$What is TechDocs?$q$, $q$A Backstage feature for producing technical documentation using a docs-as-code workflow.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Building an internal developer portal$q$, $q$Centralize software catalogs, documentation, and self-service tooling in one portal.$q$, $q$Platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Standardizing project creation$q$, $q$Use Software Templates to enforce organizational standards when scaffolding new services.$q$, $q$Engineering managers and developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$overview$q$, $q$What is Backstage?$q$, 2, ARRAY[$q$Backstage is an open-source framework for building developer portals, created at Spotify and now maintained as a community project. It centralizes a Software Catalog, Software Templates, and TechDocs technical documentation into a single internal platform.$q$, $q$Backstage graduated from CNCF Sandbox to Incubation project status in March 2022 and has an extensible plugin ecosystem maintained by the community.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$who-its-for$q$, $q$Who Backstage is for$q$, 2, ARRAY[$q$Backstage is aimed at platform engineering teams, engineering managers, and developers who want to build a self-hosted internal developer portal that unifies service catalogs, documentation, and standardized project scaffolding.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Port ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Port is an internal developer portal and platform engineering tool with a software catalog, AI agents, and a free plan for up to 15 seats.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$30/seat/month (Basic plan, billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Port is an internal developer portal platform with a free plan, AI agents, and paid tiers starting at $30 per seat per month.$q$,
  og_description = $q$Port is an internal developer portal platform with a free plan, AI agents, and paid tiers starting at $30 per seat per month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0db14796-fc34-4c7e-aed4-8d302ce97b7d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0db14796-fc34-4c7e-aed4-8d302ce97b7d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Software Catalog$q$, $q$Tracks services, components, and infrastructure across an engineering organization.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Context Lake$q$, $q$Aggregates environmental and engineering tool data into a centralized intelligence layer.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Self-service Actions$q$, $q$Lets developers trigger governed, self-service workflows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$AI Agents$q$, $q$Auto-discovers and orchestrates agentic workflows across the engineering ecosystem.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Scorecards$q$, $q$Measures engineering metrics and the ROI of initiatives such as AI adoption.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Workflow Orchestrator$q$, $q$Automates processes across the SDLC with built-in policy enforcement.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Integration marketplace$q$, $q$Connects to Slack, Jira, Cursor IDE, GitHub, and 100+ other tools.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Free plan for up to 15 seats and 10,000 entities with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Published, transparent pricing for Basic and Standard tiers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Broad integration marketplace with 100+ integrations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Uptime SLA published for paid tiers (99.8% Basic/Standard, 99.9% Enterprise)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Automation run limits (500) on Free and Basic plans may be restrictive at scale$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$SSO and dynamic permissions require the Standard plan or higher$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Advanced security features (SCIM, Private Link, IP allowlisting) are Enterprise-only$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Does Port have a free plan?$q$, $q$Yes, free for up to 15 seats, 10,000 entities, and 500 automation runs, with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$How much does Port cost?$q$, $q$The Basic plan starts at $30/seat/month billed annually; the Standard plan is $40/seat/month billed annually.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Does Port offer single sign-on?$q$, $q$Yes, SSO and dynamic permissions are available starting on the Standard plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$What is Port's uptime SLA?$q$, $q$99.8% on the Basic and Standard plans, and 99.9% on Enterprise.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Building an internal developer portal$q$, $q$Catalog services and infrastructure with a self-service interface for developers.$q$, $q$Platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Automating engineering workflows$q$, $q$Use Actions and the Workflow Orchestrator to automate infrastructure and SDLC processes with policy enforcement.$q$, $q$DevOps and SRE teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Free$q$, $q$$0$q$, NULL, $q$["Up to 15 seats","Up to 10,000 entities","500 automation runs","Community support","Usage-limited AI agents"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Basic$q$, $q$$30/seat/month$q$, $q$annual$q$, $q$["Up to 50 seats","Up to 50,000 entities","500 automation runs","99.8% uptime SLA","Commercial support (6-hour response)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Standard$q$, $q$$40/seat/month$q$, $q$annual$q$, $q$["Up to 200 seats","Up to 250,000 entities","Up to 2,000 automation runs","Up to 5 workspaces","Single Sign-On","Dynamic permissions"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited seats","More than 1,000,000 entities","More than 10,000 automation runs","99.9% uptime SLA","SCIM provisioning, Private Link, IP allowlisting"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$overview$q$, $q$What is Port?$q$, 2, ARRAY[$q$Port is an internal developer portal and platform engineering tool built around a Software Catalog, a Context Lake that aggregates engineering data, and self-service Actions. It also includes AI Agents, Scorecards, and a Workflow Orchestrator for automating processes across the software development lifecycle.$q$, $q$Port publishes tiered pricing: a Free plan for up to 15 seats, paid Basic and Standard plans priced per seat, and a custom Enterprise plan with unlimited seats and additional security controls.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', $q$who-its-for$q$, $q$Who Port is for$q$, 2, ARRAY[$q$Port is designed for platform engineering, DevOps, and SRE teams that need a software catalog combined with self-service automation and governance across their engineering ecosystem.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0db14796-fc34-4c7e-aed4-8d302ce97b7d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Cortex ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cortex is an engineering operations platform offering a service catalog, scorecards, and workflow automation, priced via custom quote.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Cortex is an engineering operations platform with a service catalog, scorecards, and workflow automation, priced via custom quote.$q$,
  og_description = $q$Cortex is an engineering operations platform with a service catalog, scorecards, and workflow automation, priced via custom quote.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3dc31633-727a-4c74-8a39-811e3fd310a2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3dc31633-727a-4c74-8a39-811e3fd310a2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dc31633-727a-4c74-8a39-811e3fd310a2', $q$Catalog & Context Graph$q$, $q$Aggregates data from engineering tools into a unified view of services and team status.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dc31633-727a-4c74-8a39-811e3fd310a2', $q$Scorecards$q$, $q$Tracks production readiness and AI adoption metrics across the organization.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dc31633-727a-4c74-8a39-811e3fd310a2', $q$Workflows$q$, $q$Automates infrastructure provisioning, service scaffolding, and migrations through standardized "golden paths."$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dc31633-727a-4c74-8a39-811e3fd310a2', $q$Compliance and audit support$q$, $q$Provides features supporting compliance and audit requirements for engineering organizations.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3dc31633-727a-4c74-8a39-811e3fd310a2', $q$SOC 2 Type II and ISO/IEC 27001:2022 certified$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3dc31633-727a-4c74-8a39-811e3fd310a2', $q$Backed by Y Combinator$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3dc31633-727a-4c74-8a39-811e3fd310a2', $q$Combines service catalog, scorecards, and workflow automation in one platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3dc31633-727a-4c74-8a39-811e3fd310a2', $q$Focused specifically on production readiness and engineering operations metrics$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3dc31633-727a-4c74-8a39-811e3fd310a2', $q$No published pricing; requires booking a demo for a custom proposal$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3dc31633-727a-4c74-8a39-811e3fd310a2', $q$Founded year and headquarters are not disclosed on the official site$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3dc31633-727a-4c74-8a39-811e3fd310a2', $q$Does Cortex publish pricing?$q$, $q$No, Cortex states its pricing is customized to each team's needs via a proposal after a demo.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3dc31633-727a-4c74-8a39-811e3fd310a2', $q$Is Cortex certified for security compliance?$q$, $q$Yes, Cortex is SOC 2 Type II and ISO/IEC 27001:2022 certified.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3dc31633-727a-4c74-8a39-811e3fd310a2', $q$Who backs Cortex?$q$, $q$Cortex is a Y Combinator-backed company.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3dc31633-727a-4c74-8a39-811e3fd310a2', $q$What does Cortex track?$q$, $q$Production readiness and AI adoption metrics through its Scorecards feature.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3dc31633-727a-4c74-8a39-811e3fd310a2', $q$Tracking production readiness$q$, $q$Use Scorecards to monitor whether services meet production-readiness standards.$q$, $q$SRE and platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3dc31633-727a-4c74-8a39-811e3fd310a2', $q$Automating service scaffolding$q$, $q$Use Workflows to provision infrastructure and scaffold new services via standardized golden paths.$q$, $q$Platform engineering teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3dc31633-727a-4c74-8a39-811e3fd310a2', $q$overview$q$, $q$What is Cortex?$q$, 2, ARRAY[$q$Cortex is an engineering operations platform that functions as an internal developer portal, providing a service catalog and context graph, production-readiness and AI-adoption Scorecards, and workflow automation through standardized "golden paths."$q$, $q$The platform is SOC 2 Type II and ISO/IEC 27001:2022 certified and is a Y Combinator-backed company. Pricing is not published; Cortex prepares a customized proposal after a demo.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3dc31633-727a-4c74-8a39-811e3fd310a2', $q$who-its-for$q$, $q$Who Cortex is for$q$, 2, ARRAY[$q$Cortex targets engineering leaders, platform engineering teams, and SRE teams that need to track production readiness, measure AI adoption, and automate infrastructure workflows across their organization.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3dc31633-727a-4c74-8a39-811e3fd310a2', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── OpsLevel ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$OpsLevel is an internal developer portal with a software catalog, standards Scorecards, and self-service actions for engineering teams.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OpsLevel: internal developer portal with a software catalog, Scorecards, Checks, and self-service actions for engineering teams.$q$,
  og_description = $q$OpsLevel: internal developer portal with a software catalog, Scorecards, Checks, and self-service actions for engineering teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$Unified software catalog$q$, $q$Centralizes services, infrastructure, and ownership information into a single, browsable catalog with AI-powered catalog enrichment.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$Scorecards and Checks$q$, $q$Automated Checks and Scorecards let teams define and enforce engineering standards and track service health over time.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$Self-service actions and templates$q$, $q$Developers can trigger service templates and self-service actions directly from the catalog instead of filing tickets.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$Knowledge Center$q$, $q$Centralizes API references and technical documentation alongside catalog entries.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$Maintenance Agent$q$, $q$An AI Maintenance Agent is designed to automate code maintenance work at scale.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$Role-based access control$q$, $q$Granular RBAC controls who can view or modify catalog data and configuration.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$60+ integrations$q$, $q$Connects with tools including GitHub, Kubernetes, AWS, Azure, Google Cloud, Slack, PagerDuty, New Relic, Datadog, ServiceNow, Jira, Snyk, and Veracode.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$Wide integration ecosystem covering 60+ tools$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$Combines catalog, standards enforcement, and self-service actions in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$AI-powered catalog enrichment and a Maintenance Agent aim to reduce manual catalog upkeep$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$Guided product tours let prospects explore the product without signing up$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$Pricing is not published; requires contacting sales for a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$No self-serve free trial — access requires booking a demo$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$Priced per developer, so cost can rise with headcount$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$Does OpsLevel offer a free trial?$q$, $q$OpsLevel does not list a self-serve free trial. Instead it offers guided product tours and scheduled demos before granting testing access.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$How is OpsLevel priced?$q$, $q$OpsLevel is priced based on the number of developers using the portal, with volume discounts, quoted via a Standard or Enterprise plan.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$What's the difference between the Standard and Enterprise plans?$q$, $q$Standard supports up to 50 users. Enterprise offers unlimited users plus a customizable UI, on-premises/single-tenancy deployment, a dedicated customer success manager, and beta feature access.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$What integrations does OpsLevel support?$q$, $q$Over 60 tools, including GitHub, Kubernetes, AWS, Azure, Google Cloud, Slack, PagerDuty, New Relic, Datadog, ServiceNow, Jira, Snyk, and Veracode.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$Service ownership and catalog management$q$, $q$Platform teams use OpsLevel to maintain a single source of truth for every microservice, its owners, and its dependencies.$q$, $q$Platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$Enforcing engineering standards$q$, $q$Scorecards and Checks let engineering leaders track and enforce standards such as security, reliability, and documentation compliance across services.$q$, $q$Engineering leaders and SREs$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$Developer self-service$q$, $q$Developers use self-service actions and templates to scaffold new services without waiting on platform teams.$q$, $q$Software developers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$Standard$q$, $q$Custom (quote required)$q$, NULL, $q$["Up to 50 users","Unlimited cataloged components","AI-powered catalog engine","Integrations and custom checks","Self-service actions"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$Enterprise$q$, $q$Custom (quote required)$q$, NULL, $q$["Unlimited users","Customizable UI","On-premises and single-tenancy options","Dedicated customer success manager","Prioritized support access","Beta feature access"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$overview$q$, $q$What is OpsLevel?$q$, 2, ARRAY[$q$OpsLevel is an internal developer portal built around a software catalog that gives engineering teams a single place to track services, ownership, and infrastructure.$q$, $q$The platform adds Scorecards and Checks for enforcing engineering standards, self-service actions and templates for scaffolding, and a Knowledge Center for API and technical documentation, alongside AI-powered catalog enrichment and a Maintenance Agent.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', $q$who-its-for$q$, $q$Who OpsLevel is for$q$, 2, ARRAY[$q$OpsLevel targets platform engineers, site reliability engineers, software developers, and engineering leaders managing microservice architectures who need visibility into service ownership and health, plus integrations across 60+ tools such as GitHub, Kubernetes, AWS, PagerDuty, and Datadog.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b1ae7dfe-2d32-4fa8-a867-b76ccb0ebbaf', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Roadie ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Roadie is a managed Backstage software catalog and developer portal that also exposes a live context graph for AI agents.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$24/developer/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Roadie: a managed Backstage developer portal with a software catalog, TechDocs, and a live context graph for AI agents.$q$,
  og_description = $q$Roadie: a managed Backstage developer portal with a software catalog, TechDocs, and a live context graph for AI agents.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd2f52a6e-f44d-4cf6-8f6a-17030432b63d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd2f52a6e-f44d-4cf6-8f6a-17030432b63d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$Backstage software catalog$q$, $q$A managed, automatically-upgraded Backstage software catalog for tracking services, teams, and APIs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$TechDocs and API specs$q$, $q$Built-in TechDocs and API specification support for centralized technical documentation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$Self-service templates$q$, $q$Software templates let teams scaffold new services and standardize creation workflows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$75+ plugins$q$, $q$Access to more than 75 Backstage plugins for extending the portal without self-hosting Backstage.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$Dynamic context graph$q$, $q$Links services, teams, APIs, and infrastructure, pulling live data from tools like Prometheus, Kubernetes, PagerDuty, GitHub, and LaunchDarkly.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$MCP server and API for agents$q$, $q$Exposes an MCP server and REST API so AI agents can query engineering context on demand.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$SSO and RAG AI search$q$, $q$Includes single sign-on and retrieval-augmented generation (RAG) AI search across catalog content.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$Fully managed Backstage distribution with automatic upgrades$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$Access to 75+ Backstage plugins without operating Backstage yourself$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$Purpose-built context graph and MCP server for AI agent workflows$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$SOC 2 Type 2 certified$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$No published free plan or trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$The $24/developer/month Teams plan is limited to existing subscribers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$Growth and Enterprise Context plan pricing is not public and requires contacting sales$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$Is Roadie based on Backstage?$q$, $q$Yes, Roadie's Developer Portal plans are built on a managed Backstage software catalog with automatic upgrades and access to 75+ plugins.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$Does Roadie offer a free plan?$q$, $q$No free plan or trial is listed on Roadie's pricing page. The Teams plan starts at $24 per developer/month and is limited to existing subscribers, with Growth and Enterprise Context priced individually.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$What is Roadie's context graph?$q$, $q$A dynamic context graph linking services, teams, APIs, and infrastructure using live data from tools like Prometheus, Kubernetes, PagerDuty, GitHub, and LaunchDarkly, exposed via an MCP server and API for AI agents.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$Is Roadie SOC 2 certified?$q$, $q$Yes, Roadie states it is SOC 2 Type 2 certified.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$Managed Backstage developer portal$q$, $q$Engineering teams get a hosted, auto-updating Backstage catalog with TechDocs and templates without operating Backstage themselves.$q$, $q$Platform teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$AI agent context$q$, $q$Teams give AI coding and on-call agents structured, live context about services and infrastructure via Roadie's context graph and MCP server.$q$, $q$Platform and SRE teams adopting AI agents$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$Standardizing service creation$q$, $q$Self-service software templates and 75+ plugins let teams standardize how new services are scaffolded.$q$, $q$Software developers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$Teams$q$, $q$$24/developer/month$q$, $q$monthly$q$, $q$["50-150 developers","Unlimited entities","Backstage software catalog","Automatic upgrades","TechDocs and API specs","Self-service templates","75+ plugins","SSO","RAG AI","MCP Server access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$Growth$q$, $q$Custom$q$, NULL, $q$["100+ developers","Unlimited entities","SLA","Slack/MS Teams support","Custom plugins","REST API","Advanced search","Secure on-prem connection","Custom RBAC"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$Enterprise Context$q$, $q$Custom$q$, NULL, $q$["Integration-powered data store","Hundreds of pre-built sources","Custom data sources","On-prem connection","Context bundles","Agent access","REST API","MCP Servers","SLA"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$overview$q$, $q$What is Roadie?$q$, 2, ARRAY[$q$Roadie provides a managed, automatically-upgraded Backstage software catalog with TechDocs, API specs, self-service templates, and access to 75+ Backstage plugins.$q$, $q$It also exposes a dynamic context graph — linking services, teams, APIs, and infrastructure with live data from tools like Prometheus, Kubernetes, PagerDuty, GitHub, and LaunchDarkly — through an MCP server and API so AI agents can query engineering context on demand.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', $q$who-its-for$q$, $q$Who Roadie is for$q$, 2, ARRAY[$q$Roadie is built for engineering and platform teams that want a hosted Backstage catalog without running Backstage themselves, and organizations giving AI agents structured, live context on their production systems.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d2f52a6e-f44d-4cf6-8f6a-17030432b63d', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Gitea ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Gitea is a free, MIT-licensed, self-hosted Git service with built-in CI/CD, issue tracking, and package registry support.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$9.50/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Gitea: free, MIT-licensed self-hosted Git service with Gitea Actions CI/CD, packages, plus an optional paid Cloud/Enterprise tier.$q$,
  og_description = $q$Gitea: free, MIT-licensed self-hosted Git service with Gitea Actions CI/CD, packages, plus an optional paid Cloud/Enterprise tier.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b8e10e1d-f374-4ec0-aa21-3a07fe66eae5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b8e10e1d-f374-4ec0-aa21-3a07fe66eae5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Git repository hosting$q$, $q$Git repository creation and management with code review capabilities.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Gitea Actions$q$, $q$A built-in CI/CD system that is closely compatible with GitHub Actions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Project management$q$, $q$Issue tracking, kanban boards, and progress tracking tools.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Package registry$q$, $q$Support for more than 20 package management formats, including NPM, PyPI, and Maven.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Integrations$q$, $q$API and webhook support, with compatibility for tools like Slack, Discord, and Jenkins.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Cross-platform deployment$q$, $q$Runs on Linux, Windows, macOS, FreeBSD, and Kubernetes.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Free, MIT-licensed, self-hosted with unlimited users and repositories$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Built-in CI/CD (Gitea Actions) compatible with GitHub Actions syntax$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Supports 20+ package registry formats$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Deployable on Linux, Windows, macOS, FreeBSD, and Kubernetes$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Enterprise support and features require a paid subscription starting at $9.50/user/month with a one-year commitment$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Managed Gitea Cloud pricing beyond the 30-day trial is not published on the pages reviewed$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Self-hosting requires operating and maintaining your own infrastructure$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Is Gitea free?$q$, $q$Yes, the core self-hosted Gitea service is free under the MIT license with unlimited users and repositories.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Does Gitea offer CI/CD?$q$, $q$Yes, Gitea Actions is a built-in CI/CD system closely compatible with GitHub Actions.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Is there a hosted version of Gitea?$q$, $q$Yes, Gitea Cloud offers managed hosting with a 30-day free trial.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$What does Gitea Enterprise cost?$q$, $q$Gitea Enterprise starts at $9.50 per user/month with a one-year commitment.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Self-hosted source control$q$, $q$Organizations wanting full control of Git hosting on their own infrastructure deploy Gitea instead of using a SaaS host.$q$, $q$DevOps and platform teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Lightweight CI/CD alongside Git$q$, $q$Teams use Gitea Actions to run builds and tests directly next to their repositories.$q$, $q$Development teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Centralized package management$q$, $q$Teams centralize NPM, PyPI, Maven, and other packages alongside their code in Gitea's package registry.$q$, $q$DevOps teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Open Source (self-hosted)$q$, $q$Free$q$, NULL, $q$["Unlimited users and repositories","MIT license","Full control of deployment"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Gitea Cloud$q$, $q$30-day free trial$q$, NULL, $q$["Managed hosting"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$Gitea Enterprise$q$, $q$$9.50/user/month$q$, $q$monthly (1-year commitment)$q$, $q$["Enterprise support and features"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$overview$q$, $q$What is Gitea?$q$, 2, ARRAY[$q$Gitea is a self-hosted DevOps platform combining Git repository hosting with code review, Gitea Actions CI/CD compatible with GitHub Actions, issue tracking and kanban boards, and a package registry supporting more than 20 formats.$q$, $q$The core self-hosted product is free and MIT-licensed with unlimited users and repositories. A managed Gitea Cloud option offers a 30-day free trial, and Gitea Enterprise adds paid support and features starting at $9.50/user/month.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', $q$who-its-for$q$, $q$Who Gitea is for$q$, 2, ARRAY[$q$Gitea suits teams and developers who want a lightweight, self-hosted alternative to GitHub/GitLab, deployable on Linux, Windows, macOS, FreeBSD, or Kubernetes, with an optional paid Cloud or Enterprise tier for organizations that need managed hosting or dedicated support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b8e10e1d-f374-4ec0-aa21-3a07fe66eae5', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Forgejo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Forgejo is a free, self-hosted, lightweight software forge governed by the non-profit Codeberg e.V.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Forgejo: free, open source, lightweight self-hosted software forge governed by the non-profit Codeberg e.V.$q$,
  og_description = $q$Forgejo: free, open source, lightweight self-hosted software forge governed by the non-profit Codeberg e.V.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1827e10f-a82c-4fb0-8d38-d47e51547c3e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1827e10f-a82c-4fb0-8d38-d47e51547c3e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$Lightweight self-hosting$q$, $q$Designed to require an order of magnitude less resources than other software forges.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$GitHub-like interface$q$, $q$A familiar interface for teams transitioning from GitHub to a self-hosted solution.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$Federation focus$q$, $q$Development prioritizes security, scaling, federation, and privacy.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$Community governance$q$, $q$Developed under the umbrella of Codeberg e.V., a democratic non-profit organization, with contribution teams for localization, code, design, documentation, UX, and community management.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$Codeberg hosting option$q$, $q$Users can create an account on Codeberg instead of self-hosting their own Forgejo instance.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$Committed to remaining free and open source ("Forgejo will always be Free and Open Source Software")$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$Minimal server resource requirements compared to other forges$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$Governed by a non-profit (Codeberg e.V.) rather than a commercial vendor$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$Option to use the hosted Codeberg service instead of self-hosting$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$No commercial support tier or SLA mentioned on the official site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$No managed cloud/paid offering from the Forgejo project itself$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$Self-hosting requires operational expertise unless using the community-run Codeberg service$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$Is Forgejo free?$q$, $q$Yes, Forgejo states it "will always be Free and Open Source Software" with no paid tiers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$Who governs Forgejo?$q$, $q$Forgejo operates under the umbrella of Codeberg e.V., a democratic non-profit organization, with development coordinated via Codeberg and Matrix chat.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$Can I use Forgejo without self-hosting?$q$, $q$Yes, users can create an account on Codeberg instead of self-hosting their own instance.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$What kind of resources does Forgejo need?$q$, $q$Forgejo describes itself as requiring an order of magnitude less resources than other forges, making it suitable for lightweight self-hosting.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$Self-hosted forge for small teams$q$, $q$Teams with limited server resources use Forgejo for a low-maintenance, lightweight self-hosted forge.$q$, $q$Small teams and individual developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$Non-profit-governed hosting$q$, $q$Organizations wanting a non-commercial governance model can rely on Forgejo's stewardship under Codeberg e.V., or host directly on Codeberg.$q$, $q$Open source projects and privacy-conscious teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$Self-hosted$q$, $q$Free$q$, NULL, $q$["Full software forge","No licensing cost","GitHub-like interface"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$overview$q$, $q$What is Forgejo?$q$, 2, ARRAY[$q$Forgejo is a self-hosted, lightweight software forge with a GitHub-like interface, built to run on significantly fewer server resources than comparable forges.$q$, $q$The project is entirely free and open source and is governed by Codeberg e.V., a democratic non-profit organization, with contributions coordinated through Codeberg and Matrix chat.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', $q$who-its-for$q$, $q$Who Forgejo is for$q$, 2, ARRAY[$q$Forgejo suits developers and teams who want a low-maintenance, self-hosted Git forge, or who prefer a non-profit-governed project over a commercially owned one; those who don't want to self-host can use the Codeberg-hosted instance instead.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1827e10f-a82c-4fb0-8d38-d47e51547c3e', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── RhodeCode ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$RhodeCode is enterprise source code management unifying Git, Mercurial, and Subversion, with a free Community Edition and paid Enterprise/Cloud tiers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$8/user/month$q$,
  founded_year = 2010,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$RhodeCode: source code management for Git, Mercurial, and Subversion with a free Community Edition and paid Enterprise/Cloud plans.$q$,
  og_description = $q$RhodeCode: source code management for Git, Mercurial, and Subversion with a free Community Edition and paid Enterprise/Cloud plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '85550e75-0afc-4140-81a3-4e711ba76ca4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '85550e75-0afc-4140-81a3-4e711ba76ca4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$Multi-VCS support$q$, $q$Centralized control for Git, Mercurial, and Subversion repositories under one platform.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$Code review and collaboration$q$, $q$Built-in code review tools with workflow automation and issue tracker integrations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$Unified permissions$q$, $q$Fine-grained, unified permission management across multiple VCS platforms.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$Enterprise authentication$q$, $q$LDAP+Groups, SAML, AD, CAS, Google, OAuth, and 2FA support on Enterprise and Cloud plans.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$High availability$q$, $q$Multi-node configurations for scalable, highly available deployments.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$Behind-the-firewall deployment$q$, $q$On-premises deployment option with IP restrictions for enterprise-grade security.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$Free, open source Community Edition with unlimited users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$Supports Git, Mercurial, and Subversion on a single platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$Cloud and Enterprise tiers add SSO, high availability, and support with an SLA$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$Cloud plan includes unlimited traffic, disk space, and repository size and is cancelable anytime$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$Enterprise and Cloud pricing is sold in minimum 10-user packs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$Community Edition lacks enterprise authentication (SAML, AD, 2FA) and HA clustering$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$Multi-VCS support beyond Git is a less common requirement for most modern teams$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$Is RhodeCode free?$q$, $q$The RhodeCode Community Edition is free and open source with unlimited users. Enterprise ($75/user/year) and Cloud (from $8/user/month) are paid tiers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$What version control systems does RhodeCode support?$q$, $q$Git, Mercurial, and Subversion under a single platform.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$Is there a free trial?$q$, $q$RhodeCode mentions a 30-day trial for both its on-premises and cloud offerings.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$What's included in RhodeCode Cloud?$q$, $q$Dedicated isolated hardware, enterprise SSL, unlimited traffic/disk/repo size, geo-located instances (US, Asia, Europe), daily backups, and monitoring, starting at $8/user/month for a minimum of 10 users.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$Consolidating mixed VCS repositories$q$, $q$Organizations running a mix of Git, Mercurial, and Subversion repositories use RhodeCode to manage them under one unified platform.$q$, $q$Enterprise IT and DevOps teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$Behind-the-firewall source control$q$, $q$Enterprises requiring on-premises deployment with IP restrictions use RhodeCode Enterprise for regulated environments.$q$, $q$Regulated enterprises$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$Community$q$, $q$Free$q$, NULL, $q$["Unlimited users","On-premises deployment","Community support","Fine-grained permissions","Code review tools","APIs","Full text search","Basic LDAP/AD"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$Enterprise$q$, $q$$75/user/year$q$, $q$annual$q$, $q$["Technical support with SLA","Built-in chat code reviews","Scalable code search","Multi-node HA configurations","JIRA/Jenkins/Bamboo/Slack integrations","LDAP+Groups, SAML, AD, CAS, Google, OAuth, 2FA"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$Cloud$q$, $q$$8/user/month$q$, $q$monthly$q$, $q$["All Enterprise features","Dedicated isolated hardware","Enterprise SSL","Unlimited traffic, disk, and repo size","Geo-located instances (US, Asia, Europe)","Daily backups","Monitoring"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$overview$q$, $q$What is RhodeCode?$q$, 2, ARRAY[$q$RhodeCode is enterprise source code management that provides centralized control for Git, Mercurial, and Subversion repositories under a single platform, with code review, workflow automation, and unified permission management.$q$, $q$It ships as a free, open source Community Edition, plus a paid Enterprise Edition ($75/user/year) for on-premises deployments and a Cloud offering (from $8/user/month) for managed, dedicated hosting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', $q$who-its-for$q$, $q$Who RhodeCode is for$q$, 2, ARRAY[$q$RhodeCode targets enterprises and regulated organizations that need to consolidate multiple version control systems, enforce enterprise authentication, or deploy source control behind their own firewall.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('85550e75-0afc-4140-81a3-4e711ba76ca4', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Gogs ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Gogs is a free, MIT-licensed, self-hosted Git service written in Go that runs on minimal hardware.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2014,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Gogs: a free, open source, self-hosted Git service written in Go, MIT-licensed since 2014, runs on minimal hardware.$q$,
  og_description = $q$Gogs: a free, open source, self-hosted Git service written in Go, MIT-licensed since 2014, runs on minimal hardware.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '610f2fd5-da8a-4b36-8a7f-bf94d0307b17';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '610f2fd5-da8a-4b36-8a7f-bf94d0307b17' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$Simple installation$q$, $q$Run the binary directly, or run Gogs as a Docker container.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$Cross-platform$q$, $q$Runs on any platform supported by Go, including Linux, macOS, Windows, and ARM devices.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$Minimal resource requirements$q$, $q$Functions efficiently with as little as 64 MB of RAM and a quarter vCPU.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$Open source$q$, $q$MIT-licensed with all source code publicly available since 2014.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$Extremely lightweight; runs on as little as 64 MB RAM and a quarter vCPU$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$Simple binary or Docker-based installation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$Free and MIT-licensed$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$Cross-platform (Linux, macOS, Windows, ARM)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$No documented CI/CD or package registry features on the official site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$No hosted/cloud offering — self-hosting only$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$No paid tier for dedicated support$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$Is Gogs free?$q$, $q$Yes, Gogs is MIT-licensed and free, with source code publicly available since 2014.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$What are Gogs' hardware requirements?$q$, $q$Gogs can run with as little as 64 MB of RAM and a quarter vCPU.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$What platforms does Gogs support?$q$, $q$Any platform supported by Go, including Linux, macOS, Windows, and ARM devices.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$How do I install Gogs?$q$, $q$Run the binary directly, or run it as a Docker container.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$Self-hosting Git on minimal hardware$q$, $q$Teams with constrained infrastructure, such as a small VPS or single-board computer, use Gogs to run a Git service on very limited resources.$q$, $q$Small teams, hobbyists, and self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$Lightweight private Git hosting$q$, $q$Developers wanting a simple, low-maintenance private Git server without cloud dependency use Gogs.$q$, $q$Individual developers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$Self-hosted$q$, $q$Free$q$, NULL, $q$["MIT license","Unlimited use","Binary or Docker install"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$overview$q$, $q$What is Gogs?$q$, 2, ARRAY[$q$Gogs is a self-hosted Git service written in Go, designed to be a simple, stable, and extensible way to run your own Git repositories.$q$, $q$It installs as a single binary or Docker container, runs on any platform Go supports, and is engineered to work with as little as 64 MB of RAM and a quarter vCPU. It has been MIT-licensed and publicly available since 2014.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', $q$who-its-for$q$, $q$Who Gogs is for$q$, 2, ARRAY[$q$Gogs is aimed at individuals, hobbyists, and small teams who want a minimal, self-hosted Git server that can run on very limited hardware.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('610f2fd5-da8a-4b36-8a7f-bf94d0307b17', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── SourceHut ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SourceHut is an open source software forge offering Git/Mercurial hosting, CI, mailing lists, and ticket tracking.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$4/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Hoorn, Netherlands$q$,
  languages = '{}',
  seo_meta_description = $q$SourceHut: open source software forge with Git/Mercurial hosting, CI, mailing lists, and ticket tracking; hosted plans from $4/month.$q$,
  og_description = $q$SourceHut: open source software forge with Git/Mercurial hosting, CI, mailing lists, and ticket tracking; hosted plans from $4/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '65ac1159-3886-4555-9998-daa1111a04b1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '65ac1159-3886-4555-9998-daa1111a04b1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Git and Mercurial hosting$q$, $q$Repository hosting with fine-grained access control for both Git and Mercurial.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Continuous integration$q$, $q$Runs fully virtualized builds across various Linux distributions and BSDs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Mailing lists and code review$q$, $q$Mailing lists and code review powered by git send-email.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Ticket tracking$q$, $q$A ticket tracker focused on actionable tasks only.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Hosted IRC$q$, $q$Hosted IRC chat services with bouncer functionality.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Git-driven wikis$q$, $q$Wiki hosting driven directly by Git repositories.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Paste and static web hosting$q$, $q$Includes paste hosting and static website hosting.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$hut CLI$q$, $q$A CLI tool for data export and management across SourceHut services.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$100% free and open source software (AGPL, BSD, and other licenses)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Self-hostable as an alternative to the paid hosted service$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$States no tracking, no advertising, and no AI features$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Financial aid available for users whose situation can't support the subscription fee$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Free to use for contributing to existing projects on the hosted service$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Using most hosted services as an owner (e.g. builds.sr.ht) requires a paid subscription ($4-$12/month)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Email/mailing-list-based workflows (git send-email code review) have a learning curve versus GitHub-style pull requests$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Explicitly excludes AI features, which some teams may want$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Is SourceHut free?$q$, $q$SourceHut is free to self-host and free for contributing to existing projects on the hosted service. Using most hosted services as an owner requires a paid subscription starting at $4/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$What version control systems does SourceHut support?$q$, $q$Git and Mercurial repository hosting.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Does SourceHut have AI features?$q$, $q$No — the site states "No AI features whatsoever."$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Where is SourceHut based?$q$, $q$Its listed address is Postbus 3068, 1620GB Hoorn, Netherlands.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Is financial aid available?$q$, $q$Yes, SourceHut states it never asks for payment from anyone whose financial situation would not comfortably support the subscription fee, and users can apply for assistance.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Hosting open source projects$q$, $q$Open source and niche-language projects use SourceHut's integrated Git hosting, CI, mailing lists, and ticket tracking.$q$, $q$Open source maintainers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Privacy-focused development workflow$q$, $q$Developers who want no tracking, no ads, and no AI features use SourceHut for a minimal, privacy-respecting toolchain.$q$, $q$Privacy-conscious developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Self-hosted software forge$q$, $q$Teams that prefer to self-host rather than pay for the hosted service can run their own SourceHut instance.$q$, $q$Self-hosters$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Amateur Hackers$q$, $q$$4/month$q$, $q$monthly$q$, $q$["Full access to all services"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Typical Hackers$q$, $q$$8/month$q$, $q$monthly$q$, $q$["Full access to all services"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Professional Hackers$q$, $q$$12/month$q$, $q$monthly$q$, $q$["Full access to all services"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$overview$q$, $q$What is SourceHut?$q$, 2, ARRAY[$q$SourceHut, described by its creators as "the hacker's forge," is a fully open source software development platform combining Git and Mercurial hosting, virtualized CI, mailing-list-based code review, a ticket tracker, hosted IRC, Git-driven wikis, and paste/static web hosting.$q$, $q$The hosted service is free for contributing to existing projects, while owning projects on most services requires a paid subscription starting at $4/month. The entire platform can also be self-hosted, and it states no tracking, no advertising, and no AI features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$who-its-for$q$, $q$Who SourceHut is for$q$, 2, ARRAY[$q$SourceHut is aimed at developers and open source communities who want an integrated, privacy-respecting toolchain and are comfortable with an email- and CLI-centric workflow rather than a GitHub-style pull request UI.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── OneDev ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$OneDev is a self-hosted DevOps platform unifying Git, issues, pull requests, CI/CD, and packages, with a free Community Edition.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$6/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OneDev: self-hosted Git, CI/CD, and issue tracking platform with a free Community Edition and Enterprise Edition from $6/user/month.$q$,
  og_description = $q$OneDev: self-hosted Git, CI/CD, and issue tracking platform with a free Community Edition and Enterprise Edition from $6/user/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$Unified DevOps platform$q$, $q$Combines Git, issues, pull requests, CI/CD, packages, and workspaces in one place.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$Code search and navigation$q$, $q$Per-commit code search with language-aware symbol detection.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$Built-in CI/CD$q$, $q$CI/CD as code with a GUI editor and multiple executor types, including containers, Kubernetes, agents, and bare metal.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$Package registries$q$, $q$Built-in registries supporting Docker, NPM, Maven, NuGet, PyPI, RubyGems, and Helm.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$Automated Kanban boards$q$, $q$Task management with customizable issue workflows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$Service desk$q$, $q$Email-to-issue linking for support and request handling.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$AI user automation$q$, $q$AI integration described as supporting autonomous development work.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$Free Community Edition includes built-in CI/CD, package registries, code search, SSO/2FA, and LDAP/AD support$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$Combines Git hosting, issue tracking, CI/CD, and packages in a single self-hosted platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$Enterprise Edition adds HA/scaling, security scanning, and audit logging for $6/user/month$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$Includes AI user automation for autonomous development work$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$Enterprise Edition requires a minimum order of 12 user-months$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$Security/compliance scanning, cross-project search, and HA clustering are Enterprise-only, not in the free Community Edition$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$Self-hosted only — no managed cloud offering found on the official site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$Is OneDev free?$q$, $q$Yes, the Community Edition is free and includes a built-in CI/CD engine, package registries, code search, and SSO/2FA.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$What does OneDev Enterprise cost?$q$, $q$$6 per user/month, with a minimum order of 12 user-months.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$What package formats does OneDev support?$q$, $q$Docker, NPM, Maven, NuGet, PyPI, RubyGems, and Helm.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$Does OneDev include CI/CD?$q$, $q$Yes, a built-in CI/CD engine with a GUI editor and multiple executor types: containers, Kubernetes, agents, and bare metal.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$Does OneDev have AI features?$q$, $q$The site lists AI integration for autonomous development work and AI user automation among its included capabilities.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$All-in-one self-hosted DevOps$q$, $q$Teams wanting Git, issues, CI/CD, and packages in one self-hosted tool use OneDev instead of stitching together separate systems.$q$, $q$DevOps and platform teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$Regulated/enterprise self-hosting$q$, $q$Organizations needing high availability, security scanning, and audit logging upgrade to the OneDev Enterprise Edition.$q$, $q$Enterprises with compliance requirements$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Built-in CI/CD engine","Package registry (Docker, NPM, Maven, NuGet, PyPI, RubyGems, Helm)","Per-commit code search","Symbol navigation","Customizable issue workflows","Email-based service desk","LDAP/AD, SSO/2FA","AI user automation","CLI tools","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$Enterprise Edition$q$, $q$$6/user/month$q$, $q$monthly$q$, $q$["High availability/scalability clustering","Custom dashboards","Cross-project code search","Security/compliance scanning","Renovate dependency updates","Audit logging","Time tracking","Priority email support"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$overview$q$, $q$What is OneDev?$q$, 2, ARRAY[$q$OneDev is a self-hosted DevOps platform that unifies Git repository hosting, issue tracking with automated Kanban boards, pull requests, built-in CI/CD, and package registries in one place.$q$, $q$The free Community Edition covers core Git, CI/CD, and package registry functionality, while the paid Enterprise Edition ($6/user/month, 12 user-month minimum) adds high availability, security and compliance scanning, cross-project search, and audit logging.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', $q$who-its-for$q$, $q$Who OneDev is for$q$, 2, ARRAY[$q$OneDev suits teams that want to self-host a single platform covering source control, issues, and CI/CD rather than combining separate tools, with an Enterprise tier for organizations that need HA, compliance scanning, and audit logging.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9e5b2300-98f1-4d4e-93ad-dc29b5d2d9c5', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Woodpecker CI ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Woodpecker CI is a free, open-source CI/CD engine that runs pipeline steps in Docker containers, forked from Drone CI in 2019.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Woodpecker CI is a free, self-hosted, open-source CI/CD engine built on Docker containers, forked from Drone CI's last Apache 2.0 release.$q$,
  og_description = $q$Woodpecker CI is a free, self-hosted, open-source CI/CD engine built on Docker containers, forked from Drone CI's last Apache 2.0 release.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ff195225-a15d-4993-96da-c517414aa5f5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ff195225-a15d-4993-96da-c517414aa5f5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$Docker-based pipeline execution$q$, $q$Each pipeline step runs inside a Docker container, keeping build environments isolated and reproducible.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$YAML pipeline configuration$q$, $q$Workflows are defined in YAML files stored in a .woodpecker/ directory, with steps, images, commands, and 'when' triggers for events like push.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$Plugin ecosystem$q$, $q$Plugins are ordinary Docker images (e.g. woodpeckerci/plugin-s3) referenced in a step, so deployment and notification logic can be shared across projects.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$Multiple dependent workflows$q$, $q$A project can define several workflows that depend on one another, rather than a single linear pipeline.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$Secret injection$q$, $q$Sensitive values are referenced with from_secret in step settings so credentials aren't exposed in the pipeline file.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$Self-hosted deployment$q$, $q$Woodpecker runs entirely on infrastructure you control; there is no vendor-hosted cloud offering.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$Fully open source under Apache 2.0 and stated to remain free forever$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$Lightweight, container-native architecture keeps pipeline steps isolated$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$Plugins are ordinary Docker images, making the ecosystem easy to extend$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$Active community project with 7.5k+ GitHub stars$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$No official hosted/cloud offering — requires self-hosting$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$Some administration and forge-setup documentation pages were unavailable at the time of review$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$Smaller plugin catalog than larger commercial CI platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$Is Woodpecker CI free to use?$q$, $q$Yes. Woodpecker is fully open source under the Apache 2.0 license and the project states it will remain free forever.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$Is Woodpecker CI related to Drone CI?$q$, $q$Yes. Woodpecker was forked from Drone 0.8 in April 2019 after Drone's license changed from Apache 2.0 to a proprietary license, and was renamed Woodpecker in August 2019.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$Does Woodpecker offer a hosted cloud version?$q$, $q$No official hosted cloud service is documented; Woodpecker is designed to be self-hosted.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$What format are Woodpecker pipelines written in?$q$, $q$Pipelines are defined as YAML files in a .woodpecker/ directory, with steps that specify a Docker image and commands to run.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$Self-hosted CI for privacy-conscious teams$q$, $q$Teams that want full control over their CI infrastructure and data can run Woodpecker on their own servers.$q$, $q$DevOps teams avoiding third-party CI clouds$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$Container-native build pipelines$q$, $q$Projects already built around Docker can reuse existing images as pipeline steps and plugins.$q$, $q$Teams standardized on Docker/Kubernetes$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$Self-hosted (Open Source)$q$, $q$Free$q$, NULL, $q$["Apache 2.0 licensed","Unlimited self-hosted use","Community support"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$overview$q$, $q$What is Woodpecker CI?$q$, 2, ARRAY[$q$Woodpecker CI is a free, open-source continuous integration and delivery engine that runs each pipeline step inside a Docker container. It was forked from Drone CI's last Apache 2.0-licensed release (0.8) in 2019 after Drone changed to a proprietary license, and has since grown into a distinct project maintained by the Woodpecker Authors community.$q$, $q$Pipelines are described in YAML files stored in a .woodpecker/ directory. Steps reference a Docker image and a list of commands, and plugins are simply Docker images that can be shared across projects for tasks like deployments and notifications.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', $q$who-its-for$q$, $q$Who Woodpecker CI is for$q$, 2, ARRAY[$q$Woodpecker suits engineering teams that want a lightweight, self-hosted CI/CD engine without a hosted-cloud dependency, particularly teams already comfortable running Docker-based infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff195225-a15d-4993-96da-c517414aa5f5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Drone CI ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Drone CI is a container-native continuous integration platform from Harness, offered as an open-source Community Edition and a commercial Enterprise Edition.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Drone CI is a container-native CI platform from Harness with a free open-source Community Edition and a paid Enterprise Edition.$q$,
  og_description = $q$Drone CI is a container-native CI platform from Harness with a free open-source Community Edition and a paid Enterprise Edition.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b721f7a1-30be-4fe9-aaef-0d63697db57b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b721f7a1-30be-4fe9-aaef-0d63697db57b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$Container-based pipelines$q$, $q$Each pipeline step executes inside an isolated Docker container, keeping builds reproducible across environments.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$YAML pipeline configuration$q$, $q$Builds are defined as version-controlled YAML files rather than a UI-driven pipeline builder.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$Plugin ecosystem$q$, $q$Hundreds of pre-built plugins handle common deployment and integration tasks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$Multi-forge source control support$q$, $q$Connects to GitHub, GitLab, Bitbucket, and other source control systems to trigger builds.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$Single-binary deployment$q$, $q$The server ships as a single binary or Docker image that can scale automatically.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$Community and Enterprise editions$q$, $q$Community Edition is open source with no proprietary code; Enterprise Edition adds commercial features and support.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$Community Edition is open source and free to self-host$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$Simple, container-native architecture with a large existing plugin library$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$Backed by Harness, giving it commercial support options via the Enterprise Edition$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$Cited example of a large customer (eBay) deploying about 15,000 times a quarter$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$Now maintained under Harness rather than as an independent open-source project$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$Enterprise Edition pricing is not published and requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$The dedicated drone.io pricing page returned a not-found error at the time of review, making current cloud-offering details unclear$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$Is Drone CI free?$q$, $q$The Community Edition is open source and free to self-host. The Enterprise Edition is a commercial product with pricing available on request from Harness.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$Who maintains Drone CI?$q$, $q$Drone is maintained by Harness, which acquired Drone.io in 2020.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$Does Drone CI still exist as a separate product?$q$, $q$Yes, Drone continues to be developed and is now branded 'Drone by Harness,' offered in Community and Enterprise editions.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$How are Drone pipelines configured?$q$, $q$Pipelines are defined in version-controlled YAML files, with each step running in an isolated Docker container.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$Self-hosted container-native CI$q$, $q$Teams that want an open-source, Docker-based CI server can self-host the Community Edition.$q$, $q$Engineering teams running their own infrastructure$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$Enterprise CI with vendor support$q$, $q$Organizations needing commercial support and additional features can use the Enterprise Edition.$q$, $q$Larger organizations needing SLA-backed support$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Open source, no proprietary code","Self-hosted"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$Enterprise Edition$q$, $q$Custom$q$, NULL, $q$["Commercial support","Additional enterprise features"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$overview$q$, $q$What is Drone CI?$q$, 2, ARRAY[$q$Drone is a container-native continuous integration platform originally built by Drone.io and acquired by Harness in 2020. It automates build, test, and release workflows using YAML pipeline files, with each step executed inside an isolated Docker container.$q$, $q$Drone is distributed in two editions: a Community Edition that is open source with no proprietary code, and a commercial Enterprise Edition maintained by Harness that adds further features and paid support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', $q$who-its-for$q$, $q$Who Drone CI is for$q$, 2, ARRAY[$q$Drone suits teams that want a container-native, self-hosted CI server and are comfortable with Harness as the maintaining vendor, whether running the free Community Edition or paying for Enterprise support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b721f7a1-30be-4fe9-aaef-0d63697db57b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Concourse CI ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Concourse is a free, open-source CI/CD system that models pipelines as YAML-defined resources, jobs, and tasks running in isolated containers.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Concourse CI is a free, open-source, self-hosted CI/CD system built around resources, jobs, and containerized tasks defined in YAML.$q$,
  og_description = $q$Concourse CI is a free, open-source, self-hosted CI/CD system built around resources, jobs, and containerized tasks defined in YAML.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a86a598d-f117-4b86-8cbc-fd8500f829db';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a86a598d-f117-4b86-8cbc-fd8500f829db' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$Resource-based pipeline model$q$, $q$External artifacts like Git repos and Docker images are declared as 'resources' that Concourse automatically monitors for changes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$Containerized tasks$q$, $q$Every task runs in an isolated container with a specified image, keeping builds reproducible.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$Visual pipeline UI$q$, $q$A web UI graphs the pipeline so failed jobs can be traced back to their root cause.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$fly CLI for local testing$q$, $q$The fly execute command lets you run pipeline task logic locally before committing it.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$Interactive container debugging$q$, $q$The fly intercept command opens a shell directly inside a running or failed task's container.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$Fully open source and free to self-host$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$Declarative, resource-based model version-controls the entire pipeline$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$Local CLI testing (fly execute) speeds up pipeline development$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$Visual pipeline UI aids debugging of complex, multi-stage workflows$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$No official hosted/cloud offering — requires self-hosting$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$Resource-type abstraction has a steeper learning curve than plugin-based CI tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$Deployment requires managing systemd, Docker Compose, or manual server setup$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$Is Concourse CI free?$q$, $q$Yes, Concourse is open-source software and free to download and self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$How does Concourse define pipelines?$q$, $q$Pipelines are written in YAML and modeled as resources, jobs, and tasks, described as a distributed, continuous Makefile.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$Can I test Concourse pipelines locally?$q$, $q$Yes, the fly CLI includes a fly execute command for running task logic locally before pushing it to the pipeline.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$How is Concourse deployed?$q$, $q$Concourse provides documented installation guides for systemd, Docker Compose, and manual configuration for self-hosted deployment.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$Declarative, containerized CI/CD$q$, $q$Teams that want their entire pipeline defined as version-controlled YAML resources can adopt Concourse's model.$q$, $q$Platform and DevOps engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$Debugging complex multi-stage pipelines$q$, $q$The visual pipeline graph and fly intercept command help trace failures back to their source.$q$, $q$Teams running large, interdependent pipelines$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$overview$q$, $q$What is Concourse CI?$q$, 2, ARRAY[$q$Concourse is an open-source continuous integration and delivery system that models pipelines as resources, jobs, and tasks defined in YAML. Rather than relying on a plugin marketplace, it uses a resource-type abstraction so external artifacts like Git repositories and Docker images are automatically monitored for changes.$q$, $q$Every task in a Concourse pipeline runs inside an isolated container with a specified image. The fly CLI supports local testing of task logic with fly execute and direct debugging of running containers with fly intercept.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', $q$who-its-for$q$, $q$Who Concourse CI is for$q$, 2, ARRAY[$q$Concourse fits teams that want a declarative, container-based CI/CD system they fully control and are willing to self-host, particularly those comfortable working with its resource/job/task model instead of a plugin-driven pipeline builder.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a86a598d-f117-4b86-8cbc-fd8500f829db', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Buildbot ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Buildbot is a free, open-source Python framework for automating build, test, and release pipelines across distributed workers.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Buildbot is a free, open-source, GPL-licensed Python framework for automating distributed software build and test pipelines.$q$,
  og_description = $q$Buildbot is a free, open-source, GPL-licensed Python framework for automating distributed software build and test pipelines.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c7c25a31-e4a6-4f92-befe-498598b09f32';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c7c25a31-e4a6-4f92-befe-498598b09f32' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Master-worker architecture$q$, $q$One or more masters coordinate build jobs across workers running on different operating systems.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Python-based configuration$q$, $q$Buildbot is configured with a Python script, enabling dynamic pipeline generation and custom components.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Distributed, parallel job execution$q$, $q$Jobs are queued and executed in parallel across available worker resources.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Version control monitoring$q$, $q$Buildbot watches source repositories for changes and triggers builds automatically.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Extensive status reporting$q$, $q$Provides detailed reporting on build and test results.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Fully open source under GPL-2.0 and free to use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Highly customizable via Python configuration scripts$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Mature project used by high-profile projects like WebKit and CPython$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Cross-platform worker support$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Requires Python scripting knowledge to configure, unlike YAML-based competitors$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$No official hosted/cloud offering — requires self-hosting$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Less modern UI compared to newer commercial CI platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Is Buildbot free?$q$, $q$Yes, Buildbot is open-source software licensed under GPL-2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$What language is Buildbot written in and configured with?$q$, $q$Buildbot is written in Python (using Twisted) and is configured via a Python script rather than YAML; it requires Python 3.6+.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$What operating systems does Buildbot support?$q$, $q$Buildbot's master-worker architecture is compatible with all major operating systems.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Who uses Buildbot?$q$, $q$The project cites use by high-profile projects including WebKit, Python, and Twisted.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Highly customized build pipelines$q$, $q$Teams needing pipeline logic beyond what YAML config supports can write custom Python configuration.$q$, $q$Engineering teams with complex, non-standard build requirements$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$Cross-platform build farms$q$, $q$Projects that need to build and test across many operating systems can distribute jobs across workers.$q$, $q$Open-source projects and low-level software teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$overview$q$, $q$What is Buildbot?$q$, 2, ARRAY[$q$Buildbot is an open-source framework, written in Python using Twisted, for automating software build, test, and release processes. It uses a master-worker architecture in which one or more masters queue and distribute jobs to workers running on different operating systems, then collect and report the results.$q$, $q$Configuration is done through a Python script rather than a fixed YAML schema, allowing dynamic pipeline generation and custom components. Buildbot is licensed under GPL-2.0 and requires Python 3.6+.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', $q$who-its-for$q$, $q$Who Buildbot is for$q$, 2, ARRAY[$q$Buildbot suits teams that need highly customized, code-driven build automation and are comfortable writing Python to configure their CI system, including maintainers of large open-source projects like WebKit and CPython who already use it.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c7c25a31-e4a6-4f92-befe-498598b09f32', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── GoCD ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$GoCD is a free, open-source continuous delivery server from Thoughtworks that visualizes complex deployment pipelines end to end.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$GoCD is a free, open-source, Apache 2.0-licensed CD server from Thoughtworks with end-to-end pipeline visualization.$q$,
  og_description = $q$GoCD is a free, open-source, Apache 2.0-licensed CD server from Thoughtworks with end-to-end pipeline visualization.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '74b2d4e2-99dc-4bc1-bfaa-f10e06aac809';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '74b2d4e2-99dc-4bc1-bfaa-f10e06aac809' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$Value stream map$q$, $q$Visualizes the entire path from commit to production deployment in a single view.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$Complex workflow modeling$q$, $q$Supports parallel execution and dependency management for multi-stage delivery pipelines.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$End-to-end traceability$q$, $q$Tracks changes from commit through deployment in real time, enabling comparisons across builds.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$Cloud-native integrations$q$, $q$Works with Kubernetes, Docker, AWS, and other cloud environments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$Plugin architecture$q$, $q$An extensible plugin system integrates with many external tools.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$Fully open source under the Apache License 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$Maintained and sponsored by Thoughtworks$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$Strong visualization of complex, multi-stage delivery pipelines via the value stream map$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$Free to self-host with no license cost$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$No official hosted/cloud offering — requires self-hosting$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$UI and setup are dated compared to newer SaaS CI/CD tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$Steeper learning curve for modeling complex pipelines$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$Is GoCD free?$q$, $q$Yes, GoCD is free, open-source software released under the Apache License 2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$Who maintains GoCD?$q$, $q$GoCD is sponsored and maintained by Thoughtworks.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$Does GoCD support cloud-native deployments?$q$, $q$Yes, GoCD works with Kubernetes, Docker, AWS, and other cloud environments.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$Where can I find GoCD documentation?$q$, $q$Documentation is available at docs.gocd.org, alongside download and getting-started guides on the main site.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$Complex, multi-stage delivery pipelines$q$, $q$Teams with intricate deployment workflows can model parallel execution and dependencies visually.$q$, $q$Release and DevOps engineers managing complex CD pipelines$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$End-to-end deployment traceability$q$, $q$Organizations that need to trace a change from commit to production can use GoCD's value stream map and comparison tools.$q$, $q$Regulated or audit-conscious engineering teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$overview$q$, $q$What is GoCD?$q$, 2, ARRAY[$q$GoCD is a free, open-source continuous delivery and release automation server sponsored and maintained by Thoughtworks. It is released under the Apache License 2.0 and is designed for self-hosted deployment.$q$, $q$Its value stream map visualizes the entire path to production in a single view, supporting parallel execution and dependency management for complex delivery workflows, with real-time traceability of changes from commit to deployment.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', $q$who-its-for$q$, $q$Who GoCD is for$q$, 2, ARRAY[$q$GoCD suits teams that manage complex, multi-stage continuous delivery pipelines and want strong end-to-end visualization and traceability from a free, self-hosted, open-source server.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('74b2d4e2-99dc-4bc1-bfaa-f10e06aac809', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── CircleCI ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$CircleCI is a CI/CD platform offering a free tier plus credit-based paid plans for building, testing, and deploying software.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$15/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$CircleCI is a CI/CD platform with a free 6,000-minute tier and credit-based Performance and Scale plans for teams.$q$,
  og_description = $q$CircleCI is a CI/CD platform with a free 6,000-minute tier and credit-based Performance and Scale plans for teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$Free plan$q$, $q$Up to 6,000 build minutes per month with up to 5 active users and 30x concurrency.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$Multiple execution environments$q$, $q$Supports Docker, Linux, Windows, Arm, macOS, and self-hosted runners.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$MCP server$q$, $q$Connects AI tools to CircleCI logs, job metadata, and failure context.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$Rollback pipelines$q$, $q$Automatic rollback support for failed releases.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$Docker layer caching and workflows$q$, $q$Optimizes build speed with caching, parallelism, and multi-job workflows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$Credit-based paid plans$q$, $q$Performance and Scale plans use a credit system with a pricing calculator to size plans.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$Genuine free tier with 6,000 build minutes per month$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$Broad platform support including Docker, Windows, Arm, and macOS$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$Startup program offers up to $20,000 in free compute credits for qualifying companies$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$Client list on the site includes well-known companies such as Google and Okta$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$Paid plans use a credit-based system that can be harder to predict than flat per-seat pricing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$Scale plan requires contacting sales for custom, annually billed pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$Extra active users on the Performance plan cost $15/month each$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$Does CircleCI have a free plan?$q$, $q$Yes, the Free plan includes up to 6,000 build minutes per month, up to 5 active users, and 30x concurrency.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$How much does CircleCI's paid plan cost?$q$, $q$The Performance plan starts at $15/month and includes 30,000 credits and 5 active users, with additional users at $15/month each.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$Does CircleCI offer enterprise pricing?$q$, $q$Yes, the Scale plan offers custom, annually billed pricing with enterprise controls like SSO and unlimited concurrency.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$What environments does CircleCI support?$q$, $q$CircleCI supports Docker, Linux, Windows, Arm, macOS, and self-hosted runners.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$Small teams starting with CI/CD$q$, $q$The free plan's 6,000 monthly build minutes and 5 users suit small projects getting started.$q$, $q$Startups and small engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$Multi-platform build and release$q$, $q$Teams needing macOS, Windows, Arm, or GPU builds alongside Linux can use CircleCI's varied execution environments.$q$, $q$Teams shipping across multiple OS/architecture targets$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["Up to 6,000 build minutes","Up to 5 active users","30x concurrency","2 GB storage, 1 GB network","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$Performance$q$, $q$$15/month$q$, $q$monthly$q$, $q$["30,000 credits included","5 active users (extra $15/mo each)","80x concurrency","2 GB storage, 5 GB network","Optional 8x5 support add-on"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$Scale$q$, $q$Custom$q$, $q$annual$q$, $q$["Largest resource classes, all environments including GPU","Unlimited concurrency","200 GB storage, 50 GB network","SSO and config policies","Optional 24/7 support add-on"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$overview$q$, $q$What is CircleCI?$q$, 2, ARRAY[$q$CircleCI is a continuous integration and continuous delivery platform that automates testing, building, and deployment. It offers a free tier alongside credit-based paid plans, and supports execution environments including Docker, Linux, Windows, Arm, and macOS, as well as self-hosted runners.$q$, $q$The platform includes workflow features like parallelism, Docker layer caching, and rollback pipelines, plus an MCP server that connects AI tools to build logs, job metadata, and failure context.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', $q$who-its-for$q$, $q$Who CircleCI is for$q$, 2, ARRAY[$q$CircleCI suits teams ranging from small projects using the free tier to larger organizations on the custom-priced Scale plan that need enterprise controls like SSO, unlimited concurrency, and GPU environments.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cadd3f44-16e6-4e56-b77d-f1fdc0a1ac44', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Semaphore ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Semaphore is an open-source, pay-as-you-go CI/CD platform built for coding agents, giving every organization $15 of free usage per month.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Semaphore is an open-source, agent-native CI/CD platform with pay-as-you-go pricing and $15 of free usage every month.$q$,
  og_description = $q$Semaphore is an open-source, agent-native CI/CD platform with pay-as-you-go pricing and $15 of free usage every month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '32135d16-f5f2-4da3-94f9-bb49145ae75e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '32135d16-f5f2-4da3-94f9-bb49145ae75e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$Agent-native CI$q$, $q$Built to integrate directly with coding agents such as Claude and Codex, which can trigger CI setup and execution.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$Pre-push sandbox testing$q$, $q$A sandbox environment checks changes before they reach CI.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$Pay-as-you-go pricing$q$, $q$No per-seat fees; organizations pay only for CI execution beyond the $15 free monthly usage.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$Self-hosted agent option$q$, $q$Supports running your own agents in addition to Semaphore-hosted compute.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$Test reports and monorepo support$q$, $q$Includes test reporting and support for monorepo projects.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$Enterprise security controls$q$, $q$SOC 2 Type II certified, with SAML SSO, role-based access control, and audit logs.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$$15 of free usage every month for every organization, with no per-seat fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$Open source — source code can be reviewed and self-hosted$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$SOC 2 Type II certification with SSO, RBAC, and audit logs for enterprise needs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$Native integration with coding agents like Claude and Codex$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$Usage-based pricing makes costs less predictable than flat-rate plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$Specific per-minute/per-resource pricing isn't published on the marketing site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$Agent-native positioning may be less relevant for teams not using AI coding agents$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$Is Semaphore free?$q$, $q$Every organization gets $15 of free usage each month; usage-based charges apply for CI execution beyond that.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$Is Semaphore the same product as semaphoreci.com?$q$, $q$Yes, semaphoreci.com now redirects to semaphore.io, the current site for the product.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$Is Semaphore open source?$q$, $q$Yes, Semaphore is open source and can be self-hosted; the source is available on GitHub.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$Does Semaphore integrate with coding agents?$q$, $q$Yes, Semaphore is built for agent-native workflows and integrates with coding agents like Claude and Codex.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$Agent-driven CI setup$q$, $q$Teams using AI coding agents can have the agent configure and trigger CI runs directly.$q$, $q$Teams adopting AI coding agents in their workflow$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$Usage-based CI without per-seat costs$q$, $q$Organizations that want to avoid per-seat licensing can pay only for the compute their pipelines use.$q$, $q$Cost-conscious engineering teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$Pay-as-you-go$q$, $q$$15 free usage/month, then usage-based$q$, $q$monthly$q$, $q$["No per-seat fees","Self-hosted agent option","SOC 2 Type II, SAML SSO, RBAC, audit logs"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$overview$q$, $q$What is Semaphore?$q$, 2, ARRAY[$q$Semaphore is a continuous integration and delivery platform, formerly at semaphoreci.com and now at semaphore.io, positioned around agent-native automation — letting coding agents like Claude and Codex configure and trigger CI runs directly.$q$, $q$It uses pay-as-you-go pricing with no per-seat fees; every organization receives $15 of free usage each month before usage-based charges apply. Semaphore is open source and supports self-hosted agents alongside its hosted compute.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', $q$who-its-for$q$, $q$Who Semaphore is for$q$, 2, ARRAY[$q$Semaphore fits teams that want usage-based CI pricing without per-seat costs, and especially teams building workflows around AI coding agents that need CI to be triggerable directly by an agent.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('32135d16-f5f2-4da3-94f9-bb49145ae75e', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Buildkite ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Buildkite is a hybrid CI/CD platform that runs pipelines on your own self-hosted agents while Buildkite manages orchestration and UI.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$30/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Buildkite is a hybrid CI/CD platform with a free Personal plan and a $30/user/month Pro plan, running jobs on your own agents.$q$,
  og_description = $q$Buildkite is a hybrid CI/CD platform with a free Personal plan and a $30/user/month Pro plan, running jobs on your own agents.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e080ec1f-f731-4575-b1da-0167d0092eb9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e080ec1f-f731-4575-b1da-0167d0092eb9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Hybrid architecture$q$, $q$Pipelines run on your own self-hosted agents (or Buildkite-hosted Mac/Linux agents), while Buildkite hosts the orchestration, UI, and API.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Dynamic pipelines$q$, $q$Supports conditional logic, wait steps, block steps, and trigger steps for complex workflows.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Test Engine$q$, $q$Provides intelligent test splitting, flaky test isolation, and real-time test analytics across 15+ testing frameworks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Package Registries$q$, $q$Manages build artifacts and packages across multiple ecosystems for supply-chain security.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Mobile Delivery Cloud$q$, $q$A hosted environment optimized for iOS and Android app builds.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Unlimited parallelism$q$, $q$No cap on simultaneous jobs, limited only by available agent capacity.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Free-forever Personal plan with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Hybrid model keeps source code and secrets on your own infrastructure while Buildkite manages orchestration$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Test Engine supports 15+ testing frameworks with flaky-test isolation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Customer case studies report large-scale usage, including Uber running 100,000 concurrent agents$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Pro plan is priced per active user ($30/month), which can scale up quickly for larger teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Enterprise plan requires a 30-user minimum and custom pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Free Personal plan is limited to 3 concurrent jobs and 1 user$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Is Buildkite free?$q$, $q$The Personal plan is free forever for a single user with 3 concurrent jobs and 90-day build retention. A 30-day All Access Trial with full features is also available.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$How much does Buildkite's Pro plan cost?$q$, $q$The Pro plan costs $30 per active user per month and includes unlimited users, unlimited test executions, and all agent sizes including Mac M4.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$What is Buildkite's hybrid architecture?$q$, $q$Buildkite hosts the orchestration, UI, and API, while build jobs run on agents you host yourself or on Buildkite-hosted Mac/Linux agents.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Does Buildkite support mobile app builds?$q$, $q$Yes, its Mobile Delivery Cloud provides an environment optimized for iOS and Android deployment.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Large-scale, self-hosted CI$q$, $q$Organizations that need to keep build infrastructure and secrets on their own network can run Buildkite agents on-premise or in their own cloud.$q$, $q$Large engineering orgs with strict infrastructure/security requirements$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Test flakiness reduction$q$, $q$Teams with large test suites can use Test Engine to split tests intelligently and isolate flaky tests.$q$, $q$QA and engineering teams managing large test suites$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$All Access Trial$q$, $q$$0$q$, NULL, $q$["30-day full platform access","No credit card required","Dedicated Developer Success Engineer"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Personal$q$, $q$Free$q$, NULL, $q$["3 concurrent jobs","1 user","90-day build retention","Community support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Pro$q$, $q$$30/user/month$q$, $q$monthly$q$, $q$["Unlimited users and test executions","All agent sizes including Mac M4","Priority email support and SSO","250 managed tests included, then $0.10/test"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["30-user minimum","Premium support SLA","SCIM/SAML/ADFS","Audit logs and build exports","Pipeline templates"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$overview$q$, $q$What is Buildkite?$q$, 2, ARRAY[$q$Buildkite is a CI/CD platform built around a hybrid architecture: Buildkite hosts the pipeline orchestration, UI, and API, while build jobs execute on agents you run yourself (or on Buildkite-hosted Mac and Linux agents). This keeps source code and secrets on infrastructure you control.$q$, $q$The platform includes dynamic pipelines with conditional logic and trigger steps, a Test Engine for intelligent test splitting and flaky test isolation across 15+ testing frameworks, Package Registries for artifact management, and a Mobile Delivery Cloud for iOS/Android builds.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', $q$who-its-for$q$, $q$Who Buildkite is for$q$, 2, ARRAY[$q$Buildkite suits engineering teams — from solo developers on the free Personal plan to large organizations like Uber and Reddit cited in its case studies — that want CI orchestration as a service while keeping build execution on their own agents.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e080ec1f-f731-4575-b1da-0167d0092eb9', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Buddy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Buddy is a DevOps platform combining CI/CD pipelines, deployment automation, environment provisioning, and visual testing in one suite.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€29/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Buddy combines CI/CD pipelines, deployment automation, environments, and visual testing, with a free plan and plans from €29/month.$q$,
  og_description = $q$Buddy combines CI/CD pipelines, deployment automation, environments, and visual testing, with a free plan and plans from €29/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a8f6b931-ead8-4549-9325-5d2d323f59c8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a8f6b931-ead8-4549-9325-5d2d323f59c8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$Remote deployments$q$, $q$Deploys to VPS, bare metal, CDNs, and mixed clouds with agent and agentless options, one-click rollbacks, and manual approvals.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$Pipelines$q$, $q$Pipelines can be triggered by GitHub, AWS, Slack, or server events and designed via UI or YAML, running on Intel, ARM, Linux, Windows, Mac, or NixOS.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$Environments$q$, $q$Automated provisioning of dev, staging, and production environments on Buddy's cloud or your own infrastructure.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$Visual Reviews$q$, $q$Browser and viewport testing with interaction tests and snapshot diffing, supporting Playwright, Selenium, and Cypress.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$Tunnels$q$, $q$Secure connectivity to external networks protected by OAuth, SAML, and OIDC.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$Domains$q$, $q$Multi-tenant domain management with automated SSL and DNS records managed via Git, UI, or API.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$Free plan available with a 14-day trial and no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$Combines CI/CD, deployment automation, environment provisioning, and visual testing in a single product$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$Supports pipeline design via either a visual UI or YAML$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$SOC 2 certified$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$Free plan is limited to 1 seat and 1 concurrent pipeline$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$Adding seats or concurrency on paid plans carries per-unit surcharges (e.g. extra seat $9/mo on Pro)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$Pricing is quoted in euros, which may complicate budgeting for USD-based teams$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$Does Buddy have a free plan?$q$, $q$Yes, the Free plan includes 1 seat, 1 concurrent pipeline, 300 pipeline GB-minutes, and 1 GB of pipeline cache.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$How much does Buddy's Pro plan cost?$q$, $q$The Pro plan costs €29/month and includes 2 seats and 1 concurrent pipeline, with extra seats and concurrency billed separately.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$What testing frameworks does Buddy's Visual Reviews support?$q$, $q$Visual Reviews supports Playwright, Selenium, and Cypress for browser and viewport testing.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$What operating systems can Buddy pipelines run on?$q$, $q$Pipelines can run on Intel, ARM, Linux, Windows, Mac, or NixOS.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$All-in-one CI/CD and deployment$q$, $q$Teams that want pipelines, deployments, and environment provisioning in one product rather than stitching together separate tools.$q$, $q$Small-to-mid engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$Visual regression testing in CI$q$, $q$Teams can add browser/viewport snapshot testing directly into their pipelines using Visual Reviews.$q$, $q$Frontend teams needing visual QA$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$Free$q$, $q$€0$q$, NULL, $q$["1 seat","1 concurrent pipeline","300 pipeline GB-minutes","1 GB pipeline cache","300 sandbox CPU-minutes","730 sandbox GB-hours"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$Pro$q$, $q$€29/month$q$, $q$monthly$q$, $q$["2 seats (extra $9/mo per seat)","1 concurrent (extra $50/mo per concurrent)","3,000 pipeline GB-minutes","10 GB pipeline cache"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$Hyper$q$, $q$€99/month$q$, $q$monthly$q$, $q$["5 seats (extra $29/mo per seat)","2 concurrents","6,000 pipeline GB-minutes","20 GB pipeline cache","Advanced permissions","SAML & OIDC SSO"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$overview$q$, $q$What is Buddy?$q$, 2, ARRAY[$q$Buddy is a DevOps and platform engineering suite that combines CI/CD pipelines, remote deployment automation, environment provisioning, and visual testing into one product. Pipelines can be triggered by GitHub, AWS, Slack, or server events and designed either visually or in YAML, running across Intel, ARM, Linux, Windows, Mac, or NixOS.$q$, $q$Beyond pipelines, Buddy includes Environments for automated dev/staging/production provisioning, Visual Reviews for browser and viewport snapshot testing with Playwright, Selenium, and Cypress, Tunnels for secure external connectivity, and Domains for multi-tenant DNS/SSL management.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', $q$who-its-for$q$, $q$Who Buddy is for$q$, 2, ARRAY[$q$Buddy suits teams that want CI/CD, deployment automation, environment provisioning, and visual testing consolidated in one platform rather than assembled from separate tools, from small teams on the free plan to larger teams on Pro or Hyper.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8f6b931-ead8-4549-9325-5d2d323f59c8', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Harness ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Harness is a software delivery platform covering CI, CD/GitOps, feature flags, security testing, and cloud cost management, with a free tier.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Harness is a modular software delivery platform covering CI, CD, feature flags, and security, with a free plan and custom-priced tiers.$q$,
  og_description = $q$Harness is a modular software delivery platform covering CI, CD, feature flags, and security, with a free plan and custom-priced tiers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$Continuous Integration$q$, $q$Runs build and test pipelines as part of the broader Harness platform.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$Continuous Delivery & GitOps$q$, $q$Automates deployment workflows with GitOps-based delivery.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$Internal Developer Portal$q$, $q$Provides a developer portal module alongside the CI/CD pipeline tooling.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$Feature Management & Experimentation$q$, $q$Feature flag management and experimentation tooling.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$AI Test Automation and AI SRE$q$, $q$AI-assisted testing and site-reliability modules.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$Cloud & AI cost management$q$, $q$Cost optimization tooling for cloud and AI spend.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$100+ integrations$q$, $q$Supports major cloud providers (AWS, Azure, GCP, OCI) and other technologies.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$Free tier available for individual developers and small teams$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$Broad, modular platform spanning CI, CD, feature flags, security, and cost management$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$Open-source starter platform available (Harness Open Source)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$Also owns and maintains Drone CI, giving it deep container-native CI heritage$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$Paid Essentials and Enterprise tiers require contacting sales for pricing — no public pricing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$Broad module set can be more complex than single-purpose CI tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$Detailed free-tier CI limits (concurrency, runners) are only shown at the Essentials level and above$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$Does Harness have a free plan?$q$, $q$Yes, Harness offers a Free plan aimed at individual developers and small teams, alongside an open-source starter platform.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$How much does Harness cost beyond the free tier?$q$, $q$The Essentials and Enterprise plans require contacting Harness sales; specific pricing is not published.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$What modules does Harness offer?$q$, $q$Modules include Continuous Integration, Continuous Delivery & GitOps, Internal Developer Portal, Infrastructure as Code Management, Feature Management & Experimentation, AI Test Automation, AI SRE, security testing, and cloud/AI cost management.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$Is Harness related to Drone CI?$q$, $q$Yes, Harness acquired Drone.io in 2020 and continues to develop Drone as 'Drone by Harness.'$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$End-to-end software delivery platform$q$, $q$Organizations wanting CI, CD, feature flags, and security testing under one modular platform rather than separate point tools.$q$, $q$Mid-to-large engineering organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$AI-assisted delivery and reliability$q$, $q$Teams can adopt AI Test Automation and AI SRE modules alongside core CI/CD.$q$, $q$Teams investing in AI-assisted DevOps tooling$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$Free$q$, $q$$0$q$, NULL, $q$["Individual developers and small teams","Basic CI capabilities","Open source starter platform available"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$Essentials$q$, $q$Custom$q$, NULL, $q$["250GB code repository storage","Up to 60 concurrent pipeline executions","Up to 60 self-hosted runners"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["250GB code repository storage","Unlimited concurrent pipeline executions","Unlimited self-hosted runners","Modular selection of any module","Dedicated account manager"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$overview$q$, $q$What is Harness?$q$, 2, ARRAY[$q$Harness is a software delivery platform covering the lifecycle from code to production, including Continuous Integration, Continuous Delivery & GitOps, an Internal Developer Portal, feature flag management, AI-assisted testing, security testing, and cloud/AI cost management. It supports 100+ integrations across major cloud providers including AWS, Azure, GCP, and OCI.$q$, $q$Harness offers a Free plan for individual developers and small teams, plus quote-only Essentials and Enterprise plans for larger organizations. The company also owns and maintains Drone CI, which it acquired in 2020.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', $q$who-its-for$q$, $q$Who Harness is for$q$, 2, ARRAY[$q$Harness suits organizations that want a single modular platform spanning CI, CD, feature flags, security, and cost management rather than assembling separate point tools, from individual developers on the free tier to enterprises negotiating custom Essentials or Enterprise contracts.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82b1ccc3-3f53-4e7a-8f43-b0c0dcbf7a7f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Flux ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Flux is a free, open-source, CNCF Graduated GitOps tool that syncs Kubernetes clusters with the state declared in Git.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Flux is a free, open-source CNCF Graduated GitOps tool for Kubernetes, syncing clusters with Git and supporting Helm, Kustomize, and Flagger.$q$,
  og_description = $q$Flux is a free, open-source CNCF Graduated GitOps tool for Kubernetes, syncing clusters with Git and supporting Helm, Kustomize, and Flagger.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6ffc4ecf-fd8f-435d-a80c-5753e1503951';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6ffc4ecf-fd8f-435d-a80c-5753e1503951' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$GitOps synchronization$q$, $q$Declarative infrastructure and application state stored in Git is automatically and continuously applied to Kubernetes clusters.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$Progressive delivery$q$, $q$Integrates with Flagger for canary releases, feature flags, and A/B testing on top of GitOps-managed deployments.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$Multi-cluster management$q$, $q$Manages applications and configuration across multiple Kubernetes clusters from Git.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$Automated image updates$q$, $q$Scans container registries and can patch image tags, pushing the change back to Git automatically.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$Pull-based security model$q$, $q$Uses a pull-based architecture with RBAC and least-privilege principles rather than exposing cluster credentials to CI systems.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$Broad ecosystem support$q$, $q$Works with Kustomize, Helm, GitHub, GitLab, Slack notifications, OPA, and Kyverno.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$Free and fully open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$CNCF Graduated project status signals maturity and broad governance$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$Pull-based architecture reduces the security exposure of cluster credentials$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$Integrates with Flagger for progressive delivery (canary, A/B testing)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$Supports multiple Git providers and Kubernetes distributions$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$Requires working knowledge of Kubernetes and GitOps concepts to configure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$No official managed/hosted offering — you operate it yourself$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$Progressive delivery features require installing the separate Flagger project$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$Is Flux free?$q$, $q$Yes, Flux is fully open source and free to use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$Is Flux a CNCF project?$q$, $q$Yes, Flux is a CNCF Graduated project.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$Who created Flux?$q$, $q$Flux was originally created by Weaveworks and is now developed as a community-driven project under CNCF governance.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$Does Flux support canary deployments?$q$, $q$Yes, through integration with Flagger, a separate progressive delivery tool in the Flux ecosystem.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$Which Git providers does Flux support?$q$, $q$GitHub, GitLab, Bitbucket, and S3-compatible buckets.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$GitOps continuous delivery$q$, $q$Automatically sync Kubernetes cluster state with a Git repository as the single source of truth.$q$, $q$Platform engineers and DevOps teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$Multi-cluster application rollout$q$, $q$Manage configuration and deployments consistently across multiple Kubernetes clusters.$q$, $q$DevOps teams operating fleets of clusters$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$Automated image patching$q$, $q$Automatically detect new container image versions and update Git manifests without manual intervention.$q$, $q$Engineering teams wanting continuous patching$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$overview$q$, $q$What is Flux?$q$, 2, ARRAY[$q$Flux is a set of open-source, CNCF Graduated continuous and progressive delivery tools for Kubernetes. It implements GitOps: the desired state of applications and infrastructure is declared in a Git repository, and Flux continuously reconciles the live cluster to match it.$q$, $q$Originally created by Weaveworks, Flux is now a community-driven project governed under the Cloud Native Computing Foundation, with support for Kustomize, Helm, multiple Git providers, and integration with Flagger for progressive delivery such as canary releases.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', $q$who-its-for$q$, $q$Who Flux is for$q$, 2, ARRAY[$q$Flux is built for platform and DevOps teams running Kubernetes who want to manage cluster state declaratively through Git rather than manual kubectl or CI-driven deployments, particularly teams operating multiple clusters or requiring auditable, pull-based deployment security.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6ffc4ecf-fd8f-435d-a80c-5753e1503951', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Rancher ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Rancher is SUSE's open-source platform for managing Kubernetes clusters across cloud, on-prem, and edge infrastructure.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Rancher is a free, open-source Kubernetes management platform from SUSE, with Rancher Prime offering paid enterprise support.$q$,
  og_description = $q$Rancher is a free, open-source Kubernetes management platform from SUSE, with Rancher Prime offering paid enterprise support.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '446aa6e7-9482-4a1a-b79a-0320f056b430';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '446aa6e7-9482-4a1a-b79a-0320f056b430' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Multi-cluster Kubernetes management$q$, $q$Manage clusters across cloud, on-premises, and edge infrastructure from a unified platform.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Zero-trust security policies$q$, $q$Container lifecycle security and policy controls across managed clusters.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Certified Kubernetes distributions$q$, $q$Provides certified, secure Kubernetes distributions for sensitive and edge deployments.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Unified operations dashboard$q$, $q$Central view for managing OS, storage, VMs, and containers across the fleet.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Developer workflow tooling$q$, $q$Tools to streamline application deployment and improve developer reliability.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Free, open-source core with an active GitHub community$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Backed by SUSE, an established enterprise software vendor$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Manages Kubernetes clusters across multiple clouds, on-prem, and edge from one control plane$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Cited by SUSE as a Leader in the 2025 Gartner Magic Quadrant for Container Management$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Used by 30,000+ teams according to the vendor$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Rancher Prime (enterprise) pricing is not publicly listed and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Requires Kubernetes expertise to deploy and operate effectively$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Full enterprise feature set is gated behind the paid Prime offering$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Is Rancher free?$q$, $q$Yes, the open-source version of Rancher is free. SUSE also offers Rancher Prime, a paid enterprise edition with support.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Who owns Rancher?$q$, $q$Rancher is developed by SUSE.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$How many teams use Rancher?$q$, $q$SUSE states more than 30,000 teams use Rancher.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Does Rancher work across multiple clouds?$q$, $q$Yes, it manages Kubernetes clusters across cloud, on-premises, and edge environments.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Enterprise Kubernetes fleet management$q$, $q$Centrally manage and secure Kubernetes clusters across multiple environments.$q$, $q$Platform and DevOps teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Edge and OT Kubernetes deployment$q$, $q$Run certified Kubernetes distributions in industrial and edge settings.$q$, $q$Manufacturing and industrial IT teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Multi-cloud cluster governance$q$, $q$Apply consistent security and access policy across clusters spanning multiple cloud providers.$q$, $q$Enterprise IT and platform teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Rancher (Open Source)$q$, $q$Free$q$, NULL, $q$["Multi-cluster Kubernetes management","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$Rancher Prime$q$, $q$Custom (contact sales)$q$, NULL, $q$["Enterprise support","Certified distributions","Managed offering on AWS"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$overview$q$, $q$What is Rancher?$q$, 2, ARRAY[$q$Rancher is an open-source platform for managing Kubernetes clusters, developed by SUSE. It provides a unified dashboard for deploying, securing, and operating containerized workloads across cloud, on-premises, and edge infrastructure.$q$, $q$The open-source core is free to use, while SUSE also sells Rancher Prime, a paid enterprise edition that adds vendor support, certified distributions, and a managed offering on AWS.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', $q$who-its-for$q$, $q$Who Rancher is for$q$, 2, ARRAY[$q$Rancher is aimed at platform and DevOps teams responsible for operating Kubernetes at scale across multiple clusters and environments, from cloud-native infrastructure teams to industrial and edge deployments that need centralized policy and security controls.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('446aa6e7-9482-4a1a-b79a-0320f056b430', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Portainer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Portainer manages Docker and Kubernetes environments, with a free Community Edition and paid Business Edition plans.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$105/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$New Zealand$q$,
  languages = '{}',
  seo_meta_description = $q$Portainer manages Docker and Kubernetes containers with a free Community Edition and Business Edition plans starting at $105/month.$q$,
  og_description = $q$Portainer manages Docker and Kubernetes containers with a free Community Edition and Business Edition plans starting at $105/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '533ae83f-c4e9-4971-b328-0c6cb0ac3d10';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '533ae83f-c4e9-4971-b328-0c6cb0ac3d10' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Multi-cluster fleet management$q$, $q$Manage containers across Kubernetes distributions including EKS, AKS, GKE, bare metal, and on-premises.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$GitOps deployment workflows$q$, $q$Centralized reconciliation and promotion gates for Git-driven deployments.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Self-service deployment templates$q$, $q$Pre-defined templates with resource quotas and role-based access control.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Enterprise identity integration$q$, $q$SSO, LDAP, and OIDC support for centralized access control.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Air-gapped and offline support$q$, $q$Deployment support for edge and remote environments without internet access.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$OT/industrial platform support$q$, $q$Works with operational technology vendors such as Ignition and Critical Manufacturing.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Business Edition is free forever for up to 3 nodes$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Works across both Docker and multiple Kubernetes distributions (Rancher, K3s, OpenShift, Talos)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Used by organizations including NASA and the U.S. Navy, per the vendor$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Annual billing saves 16% compared to monthly on IT plans$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Dedicated low-cost Home & Student plan for non-commercial use$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Enterprise plan pricing is not public and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Starter and Scale plans restrict eligibility by organization revenue (≤$50M / ≤$100M)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Only community support is included on the entry-level Starter plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Is Portainer free?$q$, $q$Yes, Portainer Business Edition is free forever for up to 3 nodes.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$How much does Portainer cost beyond the free tier?$q$, $q$Enterprise IT plans start from $105/month for the Starter plan (5-15 nodes).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Does Portainer support Kubernetes and Docker?$q$, $q$Yes, Portainer manages both Docker and Kubernetes environments.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Is there a plan for personal or student use?$q$, $q$Yes, a Home & Student plan is available for $155/year for non-commercial use on up to 15 nodes.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Container fleet management$q$, $q$Manage Docker and Kubernetes containers across multiple environments from one dashboard.$q$, $q$Platform and DevOps engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Industrial/OT container deployment$q$, $q$Deploy and manage containerized workloads in manufacturing, retail, and field operations.$q$, $q$Manufacturing and edge IT teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Personal or lab container management$q$, $q$Manage small self-hosted container setups with the Home & Student plan.$q$, $q$Students and hobbyists$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Business Edition (Free)$q$, $q$Free$q$, NULL, $q$["Up to 3 nodes","Full feature access","No credit card required"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Starter$q$, $q$$105/month$q$, $q$monthly$q$, $q$["5-15 nodes","Up to 16 vCPUs per node","Community support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Scale$q$, $q$$209/month$q$, $q$monthly$q$, $q$["5-35 nodes","Up to 24 vCPUs per node","9x5 next business day support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Enterprise$q$, $q$Custom (contact sales)$q$, NULL, $q$["32 to unlimited vCPUs per node","Assigned support engineer","24/7 support option"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$Home & Student$q$, $q$$155/year$q$, $q$annual$q$, $q$["Up to 15 nodes","Non-commercial use only"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$overview$q$, $q$What is Portainer?$q$, 2, ARRAY[$q$Portainer is an operational control platform for managing Docker and Kubernetes container environments. It provides a dashboard for deploying, monitoring, and securing containerized workloads without requiring deep cloud-native expertise.$q$, $q$Portainer offers a free Community Edition and a Business Edition that is free forever for up to 3 nodes, plus paid Enterprise IT plans (Starter, Scale, Enterprise) and a discounted Home & Student plan for non-commercial use.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', $q$who-its-for$q$, $q$Who Portainer is for$q$, 2, ARRAY[$q$Portainer suits teams operating Docker or Kubernetes who want a centralized management dashboard, ranging from small teams using the free tier to enterprises and industrial/OT organizations needing SSO, RBAC, and air-gapped deployment support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('533ae83f-c4e9-4971-b328-0c6cb0ac3d10', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Coolify ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Coolify is a free, open-source, self-hostable alternative to Heroku and Vercel for deploying apps to your own servers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$5/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Coolify is a free, open-source self-hosted PaaS alternative to Heroku and Vercel, with Coolify Cloud starting at $5/month.$q$,
  og_description = $q$Coolify is a free, open-source self-hosted PaaS alternative to Heroku and Vercel, with Coolify Cloud starting at $5/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '005bfac7-53dd-49b7-9c17-ef452a208620';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '005bfac7-53dd-49b7-9c17-ef452a208620' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$Self-hosted deployment$q$, $q$Deploy to any server you own, including VPS, Raspberry Pi, or cloud providers, with no vendor lock-in.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$280+ one-click services$q$, $q$Deploy databases and popular services with one click, alongside apps in multiple programming languages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$Automatic backups and SSL$q$, $q$Automatic database backups and free SSL certificate management via Let's Encrypt.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$Git integration$q$, $q$Connects with GitHub, GitLab, Bitbucket, and Gitea for deployment workflows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$Browser-based terminal$q$, $q$Real-time terminal access to servers directly from the browser.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$Team collaboration$q$, $q$Tools for teams to collaborate on deployments and infrastructure.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$Self-hosting is free forever and fully open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$No vendor lock-in — deploy to any server you own$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$Supports 280+ one-click services$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$Low-cost managed Coolify Cloud tier starting at $5/month$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$Supports multiple Git providers (GitHub, GitLab, Bitbucket, Gitea)$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$Self-hosted setup requires managing your own server infrastructure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$Coolify Cloud still requires bringing your own servers to deploy to$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$Only community and limited email support on the base Cloud plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$Is Coolify free?$q$, $q$Yes, self-hosting Coolify is free forever and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$What is Coolify Cloud?$q$, $q$A managed control panel service starting at $5/month for 2 connected servers, with $3/month per additional server.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$Do I need my own server to use Coolify?$q$, $q$Yes, both the self-hosted and Cloud versions require you to bring your own servers, such as a VPS or cloud instance.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$What can I deploy with Coolify?$q$, $q$Over 280 one-click services plus custom applications in multiple programming languages.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$Self-hosted app deployment$q$, $q$Deploy web apps and services to your own servers without PaaS vendor lock-in.$q$, $q$Indie developers and small teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$Managed deployment via Coolify Cloud$q$, $q$Use a hosted control panel to manage deployments to your own connected servers.$q$, $q$Teams wanting less infrastructure overhead$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$Self-Hosted$q$, $q$Free$q$, NULL, $q$["Unlimited servers","Unlimited deployments","Full feature access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$Coolify Cloud$q$, $q$$5/month$q$, $q$monthly$q$, $q$["2 servers included","Unlimited deployments per server","Community + limited email support","$3/month per additional server","20% discount with annual billing"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$overview$q$, $q$What is Coolify?$q$, 2, ARRAY[$q$Coolify is an open-source, self-hostable alternative to Vercel, Heroku, Netlify, and Railway. It lets developers deploy applications and services to their own servers — VPS, Raspberry Pi, or cloud instances — while keeping full ownership of their infrastructure and data.$q$, $q$Self-hosting Coolify is free forever and open source. Coolify also offers Coolify Cloud, a managed control panel starting at $5/month for 2 connected servers, for teams who want less operational overhead while still deploying to their own infrastructure.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', $q$who-its-for$q$, $q$Who Coolify is for$q$, 2, ARRAY[$q$Coolify is built for developers and small teams who want the deployment experience of a PaaS like Heroku or Vercel without the vendor lock-in, whether they self-host the control panel themselves or use the low-cost Coolify Cloud offering.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('005bfac7-53dd-49b7-9c17-ef452a208620', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── CapRover ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$CapRover is a free, open-source, self-hosted PaaS for deploying Docker apps with one-click installs and auto HTTPS.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$CapRover is a free, open-source self-hosted PaaS for Docker apps, with one-click installs, automatic HTTPS, and Swarm scaling.$q$,
  og_description = $q$CapRover is a free, open-source self-hosted PaaS for Docker apps, with one-click installs, automatic HTTPS, and Swarm scaling.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4a45bf44-b4ce-425d-98d9-8231b5a94b48';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4a45bf44-b4ce-425d-98d9-8231b5a94b48' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$One-click app deployment$q$, $q$Deploy popular services such as databases, WordPress, and monitoring tools in seconds.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$Automatic HTTPS$q$, $q$Free TLS certificates via Let's Encrypt with automatic renewal.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$Multi-language support$q$, $q$Deploy Node.js, Python, PHP, Java, Ruby, .NET, or any container-based app.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$Flexible deployment methods$q$, $q$Deploy via the web dashboard, CLI, webhooks, or Git workflows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$Docker Swarm scaling$q$, $q$Add nodes to a Docker Swarm cluster for load balancing and horizontal scaling.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$Completely free and open source under the Apache 2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$No vendor lock-in — self-hosted on your own infrastructure$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$Simple one-click app catalog for common services$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$Automatic TLS certificate issuance and renewal$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$Runs on any infrastructure that supports Docker$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$No official enterprise support or paid tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$You are responsible for managing and securing the underlying server(s)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$Community-maintained, funded via OpenCollective donations rather than a company$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$Is CapRover free?$q$, $q$Yes, CapRover is completely free and open source, licensed under Apache 2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$What is CapRover built on?$q$, $q$Docker, nginx, Let's Encrypt, and Docker Swarm.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$Does CapRover support scaling?$q$, $q$Yes, via Docker Swarm nodes for load balancing and clustering.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$How do I deploy apps with CapRover?$q$, $q$Via the web dashboard, CLI, webhooks, or Git push.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$Self-hosted PaaS for solo developers$q$, $q$Deploy and manage personal projects on owned infrastructure without a hosting bill per app.$q$, $q$Solo developers and hobbyists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$Small team app hosting$q$, $q$Run multiple containerized apps and services without vendor lock-in.$q$, $q$Small businesses and startups$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$overview$q$, $q$What is CapRover?$q$, 2, ARRAY[$q$CapRover is a free, open-source, self-hosted Platform-as-a-Service that simplifies deploying and managing Docker-based applications. It is built on Docker, nginx, Let's Encrypt, and Docker Swarm.$q$, $q$It offers one-click deployment of popular services, automatic HTTPS certificate management, and support for common languages and frameworks, all while keeping full ownership of the underlying infrastructure.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', $q$who-its-for$q$, $q$Who CapRover is for$q$, 2, ARRAY[$q$CapRover is aimed at developers and small teams who want a Heroku-like deployment experience on their own servers, without paying for a managed PaaS or dealing with complex container orchestration setup.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4a45bf44-b4ce-425d-98d9-8231b5a94b48', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Dokku ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Dokku is a free, open-source, Docker-powered PaaS that deploys Heroku-compatible apps via Git push to your own server.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Dokku is a free, open-source Docker PaaS for Git-push deployment, with an optional paid Dokku Pro dashboard add-on.$q$,
  og_description = $q$Dokku is a free, open-source Docker PaaS for Git-push deployment, with an optional paid Dokku Pro dashboard add-on.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6cf17823-4f66-4f20-8ec7-a8927a750f25';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6cf17823-4f66-4f20-8ec7-a8927a750f25' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$Git-based deployment$q$, $q$Push Heroku-compatible applications to your server via Git.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$Docker-powered isolation$q$, $q$Runs applications in isolated containers using Heroku buildpacks.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$Extensible plugin system$q$, $q$Write and install plugins in any language to customize functionality.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$No vendor lock-in$q$, $q$Install on any hardware or inexpensive cloud provider you control.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$Dokku Pro dashboard (optional)$q$, $q$A paid, self-hosted web dashboard adds a management UI, JSON API, log streaming, and scaling controls on top of core Dokku.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$Core Dokku is free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$Git-push deployment workflow familiar to Heroku users$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$Highly extensible via community plugins$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$Can be installed on any Docker-compatible infrastructure, including generic Linux, Azure, DigitalOcean, and DreamHost Cloud$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$Optional Dokku Pro adds a management UI without requiring a subscription (one-time purchase)$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$Core Dokku has no built-in web dashboard unless Dokku Pro is purchased separately$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$Dokku Pro costs $849 as an early-bird one-time purchase, with prices set to increase later$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$Requires self-managing the underlying server$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$Is Dokku free?$q$, $q$Yes, the core open-source Dokku is free. An optional paid add-on called Dokku Pro provides a management dashboard.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$How much does Dokku Pro cost?$q$, $q$Dokku Pro is offered at an early-bird one-time price of $849, covering one production server plus two pre-production environments.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$What does Dokku deploy?$q$, $q$Heroku-compatible applications, deployed via Git push and run in Docker containers using buildpacks.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$Can Dokku be extended?$q$, $q$Yes, through a plugin system that supports plugins written in any language.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$Self-hosted Heroku alternative$q$, $q$Deploy apps via git push to a self-managed server instead of paying for managed PaaS hosting.$q$, $q$Developers and small teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$Managed dashboard for Dokku fleets$q$, $q$Use Dokku Pro's web UI, API, and log streaming to operate Dokku across production and pre-production environments.$q$, $q$Teams running multiple Dokku servers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$Dokku (Open Source)$q$, $q$Free$q$, NULL, $q$["Git-push deployment","Docker buildpacks","Plugin ecosystem"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$Dokku Pro$q$, $q$$849 one-time (early-bird pricing)$q$, NULL, $q$["Web admin dashboard","JSON API","Log streaming","Scaling controls","1 production + 2 pre-production environments","Email support"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$overview$q$, $q$What is Dokku?$q$, 2, ARRAY[$q$Dokku is a free, open-source, Docker-powered Platform-as-a-Service, often described as the smallest PaaS implementation available. It lets developers push Heroku-compatible applications to their own server via Git, where they run in isolated containers built from Heroku buildpacks.$q$, $q$The core project is free and extensible through a plugin system in any language. A separate paid product, Dokku Pro, adds a self-hosted web dashboard, JSON API, log streaming, and scaling controls for teams that want a management UI on top of core Dokku.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', $q$who-its-for$q$, $q$Who Dokku is for$q$, 2, ARRAY[$q$Dokku suits developers and small teams who want a lightweight, self-hosted alternative to Heroku, deploying via familiar Git-push workflows on their own infrastructure without recurring PaaS hosting fees.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6cf17823-4f66-4f20-8ec7-a8927a750f25', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Tsuru ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Tsuru is a free, open-source Platform as a Service built on Kubernetes for deploying apps in any language.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Tsuru is a free, open-source PaaS built on Kubernetes, letting teams deploy apps in any language without managing infrastructure.$q$,
  og_description = $q$Tsuru is a free, open-source PaaS built on Kubernetes, letting teams deploy apps in any language without managing infrastructure.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5a8012fa-de58-422c-8781-450f465f4beb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5a8012fa-de58-422c-8781-450f465f4beb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$Language-agnostic deployment$q$, $q$Supports applications written in any programming language or framework.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$Single-command deploys$q$, $q$Deploy applications using a simplified, single-command workflow.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$Dynamic resource allocation$q$, $q$Scales and allocates compute resources dynamically to running applications.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$Built on Kubernetes$q$, $q$Runs on Cloud Native Computing Foundation technologies, using Kubernetes as its underlying infrastructure.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$Multi-cluster, multi-region management$q$, $q$Manages applications across multiple Kubernetes clusters and regions from a centralized control point.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$Built on standard Kubernetes/CNCF technologies rather than a proprietary runtime$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$Used in production by organizations including Globo.com, Jumia, and Stone, per the Tsuru website$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$Supports multi-cluster and multi-region deployments from one control point$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$Can be tried locally via Minikube$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$Requires Kubernetes infrastructure to operate$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$Documentation and adoption skew toward Globo.com's own production use case$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$Smaller community compared to larger PaaS/GitOps projects$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$Is Tsuru free?$q$, $q$Yes, Tsuru is open source and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$What does Tsuru run on?$q$, $q$Kubernetes clusters, built on Cloud Native Computing Foundation technologies.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$Who uses Tsuru?$q$, $q$Organizations including Globo.com, Jumia, Stone, and Hotel Urbano, according to the Tsuru website.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$Can I try Tsuru locally?$q$, $q$Yes, it supports local deployment using Minikube.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$Self-hosted PaaS on Kubernetes$q$, $q$Standardize application deployment across teams on top of existing Kubernetes infrastructure.$q$, $q$Platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$Multi-region application deployment$q$, $q$Deploy and manage applications across distributed Kubernetes clusters and regions.$q$, $q$Enterprises with distributed infrastructure$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$overview$q$, $q$What is Tsuru?$q$, 2, ARRAY[$q$Tsuru is an open-source Platform as a Service focused on developer productivity. It lets teams deploy applications in any programming language or framework across Kubernetes clusters without directly managing infrastructure.$q$, $q$Built on Cloud Native Computing Foundation technologies, Tsuru supports dynamic resource allocation, single-command deployments, and multi-cluster, multi-region management from a centralized control point. It is associated with Globo.com and used by organizations such as Jumia and Stone, per the Tsuru website.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', $q$who-its-for$q$, $q$Who Tsuru is for$q$, 2, ARRAY[$q$Tsuru is suited to platform engineering teams that already run Kubernetes and want to give developers a simplified, language-agnostic deployment workflow across multiple clusters and regions.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5a8012fa-de58-422c-8781-450f465f4beb', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Cloudron ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloudron is a self-hosting platform for web apps with automatic updates and backups, offering free and paid plans.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€15/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Cloudron is a self-hosting app platform with automatic updates, backups, and email, offering a free plan and paid Pro/Max tiers from €15/month.$q$,
  og_description = $q$Cloudron is a self-hosting app platform with automatic updates, backups, and email, offering a free plan and paid Pro/Max tiers from €15/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '63b900b3-a299-4585-b839-c8a5c321ef6b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '63b900b3-a299-4585-b839-c8a5c321ef6b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$App Store deployment$q$, $q$Deploy production-ready apps from the Cloudron App Store.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Fast security patching$q$, $q$Security patches are released within 24 hours for apps and the server, per the vendor.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Centralized user management$q$, $q$Single dashboard for access control across multiple users and apps.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Built-in email server$q$, $q$Mail server with calendar, contacts, and spam filtering included.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Encrypted backups$q$, $q$Encrypted backups to cloud storage providers including S3, Google Cloud, and DigitalOcean.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$App portability$q$, $q$Apps can be migrated across servers without complicated manual steps.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Free plan available for running up to two apps$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Fast security patch turnaround (within 24 hours, per the vendor)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Bundles email, backups, firewall, and SSO across all paid plans$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Encrypted backups to multiple cloud storage providers$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Apps can be migrated between servers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Free plan is limited to two apps$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Unlimited apps require a paid Pro or Max subscription$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Advanced features like user groups/roles and a directory server require the top Max plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Is Cloudron free?$q$, $q$Cloudron offers a free plan limited to two apps; unlimited apps require a paid Pro or Max plan.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$What does Cloudron's Pro plan cost?$q$, $q$The Pro plan is €15/month on monthly billing, with unlimited apps.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$What does the Max plan add?$q$, $q$The Max plan (€25/month) adds user groups and roles, a directory server, and multiple backup sites.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Does Cloudron include email hosting?$q$, $q$Yes, a built-in mail server with calendar, contacts, and spam filtering is included on all plans.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Self-hosting a small app suite$q$, $q$Run a limited set of self-hosted apps for free before upgrading.$q$, $q$Individuals trying self-hosting$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Full self-hosted office/collaboration stack$q$, $q$Run unlimited apps, email, and backups on a personal or organizational server.$q$, $q$Small businesses and privacy-focused organizations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Free$q$, $q$€0/month$q$, $q$monthly$q$, $q$["Up to 2 apps"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Pro$q$, $q$€15/month (monthly) / €30/month billed yearly$q$, $q$monthly$q$, $q$["Unlimited apps","App updates","Per-app backups","Firewall","Email","Single Sign-On"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$Max$q$, $q$€25/month (monthly) / €50/month billed yearly$q$, $q$monthly$q$, $q$["Unlimited apps","User groups and roles","Directory server","Multiple backup sites"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$overview$q$, $q$What is Cloudron?$q$, 2, ARRAY[$q$Cloudron is a self-hosting platform that simplifies running web applications on your own server. It handles system administration tasks such as updates, backups, and security patching so users can focus on using apps rather than maintaining infrastructure.$q$, $q$Cloudron offers a free plan for up to two apps, and paid Pro and Max subscription plans for unlimited apps, with the Max plan adding user groups/roles, a directory server, and multiple backup destinations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', $q$who-its-for$q$, $q$Who Cloudron is for$q$, 2, ARRAY[$q$Cloudron is aimed at individuals, small businesses, and privacy-conscious organizations who want to self-host a suite of web apps and email without manually managing server updates, backups, and security patches.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63b900b3-a299-4585-b839-c8a5c321ef6b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── YunoHost ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$YunoHost is a free, open-source, self-hosted server system for installing and managing apps with minimal expertise.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$YunoHost is a free, open-source self-hosting platform that simplifies installing and managing apps like email, cloud storage, and websites.$q$,
  og_description = $q$YunoHost is a free, open-source self-hosting platform that simplifies installing and managing apps like email, cloud storage, and websites.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0aa25628-95fd-4484-a51f-ba231959a576';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0aa25628-95fd-4484-a51f-ba231959a576' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$App catalog$q$, $q$Dedicated catalog of pre-configured apps installable through the web interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$Email hosting$q$, $q$Self-hosted email with contact and calendar synchronization.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$Cloud storage and file sharing$q$, $q$Host your own file storage and sharing services.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$Web hosting$q$, $q$Host websites directly from a YunoHost server.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$Admin web panel$q$, $q$Guided setup, app installation, and server maintenance through a web-based admin panel.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$Broad hardware support$q$, $q$Installs on ARM boards, Raspberry Pi devices, repurposed computers, and VPS.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$Fully free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$Non-profit project maintained by volunteers, not a commercial vendor$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$Designed to work with minimal technical expertise$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$Runs on inexpensive hardware including Raspberry Pi and repurposed computers$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$Supported by sponsors including NLnet, NGI, and Code Lutin$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$Community/volunteer-maintained rather than commercially supported$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$No official managed hosting offering — you must run your own hardware or VPS$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$App catalog quality and update cadence depend on individual app packagers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$Is YunoHost free?$q$, $q$Yes, YunoHost is entirely free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$What hardware can run YunoHost?$q$, $q$ARM boards, Raspberry Pi devices, repurposed computers, and virtual private servers.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$Who maintains YunoHost?$q$, $q$It is developed and maintained by volunteers as a non-profit project, supported by sponsors including NLnet, NGI, and Code Lutin.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$Do I need technical expertise to use YunoHost?$q$, $q$No, it is designed to let users install and maintain digital services with very little technical knowledge.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$Personal self-hosted server$q$, $q$Run your own email, file storage, and website hosting on owned hardware.$q$, $q$Privacy-conscious individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$Low-cost self-hosting on small hardware$q$, $q$Deploy a self-hosted app suite on inexpensive hardware like a Raspberry Pi.$q$, $q$Hobbyists and budget-conscious self-hosters$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$overview$q$, $q$What is YunoHost?$q$, 2, ARRAY[$q$YunoHost is a free, open-source system that lets users install and maintain digital services — apps they fully control — with very little technical knowledge. It is a non-profit, volunteer-maintained project.$q$, $q$Through a guided admin web panel and an app catalog, YunoHost supports self-hosted email, cloud storage, collaborative document editing, website hosting, and team communication tools, installable on ARM boards, Raspberry Pi devices, repurposed computers, or a VPS.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', $q$who-its-for$q$, $q$Who YunoHost is for$q$, 2, ARRAY[$q$YunoHost is aimed at individuals and small groups who want to self-host their own digital services on low-cost hardware without needing deep sysadmin skills, valuing data ownership and control over convenience of a commercial cloud provider.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0aa25628-95fd-4484-a51f-ba231959a576', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── CasaOS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$CasaOS is a free, open-source personal cloud operating system for self-hosting apps and files on devices like Raspberry Pi and ZimaBoard.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$CasaOS: free, open-source personal cloud OS for self-hosting files and Docker apps on Raspberry Pi, ZimaBoard, and NUC hardware.$q$,
  og_description = $q$CasaOS: free, open-source personal cloud OS for self-hosting files and Docker apps on Raspberry Pi, ZimaBoard, and NUC hardware.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c2436cfe-e0aa-468d-9855-6acb47cd220e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c2436cfe-e0aa-468d-9855-6acb47cd220e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$One-click app store$q$, $q$20+ pre-installed Docker-based apps plus 50+ community-verified apps available for one-click installation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$Custom Docker app support$q$, $q$Import and run existing Docker applications alongside apps from the CasaOS store.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$Centralized file storage$q$, $q$Store files, photos, and videos on your own hardware with cross-device syncing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$Remote access$q$, $q$Access files and applications outside the local network with secure connections.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$Multi-hardware support$q$, $q$Runs on Raspberry Pi, Intel NUC, ZimaBoard, and other amd64/armv7/arm64 devices.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$Fully open source under Apache 2.0, with 23.9k GitHub stars$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$No subscription fees$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$Runs on affordable, low-power hardware like Raspberry Pi and ZimaBoard$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$Growing curated app ecosystem$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$Active Discord and GitHub community$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$Requires owning and setting up your own hardware$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$Community-maintained app store quality can vary by app$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$No official vendor-backed enterprise support tier mentioned on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$Is CasaOS free?$q$, $q$Yes, CasaOS is fully open source under the Apache 2.0 license with no subscription fees.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$What hardware does CasaOS support?$q$, $q$Raspberry Pi, Intel NUC, ZimaBoard, and other amd64/armv7/arm64 devices running Ubuntu, Debian, Raspberry Pi OS, or CentOS.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$Who maintains CasaOS?$q$, $q$CasaOS is developed and maintained by IceWhale Tech, operating under ZimaSpace.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$Can I install my own Docker apps on CasaOS?$q$, $q$Yes, CasaOS supports importing existing Docker applications in addition to its built-in app store.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$Home NAS replacement$q$, $q$Store and sync files, photos, and videos on your own hardware instead of paying for cloud storage.$q$, $q$Home users wanting to own their data$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$Self-hosted app hub$q$, $q$Run a curated set of Docker apps from a single dashboard on low-power hardware.$q$, $q$Homelab enthusiasts and hobbyists$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$CasaOS$q$, $q$Free$q$, NULL, $q$["Open-source operating system","App Store access","Docker app management","Remote access"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$overview$q$, $q$What is CasaOS?$q$, 2, ARRAY[$q$CasaOS is an open-source personal cloud operating system that turns hardware like a Raspberry Pi, Intel NUC, or ZimaBoard into a self-hosted server for files, media, and apps.$q$, $q$It ships with a one-click app store of 20+ pre-installed Docker apps and 50+ community-verified apps, and it also supports importing existing Docker applications, making it a flexible base for a home server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', $q$who-its-for$q$, $q$Who CasaOS is for$q$, 2, ARRAY[$q$CasaOS suits homelab enthusiasts and privacy-conscious users who want to run their own file storage and apps on inexpensive hardware instead of paying for commercial cloud subscriptions.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c2436cfe-e0aa-468d-9855-6acb47cd220e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Umbrel ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Umbrel is a personal home server platform (umbrelOS) with a one-click app store for self-hosting files, media, AI models, and a Bitcoin node.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$549$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Umbrel: personal home cloud platform with a one-click app store for self-hosted files, AI models, Bitcoin nodes, and media, from $549.$q$,
  og_description = $q$Umbrel: personal home cloud platform with a one-click app store for self-hosted files, AI models, Bitcoin nodes, and media, from $549.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cfe083dd-da65-4b67-83be-298a4c15c75c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cfe083dd-da65-4b67-83be-298a4c15c75c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$One-click app store$q$, $q$30+ pre-installed apps including Nextcloud, Jellyfin, Plex, Tailscale, and n8n.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Local AI hosting$q$, $q$Run AI models such as DeepSeek R1 and Llama 3, plus an OpenClaw agent, directly on the device.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Bitcoin and Lightning node$q$, $q$Run a full Bitcoin node with integrated wallet support.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Media streaming$q$, $q$Stream movies and TV shows to multiple devices from your own server.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Network-wide ad blocking$q$, $q$Built-in Pi-hole integration blocks ads across the whole network.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Home automation$q$, $q$Home Assistant integration supports 1,000+ smart-home devices.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Turnkey Umbrel Home/Pro hardware options for non-technical users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Curated one-click app store with 30+ apps$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Supports running AI models locally$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Integrates a Bitcoin/Lightning node and home automation out of the box$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$umbrelOS is free to install on your own hardware$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Dedicated Umbrel Home/Pro hardware carries a significant upfront cost ($549-$699+)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Local AI model hosting requires sufficiently capable hardware$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Limited to apps available in the Umbrel App Store$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Is umbrelOS free?$q$, $q$Yes, umbrelOS is free to install on your own hardware.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Does Umbrel sell dedicated hardware?$q$, $q$Yes, Umbrel Home starts at $549 and Umbrel Pro starts at $699, with financing options such as $174.75/month for 4 months.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$What apps are available on Umbrel?$q$, $q$30+ apps including Nextcloud, Jellyfin, Plex, Tailscale, and n8n.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Can Umbrel run AI models?$q$, $q$Yes, it supports running local AI models such as DeepSeek R1 and Llama 3.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Personal cloud storage$q$, $q$Replace paid cloud storage services with self-hosted file, photo, and video storage.$q$, $q$Home users wanting data ownership$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Self-hosted AI$q$, $q$Run open AI models locally without sending data to third-party cloud services.$q$, $q$Privacy-focused users and hobbyists$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Home Bitcoin node$q$, $q$Run a full Bitcoin and Lightning node with wallet support from home.$q$, $q$Bitcoin/Lightning users$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$umbrelOS$q$, $q$Free$q$, NULL, $q$["Free operating system for self-hosting on your own hardware"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Umbrel Home$q$, $q$$549$q$, NULL, $q$["Plug-and-play home cloud hardware"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$Umbrel Pro$q$, $q$$699$q$, NULL, $q$["Up to 32TB SSD storage","Aluminum/walnut finish"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$overview$q$, $q$What is Umbrel?$q$, 2, ARRAY[$q$Umbrel is a personal home server platform built around umbrelOS, its free operating system for self-hosting files, media, AI models, and a Bitcoin node.$q$, $q$Umbrel also sells dedicated Umbrel Home and Umbrel Pro hardware, starting at $549 and $699 respectively, alongside its 30+ app one-click store.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', $q$who-its-for$q$, $q$Who Umbrel is for$q$, 2, ARRAY[$q$Umbrel targets users who want to own their data and run their own cloud, AI, and Bitcoin infrastructure at home, whether via purchased hardware or by installing umbrelOS on their own device.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cfe083dd-da65-4b67-83be-298a4c15c75c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── OpenNebula ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$OpenNebula is an open-source cloud and virtualization management platform for building private, hybrid, and edge clouds as an alternative to VMware.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OpenNebula: open-source cloud and virtualization management platform for private, hybrid, and edge clouds, maintained by OpenNebula Systems.$q$,
  og_description = $q$OpenNebula: open-source cloud and virtualization management platform for private, hybrid, and edge clouds, maintained by OpenNebula Systems.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$DRS-style scheduling and HA$q$, $q$Automated resource scheduling and high availability for hosted workloads.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$Multi-site federation$q$, $q$Federate multiple sites into a single managed cloud.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$Kubernetes integration$q$, $q$Orchestrate Kubernetes clusters alongside virtualized workloads.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$GPU and accelerated computing$q$, $q$Supports GPU workloads through an NVIDIA partnership.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$Enterprise storage integrations$q$, $q$Connects with NetApp, Pure Storage, and Veeam.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$Secure multi-tenancy$q$, $q$Isolates tenants for shared infrastructure environments.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$Source code publicly available on GitHub$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$Avoids proprietary hypervisor licensing costs (positioned as a VMware alternative)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$Supports GPU and multi-hypervisor environments$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$Multi-site federation for distributed deployments$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$Optional integrated Ubuntu Pro, RHEL, or SUSE subscriptions$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$Enterprise Subscription pricing is not published on the site (quote-based)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$Site content is licensed CC BY-NC-SA (non-commercial), separate from the platform's own source license$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$Requires infrastructure expertise to self-host and operate$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$Is OpenNebula free?$q$, $q$A Community version is available at no cost; paid Enterprise Subscriptions with additional services also exist.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$What does OpenNebula replace?$q$, $q$It is positioned as an alternative to proprietary cloud/virtualization platforms like VMware.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$Does OpenNebula support GPU workloads?$q$, $q$Yes, including support enabled through an NVIDIA partnership.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$Who maintains OpenNebula?$q$, $q$OpenNebula Systems owns and maintains the platform.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$Private and sovereign cloud$q$, $q$Build a self-managed private cloud without relying on public cloud providers.$q$, $q$Enterprises and public sector organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$Edge computing$q$, $q$Deploy and manage workloads across distributed edge locations.$q$, $q$Telecom and edge infrastructure teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$VMware migration$q$, $q$Migrate virtualization workloads off proprietary platforms.$q$, $q$IT teams reducing licensing costs$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$overview$q$, $q$What is OpenNebula?$q$, 2, ARRAY[$q$OpenNebula is a cloud and virtualization management platform used to build private, hybrid, and edge clouds, with support for GPU workloads, Kubernetes orchestration, and multi-site federation.$q$, $q$It is maintained by OpenNebula Systems and offers both a Community edition and paid Enterprise Subscriptions, along with integrated Ubuntu Pro, RHEL, or SUSE subscription options.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', $q$who-its-for$q$, $q$Who OpenNebula is for$q$, 2, ARRAY[$q$OpenNebula suits organizations that want to run their own private or edge cloud infrastructure rather than paying for proprietary virtualization licenses or public cloud services.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c70b2f9-cb51-44ec-8e77-31eb4d5e2d54', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── OpenStack ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$OpenStack is a free, Apache 2.0-licensed open-source platform for managing large pools of compute, storage, and networking across clouds.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OpenStack: free, open-source Apache 2.0 platform for managing compute, storage, and networking at scale, governed by the OpenInfra Foundation.$q$,
  og_description = $q$OpenStack: free, open-source Apache 2.0 platform for managing compute, storage, and networking at scale, governed by the OpenInfra Foundation.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8739782d-56c1-4efc-a3ac-3d0c9d531296';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8739782d-56c1-4efc-a3ac-3d0c9d531296' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$Compute, bare-metal, and container management$q$, $q$Manage virtual machines, bare metal, and containers through a common set of services.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$Orchestration and fault management$q$, $q$Automates orchestration, fault handling, and service management for cloud infrastructure.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$High availability$q$, $q$Provides HA support for applications running on OpenStack.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$API and dashboard control$q$, $q$Resources can be managed via APIs or a web dashboard.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$Multi-deployment support$q$, $q$Supports on-premises, public cloud, and edge computing deployments.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$Fully open source under the Apache 2.0 license with no licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$Governed by the vendor-neutral OpenInfra Foundation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$Proven at large scale (Walmart runs 170,000+ cores; China Mobile runs 50,000+ servers)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$Powers 180+ public cloud data centers$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$Manages 40+ million cores globally across the OpenStack community$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$No official managed or paid tier from the project itself$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$Commercial support must be sourced from third-party distributions$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$Complex to deploy and operate at scale$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$Is OpenStack free?$q$, $q$Yes, OpenStack is open source under the Apache 2.0 license with no licensing fees.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$Who governs OpenStack?$q$, $q$It is a top-level project of the OpenInfra Foundation.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$How widely is OpenStack used?$q$, $q$It powers 180+ public cloud data centers and manages 40+ million cores globally, per the OpenStack Foundation.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$What can OpenStack manage?$q$, $q$Virtual machines, bare metal, and containers, along with orchestration and fault management.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$Public cloud infrastructure$q$, $q$Operate large-scale public cloud data centers.$q$, $q$Cloud providers and telecoms$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$Private enterprise cloud$q$, $q$Run internal compute, storage, and networking infrastructure at scale.$q$, $q$Large enterprises$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$overview$q$, $q$What is OpenStack?$q$, 2, ARRAY[$q$OpenStack is an open-source cloud infrastructure platform that provides common services for managing large pools of compute, storage, and networking resources through APIs or a dashboard.$q$, $q$It is licensed under Apache 2.0, developed by the open-source community, and governed by the OpenInfra Foundation. It powers 180+ public cloud data centers and is used by organizations including Walmart and China Mobile.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', $q$who-its-for$q$, $q$Who OpenStack is for$q$, 2, ARRAY[$q$OpenStack is aimed at cloud providers, telecoms, and large enterprises that need to operate their own compute, storage, and networking infrastructure at scale without relying on a single vendor.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8739782d-56c1-4efc-a3ac-3d0c9d531296', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Harvester ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Harvester is a free, open-source hyperconverged infrastructure platform for running VMs and cloud-native workloads on bare metal, built by SUSE/Rancher.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Harvester: free, open-source hyperconverged infrastructure for running VMs and cloud-native workloads on bare metal, from SUSE/Rancher.$q$,
  og_description = $q$Harvester: free, open-source hyperconverged infrastructure for running VMs and cloud-native workloads on bare metal, from SUSE/Rancher.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a9e58a83-376b-4e93-b8f6-d707024da382';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a9e58a83-376b-4e93-b8f6-d707024da382' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$Unified VM and container management$q$, $q$A single pane of glass for both virtualization and cloud-native workload management.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$Kubernetes-in-VM support$q$, $q$Runs Kubernetes inside VMs alongside containerized workloads on the same bare-metal cluster.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$Built on proven open-source components$q$, $q$Uses Linux, KVM, Kubernetes, KubeVirt, and Longhorn instead of proprietary technology.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$Rancher ecosystem integration$q$, $q$Works alongside Rancher, Elemental, and Fleet.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$100% open source and free with no licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$Built entirely on established open-source components (KVM, KubeVirt, Longhorn)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$Maintained by SUSE/Rancher$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$Suited for both datacenter and edge deployments$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$Requires bare-metal hardware and infrastructure expertise to deploy$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$Smaller ecosystem than mature commercial hypervisors like VMware$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$Enterprise support terms are not detailed on the homepage$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$Is Harvester free?$q$, $q$Yes, it is 100% open source and free to download and deploy with no licensing fees.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$Who maintains Harvester?$q$, $q$SUSE/Rancher maintains Harvester as part of its broader Rancher ecosystem.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$What does Harvester run on?$q$, $q$Bare-metal servers, combining virtualization and cloud-native workload management.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$What technologies is Harvester built on?$q$, $q$Linux, KVM, Kubernetes, KubeVirt, and Longhorn.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$Modernizing VM workloads$q$, $q$Run existing VMs alongside new containerized applications on the same infrastructure.$q$, $q$Platform and infrastructure teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$Edge computing$q$, $q$Deploy hyperconverged infrastructure at edge locations without proprietary licensing costs.$q$, $q$Organizations running distributed edge sites$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$Harvester$q$, $q$Free$q$, NULL, $q$["Open-source HCI platform","No licensing fees"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$overview$q$, $q$What is Harvester?$q$, 2, ARRAY[$q$Harvester is an open-source hyperconverged infrastructure (HCI) solution that manages both virtualization and cloud-native workloads on bare-metal servers from a single pane of glass.$q$, $q$It is built on mature open-source components including Linux, KVM, Kubernetes, KubeVirt, and Longhorn, and is maintained by SUSE/Rancher as part of the broader Rancher ecosystem.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', $q$who-its-for$q$, $q$Who Harvester is for$q$, 2, ARRAY[$q$Harvester is aimed at infrastructure teams that want to run VM-based and cloud-native workloads on the same bare-metal hardware without paying for proprietary HCI licensing.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a9e58a83-376b-4e93-b8f6-d707024da382', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── KubeVirt ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$KubeVirt is an open-source, CNCF-hosted project that adds a virtualization API to Kubernetes, letting teams run VMs alongside containers.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$KubeVirt: free, open-source CNCF project adding a virtualization API to Kubernetes to run VMs alongside containerized workloads.$q$,
  og_description = $q$KubeVirt: free, open-source CNCF project adding a virtualization API to Kubernetes to run VMs alongside containerized workloads.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '66cb57df-a72f-4b48-8e7c-dd2074ba5b6e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '66cb57df-a72f-4b48-8e7c-dd2074ba5b6e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$Virtualization API for Kubernetes$q$, $q$Manage virtual machines using native Kubernetes APIs and tooling.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$Run VMs alongside containers$q$, $q$Combine containerized applications and VM-based workloads on the same cluster.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$Gradual modernization support$q$, $q$Decompose virtualized workloads into microservices over time instead of an all-at-once migration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$Multiple quickstart paths$q$, $q$Getting-started guides for MiniKube, Kind, Killercoda, and cloud providers.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$CNCF-hosted incubating project with community governance$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$Lets teams keep hard-to-containerize VM workloads on Kubernetes$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$Multiple quickstart options for testing before production use$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$Listed as an incubating (not yet graduated) CNCF project$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$Requires an existing Kubernetes cluster to run$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$Aimed primarily at infrastructure/platform teams rather than end users$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$Is KubeVirt free?$q$, $q$Yes, it is an open-source project with no license fees.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$Who governs KubeVirt?$q$, $q$It is hosted by the Cloud Native Computing Foundation (CNCF) as an incubating project.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$What problem does KubeVirt solve?$q$, $q$It lets teams run VM-based workloads that can't easily be containerized alongside containers on Kubernetes.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$How do I try KubeVirt?$q$, $q$The project provides quickstarts for MiniKube, Kind, Killercoda, and cloud providers.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$Running legacy VMs on Kubernetes$q$, $q$Keep VM-based applications running on the same platform as new containerized services.$q$, $q$Platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$Gradual application modernization$q$, $q$Decompose virtualized workloads into microservices incrementally.$q$, $q$Teams migrating off traditional virtualization$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$overview$q$, $q$What is KubeVirt?$q$, 2, ARRAY[$q$KubeVirt is an open-source project that provides a virtualization API for Kubernetes, letting organizations manage both containerized applications and virtual machines within a unified platform.$q$, $q$It is hosted by the Cloud Native Computing Foundation (CNCF) as an incubating project and is aimed at teams with existing VM-based workloads that cannot be easily containerized.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', $q$who-its-for$q$, $q$Who KubeVirt is for$q$, 2, ARRAY[$q$KubeVirt suits organizations adopting Kubernetes that still need to run VM-based infrastructure, or teams gradually modernizing legacy virtualized applications into microservices.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('66cb57df-a72f-4b48-8e7c-dd2074ba5b6e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Nomad ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Nomad is HashiCorp's scheduler and orchestrator for deploying containers and non-containerized applications across cloud and on-prem environments.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Nomad by HashiCorp: scheduler and orchestrator for containers, binaries, and batch jobs across cloud and on-prem infrastructure.$q$,
  og_description = $q$Nomad by HashiCorp: scheduler and orchestrator for containers, binaries, and batch jobs across cloud and on-prem infrastructure.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd651e30f-02b4-4774-b024-a6a3d9d377ee';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd651e30f-02b4-4774-b024-a6a3d9d377ee' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$Hybrid job scheduling$q$, $q$Orchestrate, deploy, and manage containers, binaries, and batch jobs across on-prem and cloud environments.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$Non-containerized workload support$q$, $q$Runs containerized and non-containerized applications from the same scheduler.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$Task driver extensibility$q$, $q$Supports multiple task drivers for different workload types.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$Advanced scheduling$q$, $q$Includes affinities and preemption for fine-grained placement control.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$HashiCorp ecosystem integration$q$, $q$Integrates with Consul for service discovery and Vault for secrets management.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$Enterprise governance$q$, $q$Enterprise edition adds access controls and governance policies.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$Works with both containers and non-containerized applications$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$Integrates natively with Consul and Vault$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$Flexible, extensible task-driver model$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$Supports hybrid on-prem and cloud deployment$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$Enterprise tier pricing is not publicly listed (quote-based)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$Advanced governance features are gated behind the Enterprise edition$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$Smaller ecosystem and community than Kubernetes$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$Is Nomad free?$q$, $q$An open-source/Community edition is available; HashiCorp also offers a paid Enterprise edition with additional governance features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$What does Nomad orchestrate?$q$, $q$Containers, binaries, and batch jobs across cloud and on-premises infrastructure.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$Does Nomad integrate with other HashiCorp tools?$q$, $q$Yes, it integrates with Consul for service discovery and Vault for secrets management.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$What does the Enterprise edition add?$q$, $q$Additional access controls and governance policies, per HashiCorp's documentation.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$Hybrid workload orchestration$q$, $q$Schedule containers and non-containerized apps across on-prem and cloud environments from one tool.$q$, $q$Platform and infrastructure teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$Batch job scheduling$q$, $q$Run batch and binary workloads without requiring full containerization.$q$, $q$Teams with mixed containerized/legacy workloads$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$overview$q$, $q$What is Nomad?$q$, 2, ARRAY[$q$Nomad is HashiCorp's scheduler and orchestrator for deploying and managing containers, binaries, and batch jobs across on-prem and cloud environments at scale.$q$, $q$It integrates with Consul for service discovery and Vault for secrets management, and is available as an open-source/Community edition alongside a paid Enterprise edition with added governance features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', $q$who-its-for$q$, $q$Who Nomad is for$q$, 2, ARRAY[$q$Nomad suits infrastructure teams that need to orchestrate a mix of containerized and non-containerized workloads across hybrid on-prem and cloud environments.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d651e30f-02b4-4774-b024-a6a3d9d377ee', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── HashiCorp Consul ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Consul is HashiCorp's service networking platform providing service discovery, service mesh, and secure service-to-service communication.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$HashiCorp Consul: service discovery, service mesh, and secure network connectivity across on-prem, hybrid, and multi-cloud environments.$q$,
  og_description = $q$HashiCorp Consul: service discovery, service mesh, and secure network connectivity across on-prem, hybrid, and multi-cloud environments.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd5b8da39-746d-47c9-a6e2-4ce6ea00b2a0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd5b8da39-746d-47c9-a6e2-4ce6ea00b2a0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$Service discovery$q$, $q$Service registration and discovery through a central catalog.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$Service mesh$q$, $q$Sidecar proxies and gateways implement a full service mesh.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$L7 traffic management$q$, $q$Application-layer traffic control across services.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$Security enforcement$q$, $q$Intentions and access controls govern which services can communicate.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$Observability$q$, $q$Metrics, logs, and distributed tracing for service traffic.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$Multi-tenancy$q$, $q$Admin partitions and namespaces isolate tenants.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$Works across on-prem, hybrid, and multi-cloud environments$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$Supports both VM and Kubernetes runtimes$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$Built-in service mesh and traffic management$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$Managed HCP Consul option available$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$Enterprise pricing is not publicly listed (quote-based)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$Service mesh adds operational complexity$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$Full feature set is split across Community and Enterprise editions$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$Is Consul free?$q$, $q$Consul has a Community edition; Enterprise and a managed HCP Consul option are also available.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$What does Consul do?$q$, $q$Provides service discovery, service mesh, and secure network connectivity between services.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$Does Consul work with Kubernetes?$q$, $q$Yes, it supports both virtual machine and Kubernetes runtimes.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$What is HCP Consul?$q$, $q$HashiCorp's managed cloud version of Consul.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$Multi-cloud service networking$q$, $q$Connect services securely across on-prem, hybrid, and multi-cloud environments.$q$, $q$Platform and network engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$Kubernetes service mesh$q$, $q$Add service mesh traffic management and security to Kubernetes workloads.$q$, $q$Teams running microservices on Kubernetes$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$overview$q$, $q$What is HashiCorp Consul?$q$, 2, ARRAY[$q$Consul is a service networking solution that enables teams to manage secure network connectivity between services across on-prem, hybrid cloud, and multi-cloud environments and runtimes.$q$, $q$It combines service discovery, a service mesh with sidecar proxies and gateways, L7 traffic management, and security enforcement through intentions and access controls, and is available as Community, Enterprise, and managed HCP Consul editions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', $q$who-its-for$q$, $q$Who Consul is for$q$, 2, ARRAY[$q$Consul is built for platform and network teams that need service discovery and secure service-to-service communication across VM and Kubernetes environments spanning multiple clouds.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5b8da39-746d-47c9-a6e2-4ce6ea00b2a0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Boundary ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Boundary is HashiCorp's identity-based access management tool for securely accessing infrastructure without exposing credentials or networks.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$HashiCorp Boundary: identity-based, secure remote access to infrastructure without exposing networks or sharing credentials.$q$,
  og_description = $q$HashiCorp Boundary: identity-based, secure remote access to infrastructure without exposing networks or sharing credentials.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'af04c60a-0edd-428f-9f5c-f88f9ad98f64';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'af04c60a-0edd-428f-9f5c-f88f9ad98f64' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$Identity-based access$q$, $q$Enable privileged sessions for users and applications based on identity and role.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$Automated service discovery$q$, $q$Automates onboarding of infrastructure resources as hosts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$Terraform provider support$q$, $q$Define access policies and configuration as code with the full Terraform provider.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$Session auditing$q$, $q$Visibility into session metrics, events, logs, and traces, with export to monitoring tools.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$SSH credential injection$q$, $q$Injects SSH credentials for sessions instead of exposing them to end users.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$Identity-based access removes the need for VPNs or shared credentials$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$Integrates with Terraform for infrastructure-as-code policy management$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$Session auditing with export to monitoring tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$Both self-managed Community and managed HCP Boundary options available$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$HCP Boundary pricing beyond the free trial is not published on the site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$Requires integration work with existing identity providers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$Fewer built-in integrations than more established PAM tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$Is Boundary free?$q$, $q$A self-managed Community edition is available; HCP Boundary (managed) offers a free trial.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$What problem does Boundary solve?$q$, $q$Secure, identity-based remote access to infrastructure without exposing networks or sharing credentials.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$Does Boundary integrate with Terraform?$q$, $q$Yes, it has full Terraform provider support for policies and configuration.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$What is HCP Boundary?$q$, $q$HashiCorp's managed cloud offering for Boundary, available with a free trial.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$Privileged remote access$q$, $q$Grant identity-based, time-limited access to servers and databases without VPNs.$q$, $q$Security and infrastructure teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$Session auditing and compliance$q$, $q$Track and export session logs and metrics for audit and compliance needs.$q$, $q$Security-conscious organizations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$overview$q$, $q$What is Boundary?$q$, 2, ARRAY[$q$Boundary is HashiCorp's identity-based access management tool that enables users and applications to securely access infrastructure based on identity and role, rather than network location.$q$, $q$It offers automated service discovery, Terraform provider support for policy as code, and session auditing, and is available as a self-managed Community edition or as managed HCP Boundary with a free trial.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', $q$who-its-for$q$, $q$Who Boundary is for$q$, 2, ARRAY[$q$Boundary is aimed at security and infrastructure teams that need to grant privileged, auditable access to servers and systems without relying on VPNs or shared credentials.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af04c60a-0edd-428f-9f5c-f88f9ad98f64', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Authelia ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Authelia is an open-source authentication and authorization server providing SSO and multi-factor authentication for self-hosted apps via a reverse proxy.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Authelia: free, open-source SSO and multi-factor authentication server that pairs with a reverse proxy to secure self-hosted apps.$q$,
  og_description = $q$Authelia: free, open-source SSO and multi-factor authentication server that pairs with a reverse proxy to secure self-hosted apps.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '82f44b81-1616-4e4f-99ec-891f86393804';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '82f44b81-1616-4e4f-99ec-891f86393804' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Multi-factor authentication and SSO$q$, $q$Centralized authentication portal supporting single sign-on across web applications.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Modern authentication methods$q$, $q$Supports Passkeys, one-time passwords, mobile push notifications, and WebAuthn.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Login regulation$q$, $q$Brute-force prevention through login rate regulation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Granular authorization policies$q$, $q$Fine-grained access control policies for users and groups.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$OpenID Connect 1.0 provider$q$, $q$Operates as an OpenID Certified provider for standards-based SSO.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Lightweight footprint$q$, $q$Container image under 20MB with typical memory usage under 30MB.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Kubernetes support$q$, $q$Deployable for high availability on Kubernetes.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Free and open source under the Apache 2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Very lightweight (container image under 20MB)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Fast performance, with ~100ms portal load and millisecond-level authorization$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$OpenID Certified provider$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Supports modern auth methods like Passkeys and WebAuthn$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Requires a reverse proxy to function; not a standalone application$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Self-hosted setup and configuration required$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Relies on community contributions/donations to fund continued security audits$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Is Authelia free?$q$, $q$Yes, it is open source under the Apache 2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$What authentication methods does Authelia support?$q$, $q$Passkeys, one-time passwords, mobile push notifications, and WebAuthn.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Does Authelia work standalone?$q$, $q$No, it is designed as a companion to a reverse proxy.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Is Authelia OpenID certified?$q$, $q$Yes, it operates as an OpenID Certified provider.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$How lightweight is Authelia?$q$, $q$The container image is under 20MB and typically uses under 30MB of memory.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Securing self-hosted apps$q$, $q$Add SSO and MFA in front of self-hosted web applications via a reverse proxy.$q$, $q$Homelab and self-hosting users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Enterprise-style access control$q$, $q$Apply granular, group-based authorization policies to internal web apps.$q$, $q$Small teams and organizations running internal tools$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Authelia$q$, $q$Free$q$, NULL, $q$["Open-source authentication and authorization server","SSO and MFA","OpenID Connect 1.0 provider"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$overview$q$, $q$What is Authelia?$q$, 2, ARRAY[$q$Authelia is an open-source authentication and authorization server and portal that adds multi-factor authentication and single sign-on to web applications through a companion reverse proxy.$q$, $q$It supports Passkeys, one-time passwords, mobile push, and WebAuthn, operates as an OpenID Certified provider, and is designed to be lightweight, with a container image under 20MB.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$who-its-for$q$, $q$Who Authelia is for$q$, 2, ARRAY[$q$Authelia is built for self-hosters and teams who run their own web applications behind a reverse proxy and want centralized SSO and MFA without relying on a third-party identity provider.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Permify ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Permify is an open-source, Zanzibar-inspired authorization service for building fine-grained RBAC, ABAC, and ReBAC access control.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Permify: open-source, Zanzibar-inspired authorization service with RBAC, ABAC, and ReBAC support for developers, self-hosted or cloud.$q$,
  og_description = $q$Permify: open-source, Zanzibar-inspired authorization service with RBAC, ABAC, and ReBAC support for developers, self-hosted or cloud.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b95ba4cb-96d7-4478-9722-2807aa591486';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b95ba4cb-96d7-4478-9722-2807aa591486' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Centralized authorization engine$q$, $q$Abstracts permission logic out of individual applications into a single service, based on the relationship-modeling approach of Google's Zanzibar paper.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Multiple access control models$q$, $q$Supports role-based (RBAC), attribute-based (ABAC), and relationship-based (ReBAC) access control within one schema language.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Fast access checks$q$, $q$Permify's documentation reports access-check response times as fast as 10ms for permission evaluation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Multi-tenant support$q$, $q$Isolated authorization logic can be configured per tenant within a single Permify deployment.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Self-hosted or managed cloud$q$, $q$Runs as a self-hosted, AGPL-3.0 licensed service, or as Permify Cloud, a managed offering with SOC2 and GDPR compliance across AWS, GCP, and Azure.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Schema-as-code modeling$q$, $q$Authorization rules are defined in a dedicated schema language that can be version-controlled alongside application code.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Open source under AGPL-3.0 with a fully self-hostable Community edition$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Modeled on Google's Zanzibar authorization approach used for large-scale systems$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Supports RBAC, ABAC, and ReBAC in a single unified engine$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Backed by FusionAuth following its November 2025 acquisition, which committed to keeping Permify open source$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Managed Permify Cloud option available for teams that don't want to self-host$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Now part of FusionAuth's product family, with a unified pricing model planned for 2026 that may change today's standalone offering$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Managed Permify Cloud pricing is not publicly listed and requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Requires learning Permify's own schema language to model authorization logic$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Best suited to teams already comfortable running a dedicated authorization microservice$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Is Permify free to use?$q$, $q$Yes. Permify's core authorization engine is open source under the AGPL-3.0 license and can be self-hosted for free. A paid, managed Permify Cloud offering is also available.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Who maintains Permify?$q$, $q$Permify was acquired by FusionAuth in November 2025. FusionAuth has stated Permify remains open source and continues to be developed as a standalone authorization engine.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$What authorization models does Permify support?$q$, $q$Permify supports role-based access control (RBAC), attribute-based access control (ABAC), and relationship-based access control (ReBAC) within a single schema.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Can Permify run in the cloud?$q$, $q$Yes. Permify Cloud is a managed hosting option with SOC2 and GDPR compliance, available across AWS, GCP, and Azure regions.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Fine-grained permissions for SaaS applications$q$, $q$Teams building multi-tenant SaaS products use Permify to centralize resource-level and role-based permission checks instead of hardcoding authorization logic into each service.$q$, $q$SaaS engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Replacing ad hoc authorization code$q$, $q$Organizations migrating away from scattered if/else permission checks adopt Permify's schema language to define, test, and audit access rules in one place.$q$, $q$Platform and backend engineers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Community (Self-Hosted)$q$, $q$Free$q$, NULL, $q$["Open source under AGPL-3.0","Full self-hosted deployment","RBAC, ABAC, and ReBAC support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$Permify Cloud$q$, $q$Custom (usage-based)$q$, NULL, $q$["Managed hosting on AWS, GCP, or Azure","SOC2 and GDPR compliance","Premium support"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$overview$q$, $q$What is Permify?$q$, 2, ARRAY[$q$Permify is an open-source authorization-as-a-service platform that helps developers build and manage fine-grained, scalable access control systems, inspired by Google's Zanzibar authorization model.$q$, $q$It stores permission data as structured relationships and exposes a check API for evaluating access decisions, supporting RBAC, ABAC, and ReBAC models in one schema. Permify was acquired by FusionAuth in November 2025 and remains open source under AGPL-3.0.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', $q$who-its-for$q$, $q$Who Permify is for$q$, 2, ARRAY[$q$Permify suits engineering teams that need centralized, auditable authorization across multiple applications or services rather than reimplementing permission logic in each codebase.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b95ba4cb-96d7-4478-9722-2807aa591486', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Casbin ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Apache Casbin is an open-source access control library supporting multiple authorization models across 15+ programming languages.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Apache Casbin: open-source access control library for RBAC, ABAC, and other authorization models, available in 15+ languages.$q$,
  og_description = $q$Apache Casbin: open-source access control library for RBAC, ABAC, and other authorization models, available in 15+ languages.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '05c2f6b8-9698-410f-a6a2-b3cdf7f98777';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '05c2f6b8-9698-410f-a6a2-b3cdf7f98777' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$Hybrid access control models$q$, $q$Uses PERM metamodel .conf policy files to configure RBAC, ABAC, ACL, and other access control models declaratively.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$Multi-language implementations$q$, $q$Provides libraries for Go, Java, C/C++, Node.js, PHP, Python, .NET, Rust, Ruby, Swift, Lua, Dart, and more.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$Pluggable policy storage$q$, $q$Policies can be stored in MySQL, Postgres, Oracle, MongoDB, Redis, Cassandra, AWS S3, and other adapters.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$Filtered policy loading$q$, $q$Supports loading a subset of policy rules for large-scale deployments with many policies.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$Role manager integrations$q$, $q$Role hierarchies can be synced with external identity providers such as LDAP, Okta, Auth0, and Azure AD.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$Online policy editor$q$, $q$An interactive editor lets developers test and debug authorization models and policies in the browser.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$Fully open source under the Apache License 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$Available in 15+ programming languages with consistent APIs$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$Supports many storage backends via a pluggable adapter system$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$Used in production by large organizations including Intel, VMware, Cisco, and Alibaba, per the project site$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$Undergoing incubation at the Apache Software Foundation, indicating formal governance$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$Apache Casbin is still labeled '(Incubating)' at the ASF, meaning governance and infrastructure are not yet fully finalized$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$No official hosted or managed offering; teams must integrate and operate it themselves$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$Policy modeling with the PERM metamodel has a learning curve for teams new to declarative authorization config$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$Is Casbin free to use?$q$, $q$Yes. Casbin is a fully open-source library licensed under Apache License 2.0, with no paid tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$What programming languages does Casbin support?$q$, $q$Casbin has implementations in Golang, Java, C/C++, Node.js, JavaScript, PHP, Python, .NET (C#), Rust, Ruby, Swift, Lua, Dart, Elixir, and more.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$What access control models does Casbin support?$q$, $q$Casbin supports ACL, RBAC, ABAC, and other hybrid access control models defined through its PERM metamodel configuration files.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$Where can Casbin policies be stored?$q$, $q$Casbin supports pluggable storage adapters including MySQL, Postgres, Oracle, MongoDB, Redis, Cassandra, and AWS S3.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$Adding authorization to a new service$q$, $q$Developers embed the Casbin library directly into an application to enforce RBAC or ABAC policies without building an authorization system from scratch.$q$, $q$Backend developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$Standardizing access control across microservices$q$, $q$Teams use Casbin's consistent multi-language APIs to apply the same authorization model across services written in different languages.$q$, $q$Platform engineering teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$overview$q$, $q$What is Casbin?$q$, 2, ARRAY[$q$Apache Casbin is an open-source access control library that supports multiple authorization models, including ACL, RBAC, and ABAC, through a declarative PERM metamodel configuration.$q$, $q$It is implemented across more than a dozen programming languages and can persist policies in a range of databases via pluggable adapters. The project is currently undergoing incubation at the Apache Software Foundation.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', $q$who-its-for$q$, $q$Who Casbin is for$q$, 2, ARRAY[$q$Casbin is aimed at developers who need to embed flexible, model-driven authorization directly into an application or service rather than relying on an external authorization API.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05c2f6b8-9698-410f-a6a2-b3cdf7f98777', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Open Policy Agent ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open Policy Agent (OPA) is a CNCF-graduated, open-source policy engine for enforcing policy-as-code across cloud-native infrastructure.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Open Policy Agent (OPA): CNCF-graduated, open-source Rego policy engine for authorization, compliance, and Kubernetes admission control.$q$,
  og_description = $q$Open Policy Agent (OPA): CNCF-graduated, open-source Rego policy engine for authorization, compliance, and Kubernetes admission control.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c1a8c047-6445-4dbd-ae16-412f8a2807f2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c1a8c047-6445-4dbd-ae16-412f8a2807f2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$Rego policy language$q$, $q$Policies are written in Rego, a declarative language purpose-built for expressing rules over structured data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$Decoupled policy enforcement$q$, $q$Separates policy decision-making from application code, letting teams update authorization or compliance rules without redeploying services.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$Kubernetes admission control$q$, $q$OPA Gatekeeper, a related CNCF project, enforces Rego policies as Kubernetes admission controllers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$Configuration testing$q$, $q$Conftest, a companion tool in the OPA ecosystem, tests configuration files such as Kubernetes manifests and Terraform plans against Rego policies.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$Interactive policy playground$q$, $q$The OPA website provides a 'Play' environment for writing and testing Rego policies directly in the browser.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$Fully open source under the Apache License 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$Graduated CNCF project (graduated January 2021), indicating mature governance and broad adoption$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$Used by large enterprises including Atlassian, Bloomberg, Capital One, Cisco, Goldman Sachs, and Pinterest, per the project site$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$General-purpose engine that applies to authorization, Kubernetes policy, CI/CD, and infrastructure-as-code checks$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$Active ecosystem of companion tools (Gatekeeper, Conftest, Regal)$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$Rego is a domain-specific language with its own learning curve distinct from general-purpose programming languages$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$No official managed cloud offering directly from the OPA project; commercial support is available through third parties such as Styra$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$Requires operational work to deploy, scale, and keep policy bundles in sync across environments$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$Is Open Policy Agent free?$q$, $q$Yes. OPA is fully open source under the Apache License 2.0 with no paid tier from the project itself.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$What is Rego?$q$, $q$Rego is the declarative policy language used to write OPA policies, designed for expressing rules over structured data such as JSON.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$Is OPA a CNCF project?$q$, $q$Yes. OPA was accepted into the CNCF in March 2018 and reached Graduated maturity status in January 2021.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$Can OPA enforce policy in Kubernetes?$q$, $q$Yes, via OPA Gatekeeper, a related project that runs OPA policies as Kubernetes admission controllers.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$Kubernetes admission control$q$, $q$Platform teams use OPA Gatekeeper to enforce policies on Kubernetes resources at admission time, blocking non-compliant deployments.$q$, $q$Platform and DevOps engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$Application-level authorization$q$, $q$Engineering teams call OPA as a policy decision point to centralize authorization logic across microservices, decoupling it from application code.$q$, $q$Backend and security engineers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$overview$q$, $q$What is Open Policy Agent?$q$, 2, ARRAY[$q$Open Policy Agent (OPA) is an open-source, general-purpose policy engine that lets organizations define, manage, and enforce policies as code using the Rego language.$q$, $q$OPA is a graduated project of the Cloud Native Computing Foundation and is used to enforce policy across microservices, Kubernetes, CI/CD pipelines, and API gateways.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', $q$who-its-for$q$, $q$Who Open Policy Agent is for$q$, 2, ARRAY[$q$OPA is built for platform, security, and DevOps teams that need a unified, code-based way to enforce authorization and compliance policies across heterogeneous infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c1a8c047-6445-4dbd-ae16-412f8a2807f2', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Conjur ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Conjur Open Source is CyberArk's secrets management and machine-identity platform for securing credentials in cloud-native environments.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Conjur Open Source: CyberArk's secrets management and RBAC engine for securing machine identities and credentials in DevOps pipelines.$q$,
  og_description = $q$Conjur Open Source: CyberArk's secrets management and RBAC engine for securing machine identities and credentials in DevOps pipelines.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0b888188-3d57-4941-b06a-2c4600263666';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0b888188-3d57-4941-b06a-2c4600263666' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$Centralized secret store$q$, $q$Provides a REST-based secret store with a role-based access control engine, defined using its Machine Authorization Markup Language (MAML).$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$Machine identity authentication$q$, $q$Includes built-in authenticators for Kubernetes, OpenShift, AWS IAM, and OIDC to let workloads fetch secrets without static credentials.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$Secretless Broker$q$, $q$Lets applications connect to backend services without ever fetching or managing passwords and keys directly.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$DevOps toolchain integrations$q$, $q$Integrates with Ansible, Jenkins, Puppet, and Terraform, as well as CI/CD and container orchestration platforms.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$Multi-language client SDKs$q$, $q$Official client libraries are available for .NET, Go, Java, Python, and Ruby.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$Conjur server is licensed under GNU LGPL v3.0, with client libraries under Apache License 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$Actively maintained on GitHub, with releases as recent as mid-2026 and over 900 GitHub stars$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$Built-in authenticators cover major cloud and container platforms (Kubernetes, OpenShift, AWS IAM, OIDC)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$Backed by CyberArk, an established identity security vendor, with commercial licenses and support available$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$CyberArk was acquired by Palo Alto Networks, and the conjur.org marketing domain now redirects to Palo Alto Networks' secrets management product page, which can make it harder to find dedicated Conjur Open Source resources$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$The full-featured enterprise edition and commercial support require a paid CyberArk/Palo Alto Networks license$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$Configuration uses a proprietary policy language (MAML) rather than a more widely known format$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$Is Conjur open source?$q$, $q$Yes. The Conjur server is licensed under GNU LGPL v3.0 and client libraries under Apache License 2.0. Commercial licenses are also available from CyberArk.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$What does Conjur do?$q$, $q$Conjur is a secrets management and machine-identity platform that stores secrets, authenticates workloads, and enforces role-based access to credentials.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$Which platforms can authenticate to Conjur?$q$, $q$Conjur includes built-in authenticators for Kubernetes, OpenShift, AWS IAM, and OIDC, among others.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$Who maintains Conjur today?$q$, $q$Conjur is maintained by CyberArk, which was acquired by Palo Alto Networks; the open-source project remains actively developed on GitHub.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$Securing Kubernetes workload secrets$q$, $q$Platform teams use Conjur's Kubernetes authenticator to let pods retrieve secrets dynamically instead of storing credentials in manifests or environment variables.$q$, $q$Platform and DevOps engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$CI/CD pipeline credential management$q$, $q$Organizations integrate Conjur with Jenkins, Ansible, or Terraform so pipelines fetch secrets at runtime rather than hardcoding them.$q$, $q$DevOps and security engineers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$Conjur Open Source$q$, $q$Free$q$, NULL, $q$["Secret store and RBAC engine","Kubernetes, OpenShift, AWS IAM, OIDC authenticators","Secretless Broker","Community Discourse support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$CyberArk Commercial License$q$, $q$Custom$q$, NULL, $q$["Enterprise support","Additional enterprise features","Commercial license terms"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$overview$q$, $q$What is Conjur?$q$, 2, ARRAY[$q$Conjur is a secrets management and application-identity platform originally built by CyberArk. It provides a centralized secret store, a role-based access policy engine, and authenticators that let machines and CI/CD pipelines retrieve credentials securely.$q$, $q$The Conjur server is open source under GNU LGPL v3.0, with commercial licenses and enterprise support available from CyberArk, now part of Palo Alto Networks following its 2025 acquisition.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', $q$who-its-for$q$, $q$Who Conjur is for$q$, 2, ARRAY[$q$Conjur is built for DevOps and security teams running containerized or cloud-native infrastructure who need to eliminate hardcoded secrets and manage machine identities at scale.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0b888188-3d57-4941-b06a-2c4600263666', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── TheHive ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$TheHive is a collaborative security incident response and case management platform for SOCs, CSIRTs, and CERTs, developed by StrangeBee.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$TheHive: collaborative security case management platform for incident response, with a free Community edition and paid Gold/Platinum tiers.$q$,
  og_description = $q$TheHive: collaborative security case management platform for incident response, with a free Community edition and paid Gold/Platinum tiers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '257eca99-6ff2-4447-96da-fbf120b70160';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '257eca99-6ff2-4447-96da-fbf120b70160' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$Case and alert management$q$, $q$Organizes SOC work around Cases, Tasks, and Observables, letting teams triage alerts and track incident-response activity.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$Observable analysis via Cortex$q$, $q$Integrates with Cortex, StrangeBee's analysis and active-response engine, to automatically enrich and analyze indicators such as IPs, hashes, and URLs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$MISP integration$q$, $q$Connects to MISP threat intelligence servers to import and correlate indicators of compromise directly within cases.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$300+ integrations$q$, $q$StrangeBee's site lists 300+ integrations for pulling alerts from other security tools into TheHive.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$Multiple deployment options$q$, $q$Available as a self-hosted on-premises install, prebuilt cloud images for AWS/Azure, or a fully managed TheHive Cloud Platform SaaS.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$Free Community edition is available for self-hosting, supporting up to 2 users and 1 organization$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$Deep native integration with Cortex and MISP for threat intelligence and observable analysis$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$Used by a large community: StrangeBee cites 3,500+ users across 50+ countries$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$Flexible deployment: self-hosted, cloud images, or managed SaaS$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$Since StrangeBee took over development in 2018, TheHive 4 and 5 no longer accept external code contributions, and TheHive's earlier fully open-source versions (3 and 4) were discontinued and their repositories archived in 2023$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$The free Community edition is capped at 2 users and 1 organization; larger teams need a paid Gold or Platinum license$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$Gold and Platinum plan pricing is not publicly listed and requires contacting StrangeBee$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$Advanced support (business-hours or priority response) is only available on paid tiers$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$Is TheHive free?$q$, $q$TheHive offers a free Community edition limited to 2 users and 1 organization. Paid Gold and Platinum editions remove those limits and add support and enterprise features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$What is Cortex?$q$, $q$Cortex is StrangeBee's companion observable-analysis and active-response engine that TheHive uses to automatically enrich indicators of compromise.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$Who develops TheHive?$q$, $q$TheHive has been developed by StrangeBee since 2018. The current versions (4 and 5) are developed exclusively by StrangeBee's team rather than the open community.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$Can TheHive integrate with MISP?$q$, $q$Yes, TheHive natively integrates with MISP threat intelligence servers to import and correlate indicators.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$SOC alert triage and case management$q$, $q$Security operations centers use TheHive to centralize alerts from multiple sources into cases, assign tasks, and track investigation progress.$q$, $q$SOC analysts$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$Incident response for CSIRTs/CERTs$q$, $q$Incident response teams use TheHive's case and observable model, combined with Cortex analyzers, to investigate and respond to security incidents collaboratively.$q$, $q$CSIRT and CERT teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$Community$q$, $q$Free$q$, NULL, $q$["Up to 2 users, 1 organization","1 Cortex server, 1 MISP server","Community-based support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$Gold$q$, $q$Custom (per user/org)$q$, NULL, $q$["5+ users, up to 5 organizations","Up to 5 Cortex/MISP servers","Custom views, white labeling","Business-hours EU support, 2-business-day response"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$Platinum$q$, $q$Custom (per user/org)$q$, NULL, $q$["5+ users, multiple organizations","Unlimited Cortex/MISP servers","Business-hours EU support via email, chat, and video, 1-business-day response"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$overview$q$, $q$What is TheHive?$q$, 2, ARRAY[$q$TheHive is a collaborative security case management platform used by SOCs, CSIRTs, and CERTs to manage alerts, cases, and incident-response tasks in one place.$q$, $q$It is developed by StrangeBee and integrates tightly with Cortex for observable analysis and MISP for threat intelligence. A free Community edition remains available alongside paid Gold and Platinum plans and a managed cloud platform.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', $q$who-its-for$q$, $q$Who TheHive is for$q$, 2, ARRAY[$q$TheHive is aimed at security operations centers, incident-response teams, and MSSPs that need a structured, collaborative way to manage security cases and investigations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('257eca99-6ff2-4447-96da-fbf120b70160', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── MISP ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$MISP is a free, open-source threat intelligence platform for collecting, correlating, and sharing indicators of compromise among security teams.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$MISP: free, open-source threat intelligence platform for storing, correlating, and sharing IOCs via STIX, OpenIOC, and TAXII.$q$,
  og_description = $q$MISP: free, open-source threat intelligence platform for storing, correlating, and sharing IOCs via STIX, OpenIOC, and TAXII.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$Structured indicator storage$q$, $q$Stores threat indicators in a structured format that enables correlation, automated export for IDS/SIEM systems, and analysis.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$STIX and OpenIOC export$q$, $q$Exports threat data in open standard formats including STIX and OpenIOC for interoperability with other security tools.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$Taxonomies and Galaxy classification$q$, $q$Includes classification systems such as MITRE ATT&CK and Exploit-Kit taxonomies to tag and categorize threat data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$Community sync and sharing$q$, $q$Supports multi-instance synchronization so organizations can share threat intelligence across trusted communities.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$PyMISP API$q$, $q$Provides a REST API and the PyMISP Python library for programmatic access and automation.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$Completely free to use, with the software, data format, and API released under open standards and OSI-approved open source licenses$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$Governed by an interlocked contributor license so no single organization can change MISP's open-source model$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$Large, active community of users creating and maintaining shared threat-intelligence communities$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$Broad interoperability via STIX, OpenIOC, and TAXII export formats$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$Self-hosting and configuring MISP requires security and infrastructure expertise$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$No official managed SaaS hosting from the MISP project itself; commercial hosting/support comes from third parties$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$Effective threat-intel sharing depends on joining or building trusted communities, which takes ongoing effort$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$Is MISP free?$q$, $q$Yes. MISP is free and open source software, with its data format and API also released as open standards.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$What formats does MISP export to?$q$, $q$MISP supports export to STIX, OpenIOC, and other formats, plus TAXII push for automated distribution to IDS or SIEM systems.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$Who uses MISP?$q$, $q$MISP is used by incident analysts, security and ICT professionals, and malware reversers who need structured threat information sharing.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$Can I run my own MISP community?$q$, $q$Yes. MISP supports multi-instance synchronization, allowing organizations to build and operate their own sharing communities.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$Threat intelligence sharing between organizations$q$, $q$Security teams use MISP to share indicators of compromise with trusted partners or sector-specific ISACs through synchronized MISP instances.$q$, $q$Threat intelligence teams and ISACs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$Feeding IOCs into SIEM/IDS$q$, $q$Analysts export structured indicators from MISP in STIX or OpenIOC format to automatically populate detection rules in SIEM and IDS platforms.$q$, $q$SOC and detection engineering teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$overview$q$, $q$What is MISP?$q$, 2, ARRAY[$q$MISP is an open-source threat intelligence platform for collecting, storing, correlating, and sharing indicators related to targeted attacks, financial fraud, and other cyber threats.$q$, $q$It is free to use, with an open data format and API, and is maintained by a large community that operates shared threat-intelligence communities on top of the platform.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', $q$who-its-for$q$, $q$Who MISP is for$q$, 2, ARRAY[$q$MISP is built for incident analysts, security operations teams, and threat intelligence practitioners who need to structure, correlate, and share IOCs across organizations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b56d7d7d-6b4d-47bb-b82f-c7a9036e4a72', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── OpenCTI ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$OpenCTI is an open-source cyber threat intelligence platform by Filigran for structuring, analyzing, and sharing CTI knowledge.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OpenCTI: open-source cyber threat intelligence platform from Filigran, with a free Community edition and paid Enterprise Edition.$q$,
  og_description = $q$OpenCTI: open-source cyber threat intelligence platform from Filigran, with a free Community edition and paid Enterprise Edition.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '51b8b175-b3a3-4820-80ba-3b5c9cb31c4e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '51b8b175-b3a3-4820-80ba-3b5c9cb31c4e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$STIX2-based knowledge graph$q$, $q$Structures threat intelligence as a knowledge graph, letting analysts link threat actors, malware, campaigns, and indicators.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$230+ connectors$q$, $q$Filigran's site cites 230+ one-click connectors for integrating OpenCTI with other tools across the security stack.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$Enterprise Edition add-ons$q$, $q$OpenCTI Enterprise Edition adds professional support and additional capabilities on top of the open-source Community Edition.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$Dashboards and enrichment$q$, $q$Provides dashboards and automated enrichment workflows for turning raw threat data into actionable intelligence.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$Part of the XTM platform$q$, $q$OpenCTI is positioned by Filigran as part of a broader eXtended Threat Management (XTM) product suite.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$OpenCTI Community Edition is fully open source under the Apache License 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$Large connector ecosystem (230+) for integrating with other security tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$Backed by Filigran, a dedicated cybersecurity company, with professional training (Filigran Academy) and support$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$Used by a stated 6,000+ cybersecurity practitioners across individuals, enterprises, and government organizations$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$Enterprise Edition features are governed by a separate, non-open-source license and require a paid subscription$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$Enterprise Edition and SaaS pricing are not publicly listed and require contacting Filigran$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$Running a knowledge-graph-based CTI platform at scale requires infrastructure and analyst expertise$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$Is OpenCTI free?$q$, $q$The OpenCTI Community Edition is free and open source under the Apache License 2.0. A paid OpenCTI Enterprise Edition adds additional features and support.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$Who develops OpenCTI?$q$, $q$OpenCTI is developed by Filigran, a cybersecurity company.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$How many integrations does OpenCTI support?$q$, $q$Filigran's site states OpenCTI offers 230+ one-click connectors to integrate with other security tools.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$What data model does OpenCTI use?$q$, $q$OpenCTI structures threat intelligence using the STIX2 standard within a knowledge graph.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$Centralizing threat intelligence analysis$q$, $q$CTI teams use OpenCTI's knowledge graph to link threat actors, malware, and indicators, turning scattered reports into structured, actionable intelligence.$q$, $q$Threat intelligence analysts$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$Automating intel enrichment via connectors$q$, $q$Security teams use OpenCTI's connector ecosystem to automatically pull and enrich data from feeds, sandboxes, and other tools into a single platform.$q$, $q$SOC and CTI teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Open source under Apache License 2.0","STIX2 knowledge graph","230+ connectors"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$Enterprise Edition$q$, $q$Custom$q$, NULL, $q$["Additional enterprise capabilities","Professional support","Filigran Academy training access"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$overview$q$, $q$What is OpenCTI?$q$, 2, ARRAY[$q$OpenCTI is an open-source cyber threat intelligence platform that organizes threat data as a STIX2-based knowledge graph, helping analysts structure, analyze, and disseminate actionable intelligence.$q$, $q$It is developed by Filigran, which offers a free Apache 2.0-licensed Community Edition alongside a paid Enterprise Edition with additional features and support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', $q$who-its-for$q$, $q$Who OpenCTI is for$q$, 2, ARRAY[$q$OpenCTI is aimed at threat intelligence teams, SOCs, and MSSPs that need to structure and correlate CTI data from many sources rather than tracking it in spreadsheets or disconnected tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('51b8b175-b3a3-4820-80ba-3b5c9cb31c4e', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Velociraptor ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Velociraptor is a free, open-source digital forensics and incident response tool for endpoint monitoring and threat hunting.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Velociraptor: free, open-source DFIR tool for endpoint monitoring, evidence collection, and threat hunting, maintained by Rapid7.$q$,
  og_description = $q$Velociraptor: free, open-source DFIR tool for endpoint monitoring, evidence collection, and threat hunting, maintained by Rapid7.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e37166a1-5273-4465-ae0c-fa12188ba286';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e37166a1-5273-4465-ae0c-fa12188ba286' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$Velociraptor Query Language (VQL)$q$, $q$Investigators write custom VQL queries to build targeted hunts and forensic collections tailored to specific investigations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$Targeted evidence collection$q$, $q$Collects forensic evidence simultaneously across multiple endpoints for incident response.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$Continuous endpoint monitoring$q$, $q$Monitors endpoint events such as logs, file changes, and processes, with centralized, indefinite storage of that event data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$Built-in artifact library$q$, $q$Ships with a library of forensic artifacts that can be used directly or customized for proactive threat hunting.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$Large-scale hunts$q$, $q$Designed to run hunts across large deployments, with reported use against tens of thousands of endpoints in real incident response operations.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$Fully open source under the AGPL license and free to use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$Powerful custom query language (VQL) for building tailored forensic collections and hunts$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$Maintained by Rapid7, which acquired the Velociraptor team in 2021, providing ongoing development resources$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$Scales to large, distributed endpoint fleets for enterprise-wide incident response$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$Rapid7 also integrates Velociraptor into its own commercial InsightIDR/XDR products, which are separate paid offerings from the free open-source tool$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$VQL has a learning curve for analysts unfamiliar with its query syntax$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$Requires self-hosting and operational management; there is no vendor-run SaaS version of the open-source tool itself$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$Is Velociraptor free?$q$, $q$Yes. Velociraptor is open source under the AGPL license and free to use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$Who maintains Velociraptor?$q$, $q$Velociraptor is maintained by Rapid7, which acquired the Velociraptor team in 2021, though the tool remains free and open source.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$What is VQL?$q$, $q$VQL (Velociraptor Query Language) is the query language used to write custom forensic collections and threat-hunting queries in Velociraptor.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$What platforms does Velociraptor support?$q$, $q$Velociraptor is used for endpoint monitoring and forensics across large, distributed fleets of endpoints in incident response operations.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$Enterprise-wide incident response$q$, $q$IR teams deploy Velociraptor across thousands of endpoints to simultaneously collect forensic evidence during active security incidents.$q$, $q$Incident response teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$Proactive threat hunting$q$, $q$Security teams use Velociraptor's built-in artifact library and VQL to hunt for indicators of compromise across the endpoint fleet before an incident is confirmed.$q$, $q$Threat hunters and SOC analysts$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$Open Source$q$, $q$Free$q$, NULL, $q$["AGPL-licensed","Full VQL query engine","Endpoint monitoring and evidence collection"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$overview$q$, $q$What is Velociraptor?$q$, 2, ARRAY[$q$Velociraptor is an open-source digital forensics and incident response (DFIR) tool that gives security teams visibility into endpoints through targeted evidence collection, continuous monitoring, and proactive threat hunting.$q$, $q$It uses its own query language, VQL, to build custom collections and hunts, and is designed to operate across large, distributed endpoint fleets. The project is maintained by Rapid7, which acquired the Velociraptor team in 2021.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', $q$who-its-for$q$, $q$Who Velociraptor is for$q$, 2, ARRAY[$q$Velociraptor is aimed at incident responders and threat hunters who need deep, queryable visibility into endpoint activity across large organizations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e37166a1-5273-4465-ae0c-fa12188ba286', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── FleetDM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Fleet (FleetDM) is an open-source device management platform built on osquery for managing macOS, Linux, Windows, iOS, and Android.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Fleet (FleetDM): open-source device management platform for macOS, Linux, Windows, iOS, and Android, free and premium tiers.$q$,
  og_description = $q$Fleet (FleetDM): open-source device management platform for macOS, Linux, Windows, iOS, and Android, free and premium tiers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a79e35cf-f4a5-404f-8138-ace452376ebd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a79e35cf-f4a5-404f-8138-ace452376ebd' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Cross-platform device inventory$q$, $q$Manages device inventory across macOS, Linux, Windows, iOS, and Android from a single console.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Real-time device reporting$q$, $q$Fleet's site states devices can report data back in under 30 seconds.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Patch and vulnerability management$q$, $q$Provides software update and patch management alongside vulnerability visibility across managed devices.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Infrastructure as code$q$, $q$Device configuration and policies can be managed as code, and automated via a single REST API.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Cloud or self-hosted deployment$q$, $q$Can be run as a self-hosted open-source deployment or as a hosted cloud service.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Live queries and diagnostics$q$, $q$Supports live reports, scripting, and diagnostics against endpoints, built on the osquery agent.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Free, open-source version is available and stated to always remain free$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Manages a wide range of operating systems (macOS, Linux, Windows, iOS, Android) from one console$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Fleet states it is used by 1,300+ organizations across 90+ countries managing 2,000,000+ devices$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Offers both self-hosted and cloud deployment options$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Single API supports automation and infrastructure-as-code workflows$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Premium tier pricing is not publicly detailed on the marketing site and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Advanced features (beyond the free/open-source tier) require a paid premium license$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Self-hosting requires infrastructure and operational overhead compared to a fully managed MDM$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Is Fleet free?$q$, $q$Fleet maintains a free, open-source version that the company states will always be free, alongside paid premium tiers with additional features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$What operating systems does Fleet manage?$q$, $q$Fleet can manage macOS, Linux, Windows, iOS, and Android devices from a single console.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Can Fleet be self-hosted?$q$, $q$Yes. Fleet can be deployed self-hosted or used as a hosted cloud service.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$How many organizations use Fleet?$q$, $q$Fleet's site states it is used by 1,300+ organizations across 90+ countries, managing over 2,000,000 devices.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Managing heterogeneous device fleets$q$, $q$IT and security teams use Fleet to inventory and manage devices across multiple operating systems, including subsidiaries or acquired companies with mixed environments.$q$, $q$IT and security operations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Patch and vulnerability management at scale$q$, $q$Organizations use Fleet's patch management and reporting to track and remediate vulnerabilities across large device fleets via a single API.$q$, $q$Vulnerability management teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Free$q$, $q$Free$q$, NULL, $q$["Open source","Core device management and inventory","Self-hosted deployment"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$Premium$q$, $q$Custom$q$, NULL, $q$["Additional management and automation features","Cloud or self-hosted deployment","Vendor support"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$overview$q$, $q$What is Fleet (FleetDM)?$q$, 2, ARRAY[$q$Fleet is an open-source device management platform, built on osquery, that provides inventory, patch management, vulnerability visibility, and automation across macOS, Linux, Windows, iOS, and Android devices from a single console.$q$, $q$It offers a free, open-source tier alongside premium plans, and can be deployed self-hosted or as a hosted cloud service.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', $q$who-its-for$q$, $q$Who Fleet is for$q$, 2, ARRAY[$q$Fleet is aimed at IT and security teams managing large, mixed-OS device fleets who want open, API-driven device management rather than a closed proprietary MDM.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a79e35cf-f4a5-404f-8138-ace452376ebd', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── osquery ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$osquery is a free, open-source tool that exposes an operating system as a relational database for SQL-based security monitoring.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$osquery: free, open-source tool that exposes OS state as SQL tables for security monitoring across Linux, macOS, and Windows.$q$,
  og_description = $q$osquery: free, open-source tool that exposes OS state as SQL tables for security monitoring across Linux, macOS, and Windows.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2bf3de07-cc2a-49cd-8239-4d711fd37c68';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2bf3de07-cc2a-49cd-8239-4d711fd37c68' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$SQL-based OS instrumentation$q$, $q$Exposes operating system information such as running processes, network connections, and file hashes as queryable SQL tables.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$100+ built-in tables$q$, $q$Ships with an extensive schema of pre-built tables representing operating system concepts across supported platforms.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$Ad hoc and scheduled queries$q$, $q$Supports interactive querying through the osqueryi shell and continuous scheduled monitoring via the osqueryd daemon.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$Thrift API extensions$q$, $q$Provides Thrift-based APIs for building custom applications and extensions on top of the query engine.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$Cross-platform support$q$, $q$Runs on Linux, macOS, and Windows.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$Free and open source, dual-licensed under Apache License 2.0 and GPL 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$Governed under an open foundation model (the osquery project moved to the Linux Foundation), providing vendor-neutral governance$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$Widely adopted, with 23.4k+ GitHub stars and 2.6k+ forks at the time of research$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$Large, extensible schema (100+ tables) covering processes, network, kernel, and file system data$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$Regular release cadence, with minor releases roughly every two months$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$Requires SQL and systems knowledge to write effective queries and schedules$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$No vendor-run managed service from the osquery project itself; fleet management typically requires a separate tool such as Fleet$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$Deploying and tuning scheduled queries at scale requires ongoing operational effort$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$Is osquery free?$q$, $q$Yes. osquery is free and open source, dual-licensed under Apache License 2.0 and GPL 2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$What platforms does osquery support?$q$, $q$osquery supports Linux, macOS, and Windows.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$How do I query with osquery?$q$, $q$osquery can be queried ad hoc via the osqueryi interactive shell, or scheduled continuously via the osqueryd daemon.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$Who governs the osquery project?$q$, $q$osquery is a community-driven open-source project with GitHub-based issue tracking and a regular release cadence.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$Endpoint security monitoring$q$, $q$Security teams schedule osquery queries to continuously monitor processes, network connections, and file changes across a fleet of endpoints.$q$, $q$SOC and detection engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$Incident response investigation$q$, $q$Responders run ad hoc osquery queries via osqueryi to quickly inspect the state of a compromised or suspicious host.$q$, $q$Incident responders$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Apache 2.0 / GPL 2.0 dual license","100+ built-in tables","osqueryi and osqueryd"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$overview$q$, $q$What is osquery?$q$, 2, ARRAY[$q$osquery is an open-source tool that exposes an operating system's state as a set of relational database tables, letting security and IT teams write SQL queries to explore processes, network connections, file hashes, and other OS data.$q$, $q$It is free to use, dual-licensed under Apache 2.0 and GPL 2.0, and supports Linux, macOS, and Windows. It can be queried interactively or run as a scheduled monitoring daemon.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', $q$who-its-for$q$, $q$Who osquery is for$q$, 2, ARRAY[$q$osquery is aimed at security and IT teams who want a lightweight, SQL-queryable way to monitor endpoint state, often as the underlying agent for a fleet management layer such as Fleet.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2bf3de07-cc2a-49cd-8239-4d711fd37c68', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Suricata ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source network threat detection engine that runs as an IDS, IPS, and network security monitor.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Suricata is a free, open-source IDS/IPS and network security monitoring engine maintained by the nonprofit OISF.$q$,
  og_description = $q$Suricata is a free, open-source IDS/IPS and network security monitoring engine maintained by the nonprofit OISF.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6ee44c6e-b374-4911-ad78-9275dc36fec8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6ee44c6e-b374-4911-ad78-9275dc36fec8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Intrusion detection and prevention$q$, $q$Runs as an IDS that alerts on suspicious traffic or as an inline IPS that can drop traffic in real time, from a single binary.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Network security monitoring$q$, $q$Logs HTTP requests, TLS handshakes, DNS queries, file transfers, and other protocol activity for later analysis.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Multi-threaded engine$q$, $q$Built as a multi-threaded engine designed to scale across modern multi-core hardware for higher-throughput networks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Snort-compatible rule syntax$q$, $q$Uses Snort-style rule syntax, allowing rulesets such as the Emerging Threats Open ruleset to work without modification.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Community and vendor embedding$q$, $q$Used directly by organizations and embedded by major security vendors into their own products.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Free and open source under GPLv2 with no licensing fee for the engine$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Multi-threaded architecture suited to high-throughput networks$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Compatible with existing Snort-style rulesets, including Emerging Threats Open$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Maintained by the nonprofit Open Information Security Foundation (OISF)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Active community with an annual SuriCon conference$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Requires manual rule management and tuning to be effective$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$No official managed/hosted commercial tier from OISF itself$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Effective deployment requires network security expertise$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Is Suricata free to use?$q$, $q$Yes. Suricata is free and open-source software, licensed under GPLv2, with no fee for the engine.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Who maintains Suricata?$q$, $q$Suricata is maintained by the Open Information Security Foundation (OISF), a nonprofit foundation.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$What rule format does Suricata use?$q$, $q$Suricata uses Snort-style rule syntax, so rulesets like Emerging Threats Open work with it out of the box.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Can Suricata block traffic, not just alert?$q$, $q$Yes. Suricata can run inline as an intrusion prevention system (IPS) that drops malicious traffic, in addition to IDS alerting and NSM logging.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Network intrusion detection$q$, $q$Deploy Suricata to passively monitor network traffic and alert on suspicious or malicious activity.$q$, $q$Security operations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Inline intrusion prevention$q$, $q$Run Suricata inline to automatically drop traffic matching known-bad signatures.$q$, $q$Network security engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Embedded threat detection$q$, $q$Vendors embed the Suricata engine into their own security appliances and products.$q$, $q$Security product vendors$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$overview$q$, $q$What is Suricata?$q$, 2, ARRAY[$q$Suricata is a free, open-source network threat detection engine maintained by the Open Information Security Foundation (OISF). It combines intrusion detection (IDS), intrusion prevention (IPS), and network security monitoring (NSM) in a single, multi-threaded binary.$q$, $q$The engine uses Snort-compatible rule syntax, which means widely used rulesets such as Emerging Threats Open work with Suricata without modification. It is used directly by organizations and is also embedded into products by major security vendors.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$who-its-for$q$, $q$Who Suricata is for$q$, 2, ARRAY[$q$Suricata suits security operations teams, network engineers, and vendors who need an open-source engine for detecting or blocking network-based threats, and who have the in-house expertise to configure, tune, and maintain an IDS/IPS deployment.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Zeek ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source network security monitoring framework that generates detailed transaction logs of network traffic.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 1995,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Zeek is a free, BSD-licensed network security monitoring framework, originally created as Bro in 1995 and renamed in 2018.$q$,
  og_description = $q$Zeek is a free, BSD-licensed network security monitoring framework, originally created as Bro in 1995 and renamed in 2018.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '82d8db18-43fe-4252-9850-0cc4a603d607';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '82d8db18-43fe-4252-9850-0cc4a603d607' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$Passive network traffic analysis$q$, $q$Analyzes network traffic in real time on passive sensors rather than actively blocking traffic like an inline IPS.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$Extensive default logging$q$, $q$Generates over 70 log files by default, covering protocol activity, files, and connections.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$Broad event coverage$q$, $q$Tracks more than 3,000 distinct network events for detailed visibility into activity on the wire.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$SIEM integration$q$, $q$Log output is designed to integrate with SIEM systems for centralized security analysis.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$Customizable scripting$q$, $q$A scripting layer lets users customize what data is extracted and how traffic is analyzed.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$Free and open source under a permissive BSD license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$Very high visibility into network activity via 70+ default log types$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$Backed by over 20 years of research and development history$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$Receives ongoing development and financial support from Corelight$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$Reported 10,000+ deployments worldwide$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$Passive monitoring only; does not block traffic like an inline IPS$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$No official paid or hosted tier from the Zeek project itself$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$Requires expertise to deploy sensors and interpret log output effectively$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$Is Zeek free?$q$, $q$Yes. Zeek is free, open-source software released under a BSD license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$Was Zeek previously called something else?$q$, $q$Yes. Zeek was originally created by Vern Paxson in 1995 under the name Bro, and the project was renamed to Zeek in 2018.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$Does Zeek block malicious traffic?$q$, $q$No. Zeek operates passively on sensors to monitor and log traffic; it is a monitoring framework rather than an inline intrusion prevention system.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$Who supports Zeek's development?$q$, $q$Zeek receives development and financial support from Corelight, in addition to its open-source community.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$Network security monitoring$q$, $q$Capture detailed transaction logs and file contents from network traffic for security analysis.$q$, $q$Security operations centers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$Incident investigation$q$, $q$Use Zeek's detailed historical logs to investigate and reconstruct network-based incidents.$q$, $q$Incident responders$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$SIEM data enrichment$q$, $q$Feed Zeek's rich network logs into a SIEM for correlation with other security data.$q$, $q$SOC analysts$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$overview$q$, $q$What is Zeek?$q$, 2, ARRAY[$q$Zeek is a free, open-source network security monitoring framework that analyzes network traffic in real time. Rather than actively blocking traffic, Zeek runs passively on sensors and generates detailed transaction logs, file content records, and customizable output for security analysts.$q$, $q$Originally created by Vern Paxson in 1995 as 'Bro,' the project was renamed Zeek in 2018. It is released under a permissive BSD license and receives ongoing development and financial support from Corelight.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', $q$who-its-for$q$, $q$Who Zeek is for$q$, 2, ARRAY[$q$Zeek is built for security operations teams and incident responders who need deep, log-based visibility into network activity and plan to integrate that data with a SIEM or other analysis workflow.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82d8db18-43fe-4252-9850-0cc4a603d607', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Snort ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source network intrusion detection and prevention system, created in 1998 and now developed by Cisco.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 1998,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Snort is a free, open-source network IDS/IPS created in 1998 by Martin Roesch and now developed by Cisco under GPLv2.$q$,
  og_description = $q$Snort is a free, open-source network IDS/IPS created in 1998 by Martin Roesch and now developed by Cisco under GPLv2.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '816a340d-aa9a-49e1-9aad-c93e0406c1d9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '816a340d-aa9a-49e1-9aad-c93e0406c1d9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$Real-time traffic analysis$q$, $q$Performs real-time traffic analysis and packet logging on IP networks.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$Packet sniffer and logger$q$, $q$Can run as a simple packet sniffer (like tcpdump) or a packet logger for network traffic debugging.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$Intrusion prevention system$q$, $q$Can be deployed as a full network intrusion prevention system to detect and stop attacks inline.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$Protocol analysis and content matching$q$, $q$Detects attacks such as buffer overflows, stealth port scans, CGI attacks, SMB probes, and OS fingerprinting attempts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$Snort 3 plugin architecture$q$, $q$Snort 3 adds performance improvements and a range of 200+ plugins for custom network setups.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$Community and subscriber rulesets$q$, $q$Rules are distributed as a Community Ruleset and a Cisco Talos-curated Subscriber Ruleset.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$Free and open source under GPLv2 for the engine and Community Ruleset$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$Long track record dating back to 1998, now backed by Cisco/Talos$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$Snort 3 offers a large plugin ecosystem (200+ plugins)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$Can function as sniffer, logger, or full IPS depending on need$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$Widely documented with dedicated Cisco training courses$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$The curated Subscriber Ruleset from Cisco Talos is a paid add-on, unlike the free Community Ruleset$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$Requires manual tuning and rule management for effective detection$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$Some resources and documentation assume familiarity with network security concepts$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$Is Snort free?$q$, $q$Yes. The Snort engine and Community Ruleset are free and open source under GPLv2. Cisco Talos also offers a paid Subscriber Ruleset.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$Who develops Snort?$q$, $q$Snort was created in 1998 by Martin Roesch and is now developed by Cisco, which acquired Sourcefire (Snort's original company) in 2013.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$What is Snort 3?$q$, $q$Snort 3 is the current major version, adding performance improvements and a plugin architecture with 200+ available plugins.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$Can Snort prevent attacks, not just detect them?$q$, $q$Yes. Snort can be deployed as an intrusion prevention system (IPS) in addition to intrusion detection (IDS).$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$Network intrusion detection and prevention$q$, $q$Monitor and optionally block malicious network traffic using signature-based rules.$q$, $q$Network security teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$Traffic debugging$q$, $q$Use Snort as a packet sniffer or logger for troubleshooting network issues.$q$, $q$Network administrators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$Cisco security curricula$q$, $q$Learn open-source IDS/IPS concepts through Cisco's official Snort training courses.$q$, $q$Security engineers and students$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$overview$q$, $q$What is Snort?$q$, 2, ARRAY[$q$Snort is a free, open-source network intrusion detection and prevention system created by Martin Roesch in 1998. It performs real-time traffic analysis and packet logging on IP networks, and can be run as a packet sniffer, packet logger, or full network intrusion prevention system.$q$, $q$Snort is now developed by Cisco, which acquired Sourcefire, Snort's original company, in 2013. The engine and Community Ruleset are distributed under GPLv2, while Cisco Talos also maintains a paid Subscriber Ruleset with additional curated detection content.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', $q$who-its-for$q$, $q$Who Snort is for$q$, 2, ARRAY[$q$Snort suits network security teams and administrators who need an established, well-documented open-source IDS/IPS, and organizations already invested in the Cisco security ecosystem.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('816a340d-aa9a-49e1-9aad-c93e0406c1d9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── DefectDojo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source vulnerability management and ASPM platform for centralizing security findings from 200+ scanning tools.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$300/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$DefectDojo centralizes vulnerability findings from 200+ security tools. Free open-source edition (BSD-3) plus a paid Pro tier.$q$,
  og_description = $q$DefectDojo centralizes vulnerability findings from 200+ security tools. Free open-source edition (BSD-3) plus a paid Pro tier.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '717823fe-8010-4821-a2b2-2263a7afbe21';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '717823fe-8010-4821-a2b2-2263a7afbe21' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$Finding import and deduplication$q$, $q$Imports results from over 200 security scanning tools and deduplicates overlapping findings.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$Role-based access control$q$, $q$Supports RBAC alongside authentication via username/password, LDAP, SAML, and OAuth.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$REST API and Swagger UI$q$, $q$Provides a REST API with built-in Swagger documentation for automation and integration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$Automation rules engine (Pro)$q$, $q$Pro tier adds a rules engine, tunable deduplication, and background imports for automated workflows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$Premium parsers and integrations (Pro)$q$, $q$Pro tier includes additional integrations such as Snyk, SonarQube, and AWS, plus a universal CSV/JSON parser.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$Cloud-hosted option (Pro)$q$, $q$Pro tier can be run as a cloud-hosted SaaS instance in addition to self-hosting.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$Free, self-hosted open-source edition under BSD-3-Clause$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$Over 200 integrations with security scanning tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$38 million+ downloads and 4,000+ GitHub stars for the open-source project$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$Storage-based pricing on Pro rather than per-app or per-user fees$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$Active community support via Slack$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$Advanced automation, premium parsers, and MFA require the paid Pro tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$Pro pricing beyond the base tier requires a custom quote for larger storage volumes$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$Self-hosting the open-source edition requires infrastructure and maintenance effort$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$Is DefectDojo free?$q$, $q$Yes, DefectDojo has a free, open-source, self-hosted edition licensed under BSD-3-Clause. A paid Pro tier with additional features starts around $300/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$What license is DefectDojo released under?$q$, $q$The open-source edition is released under the BSD-3-Clause license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$How many tools does DefectDojo integrate with?$q$, $q$DefectDojo offers over 200 integrations with security scanning tools.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$What does DefectDojo Pro add over the free edition?$q$, $q$Pro adds an automation rules engine, tunable deduplication, background imports, premium parsers, a cloud-hosted option, MFA, and premium support.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$Vulnerability management$q$, $q$Centralize and deduplicate vulnerability findings from many different scanning tools in one place.$q$, $q$Application security teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$ASPM (Application Security Posture Management)$q$, $q$Track security posture across applications with dashboards, RBAC, and reporting.$q$, $q$AppSec and DevSecOps teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$Pentest and MSSP reporting$q$, $q$Consolidate and report on findings across engagements for clients or internal stakeholders.$q$, $q$Pen testers and MSPs$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$Free (Open Source)$q$, $q$$0$q$, NULL, $q$["Core finding import & deduplication","Authentication (LDAP, SAML, OAuth)","Role-based access control","REST API & Swagger UI","Manual import & reimport","Basic dashboard & reporting"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$Pro$q$, $q$From $300/month$q$, $q$monthly$q$, $q$["Everything in Free","Automation rules engine","Tunable deduplication","Background imports","Premium parsers and integrations","Cloud-hosted option","MFA","Premium support & SLAs"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$overview$q$, $q$What is DefectDojo?$q$, 2, ARRAY[$q$DefectDojo is a vulnerability management and application security posture management (ASPM) platform that centralizes security findings from more than 200 scanning tools. It offers a free, open-source, self-hosted edition released under the BSD-3-Clause license, alongside a paid Pro tier.$q$, $q$The open-source edition covers finding import and deduplication, authentication (including LDAP, SAML, and OAuth), role-based access control, and a REST API. DefectDojo Pro adds automation, premium parsers, a cloud-hosted option, and enterprise support, priced on a storage-based model starting around $300/month.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', $q$who-its-for$q$, $q$Who DefectDojo is for$q$, 2, ARRAY[$q$DefectDojo suits application security teams, pen testers, and MSSPs that need to consolidate findings from many disparate security tools into a single system, whether self-hosting the free edition or paying for Pro's automation and cloud hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('717823fe-8010-4821-a2b2-2263a7afbe21', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Faraday ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Offensive security platform combining vulnerability management, pentest reporting, and attack surface management, with a free open-source community edition.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2004,
  company_size = NULL,
  headquarters = $q$Miami, Florida, United States$q$,
  languages = '{}',
  seo_meta_description = $q$Faraday is an offensive security platform for vulnerability management and pentest reporting, with a free GPL-3.0 community edition.$q$,
  og_description = $q$Faraday is an offensive security platform for vulnerability management and pentest reporting, with a free GPL-3.0 community edition.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '119e88eb-8125-4474-bd00-8010e05e2e72';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '119e88eb-8125-4474-bd00-8010e05e2e72' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Vulnerability management$q$, $q$Continuous vulnerability scanning with context-driven prioritization through a smart-scoring system.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Pentest reporting$q$, $q$Automatically centralizes and organizes penetration testing findings into reports.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Attack surface management$q$, $q$Maps external digital exposure and threat intelligence across an organization's assets.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$DevSecOps integration$q$, $q$Embeds security checks into development pipelines as part of a DevSecOps workflow.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Free community edition$q$, $q$A free, open-source community edition is available under the GPL-3.0 license and downloadable from GitHub.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Commercial tiers with SSO and ticketing$q$, $q$Paid Professional and Corporate editions add API endpoints, executive reports, LDAP/SAML SSO, and ticketing tool integrations.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Free, open-source community edition licensed under GPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Combines vulnerability management, pentest reporting, and attack surface management in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$In operation since 2004 with an established enterprise client base$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$ISO/IEC 27001:2022 certified$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Offers both cloud-hosted and on-premises deployment$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Advanced features (SSO, ticketing integrations, executive reporting) require paid Professional/Corporate tiers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Pricing for commercial tiers is not published and requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Additional paid products (Enrichment, CART, OPS) are sold separately from the core platform$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Is Faraday free to use?$q$, $q$Yes. Faraday has a free, open-source community edition released under GPL-3.0. Paid Professional and Corporate editions add further features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$When was Faraday founded?$q$, $q$Faraday was founded in 2004.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Where is Faraday headquartered?$q$, $q$Faraday is headquartered in Miami, Florida, with a research lab in Buenos Aires, Argentina.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Does Faraday offer cloud hosting?$q$, $q$Yes. Faraday can be deployed both in the cloud and on-premises.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Continuous vulnerability management$q$, $q$Track and prioritize vulnerabilities across assets with automated smart scoring.$q$, $q$Security teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Pentest reporting$q$, $q$Centralize findings from multiple penetration tests into unified reports.$q$, $q$Penetration testers and MSSPs$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Attack surface mapping$q$, $q$Discover and monitor external-facing digital assets and exposure.$q$, $q$Enterprise security teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Community$q$, $q$$0$q$, NULL, $q$["Open-source core platform (GPL-3.0)","Self-hosted deployment"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Pentest on Demand$q$, $q$Custom$q$, NULL, $q$["Initial security testing engagement"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Always On$q$, $q$Custom$q$, NULL, $q$["All platform modules","Continuous offensive security and automation"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$Enterprise+$q$, $q$Custom$q$, NULL, $q$["Tailored enterprise-scale offensive security"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$overview$q$, $q$What is Faraday?$q$, 2, ARRAY[$q$Faraday is an offensive security platform, founded in 2004 and headquartered in Miami, Florida, that combines vulnerability management, penetration testing reporting, and attack surface management. It serves enterprises and MSSPs and holds ISO/IEC 27001:2022 certification.$q$, $q$A free, open-source community edition is available under the GPL-3.0 license and can be self-hosted. Paid Professional and Corporate tiers add features such as additional API endpoints, executive reporting, LDAP/SAML SSO, and ticketing tool integrations, alongside separately sold add-ons like Faraday Enrichment, CART, and OPS.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', $q$who-its-for$q$, $q$Who Faraday is for$q$, 2, ARRAY[$q$Faraday suits security teams and MSSPs that need to centralize vulnerability and pentest data, ranging from teams self-hosting the free community edition to enterprises needing SSO, ticketing integrations, and continuous offensive security services.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('119e88eb-8125-4474-bd00-8010e05e2e72', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Dependency-Track ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, OWASP-maintained platform that analyzes SBOMs to inventory components and identify supply-chain vulnerabilities.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OWASP Dependency-Track is a free, Apache 2.0-licensed platform for SBOM-based software supply chain risk management.$q$,
  og_description = $q$OWASP Dependency-Track is a free, Apache 2.0-licensed platform for SBOM-based software supply chain risk management.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b102eee5-b364-47b7-9569-b256d99e7549';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b102eee5-b364-47b7-9569-b256d99e7549' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$SBOM-based inventory$q$, $q$Uses CycloneDX SBOMs to track libraries, containers, operating systems, firmware, and services across projects.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$Continuous vulnerability analysis$q$, $q$Matches inventoried components against multiple vulnerability sources, including NVD, GitHub Advisories, Snyk, and OSV.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$Policy engine$q$, $q$An expression-based policy engine enforces security, operational, and license-compliance rules.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$Horizontal scalability$q$, $q$Version 5.0 adds horizontal scaling and active/active high availability for large deployments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$Docker-based deployment$q$, $q$Deploys via Docker or Docker Compose with a PostgreSQL database (v5.0+).$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$Free and open source under the Apache 2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$Maintained by OWASP as a Flagship Project$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$Used by 20,000+ organizations according to the project site$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$Scales to process tens of thousands of SBOMs per hour$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$Cross-references multiple vulnerability intelligence sources$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$No official paid or managed hosting tier from the project itself$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$Requires self-hosting infrastructure (Docker, PostgreSQL) and ongoing maintenance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$Effectiveness depends on consistently generating accurate SBOMs upstream$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$Is Dependency-Track free?$q$, $q$Yes. Dependency-Track is free and open source, licensed under Apache 2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$Who maintains Dependency-Track?$q$, $q$Dependency-Track is maintained as an OWASP Flagship Project.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$What format of SBOM does Dependency-Track use?$q$, $q$Dependency-Track ingests CycloneDX SBOMs to build its component inventory.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$How is Dependency-Track deployed?$q$, $q$It is typically deployed via Docker or Docker Compose, with PostgreSQL as the database for version 5.0 and later.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$Software supply chain risk management$q$, $q$Continuously monitor components across projects for known vulnerabilities.$q$, $q$Application security teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$License compliance$q$, $q$Enforce license-compliance policies against the software component inventory.$q$, $q$Legal and compliance teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$SBOM ingestion at scale$q$, $q$Process large volumes of CycloneDX SBOMs from CI/CD pipelines.$q$, $q$DevSecOps engineers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$overview$q$, $q$What is Dependency-Track?$q$, 2, ARRAY[$q$Dependency-Track is a free, open-source software supply chain risk management platform maintained as an OWASP Flagship Project. It ingests CycloneDX SBOMs to inventory components such as libraries, containers, operating systems, and firmware, then continuously matches them against vulnerability sources including NVD, GitHub Advisories, Snyk, and OSV.$q$, $q$The platform is released under the Apache 2.0 license and includes an expression-based policy engine for security, operational, and license-compliance enforcement. Version 5.0 added horizontal scaling and active/active high availability for larger deployments.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', $q$who-its-for$q$, $q$Who Dependency-Track is for$q$, 2, ARRAY[$q$Dependency-Track suits application security and DevSecOps teams that already generate SBOMs in CI/CD and need a self-hosted, open-source system to track component risk and license compliance at scale.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b102eee5-b364-47b7-9569-b256d99e7549', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── OWASP Dependency-Check ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source software composition analysis tool that identifies publicly disclosed vulnerabilities in project dependencies.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OWASP Dependency-Check scans project dependencies for known CVEs. Free, Apache 2.0-licensed, with Maven, Gradle, and CI/CD plugins.$q$,
  og_description = $q$OWASP Dependency-Check scans project dependencies for known CVEs. Free, Apache 2.0-licensed, with Maven, Gradle, and CI/CD plugins.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4e30e978-262d-4a83-b746-96ea2a1f37ae';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4e30e978-262d-4a83-b746-96ea2a1f37ae' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$CPE-based vulnerability detection$q$, $q$Identifies known vulnerable components by matching Common Platform Enumeration (CPE) identifiers against dependencies.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$CVE-linked reporting$q$, $q$Generates reports that link detected components to their associated CVE entries.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$Automatic NVD updates$q$, $q$Automatically updates its vulnerability database using NIST's National Vulnerability Database (NVD) data feeds.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$Third-party data sources$q$, $q$Cross-references NPM Audit API, OSS Index, RetireJS, and Bundler Audit for additional coverage.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$Build tool and CI/CD plugins$q$, $q$Available as Maven, Gradle, and Ant plugins, plus integrations for Jenkins, GitHub Actions, and Azure DevOps.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$Container and CLI support$q$, $q$Distributed as a command-line tool, Docker container image, and via Mac Homebrew.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$Free and open source under the Apache 2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$OWASP Flagship Tool Project with broad community backing$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$Integrates directly into Maven, Gradle, Jenkins, and other common build/CI tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$Cross-references multiple vulnerability data sources beyond just NVD$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$Also available as a SonarQube plugin$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$Initial vulnerability database download can take 10+ minutes$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$Relies on CPE matching, which can produce false positives or miss non-CPE-mapped components$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$No official paid or hosted tier; self-managed setup and updates required$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$Is OWASP Dependency-Check free?$q$, $q$Yes. It is free and open source, released under the Apache 2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$What build tools does it integrate with?$q$, $q$It offers plugins for Maven, Gradle, and Ant, plus integrations for Jenkins, GitHub Actions, Azure DevOps, and SonarQube.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$Where does it get vulnerability data?$q$, $q$It primarily uses NIST's NVD data feeds, supplemented by NPM Audit API, OSS Index, RetireJS, and Bundler Audit.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$Who leads the OWASP Dependency-Check project?$q$, $q$The project is led by Jeremy Long under the OWASP Foundation.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$Build-time vulnerability scanning$q$, $q$Scan project dependencies for known CVEs as part of a Maven, Gradle, or Ant build.$q$, $q$Software developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$CI/CD security gating$q$, $q$Fail builds in Jenkins, GitHub Actions, or Azure DevOps when known-vulnerable dependencies are detected.$q$, $q$DevSecOps engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$Ad hoc dependency audits$q$, $q$Run scans via CLI or Docker to audit a project's dependencies outside of a CI pipeline.$q$, $q$Security teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$overview$q$, $q$What is OWASP Dependency-Check?$q$, 2, ARRAY[$q$OWASP Dependency-Check is a free, open-source software composition analysis (SCA) tool that identifies publicly disclosed vulnerabilities in a project's dependencies. It matches components against Common Platform Enumeration (CPE) identifiers and links results to CVE entries, drawing primarily on NIST's NVD data feeds along with sources like NPM Audit API, OSS Index, RetireJS, and Bundler Audit.$q$, $q$Released under the Apache 2.0 license and recognized as an OWASP Flagship Tool Project, it is available as a command-line tool, Maven/Gradle/Ant plugin, Docker container, Homebrew package, and integrates with Jenkins, GitHub Actions, Azure DevOps, and SonarQube.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', $q$who-its-for$q$, $q$Who OWASP Dependency-Check is for$q$, 2, ARRAY[$q$It suits developers and DevSecOps teams who want a free, self-hosted way to catch known-vulnerable dependencies directly inside their build tools and CI/CD pipelines.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4e30e978-262d-4a83-b746-96ea2a1f37ae', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Harbor ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, CNCF-graduated container registry with built-in vulnerability scanning, RBAC, and image replication.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Harbor is a free, open-source, CNCF-graduated container registry with vulnerability scanning, RBAC, and replication.$q$,
  og_description = $q$Harbor is a free, open-source, CNCF-graduated container registry with vulnerability scanning, RBAC, and replication.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2fda9f09-2141-4cc7-84c4-66606e716a87';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2fda9f09-2141-4cc7-84c4-66606e716a87' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$Vulnerability scanning$q$, $q$Scans stored artifacts for known vulnerabilities as part of its security policy enforcement.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$Content signing and validation$q$, $q$Supports signing and validating container images to ensure content integrity.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$Role-based access control$q$, $q$Provides multi-tenant RBAC with identity integration for controlling who can push and pull artifacts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$Cross-registry replication$q$, $q$Replicates artifacts across multiple registries for distribution or disaster recovery.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$Kubernetes and Docker deployment$q$, $q$Deployable on any Kubernetes environment or a system with Docker support.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$Extensible API and web UI$q$, $q$Offers a full API alongside a web UI for managing artifacts and policies.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$Free and open source, and a CNCF Graduated project$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$Built-in vulnerability scanning and image signing without extra tooling$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$Multi-tenant RBAC suited to shared/enterprise environments$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$Supports replication across registries for HA/DR scenarios$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$Adopted by large enterprises such as JD.com and China Mobile$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$Requires self-hosting on Kubernetes or Docker; no official managed hosted tier from the project$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$Operational overhead for upgrades, scaling, and storage backend management$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$No commercial support channel documented on the official site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$Is Harbor free?$q$, $q$Yes. Harbor is free, open-source software and a CNCF Graduated project.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$What governance status does Harbor have?$q$, $q$Harbor is a Cloud Native Computing Foundation (CNCF) Graduated project.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$Does Harbor scan images for vulnerabilities?$q$, $q$Yes. Harbor includes built-in vulnerability scanning as part of its artifact security policies.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$Where can Harbor be deployed?$q$, $q$Harbor can be deployed on any Kubernetes environment or on a system with Docker support.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$Private container registry$q$, $q$Host and manage container images and other OCI artifacts privately within an organization.$q$, $q$Platform and DevOps teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$Supply chain security for images$q$, $q$Enforce vulnerability scanning and content signing before images reach production.$q$, $q$DevSecOps teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$Multi-region image replication$q$, $q$Replicate artifacts across registries for redundancy or geographic distribution.$q$, $q$Infrastructure teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$overview$q$, $q$What is Harbor?$q$, 2, ARRAY[$q$Harbor is a free, open-source registry for container images and other OCI artifacts, built for cloud-native environments such as Kubernetes and Docker. It is a Cloud Native Computing Foundation (CNCF) Graduated project, reflecting mature governance and broad industry adoption.$q$, $q$Harbor secures artifacts with role-based access control, vulnerability scanning, and content signing, and it supports replication across multiple registries. It can be deployed on any Kubernetes environment or a Docker-enabled system, and is used by enterprises such as JD.com and China Mobile.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', $q$who-its-for$q$, $q$Who Harbor is for$q$, 2, ARRAY[$q$Harbor suits platform, DevOps, and DevSecOps teams that need a self-hosted, security-focused container registry with fine-grained access control and replication, particularly in Kubernetes-based environments.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2fda9f09-2141-4cc7-84c4-66606e716a87', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Quay ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Container registry platform from Red Hat, available as the open-source Project Quay, the hosted Quay.io service, and enterprise Red Hat Quay.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Red Hat Quay is a security-focused container registry with vulnerability scanning, geo-replication, and CI/CD build automation.$q$,
  og_description = $q$Red Hat Quay is a security-focused container registry with vulnerability scanning, geo-replication, and CI/CD build automation.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd5332e67-88ad-4e34-998d-c503ab84ed89';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd5332e67-88ad-4e34-998d-c503ab84ed89' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Vulnerability scanning and access control$q$, $q$Provides granular security management with access controls and image vulnerability scanning.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$High availability and geo-replication$q$, $q$Supports high availability and geographic replication by running multiple instances.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Automated CI/CD builds$q$, $q$Triggers automated image builds from GitHub, BitBucket, and GitLab for high-velocity CI/CD.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Enterprise authentication$q$, $q$Supports LDAP and OIDC for enterprise authentication and team-based access control.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$OpenShift integration$q$, $q$Integrates with OpenShift for automated credential exchange and image management.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Free public repositories on Quay.io$q$, $q$Quay.io, the hosted service, offers unlimited free public repository hosting and storage.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Public repositories are free and unlimited on the hosted Quay.io service$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Underlying Project Quay is open source$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Built-in vulnerability scanning and image signing for security-conscious teams$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Tight integration with OpenShift and Kubernetes$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Geo-replication support for high availability$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Private repositories on Quay.io require a paid plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Red Hat Quay enterprise self-managed pricing is not publicly listed and requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Enterprise features are oriented toward organizations already using Red Hat/OpenShift infrastructure$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Is Quay free?$q$, $q$Public repositories on the hosted Quay.io service are free with unlimited storage. Private repositories require a paid plan, and Red Hat Quay's self-managed enterprise product is priced separately.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$What is the difference between Project Quay and Red Hat Quay?$q$, $q$Project Quay is the open-source upstream project; Red Hat Quay is Red Hat's supported, self-managed enterprise product, and Quay.io is the hosted SaaS version.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Does Quay integrate with OpenShift?$q$, $q$Yes. Quay integrates with OpenShift for automated credential exchange and image management.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Can Quay build images automatically from source repos?$q$, $q$Yes. Quay supports automated CI/CD builds triggered from GitHub, BitBucket, and GitLab.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Public open-source image hosting$q$, $q$Host public container images for free with unlimited storage on Quay.io.$q$, $q$Open-source projects$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Enterprise private registry$q$, $q$Run a self-managed, security-focused registry across data centers and cloud environments.$q$, $q$Enterprises using Kubernetes/OpenShift$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$CI/CD image automation$q$, $q$Automatically build and publish images from source repository changes.$q$, $q$DevOps teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Quay.io Free (Public)$q$, $q$$0$q$, NULL, $q$["Unlimited public repositories","Free security scanning of public images"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Quay.io Micro$q$, $q$Paid$q$, $q$monthly$q$, $q$["10 private repositories","Unlimited public repos","Team-based permissions"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Quay.io Small$q$, $q$Paid$q$, $q$monthly$q$, $q$["20 private repositories","Unlimited public repos","Team-based permissions"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$Red Hat Quay (self-managed)$q$, $q$Custom$q$, NULL, $q$["Priced per deployment","Sold standalone or with OpenShift Platform Plus"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$overview$q$, $q$What is Quay?$q$, 2, ARRAY[$q$Quay is a container registry platform from Red Hat, available in three forms: the open-source Project Quay, the hosted Quay.io SaaS service, and the commercial, self-managed Red Hat Quay enterprise product. It offers vulnerability scanning, access controls, geographic replication, and automated CI/CD builds from GitHub, BitBucket, and GitLab.$q$, $q$Public repositories on Quay.io are free with unlimited storage, while private repositories require a paid plan priced by repository count. Red Hat Quay, the self-managed enterprise offering, is priced per deployment and can be sold standalone or bundled with OpenShift Platform Plus, with tight integration into OpenShift for credential exchange and image management.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', $q$who-its-for$q$, $q$Who Quay is for$q$, 2, ARRAY[$q$Quay suits open-source projects that want free public image hosting, and enterprises running Kubernetes or OpenShift that need a security-focused private registry with geo-replication and enterprise authentication.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5332e67-88ad-4e34-998d-c503ab84ed89', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Verdaccio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lightweight, free open-source Node.js private proxy registry for npm, yarn, and pnpm packages.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Verdaccio is a free, MIT-licensed, zero-config private npm proxy registry supporting npm, yarn, and pnpm.$q$,
  og_description = $q$Verdaccio is a free, MIT-licensed, zero-config private npm proxy registry supporting npm, yarn, and pnpm.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e4836b9e-697c-4735-b03e-624cbcf6545f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e4836b9e-697c-4735-b03e-624cbcf6545f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Private package hosting$q$, $q$Hosts proprietary packages privately within an organization with minimal configuration.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Registry proxying and caching$q$, $q$Chains and proxies multiple registries, caching npmjs.org packages to reduce latency and provide failover.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Package overriding$q$, $q$Allows deploying modified versions of public packages locally under the same package name.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Multi-client support$q$, $q$Works with npm, yarn, and pnpm package manager clients.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Docker and Kubernetes deployment$q$, $q$Ships an official Docker image and a Helm chart for Kubernetes deployments.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Plugin ecosystem$q$, $q$Supports community plugins for extended storage backends, including Amazon S3 and Google Cloud Storage.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Completely free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Minimal configuration required to get a private registry running$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Used by well-known projects including Nx, pnpm, Angular CLI, and Storybook$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Supports all major Node.js package manager clients (npm, yarn, pnpm)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Official Docker image and Helm chart simplify deployment$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Run entirely by volunteers, with no one working on it full-time$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$No official paid or hosted commercial tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Self-hosting requires the user to manage uptime, storage, and scaling$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Is Verdaccio free?$q$, $q$Yes. Verdaccio is free and open-source software released under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$What package managers does Verdaccio support?$q$, $q$Verdaccio supports npm, yarn, and pnpm clients.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Can Verdaccio proxy the public npm registry?$q$, $q$Yes. Verdaccio can proxy and cache packages from npmjs.org, and it can chain multiple registries together.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$How is Verdaccio deployed?$q$, $q$Verdaccio can be run directly, via its official Docker image, or deployed to Kubernetes using its Helm chart.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Private npm registry$q$, $q$Host proprietary internal packages without publishing them publicly.$q$, $q$Development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Registry caching and failover$q$, $q$Cache public npm packages locally to reduce latency and provide offline failover.$q$, $q$Platform engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$Local package overrides$q$, $q$Test or patch modified versions of public packages locally before publishing changes upstream.$q$, $q$Open-source maintainers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$overview$q$, $q$What is Verdaccio?$q$, 2, ARRAY[$q$Verdaccio is a free, open-source, lightweight Node.js private proxy registry that functions as a local npm registry with minimal configuration. It is released under the MIT license and supports npm, yarn, and pnpm clients.$q$, $q$Verdaccio can host private packages, proxy and cache the public npmjs.org registry, and override public packages locally under the same name. It ships an official Docker image and Helm chart, and supports community plugins for storage backends like Amazon S3 and Google Cloud Storage. It is run by volunteers and used by projects such as Nx, pnpm, Angular CLI, and Storybook.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', $q$who-its-for$q$, $q$Who Verdaccio is for$q$, 2, ARRAY[$q$Verdaccio suits development teams and open-source maintainers who need a free, self-hosted way to host private npm packages or cache and override public registry packages.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e4836b9e-697c-4735-b03e-624cbcf6545f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Sonatype Nexus Repository ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud-native artifact repository manager that stores, secures, and distributes binaries, containers, and AI/ML models across 20+ package formats.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2008,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Sonatype Nexus Repository manages Maven, npm, Docker, PyPI, and 20+ other package formats, with a free Community edition and paid Pro tier.$q$,
  og_description = $q$Sonatype Nexus Repository manages Maven, npm, Docker, PyPI, and 20+ other package formats, with a free Community edition and paid Pro tier.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ba780fa8-7453-4d31-a091-d99288158644';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ba780fa8-7453-4d31-a091-d99288158644' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$20+ Package Formats$q$, $q$Stores and manages artifacts across Maven, npm, Docker, PyPI, Helm, Hugging Face, and other formats from a single repository manager.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Proxy Repository Caching$q$, $q$Caches remote dependencies locally to reduce build latency, with the vendor citing up to 95% faster builds.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$RBAC, SAML, and SSO$q$, $q$Supports role-based access control, TLS encryption, and SAML/SSO integration for enterprise authentication.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Repository Firewall Integration$q$, $q$Integrates with Sonatype Repository Firewall to surface malware detection alerts on incoming components.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$High Availability Clustering$q$, $q$Supports HA cluster deployments with a 99.9% uptime SLA for production environments.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Air-Gapped Deployment$q$, $q$Offers a disconnected deployment option for restricted or air-gapped environments.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Supports 20+ package formats in a single repository manager$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Free Community edition available for smaller teams$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Enterprise security features like SAML/SSO and RBAC$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Deployable self-hosted, in the cloud, or air-gapped$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Integrates with Repository Firewall for malware detection$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Specific Pro edition pricing is not published; requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Advanced authentication (SSO/SAML) requires the paid Pro edition$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Enterprise-focused feature set may be more than small teams need$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Is Sonatype Nexus Repository free?$q$, $q$Yes, a Community edition is available at no cost; a paid Pro edition adds features like SSO/SAML authentication.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Can Nexus Repository be self-hosted?$q$, $q$Yes, it can be deployed self-hosted in a data center or cloud, in addition to a fully managed SaaS option.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$What package formats does Nexus Repository support?$q$, $q$It supports 20+ formats including Maven, npm, Docker, PyPI, Helm, and Hugging Face models.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Does Nexus Repository support air-gapped environments?$q$, $q$Yes, a disconnected/air-gapped deployment option is available for restricted environments.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Centralizing build artifacts$q$, $q$Teams use Nexus Repository to store and version build outputs like Maven and npm packages in one place.$q$, $q$Development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Securing the software supply chain$q$, $q$Organizations use RBAC, SAML/SSO, and Repository Firewall integration to control access and screen incoming components.$q$, $q$Security and DevOps teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Reducing build times with caching$q$, $q$Proxy repositories cache remote dependencies locally to speed up CI/CD pipelines.$q$, $q$Platform engineering teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Community$q$, $q$Free$q$, NULL, $q$["Core artifact repository management","Support for major package formats","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Pro$q$, $q$Custom / contact sales$q$, NULL, $q$["SAML/SSO and advanced authentication","High availability clustering","Repository Firewall integration","Premium support"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$overview$q$, $q$What is Sonatype Nexus Repository?$q$, 2, ARRAY[$q$Sonatype Nexus Repository is an artifact repository manager that stores, manages, and distributes software binaries, containers, and AI/ML models. It supports more than 20 package formats, including Maven, npm, Docker, PyPI, Helm, and Hugging Face model artifacts, from a single centralized repository.$q$, $q$The product is offered as a free Community edition and a paid Pro edition with enterprise authentication (SAML/SSO), high availability clustering, and integration with Sonatype's Repository Firewall for malware detection. It can be deployed self-hosted, as a managed cloud service, or in an air-gapped configuration for restricted environments.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$who-its-for$q$, $q$Who Sonatype Nexus Repository is for$q$, 2, ARRAY[$q$Nexus Repository is built for development, DevOps, and security teams that need to centralize build artifacts, cache dependencies for faster CI/CD pipelines, and enforce access controls and supply-chain security across multiple package ecosystems.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── JFrog Artifactory ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Universal artifact repository manager supporting 50+ package formats for managing binaries, containers, and AI/ML models across the software supply chain.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$JFrog Artifactory manages 50+ package formats including Maven, npm, Docker, and Helm, with free, SaaS, and self-managed enterprise options.$q$,
  og_description = $q$JFrog Artifactory manages 50+ package formats including Maven, npm, Docker, and Helm, with free, SaaS, and self-managed enterprise options.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ed99d703-32ed-4261-9895-3b1e2b391d3a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ed99d703-32ed-4261-9895-3b1e2b391d3a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$50+ Package Formats$q$, $q$Manages Maven, npm, PyPI, Docker, Helm, NuGet, Debian, RPM, Terraform, and AI/ML model artifacts in one platform.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$Container & Kubernetes Registry$q$, $q$Provides a Docker-compatible container registry with Kubernetes-focused registry capabilities.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$Dependency Proxying & Caching$q$, $q$Proxies and caches remote dependencies to reduce external network calls during builds.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$Bi-Directional Replication$q$, $q$Automates repository synchronization across multiple sites for distributed teams.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$Software Governance$q$, $q$Applies RBAC and security policy enforcement across the artifact lifecycle.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$High Availability SLA$q$, $q$Offers a 99.99% uptime SLA on premium availability tiers.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$Broadest package format support among major artifact repository managers (50+)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$Deployable as SaaS, self-managed, or hybrid$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$Used by 6,500+ teams including 80% of the Fortune 100$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$100+ ecosystem integrations, including GitHub, ServiceNow, and Sonar$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$Specific pricing tiers are not published on the marketing site; requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$Feature breadth can add setup complexity for small teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$Premium SLA and advanced features are reserved for paid tiers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$Is there a free tier of JFrog Artifactory?$q$, $q$Yes, a free tier is available to try, alongside paid Enterprise+ options.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$Can Artifactory run on-premises?$q$, $q$Yes, it supports self-managed on-premises or multi-cloud deployment in addition to SaaS.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$What package formats does Artifactory support?$q$, $q$It supports 50+ formats, including Maven, npm, Docker, Helm, NuGet, and Terraform.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$Does Artifactory offer high availability?$q$, $q$Yes, a Premium Availability SLA option offers 99.99% uptime.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$Managing containers at scale$q$, $q$Teams use Artifactory's Docker-compatible registry to store and distribute container images.$q$, $q$Platform and DevOps teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$Distributed team synchronization$q$, $q$Bi-directional replication keeps repositories in sync across global development sites.$q$, $q$Distributed engineering organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$Enterprise governance$q$, $q$RBAC and policy enforcement help large organizations control access to artifacts.$q$, $q$Security and compliance teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$Free$q$, $q$Free$q$, NULL, $q$["Try Artifactory with core repository features"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$Enterprise+$q$, $q$Custom / contact sales$q$, NULL, $q$["Premium Availability SLA (99.99%)","Advanced governance and security policy enforcement","100+ ecosystem integrations"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$overview$q$, $q$What is JFrog Artifactory?$q$, 2, ARRAY[$q$JFrog Artifactory is a universal artifact repository manager that centralizes storage and distribution of software binaries, packages, containers, and releases. It supports more than 50 package formats, including Maven, npm, PyPI, Docker, Helm, NuGet, Debian, RPM, and Terraform, as well as AI/ML model artifacts.$q$, $q$Artifactory can be deployed as a fully managed SaaS on AWS, Azure, or GCP, self-managed on-premises or across multiple clouds, or in a hybrid configuration. It is used by more than 6,500 teams, including 80% of the Fortune 100, and integrates with over 100 tools in the software delivery ecosystem.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', $q$who-its-for$q$, $q$Who JFrog Artifactory is for$q$, 2, ARRAY[$q$Artifactory is built for enterprise development and platform teams that need a single repository manager across many package formats, distributed replication for global teams, and governance controls for large-scale software supply chains.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed99d703-32ed-4261-9895-3b1e2b391d3a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Pulp ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open source platform for fetching, hosting, and distributing software repositories across RPM, Debian, Python, npm, Container, and other formats.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Pulp is a free, open source (GPL-2.0) repository manager for mirroring and distributing RPM, Debian, Python, npm, and Container packages.$q$,
  og_description = $q$Pulp is a free, open source (GPL-2.0) repository manager for mirroring and distributing RPM, Debian, Python, npm, and Container packages.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ebebe13c-233a-47f4-a8e7-636776fbd5d6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ebebe13c-233a-47f4-a8e7-636776fbd5d6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$Multi-Format Repository Support$q$, $q$Manages RPM, Debian, Python, npm, Container, Maven, and Ansible content, among other formats.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$On-Demand & Synced Repositories$q$, $q$Supports on-demand downloading as well as fully synchronized local mirrors of upstream repositories.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$Role-Based Access Control$q$, $q$Includes RBAC and domain support for multi-tenant repository management.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$Lifecycle Promotion & Replication$q$, $q$Supports promoting content through lifecycle stages and replicating repositories across instances.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$Metadata Signing & Vulnerability Scanning$q$, $q$Provides metadata signing and vulnerability scanning capabilities for hosted content.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$Kubernetes Deployment via Pulp Operator$q$, $q$Deploys through OCI container images or Kubernetes using the Pulp Operator.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$Fully open source under GPL-2.0-or-later with no paid tier required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$Broad package format support (RPM, Debian, Python, npm, Container, Maven, Ansible)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$Actively maintained, with releases as recent as July 2026$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$REST API for programmatic repository management$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$Deployable via Kubernetes Operator or OCI container images$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$No official managed/hosted SaaS offering; requires self-hosting$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$No commercial support contract mentioned on the official site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$Kubernetes/OCI-based deployment adds operational complexity for small teams$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$Is Pulp free to use?$q$, $q$Yes, Pulp is fully open source with no commercial pricing tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$What package formats does Pulp support?$q$, $q$It supports RPM, Debian, Python, npm, Container, Maven, Ansible, and more.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$Can Pulp be deployed on Kubernetes?$q$, $q$Yes, via the Pulp Operator, in addition to OCI container image deployment.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$What license does Pulp use?$q$, $q$Pulp's pulpcore codebase is licensed under GPL-2.0-or-later.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$Mirroring upstream repositories$q$, $q$Organizations use Pulp to mirror RPM, Debian, and Python repositories locally to reduce external dependency.$q$, $q$System administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$Air-gapped package distribution$q$, $q$Pulp hosts custom and mirrored content for environments without direct internet access.$q$, $q$Enterprise IT teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$Multi-format artifact management$q$, $q$Teams consolidate content from multiple package ecosystems into one platform.$q$, $q$DevOps and platform engineers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$overview$q$, $q$What is Pulp?$q$, 2, ARRAY[$q$Pulp is an open source platform that lets developers fetch, upload, organize, and distribute software packages on-premises or in the cloud. It supports repository content types including RPM, Debian, Python, npm, Container, Maven, and Ansible.$q$, $q$The project, maintained on GitHub as pulp/pulpcore under a GPL-2.0-or-later license, supports on-demand downloading, synchronized mirroring, RBAC, lifecycle promotion, metadata signing, and vulnerability scanning. It can be deployed via OCI container images or Kubernetes using the Pulp Operator.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', $q$who-its-for$q$, $q$Who Pulp is for$q$, 2, ARRAY[$q$Pulp is aimed at developers and system administrators who need to mirror, host, and distribute software packages across multiple ecosystems, including teams operating in air-gapped or restricted-network environments.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ebebe13c-233a-47f4-a8e7-636776fbd5d6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Cloudsmith ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud-native artifact management platform for securely distributing software packages and containers across 30+ formats with usage-based pricing.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Cloudsmith is a managed artifact and container registry supporting 30+ package formats, with a free Core tier and usage-based paid plans.$q$,
  og_description = $q$Cloudsmith is a managed artifact and container registry supporting 30+ package formats, with a free Core tier and usage-based paid plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e47e77d6-8770-40cc-ad32-e7a099e5b0e2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e47e77d6-8770-40cc-ad32-e7a099e5b0e2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$30+ Package Formats$q$, $q$Supports 30+ package formats plus raw file hosting in a single managed platform.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$OCI-Compliant Container Registry$q$, $q$Provides a Docker-compatible, OCI-compliant container registry.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$Security & Policy Controls$q$, $q$Includes vulnerability identification, malware detection, and policy management using OPA Rego syntax.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$Package Workflows$q$, $q$Supports quarantine, promotion, and package signing workflows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$Enterprise Access Controls$q$, $q$Offers SAML/SSO, SCIM provisioning, and OIDC token support.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$Global Distribution Network$q$, $q$Uses a distribution network the vendor describes as 600 global points of presence with edge caching.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$Free Core tier available for open-source repositories$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$Fully managed SaaS, no infrastructure to maintain$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$Supports 30+ package formats plus raw files$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$Usage-based pricing means uploads are free and only delivery/storage are billed$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$Free Core tier is capped at 500MB storage and 1GB delivery with no overage option$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$Paid plan pricing beyond Core is usage-based and not fully published$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$Enterprise features like SSO/SCIM require paid plans$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$Does Cloudsmith have a free plan?$q$, $q$Yes, the Core plan is free but limited to 500MB storage and 1GB delivery per month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$How is Cloudsmith priced?$q$, $q$It uses usage-based pricing on storage and package delivery/bandwidth; uploads are free of charge.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$What package formats does Cloudsmith support?$q$, $q$It supports 30+ formats plus raw files, including an OCI-compliant container registry.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$Is Cloudsmith self-hosted or SaaS?$q$, $q$Cloudsmith is a fully managed, cloud-native SaaS platform.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$Hosting open-source packages$q$, $q$Open-source projects use the free Core tier to distribute packages publicly.$q$, $q$Open-source maintainers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$Securing the container supply chain$q$, $q$Teams use the OCI-compliant registry with vulnerability and malware scanning to secure container images.$q$, $q$DevOps and security teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$Enterprise package governance$q$, $q$Organizations use SAML/SSO, SCIM, and OPA-based policy management to control access to artifacts.$q$, $q$Enterprise platform teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$Core$q$, $q$Free$q$, NULL, $q$["500MB storage / 1GB delivery per month","Open-source repository support","No overage — upgrade required beyond limits"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$Pro / Ultra / Enterprise$q$, $q$Usage-based / contact sales$q$, NULL, $q$["Higher storage and delivery allowances","SAML/SSO and SCIM provisioning","Advanced security and policy controls"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$overview$q$, $q$What is Cloudsmith?$q$, 2, ARRAY[$q$Cloudsmith is a fully managed, cloud-native artifact management platform for controlling, securing, and distributing software packages and containers. It supports more than 30 package formats plus raw files, along with a Docker-compatible, OCI-compliant container registry.$q$, $q$The platform is priced on usage, primarily storage and package delivery/bandwidth, with uploads free of charge. A free Core plan is capped at 500MB storage and 1GB delivery per month, while paid Pro, Ultra, and Enterprise plans add higher allowances and enterprise access controls such as SAML/SSO and SCIM provisioning.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', $q$who-its-for$q$, $q$Who Cloudsmith is for$q$, 2, ARRAY[$q$Cloudsmith is aimed at open-source maintainers who want free public package hosting, and at enterprise teams that need a managed, secure, multi-format artifact and container registry without operating their own infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e47e77d6-8770-40cc-ad32-e7a099e5b0e2', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Nagios ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open source IT infrastructure monitoring engine for servers, networks, and applications, with a paid Nagios XI edition for enterprise dashboards.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Nagios Core is free, open source IT monitoring software for servers and networks, backed by a paid Nagios XI enterprise edition.$q$,
  og_description = $q$Nagios Core is free, open source IT monitoring software for servers and networks, backed by a paid Nagios XI enterprise edition.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6fe712b1-9844-4be1-8956-48e550068b64';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6fe712b1-9844-4be1-8956-48e550068b64' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$Plugin Architecture$q$, $q$Uses a plugin-based architecture with thousands of available community plugins, including check_ping, check_ssh, check_cpu, and check_memory.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$Cross-Platform Agent (NCPA)$q$, $q$Provides a cross-platform agent for real-time monitoring of Windows, Linux, and network systems.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$Scalability Tools$q$, $q$Includes Mod-Gearman for distributing checks across large environments.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$Configuration & Visualization Add-ons$q$, $q$Offers configuration tools and dashboard/network map add-ons.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$Nagios XI Dashboards$q$, $q$The paid Nagios XI edition adds pre-installed plugins, monitoring wizards, and enterprise dashboards.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$Nagios Core is free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$Large plugin ecosystem with thousands of community-built checks$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$25+ years of development history and enterprise adoption$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$Scalable to large environments via Mod-Gearman$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$Nagios XI pricing is not published; requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$Core's interface and configuration are less modern than newer monitoring tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$Advanced dashboards and wizards require the paid XI edition$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$Is Nagios free?$q$, $q$Nagios Core, the monitoring engine, is free and open source. Nagios XI is a paid enterprise edition.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$What's the difference between Nagios Core and Nagios XI?$q$, $q$Nagios XI adds pre-installed plugins, monitoring wizards, and dashboards on top of the free Core engine.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$Does Nagios support Windows and Linux?$q$, $q$Yes, via the cross-platform NCPA agent.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$Can Nagios scale to large environments?$q$, $q$Yes, using tools like Mod-Gearman to distribute checks.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$Monitoring on-prem infrastructure$q$, $q$Teams use Nagios Core to monitor servers, network devices, and applications for downtime.$q$, $q$System administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$Enterprise monitoring with dashboards$q$, $q$Organizations upgrade to Nagios XI for pre-built wizards and visual dashboards.$q$, $q$IT operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$Custom monitoring checks$q$, $q$Teams write or install plugins to monitor virtually any service or metric.$q$, $q$DevOps engineers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$Nagios Core$q$, $q$Free$q$, NULL, $q$["Open source monitoring engine","Plugin architecture","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$Nagios XI$q$, $q$Custom / contact sales$q$, NULL, $q$["Pre-installed plugins and monitoring wizards","Enterprise dashboards","Vendor support"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$overview$q$, $q$What is Nagios?$q$, 2, ARRAY[$q$Nagios is an IT infrastructure monitoring platform described by its maker as "the industry standard in open source IT monitoring tools." Nagios Core, the free and open source monitoring engine, watches servers, networks, applications, and services to help prevent downtime.$q$, $q$Nagios uses a plugin architecture with thousands of available community-built checks, plus a cross-platform agent (NCPA) and scalability tooling like Mod-Gearman. A paid enterprise edition, Nagios XI, adds pre-installed plugins, monitoring wizards, and dashboards on top of the free Core engine.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', $q$who-its-for$q$, $q$Who Nagios is for$q$, 2, ARRAY[$q$Nagios suits system administrators and IT operations teams that want a free, highly extensible monitoring engine, as well as enterprises that want pre-built dashboards and wizards through the paid Nagios XI edition.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6fe712b1-9844-4be1-8956-48e550068b64', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Checkmk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Unified IT monitoring platform for hybrid infrastructure with a free Community edition and paid Pro, Ultimate, and Cloud tiers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€190/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Checkmk is an IT observability platform with 2,000+ integrations, a free open source Community edition, and paid Pro/Ultimate/Cloud plans.$q$,
  og_description = $q$Checkmk is an IT observability platform with 2,000+ integrations, a free open source Community edition, and paid Pro/Ultimate/Cloud plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5beb7929-33c1-44c9-ad6b-682495b32b28';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5beb7929-33c1-44c9-ad6b-682495b32b28' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$Full-Stack Monitoring$q$, $q$Monitors servers, networks, storage, cloud workloads, containers, and applications from one interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$2,000+ Integrations$q$, $q$Offers over 2,000 integrations for infrastructure and application monitoring.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$AI-Powered Root Cause Analysis$q$, $q$Uses AI-assisted analysis to help identify the root cause of incidents.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$Automated Discovery$q$, $q$Automatically discovers hosts and services on the network.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$Dependency Mapping$q$, $q$Maps business services to the underlying infrastructure components they depend on.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$Multi-Tenancy$q$, $q$Supports data segregation for managed service providers with multiple customers.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$Free, open source Community edition supports up to roughly 100 hosts$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$2,000+ built-in integrations reduce custom setup work$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$Available both self-hosted and as managed SaaS (CloudAI)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$Used by large enterprises including Adobe, Siemens, and Volkswagen$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$Community edition is capped at roughly 100 hosts$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$Paid tiers start at €190/month and scale by host count$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$AI root cause analysis and advanced automation require paid tiers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$Is Checkmk free?$q$, $q$The Community edition is free and open source, limited to roughly 100 hosts.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$How much does Checkmk Pro cost?$q$, $q$Pro starts at €190/month billed annually, roughly €1.90 per host.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$Does Checkmk offer a cloud/SaaS option?$q$, $q$Yes, CloudAI is a fully managed SaaS edition starting at €240/month per year for around 1,000 services.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$What does Checkmk monitor?$q$, $q$Servers, networks, storage, cloud workloads, containers, and applications.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$Small infrastructure monitoring$q$, $q$Teams with up to roughly 100 hosts use the free Community edition.$q$, $q$Small IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$Hybrid cloud observability$q$, $q$Enterprises use Pro/Ultimate editions to monitor on-prem and cloud resources together.$q$, $q$Enterprise IT operations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$Managed service provider monitoring$q$, $q$MSPs use multi-tenancy features to monitor multiple customer environments from one instance.$q$, $q$Managed service providers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$Community$q$, $q$Free$q$, NULL, $q$["Up to ~100 hosts","2,000+ integrations","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$Pro$q$, $q$€190/month$q$, $q$annual$q$, $q$["Up to 1,000+ hosts","Advanced analytics and automation","Distributed monitoring","8x5 professional support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$Ultimate$q$, $q$€275/month$q$, $q$annual$q$, $q$["Full-stack observability","Advanced security and cloud integrations","10x5 support (upgradeable to 24x5)"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$CloudAI (SaaS)$q$, $q$€240/month$q$, $q$annual$q$, $q$["Fully managed, 99.5% availability","~1,000 services included","Up to 50,000 services supported"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$overview$q$, $q$What is Checkmk?$q$, 2, ARRAY[$q$Checkmk is a unified IT observability platform for monitoring hybrid and cloud environments, covering servers, networks, storage, cloud workloads, containers, and applications from a single interface. It offers over 2,000 integrations plus automated host/service discovery and dependency mapping.$q$, $q$Checkmk is available as a free, open source Community edition capped at around 100 hosts, alongside paid self-hosted Pro and Ultimate editions and a fully managed CloudAI SaaS edition. Pro starts at €190/month billed annually, and Ultimate starts at €275/month billed annually.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', $q$who-its-for$q$, $q$Who Checkmk is for$q$, 2, ARRAY[$q$Checkmk fits small IT teams monitoring a limited number of hosts on the free Community edition, as well as larger enterprises and managed service providers that need full-stack observability, multi-tenancy, and SLA-backed support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5beb7929-33c1-44c9-ad6b-682495b32b28', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── LibreNMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open source, auto-discovering network monitoring system supporting SNMP, CDP, LLDP, OSPF, and BGP across a wide range of network hardware.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$LibreNMS is a free, open source (GPLv3) network monitoring system with auto-discovery, a REST API, and native iOS/Android apps.$q$,
  og_description = $q$LibreNMS is a free, open source (GPLv3) network monitoring system with auto-discovery, a REST API, and native iOS/Android apps.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f5945274-4119-4f53-a92b-62b5b22c5045';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f5945274-4119-4f53-a92b-62b5b22c5045' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$Automatic Network Discovery$q$, $q$Discovers devices via CDP, FDP, LLDP, OSPF, BGP, SNMP, and ARP.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$Flexible Alerting$q$, $q$Sends alerts via email, IRC, Slack, and other channels.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$Full REST API$q$, $q$Provides a full API for retrieving and managing monitoring data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$Bandwidth Billing$q$, $q$Supports bandwidth billing based on port usage.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$Distributed Polling$q$, $q$Scales monitoring across multiple pollers with automatic updates.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$Native Mobile Apps$q$, $q$Offers native iOS and Android apps for monitoring on the go.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$Fully open source under GPLv3 with no paid tier$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$Actively maintained, with 173 releases and a June 2026 release$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$Broad device support (Cisco, Linux, FreeBSD, Juniper, Brocade, HP, and more)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$Native mobile apps for iOS and Android$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$Large contributor community (1,300+ contributors)$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$No official managed/hosted SaaS offering; requires self-hosting$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$PHP/MySQL stack requires manual server setup and maintenance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$No official vendor support contract mentioned$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$Is LibreNMS free?$q$, $q$Yes, LibreNMS is fully open source under GPLv3 with no paid tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$What protocols does LibreNMS use for discovery?$q$, $q$CDP, FDP, LLDP, OSPF, BGP, SNMP, and ARP.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$Does LibreNMS have mobile apps?$q$, $q$Yes, native apps are available for iOS and Android.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$How is LibreNMS deployed?$q$, $q$Self-hosted on CentOS/Ubuntu or via Docker.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$Multi-vendor network monitoring$q$, $q$Network admins monitor mixed-vendor environments including Cisco, Juniper, and HP hardware.$q$, $q$Network administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$ISP bandwidth billing$q$, $q$Service providers use port-based bandwidth billing for customer usage tracking.$q$, $q$Internet service providers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$Distributed enterprise monitoring$q$, $q$Large organizations use distributed polling to scale monitoring across many sites.$q$, $q$Enterprise network teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$overview$q$, $q$What is LibreNMS?$q$, 2, ARRAY[$q$LibreNMS is a fully featured, open source network monitoring system with automatic device discovery via CDP, FDP, LLDP, OSPF, BGP, SNMP, and ARP. It is built on a PHP/MySQL/SNMP stack and supports a wide range of network hardware and operating systems, including Cisco, Linux, FreeBSD, Juniper, Brocade, and HP.$q$, $q$The project is licensed under GPLv3, hosted on GitHub, and actively maintained, with 173 releases and over 1,300 contributors as of its most recent release. It offers a full REST API, flexible alerting (email, IRC, Slack), bandwidth billing, distributed polling, and native iOS and Android apps.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', $q$who-its-for$q$, $q$Who LibreNMS is for$q$, 2, ARRAY[$q$LibreNMS is built for network administrators and service providers who manage multi-vendor network infrastructure and want a free, self-hosted monitoring system with broad device support and an API for automation.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f5945274-4119-4f53-a92b-62b5b22c5045', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Observium ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Network monitoring platform with a free Community edition and paid Professional and Enterprise tiers for SMEs, ISPs, and enterprises.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$£250/year$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Observium monitors network devices with auto-discovery and a RESTful API, offering a free Community edition and paid Professional/Enterprise tiers.$q$,
  og_description = $q$Observium monitors network devices with auto-discovery and a RESTful API, offering a free Community edition and paid Professional/Enterprise tiers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1d389cbb-d85a-449c-bf50-4f82fcfc841f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1d389cbb-d85a-449c-bf50-4f82fcfc841f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$Automatic Discovery$q$, $q$Automatically discovers network devices and services, supporting 458+ OS types and vendors.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$Real-Time & Historical Metrics$q$, $q$Collects and displays real-time and historical performance metrics via a web interface.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$Rule-Based Grouping$q$, $q$Automatically groups devices and generates network maps using rules.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$Alerting$q$, $q$Supports threshold, state, and syslog-based alerting.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$Traffic Accounting & Billing$q$, $q$Includes a traffic accounting and billing system.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$RESTful API$q$, $q$Provides a RESTful API for external integration.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$Free Community edition available for home labs and small deployments$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$Supports 458+ OS types and device vendors$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$Professional/Enterprise tiers get faster, more frequent SVN-based updates$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$Enterprise plan includes 10 hours of support per year$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$Community edition only receives updates every 6-12 months$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$Professional (£250/year) and Enterprise (£1,500/year) plans add ongoing cost$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$Distributed under the QPL license, which is less common than typical open-source licenses$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$Is Observium free?$q$, $q$The Community edition is free under the QPL license; Professional and Enterprise are paid annual plans.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$How much does Observium Professional cost?$q$, $q$£250 per year.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$How much does Observium Enterprise cost?$q$, $q$£1,500 per year, including 10 hours of support.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$How often is Observium updated?$q$, $q$Community edition every 6-12 months; Professional/Enterprise receive daily SVN-based releases.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$Home lab monitoring$q$, $q$Hobbyists use the free Community edition to monitor home network devices.$q$, $q$Home lab users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$ISP network monitoring$q$, $q$Internet service providers use the Professional plan for device monitoring and traffic billing.$q$, $q$ISPs and SMEs$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$Large enterprise network monitoring$q$, $q$Enterprises use the Enterprise plan for broad device support and support hours.$q$, $q$Large enterprises$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$Community$q$, $q$Free$q$, NULL, $q$["458+ supported OS types/vendors","Updates every 6-12 months","QPL license"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$Professional$q$, $q$£250/year$q$, $q$annual$q$, $q$["Daily SVN-based updates","SME/ISP-focused support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$Enterprise$q$, $q$£1,500/year$q$, $q$annual$q$, $q$["Daily SVN-based updates","10 hours of support included"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$overview$q$, $q$What is Observium?$q$, 2, ARRAY[$q$Observium is a self-hosted network monitoring platform that provides real-time and historical visibility into network health and performance through automatic device discovery, metric collection, and alerting. It supports over 458 OS types and device vendors, including Cisco, Windows, Linux, HP, Juniper, Dell, and NetApp.$q$, $q$Observium's Community edition is free and distributed under the QPL open source license, receiving updates every 6-12 months. Paid Professional (£250/year) and Enterprise (£1,500/year, including 10 hours of support) editions receive daily SVN-based releases and are aimed at SMEs, ISPs, and larger enterprises.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', $q$who-its-for$q$, $q$Who Observium is for$q$, 2, ARRAY[$q$Observium suits home lab users and small deployments on the free Community edition, and SMEs, ISPs, and enterprises that need faster update cycles and support through the paid Professional and Enterprise plans.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d389cbb-d85a-449c-bf50-4f82fcfc841f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Gatus ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open source, developer-oriented health dashboard for HTTP, ICMP, TCP, and DNS checks, with an optional paid hosted version at Gatus.io.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Gatus is a free, open source (Apache 2.0) health dashboard and status page tool with 30+ alerting integrations and an optional hosted plan.$q$,
  og_description = $q$Gatus is a free, open source (Apache 2.0) health dashboard and status page tool with 30+ alerting integrations and an optional hosted plan.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Multi-Protocol Health Checks$q$, $q$Monitors services via HTTP, ICMP, TCP, and DNS queries.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Configurable Conditions$q$, $q$Evaluates checks using conditions on status codes, response time, body content, and IP validation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Extensive Alerting$q$, $q$Integrates with 30+ providers including Slack, Teams, PagerDuty, Discord, and Opsgenie, plus custom webhooks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Metrics Exposure$q$, $q$Exposes metrics for external monitoring systems.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Badge Generation$q$, $q$Generates uptime and performance badges.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Low Resource Usage$q$, $q$Designed for minimal resource consumption when self-hosted.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Free and open source under Apache 2.0, with 11.5k GitHub stars$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Supports 30+ alerting integrations out of the box$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Deployable via Docker, Kubernetes (Helm), or a standalone binary$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Optional managed/hosted version available for teams that don't want to self-host$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Hosted Gatus.io plan pricing is not fully published$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Self-hosted deployment requires operational setup and maintenance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Primarily configuration-file driven, which may require YAML familiarity$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Is Gatus free?$q$, $q$Yes, the self-hosted version is free and open source under Apache 2.0. A paid hosted version is also available at Gatus.io.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$How is Gatus deployed?$q$, $q$Via Docker, Kubernetes with Helm, or as a standalone binary when self-hosting.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$What alerting integrations does Gatus support?$q$, $q$30+ providers including Slack, Teams, PagerDuty, Discord, and custom webhooks.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Can Gatus be used for status pages?$q$, $q$Yes, it functions as a developer-oriented status page and health dashboard.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Self-hosted service monitoring$q$, $q$Teams self-host Gatus to monitor HTTP, TCP, ICMP, and DNS-based services.$q$, $q$Developers and DevOps teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Public status pages$q$, $q$Teams use Gatus to communicate service uptime and incidents to users.$q$, $q$SaaS and infrastructure teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Managed monitoring without self-hosting$q$, $q$Teams that prefer not to self-host use the Gatus.io hosted plan.$q$, $q$Smaller teams without dedicated ops resources$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Self-hosted$q$, $q$Free$q$, NULL, $q$["Full feature set","Apache 2.0 license","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$Hosted (Gatus.io)$q$, $q$Custom / see pricing page$q$, NULL, $q$["Managed hosting","No self-hosting required"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$overview$q$, $q$What is Gatus?$q$, 2, ARRAY[$q$Gatus is a developer-oriented health dashboard that monitors services through HTTP, ICMP, TCP, and DNS queries, evaluating results against configurable conditions such as status codes, response time, and body content. It is open source under the Apache 2.0 license and has over 11,000 GitHub stars.$q$, $q$It can be self-hosted via Docker, Kubernetes (Helm), or a standalone binary, and supports 30+ alerting integrations including Slack, Teams, PagerDuty, and Discord. For teams that prefer not to self-host, a managed hosted version is available at Gatus.io.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', $q$who-its-for$q$, $q$Who Gatus is for$q$, 2, ARRAY[$q$Gatus is aimed at developers and operations teams who want a lightweight, self-hostable health dashboard and status page, as well as smaller teams that prefer the managed Gatus.io hosted option instead of running their own infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a647c355-aedc-4b4f-b8fd-c2ffd96f3b9a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;


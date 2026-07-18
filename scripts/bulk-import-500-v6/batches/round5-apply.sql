-- Enrichment batch: Agenta, GoModel, Khoj, LLMKube, Onyx Community Edition, Citadel, Colanode, Digipad, Digistorm, Digiwall, egroupware, Group Office, Openmeetings, SOGo, Tine, Zimbra Collaboration, Endurain, FitTrackee, Mere Medical, OpenEMR, wger, Wingfit, admidio, Domoticz, EMQX, evcc, FHEM, FlowForge, FMD Server, Gladys, Home Assistant, ioBroker, Onloc, openHAB, OpenRemote, SIP Irrigation Control, SOLECTRUS, Tasmota, Thingsboard, WebThings Gateway, Cannery, HomeBox (SysAdminsMedia), Inventaire, Inventree, Open QuarterMaster, Part-DB, Shelf, Atomic Server, LibreKB, Chamilo LMS, edX, Gibbon, Helium, ILIAS, INGInious, Open eClass, OpenOLAT, QST, RELATE, RosarioSIS, CNCjs, Fluidd, LinuxCNC, Mainsail, Manyfold, Octoprint, AdventureLog, AirTrail, Dawarich, GraphHopper, Nominatim, Open Source Routing Machine (OSRM), OpenRouteService, OpenStreetMap, OpenTripPlanner, TileServer GL, Traccar, TRIP, Downtify, Lidarr
-- Publishes 80 bulk-imported tool(s) with full editorial content.

-- ── Agenta ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source LLMOps platform for prompt engineering, evaluation, and observability of LLM applications.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Agenta is an open-source LLMOps platform for prompt engineering, evaluation, and observability, self-hostable or available as a hosted service.$q$,
  og_description = $q$Agenta is an open-source LLMOps platform for prompt engineering, evaluation, and observability, self-hostable or available as a hosted service.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b79d9a0a-1374-4b1d-8cfb-7ea75374f391';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b79d9a0a-1374-4b1d-8cfb-7ea75374f391' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Prompt playground$q$, $q$Compare prompts and models side by side with complete version history and rollback.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Automated evaluation$q$, $q$LLM-as-a-judge, custom code evaluators, and structured test sets for regression testing prompts before release.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Human evaluation$q$, $q$Workflows for domain experts to manually review and score model outputs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Observability and tracing$q$, $q$Request-level tracing to pinpoint failure points, with live performance monitoring and regression detection.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Framework-agnostic SDK$q$, $q$Works with LangChain, LlamaIndex, the OpenAI SDK, and other stacks without vendor lock-in.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Self-hosted or cloud deployment$q$, $q$Run Agenta on your own infrastructure or use the hosted cloud.agenta.ai service.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Open-source core (MIT-licensed) that can be self-hosted for free$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Combines prompt management, evaluation, and observability in one tool instead of stitching several together$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Model- and framework-agnostic, avoiding vendor lock-in$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Generous free Hobby tier for getting started$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Higher trace volumes and enterprise controls (SOC2, SSO, RBAC) require paid Pro/Business/Enterprise plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Self-hosting requires managing your own infrastructure and updates$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Newer platform compared to established LLM observability tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Is Agenta open source?$q$, $q$Yes. Agenta's core is MIT-licensed and can be self-hosted for free; the public repositories contain no closed-source components.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$What's included in the free Hobby plan?$q$, $q$2 users, 5,000 traces per month, basic prompt management, up to 20 evaluations per month, and 30-day data retention with community support.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Can I use Agenta with any LLM provider?$q$, $q$Yes, it's model- and framework-agnostic and integrates with LangChain, LlamaIndex, the OpenAI SDK, and other tooling.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$How does Agenta pricing scale?$q$, $q$Paid tiers (Pro at $49/month, Business at $399/month) add more users, traces, retention, and enterprise security features; extra traces beyond plan limits are billed at $5 per 10,000.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Prompt engineering and versioning$q$, $q$Iterate on and track prompt changes across models with a shared playground.$q$, $q$AI product and engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Pre-release evaluation$q$, $q$Run automated and human evaluations against test sets before deploying prompt or model changes.$q$, $q$Teams shipping LLM-powered features$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Production observability$q$, $q$Trace live requests to debug failures and catch performance regressions.$q$, $q$Engineers operating LLM applications in production$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Hobby$q$, $q$Free$q$, $q$monthly$q$, $q$["2 users","5,000 traces/month","20 evaluations/month","30-day retention","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Pro$q$, $q$$49/month$q$, $q$monthly$q$, $q$["3 users","10,000 traces/month","Unlimited evaluations","90-day retention","In-app support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Business$q$, $q$$399/month$q$, $q$monthly$q$, $q$["Unlimited seats","1,000,000 traces/month","365-day retention","RBAC, SOC2, SSO, SLA"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, $q$["Dedicated support","Custom terms and audit logs","Self-hosted deployment options"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Agenta is an open-source LLMOps platform that brings prompt engineering, evaluation, and observability into one workflow for teams building applications on top of large language models. Its playground lets teams compare prompts and models side by side with full version history, so changes can be tracked and rolled back like code.$q$, $q$Beyond prompt management, Agenta provides automated evaluation (including LLM-as-a-judge and custom code evaluators), human evaluation workflows, and request tracing to catch regressions and failure points in production. The platform is model- and framework-agnostic, working with LangChain, LlamaIndex, the OpenAI SDK, and other stacks without locking teams into a single provider.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Agenta is built for AI product teams — product managers, engineers, and domain experts — who need a shared place to iterate on prompts, run evaluations before shipping, and monitor LLM behavior once it's live. It can be self-hosted for full data control or used as a managed cloud service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── GoModel ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source AI gateway that routes requests to 20+ LLM providers through one OpenAI-compatible API.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$GoModel is a free, open-source AI gateway written in Go that unifies 20+ LLM providers behind one self-hosted, OpenAI-compatible API.$q$,
  og_description = $q$GoModel is a free, open-source AI gateway written in Go that unifies 20+ LLM providers behind one self-hosted, OpenAI-compatible API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '15d61a4f-9e28-4299-9ecb-c1c0998fc971';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '15d61a4f-9e28-4299-9ecb-c1c0998fc971' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$Unified OpenAI-compatible API$q$, $q$One endpoint routes to 20+ providers including OpenAI, Anthropic, Gemini, Groq, xAI, Azure, Bedrock, and local Ollama/vLLM.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$Model aliasing$q$, $q$Create stable names (e.g. "smart-chat") that map to underlying provider models, so backends can be swapped without code changes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$Request caching$q$, $q$Exact-match and semantic caching to cut down on redundant provider calls.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$Usage and cost tracking$q$, $q$Token and dollar accounting per request, user path, and label.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$Audit logging$q$, $q$Full request traceability, including resolved routes and provider attempts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$Failover and circuit breaking$q$, $q$Automatically routes around provider outages.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$Lightweight self-hosted deployment$q$, $q$Runs as a small Docker image with an embedded admin dashboard; supports SQLite, PostgreSQL, or MongoDB storage.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$Fully free and open source under the MIT license, with no paid tiers for core functionality$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$Very small footprint — single binary, ~16 MB image, low memory use$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$Broad provider coverage including local inference runtimes$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$Built-in caching and failover can meaningfully cut API costs and downtime$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$Newer project with a smaller community and track record than established gateways like LiteLLM$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$No managed cloud offering — self-hosting and operating it is on the user$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$Advanced governance features (per-workflow policies) require configuration effort$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$Is GoModel free?$q$, $q$Yes. It's MIT-licensed and open source with no paid tiers for the core gateway.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$What LLM providers does GoModel support?$q$, $q$20+ providers including OpenAI, Anthropic, Google Gemini, Groq, xAI, Azure OpenAI, AWS Bedrock, and local runtimes like Ollama and vLLM.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$How is GoModel deployed?$q$, $q$As a single lightweight Docker image with an embedded admin dashboard; storage can be SQLite, PostgreSQL, or MongoDB.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$Is GoModel a drop-in replacement for LiteLLM?$q$, $q$It's built as an alternative, exposing an OpenAI-compatible endpoint and comparable routing/caching features.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$Multi-provider LLM routing$q$, $q$Give applications one stable API while switching or load-balancing across multiple LLM providers behind the scenes.$q$, $q$Platform and infrastructure engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$Usage-based billing for AI features$q$, $q$Track token and dollar usage per user or workflow to bill AI costs back to customers.$q$, $q$Multi-tenant SaaS platforms$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$Cost and reliability optimization$q$, $q$Reduce redundant provider calls with caching and avoid outages with automatic failover.$q$, $q$Teams running LLM features in production$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$GoModel is an open-source AI gateway written in Go that sits in front of OpenAI, Anthropic, Gemini, Groq, xAI, Azure OpenAI, AWS Bedrock, and local runtimes like Ollama and vLLM, exposing them all through a single OpenAI-compatible endpoint. It's positioned as a lightweight alternative to gateways like LiteLLM, adding model aliasing, caching, usage tracking, and audit logging on top of routing.$q$, $q$The project ships as a small single binary or Docker image (around 16 MB, roughly 37 MB RAM at runtime) with an embedded admin dashboard, and can persist state to SQLite for zero-setup use or to PostgreSQL/MongoDB for production deployments.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$GoModel targets platform and infrastructure teams that need to centralize access to multiple LLM providers — for example, multi-tenant SaaS products billing AI usage back to customers, or teams wanting cost control through caching, failover, and per-user usage attribution.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('15d61a4f-9e28-4299-9ecb-c1c0998fc971', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Khoj ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hostable AI assistant that answers questions from your documents, the web, and custom agents.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Khoj is an open-source, self-hostable AI assistant that searches your documents and the web, builds custom agents, and works with local or cloud LLMs.$q$,
  og_description = $q$Khoj is an open-source, self-hostable AI assistant that searches your documents and the web, builds custom agents, and works with local or cloud LLMs.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '78732199-bee3-492f-a014-b27c713b3691';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '78732199-bee3-492f-a014-b27c713b3691' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$Document search and RAG$q$, $q$Retrieves answers from a user's PDFs, Markdown notes, and GitHub repositories using retrieval-augmented generation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$Bring-your-own model$q$, $q$Works with cloud models (GPT, Claude, Gemini) or local/open models (Llama, Qwen, Mistral).$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$Custom agents$q$, $q$Build specialized assistants configured for specific tasks or knowledge domains.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$Scheduled automations$q$, $q$Set up recurring research or task-tracking jobs the assistant runs automatically.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$Web search integration$q$, $q$Pulls in live web results alongside personal document search.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$Self-hostable$q$, $q$Runs entirely on a user's own machine or server for full data control, or via the hosted cloud app.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$Open source and self-hostable, giving full control over data and models$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$Works with a wide range of both cloud and local LLMs$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$Free tier and free self-hosting available to get started$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$Active open-source community and development on GitHub$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$Higher upload limits and access to premium models require a paid cloud subscription$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$Self-hosting requires technical setup and infrastructure$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$Some advanced features (e.g. desktop research co-worker) are in beta$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$Is Khoj free?$q$, $q$Yes, there is a free tier on the hosted cloud app, and self-hosting Khoj is free since it's open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$Can I self-host Khoj?$q$, $q$Yes. Khoj is open source and designed to run on your own hardware, in addition to the hosted cloud app.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$What LLMs does Khoj support?$q$, $q$Both cloud models (OpenAI, Anthropic, Gemini) and local/open models (Llama, Qwen, Mistral, and others).$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$Does Khoj work with my own documents?$q$, $q$Yes, it uses retrieval-augmented generation to search and answer from uploaded PDFs, Markdown notes, and connected repositories.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$Personal knowledge base search$q$, $q$Ask natural-language questions over your own notes, PDFs, and repositories.$q$, $q$Researchers and knowledge workers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$Custom AI agents$q$, $q$Build task- or domain-specific assistants for recurring research or automation needs.$q$, $q$Individuals and small teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$Privacy-first AI assistant$q$, $q$Run the assistant entirely on your own infrastructure with local models.$q$, $q$Privacy-conscious users and self-hosters$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Khoj is an open-source, self-hostable AI assistant built to be understandable, hackable, and run under the user's own control. It uses retrieval-augmented generation to answer questions from a user's own files — PDFs, Markdown notes, GitHub repositories, and more — as well as from live web search.$q$, $q$Khoj can turn any online or local model (GPT, Claude, Gemini, Llama, Qwen, Mistral, and others) into a personal assistant, and supports building custom agents and scheduling recurring automations and research tasks. It's available as a free cloud app, a self-hosted deployment, or a hybrid of both.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('78732199-bee3-492f-a014-b27c713b3691', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Khoj suits researchers, knowledge workers, and privacy-conscious individuals who want an AI assistant that can search their own documents and be self-hosted rather than relying entirely on a third-party cloud service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('78732199-bee3-492f-a014-b27c713b3691', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('78732199-bee3-492f-a014-b27c713b3691', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('78732199-bee3-492f-a014-b27c713b3691', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('78732199-bee3-492f-a014-b27c713b3691', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── LLMKube ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source Kubernetes operator for deploying and autoscaling self-hosted LLM inference across GPU fleets.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$LLMKube is an open-source Kubernetes operator for deploying, autoscaling, and monitoring self-hosted LLM inference across NVIDIA, AMD, and Apple Silicon GPUs.$q$,
  og_description = $q$LLMKube is an open-source Kubernetes operator for deploying, autoscaling, and monitoring self-hosted LLM inference across NVIDIA, AMD, and Apple Silicon GPUs.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9428b91f-6588-4b7f-9850-7d2b5813f72a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9428b91f-6588-4b7f-9850-7d2b5813f72a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$Kubernetes operator$q$, $q$Deploy LLM inference services declaratively via YAML instead of hand-managing pods and scaling.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$Multi-runtime support$q$, $q$Choose llama.cpp, vLLM, TGI, mlx-server, or bring your own container.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$Heterogeneous GPU support$q$, $q$Runs across NVIDIA CUDA, AMD Vulkan, and Apple Silicon Metal hardware in the same fleet.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$Metric-driven autoscaling$q$, $q$Scales pods based on actual inference load rather than generic CPU/memory metrics.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$GPU memory optimization$q$, $q$Layer offloading and custom sharding to fit larger models on available hardware.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$Built-in monitoring$q$, $q$Grafana dashboards for inference performance out of the box.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$OpenAI-compatible API$q$, $q$Exposes deployed models through a standard OpenAI-compatible endpoint.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$Fully open source under Apache 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$Keeps inference entirely on your own infrastructure — nothing sent to external providers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$Supports mixed GPU hardware (NVIDIA, AMD, Apple Silicon) in a single deployment$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$Production-oriented autoscaling and monitoring, not just a single-node script$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$Requires existing Kubernetes infrastructure and expertise to use$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$Young, community-driven project without an established enterprise track record$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$Not aimed at non-technical users or simple single-machine setups$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$Is LLMKube free?$q$, $q$Yes, it's open source under the Apache 2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$Does LLMKube require Kubernetes?$q$, $q$Yes, it's built as a Kubernetes operator and assumes an existing cluster.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$What inference engines does it support?$q$, $q$llama.cpp, vLLM, TGI, mlx-server, and custom inference containers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$Can it run on Apple Silicon?$q$, $q$Yes, via a native Metal agent that runs llama-server on macOS with GPU access and registers back into the Kubernetes cluster.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$Scaled self-hosted LLM inference$q$, $q$Move beyond a single prototype machine to production-grade, autoscaled LLM inference on Kubernetes.$q$, $q$Platform and infrastructure engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$Mixed-hardware GPU fleets$q$, $q$Run inference across a combination of NVIDIA, AMD, and Apple Silicon machines under one operator.$q$, $q$Teams with heterogeneous existing hardware$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$Air-gapped or security-sensitive deployments$q$, $q$Keep model inference entirely on-premises with no external API calls.$q$, $q$Regulated or security-conscious organizations$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$LLMKube is an Apache 2.0-licensed Kubernetes operator that turns self-hosted LLM inference into a declarative YAML deployment. It handles downloading and caching models, GPU scheduling, health checks, autoscaling, and exposing an OpenAI-compatible API, across a mix of NVIDIA CUDA, AMD Vulkan, and Apple Silicon Metal hardware.$q$, $q$It supports multiple inference runtimes — llama.cpp, vLLM, TGI, mlx-server, or custom containers — with autoscaling driven by real inference metrics rather than generic CPU usage, plus GPU memory optimization (layer offloading, custom sharding) and built-in Grafana dashboards for monitoring. An optional add-on called Foreman can dispatch coder, verifier, and reviewer agents across the fleet of locally hosted models.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$LLMKube is aimed at infrastructure and platform teams already running Kubernetes who want to scale self-hosted LLM inference beyond a single prototype box, including air-gapped or security-sensitive environments where inference must stay on-premises.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9428b91f-6588-4b7f-9850-7d2b5813f72a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Onyx Community Edition ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hostable AI chat platform with RAG over internal documents and connectors to workplace apps.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Onyx Community Edition is a free, open-source, self-hostable AI chat platform with RAG over internal documents and connectors to workplace apps.$q$,
  og_description = $q$Onyx Community Edition is a free, open-source, self-hostable AI chat platform with RAG over internal documents and connectors to workplace apps.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$RAG-based chat$q$, $q$Hybrid search, advanced retrieval, and knowledge-graph techniques to answer questions from internal documents.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$Deep research and code interpreter$q$, $q$Chat modes that go beyond simple Q&A, including running code and multi-step research.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$MCP support$q$, $q$Connects to tools and data sources via the Model Context Protocol.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$Workplace connectors$q$, $q$Plug-and-play connectors to workplace apps that sync in real time while respecting each source's access permissions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$Chat sharing and analytics$q$, $q$Share conversations, collect user feedback, and review usage analytics.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$Standard and Lite deployment modes$q$, $q$Run the full stack or a lightweight chat UI mode that needs under 1GB of memory.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$Model-agnostic$q$, $q$Works with any LLM the operator connects, rather than being tied to one provider.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$MIT-licensed Community Edition is fully free to self-host$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$Respects source-application permissions when indexing connected data$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$Large, active open-source community (20,000+ GitHub stars)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$Works with any LLM rather than locking users into one provider$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$Advanced enterprise controls are reserved for the separate Enterprise Edition or managed cloud$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$Self-hosting a RAG platform with multiple connectors requires meaningful infrastructure investment$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$Some documentation and features assume familiarity with Kubernetes/Docker deployments$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$Is Onyx Community Edition free?$q$, $q$Yes, it's MIT-licensed and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$What's the difference between Community Edition and Enterprise Edition?$q$, $q$Enterprise Edition adds features aimed at larger organizations on top of the free Community Edition core.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$Can Onyx connect to my company's apps?$q$, $q$Yes, via connectors that sync documents from workplace apps while respecting their existing access permissions.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$Does Onyx work with any LLM?$q$, $q$Yes, it's designed to work with the LLM providers you connect rather than being tied to a single model.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$Internal knowledge search$q$, $q$Let employees ask natural-language questions across company documents and connected apps.$q$, $q$Engineering, support, and operations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$Self-hosted AI assistant$q$, $q$Deploy an in-house AI chat platform with full control over data and infrastructure.$q$, $q$Organizations prioritizing data security$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$Developer-focused AI chat$q$, $q$Use deep research, code interpreter, and web search modes for technical workflows.$q$, $q$Engineering teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Onyx (formerly Danswer) is an AI platform that connects generative AI chat to a team's internal documents, applications, and knowledge. The Community Edition is MIT-licensed and free to self-host, covering the core chat, retrieval-augmented generation, agent, and action features.$q$, $q$Onyx combines hybrid search, advanced RAG, contextual retrieval, and LLM-based knowledge graphs with plug-and-play connectors that sync from workplace apps in real time while respecting each source's existing access permissions. It supports deep research, a code interpreter, web search, and MCP (Model Context Protocol), and can be deployed in a full-featured "standard" mode or a lighter-weight "lite" mode that runs under 1GB of memory.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Onyx Community Edition suits engineering, support, and operations teams that want an internal AI assistant grounded in their own documents and tools, with the option to keep everything self-hosted for full data control. A separate managed cloud and Enterprise Edition are available for organizations that want a hosted service or additional enterprise-grade controls.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8c9db3fe-4234-4a92-8ea5-cf2dfcc5376c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Citadel ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source self-hosted groupware suite combining email, chat, forums, calendar, and wiki in one server.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 1987,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Citadel is a free, open-source self-hosted groupware suite combining email, calendar, chat, forums, and wiki in a single rooms-based server.$q$,
  og_description = $q$Citadel is a free, open-source self-hosted groupware suite combining email, calendar, chat, forums, and wiki in a single rooms-based server.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fdeb2872-5b58-466b-b859-445bc95577f4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fdeb2872-5b58-466b-b859-445bc95577f4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$Rooms-based architecture$q$, $q$Each room can function as an email folder, forum, chat, calendar, address book, or RSS reader.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$Full email server$q$, $q$Built-in SMTP, IMAP, POP3, and Sieve mail filtering.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$GroupDAV support$q$, $q$Shared calendars and contacts compatible with standard PIM clients.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$WebCit web interface$q$, $q$AJAX-style browser interface alongside a classic text/telnet BBS interface.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$Multi-domain support$q$, $q$Serve multiple mail/web domains from a single Citadel install.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$Encrypted protocols$q$, $q$OpenSSL encryption across all supported protocols.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$Lightweight C implementation$q$, $q$Designed to run efficiently, with setup possible in minutes on your own hardware or in the cloud.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$Completely free with full functionality — not a stripped-down edition meant to upsell a paid tier$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$Long-running project with roots dating back to 1987$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$Combines email, chat, calendar, forums, and wiki-style rooms in a single self-hosted server$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$Lightweight C codebase suited to modest hardware$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$Interface and overall UX feel dated compared to modern groupware products$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$Smaller active community than newer self-hosted collaboration tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$Setup and administration assume familiarity with mail server concepts (SMTP/IMAP/DNS)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$Is Citadel really free?$q$, $q$Yes, it's GPL-licensed open source software with full functionality and no paid upsell tiers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$Can Citadel replace Microsoft Exchange?$q$, $q$It's positioned by its developers as a self-hosted alternative offering email, shared calendars, and groupware features.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$What protocols does Citadel support?$q$, $q$SMTP, IMAP, POP3, Sieve, and GroupDAV, all with OpenSSL encryption.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$How do users access Citadel?$q$, $q$Through its own WebCit AJAX web interface, a text/telnet BBS interface, or standard email/calendar clients.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$Self-hosted email and groupware server$q$, $q$Run email, calendars, and contacts for an organization without proprietary licensing.$q$, $q$Small organizations and sysadmins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$Combined forum, mailing list, and chat platform$q$, $q$Use rooms to host discussion forums, mailing lists, and real-time chat for a community.$q$, $q$Community and hobbyist server operators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$Lightweight all-in-one collaboration server$q$, $q$Deploy a single low-resource server that covers mail, calendar, and messaging.$q$, $q$Self-hosters with limited hardware$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Citadel (Citadel/UX) is a self-hosted, GPL-licensed groupware and messaging suite descended from the original Citadel bulletin-board-system family of software, with a project history dating back to 1987. It's built around a "rooms" architecture, where each room can act as an email folder, discussion forum, real-time chat, mailing list, calendar, address book, or RSS reader — or several of these at once.$q$, $q$Citadel implements standard internet protocols — SMTP, IMAP, POP3, Sieve mail filtering, and GroupDAV for shared calendars and contacts — all with OpenSSL encryption, and it's written in C for a small resource footprint. It can be accessed through its own AJAX-style web interface (WebCit), a text/telnet BBS-style interface, or standard email/calendar clients, and supports multiple domains on a single install.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Citadel suits sysadmins and organizations that want a self-hosted, all-in-one alternative to proprietary email and groupware servers (such as Microsoft Exchange), without licensing costs or feature-gated free tiers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fdeb2872-5b58-466b-b859-445bc95577f4', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Colanode ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, local-first Slack and Notion alternative with chat, docs, and databases, self-hostable or cloud.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Colanode is an open-source, local-first Slack and Notion alternative with chat, docs, and databases—self-hostable or via a free-beta managed cloud.$q$,
  og_description = $q$Colanode is an open-source, local-first Slack and Notion alternative with chat, docs, and databases—self-hostable or via a free-beta managed cloud.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3c831cf1-d2a5-44c9-9cea-c5206afcba70';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3c831cf1-d2a5-44c9-9cea-c5206afcba70' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Real-time chat$q$, $q$Direct messages and channel-based conversations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Rich-text pages and wiki$q$, $q$Document and note creation similar to a Notion-style wiki.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Structured databases$q$, $q$Custom fields with table, kanban, and calendar views.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$File storage$q$, $q$Upload and manage files within workspaces.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Local-first sync via CRDTs$q$, $q$Data saves to the device first and syncs conflict-free, keeping the app usable offline.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Self-hosted or managed cloud$q$, $q$Deploy via Docker Compose/Kubernetes Helm charts, or use the managed cloud (currently free beta).$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Cross-platform clients$q$, $q$Web PWA, Electron desktop app (macOS, Windows, Ubuntu), and an iOS mobile app sharing the same codebase.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Open source and self-hostable for full data ownership$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Local-first design keeps the app working offline and syncing without conflicts$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Combines chat, docs, and databases in one workspace instead of separate tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Native clients across web, desktop, and mobile$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Managed cloud pricing isn't finalized yet — it's free during the current beta$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Self-hosting requires running PostgreSQL, Redis/Valkey, and a storage backend yourself$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Confirmed mobile support is iOS; Android availability is not documented on official channels$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Is Colanode free?$q$, $q$Self-hosting is free. The managed cloud is currently free during its beta, with pricing to be announced later.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Can I self-host Colanode?$q$, $q$Yes, Docker Compose files and Kubernetes Helm charts are provided for self-hosting.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$What does "local-first" mean for Colanode?$q$, $q$Data is saved to your device first and then synced to other devices/collaborators via CRDTs, so the app keeps working offline.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Is Colanode fully open source?$q$, $q$Yes, the project is published on GitHub as open source.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Self-hosted team chat$q$, $q$Replace Slack with a self-hosted, real-time chat and channels tool.$q$, $q$Teams wanting full data ownership$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Notion-style workspace$q$, $q$Build wikis, notes, and structured databases with multiple views for project tracking.$q$, $q$Teams organizing docs and structured data$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Offline-capable collaboration$q$, $q$Keep working and editing content without a live internet connection thanks to local-first sync.$q$, $q$Distributed or field teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Self-Hosted$q$, $q$Free$q$, $q$n/a$q$, $q$["Unlimited users","Full feature set","You manage your own PostgreSQL/Redis/storage infrastructure"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$Cloud (Beta)$q$, $q$Free during beta$q$, $q$n/a$q$, $q$["Managed hosting in EU or US region","Unlimited users","Pricing to be announced after beta"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Colanode is an open-source collaboration workspace that combines real-time chat, rich-text pages, and structured databases — positioned as a Slack and Notion alternative that puts data ownership back with the user. It's built local-first: data saves to the user's device first and syncs afterward using CRDTs (Conflict-free Replicated Data Types), so multiple people can edit without conflicts and the app keeps working offline.$q$, $q$Teams can self-host Colanode using the provided Docker Compose files or Kubernetes Helm charts (it needs PostgreSQL, Redis or Valkey, and a storage backend), or use the managed cloud, which is currently in a free beta with EU and US hosting regions. Clients include a web PWA, an Electron desktop app for macOS, Windows, and Ubuntu, and an iOS mobile app — all sharing the same underlying code.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Colanode is aimed at teams that want a Slack- and Notion-style workspace but with full control over their data, either by self-hosting or by using a managed cloud they trust, and that value offline-capable, local-first software.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c831cf1-d2a5-44c9-9cea-c5206afcba70', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;

-- ── Digipad ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source collaborative multimedia wall tool from La Digitale, an alternative to Padlet.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$Spanish$q$, $q$Italian$q$]::text[],
  seo_meta_description = $q$Digipad is a free, open-source collaborative multimedia wall tool from La Digitale, a no-signup, open alternative to Padlet.$q$,
  og_description = $q$Digipad is a free, open-source collaborative multimedia wall tool from La Digitale, a no-signup, open alternative to Padlet.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$Collaborative multimedia walls$q$, $q$Combine text, images, video, links, and files on a shared board.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$No sign-in required$q$, $q$Participants can contribute to a wall without creating an account.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$Unlimited walls$q$, $q$No cap on the number of pads that can be created.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$Real-time collaboration$q$, $q$Contributions from multiple participants appear live.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$Open source$q$, $q$AGPLv3-licensed with source code available on Codeberg.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$Multi-language interface$q$, $q$Available in French, English, Spanish, and Italian.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$Completely free with no usage caps or paid tiers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$No account required for participants to contribute$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$Open source and privacy-conscious (Swiss/GDPR-oriented hosting)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$Simple, focused interface$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$Geared toward education use cases rather than enterprise collaboration$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$Narrower feature set than commercial competitors like Padlet$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$Maintained by a small team, funded via donations rather than a company$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$Is Digipad really free?$q$, $q$Yes, there are no paid tiers; the project is funded through donations and crowdfunding.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$Do participants need an account?$q$, $q$No, contributors can add to a wall without signing in.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$Is Digipad open source?$q$, $q$Yes, it's AGPLv3-licensed with source code on Codeberg.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$Is there a limit on how many walls I can create?$q$, $q$No, there's no limit on the number of pads/walls.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$Classroom collaboration walls$q$, $q$Gather student contributions, resources, and brainstorms on a shared board.$q$, $q$Teachers and students$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$Remote team boards$q$, $q$Use a shared multimedia wall for lightweight remote or hybrid team collaboration.$q$, $q$Small teams and workshop facilitators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$Free Padlet alternative$q$, $q$Replace a paid Padlet subscription with a free, open-source equivalent.$q$, $q$Budget-conscious educators and teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Digipad, from the French nonprofit-style project La Digitale, lets people create collaborative multimedia walls for in-person classes, virtual sessions, or remote teamwork — text, images, video, links, and files can all be added to a shared board in real time. It's positioned as a free, open-source alternative to Padlet: no participant sign-in is required, and there's no limit on how many walls can be created.$q$, $q$The application is AGPLv3-licensed with source code published on Codeberg, is available in French, English, Spanish, and Italian, and is funded through donations and crowdfunding rather than a subscription model. Hosting runs in Switzerland on renewable-energy-powered data centers with a GDPR-conscious posture.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Digipad is designed primarily for teachers and students needing a free Padlet-style tool for classroom or remote-learning activities, but it works equally well for any small team wanting a lightweight, no-signup collaborative content wall.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa1eddeb-7917-4f4d-ba86-efb4ac29e2dc', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Digistorm ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source tool from La Digitale for running live polls, brainstorms, quizzes, and word clouds.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$]::text[],
  seo_meta_description = $q$Digistorm is a free, open-source tool from La Digitale for running live brainstorms, polls, quizzes, and word clouds without participant sign-up.$q$,
  og_description = $q$Digistorm is a free, open-source tool from La Digitale for running live brainstorms, polls, quizzes, and word clouds without participant sign-up.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '36a13fec-4212-4e84-87b2-11cac8bee967';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '36a13fec-4212-4e84-87b2-11cac8bee967' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$Live brainstorming sessions$q$, $q$Participants submit ideas that can be moved and reorganized in real time.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$Polls and questionnaires$q$, $q$Create surveys and quizzes for a group to respond to live.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$Word clouds$q$, $q$Generate word clouds from participant input.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$No-account participation$q$, $q$Join a session via a link or access code without creating an account.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$Reusable host sessions$q$, $q$An optional free host account lets facilitators reuse categories across sessions.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$PDF export$q$, $q$Export session results and ideas as a PDF.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$Open source$q$, $q$Source code published on Codeberg and GitLab.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$Completely free with no paid plans$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$No sign-in required for participants$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$Privacy-conscious — doesn't collect participant personal data$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$Open source and self-hostable via its published source$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$Geared toward education/training use rather than large-scale enterprise polling$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$Narrower feature set than dedicated commercial polling platforms$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$Maintained by a small volunteer-driven team$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$Is Digistorm free?$q$, $q$Yes, there are no paid plans.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$Do participants need an account?$q$, $q$No, participants join via a link or access code without signing up.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$Can sessions be reused?$q$, $q$Yes, with an optional free host account, facilitators can reuse the same categories across sessions.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$Is Digistorm open source?$q$, $q$Yes, its source code is available on Codeberg and GitLab.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$Classroom or workshop brainstorming$q$, $q$Run live idea-gathering sessions where participants contribute anonymously.$q$, $q$Teachers and workshop facilitators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$Live polls and quizzes$q$, $q$Collect real-time responses from a group during training or teaching sessions.$q$, $q$Trainers and educators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$Anonymous feedback collection$q$, $q$Gather word-cloud-style feedback without requiring participant sign-up.$q$, $q$Facilitators seeking quick, private feedback$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Digistorm, part of the La Digitale suite of free education tools, is an online application for running live surveys, questionnaires, collaborative brainstorming sessions, and word clouds. Participants join through a link or an access code without creating an account or sharing personal information, and each person sees only their own responses until results are revealed, which keeps input independent and uninfluenced by others.$q$, $q$Ideas gathered during a session can be reorganized in real time and exported as PDF. An optional free host account lets facilitators reuse the same categories across multiple sessions. The project is credited to Emmanuel Zimmert with support from the AFT-RN network, and its source is published on Codeberg and GitLab.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Digistorm is built for teachers, trainers, and facilitators who need a quick, privacy-conscious way to run live brainstorms, polls, or quizzes with a group, without asking participants to sign up.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('36a13fec-4212-4e84-87b2-11cac8bee967', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Digiwall ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source tool from La Digitale for building collaborative multimedia walls, an evolution of Digipad.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$]::text[],
  seo_meta_description = $q$Digiwall is a free, open-source collaborative multimedia wall tool from La Digitale, an evolution of Digipad with extra media block types.$q$,
  og_description = $q$Digiwall is a free, open-source collaborative multimedia wall tool from La Digitale, an evolution of Digipad with extra media block types.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '08388501-9b47-462d-b036-ddaf4b02c5a5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '08388501-9b47-462d-b036-ddaf4b02c5a5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$Collaborative multimedia walls$q$, $q$Build shared boards combining text, images, video, and links.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$Expanded content blocks$q$, $q$Additional block formats such as photo galleries, standalone images, and audio, beyond what Digipad offers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$No sign-in required$q$, $q$Participants can contribute without creating an account.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$Digidrive integration$q$, $q$Content created in Digiwall can be managed through La Digitale's central Digidrive dashboard.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$Open source$q$, $q$AGPLv3-licensed with source code available on Codeberg.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$Completely free with no paid tiers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$No account required for participants$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$Open source, with additional media block types compared to Digipad$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$Privacy-conscious, donation-funded project$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$Functional overlap with Digipad from the same maker may cause confusion about which tool to use$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$Geared toward education use cases rather than enterprise collaboration$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$Maintained by a small volunteer-driven team$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$Is Digiwall really free?$q$, $q$Yes, it's free and open source, funded by donations rather than subscriptions.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$How is Digiwall different from Digipad?$q$, $q$La Digitale describes Digiwall as an evolution of Digipad that adds new content block formats, such as photo galleries and audio.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$Do participants need an account?$q$, $q$No, contributors can add to a wall without signing in.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$Is Digiwall open source?$q$, $q$Yes, it's AGPLv3-licensed with source code on Codeberg.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$Classroom collaboration walls$q$, $q$Gather multimedia contributions from students or workshop participants on a shared board.$q$, $q$Teachers and students$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$Rich-media content boards$q$, $q$Use the expanded photo gallery and audio block types for richer collaborative content.$q$, $q$Educators wanting more media formats than a basic wall$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$Free Padlet-style alternative$q$, $q$Use as a no-cost, open-source substitute for commercial wall tools.$q$, $q$Budget-conscious educators and teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Digiwall is another free, open-source collaborative wall tool from La Digitale, the French project behind Digipad and Digistorm. It's described by La Digitale as an evolution of Digipad, adding new content-block formats (such as photo galleries, standalone images, and audio) on top of the same basic idea of a shared multimedia board.$q$, $q$Like the rest of the La Digitale suite, Digiwall is AGPLv3-licensed with its source code published on Codeberg, and it's tied into Digidrive, La Digitale's central dashboard for managing content created across its tools. It's funded through donations rather than subscriptions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Digiwall suits the same audience as Digipad — teachers, students, and small teams wanting a free, no-signup collaborative wall — for users who want its expanded media block types or who access it through Digidrive.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08388501-9b47-462d-b036-ddaf4b02c5a5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── egroupware ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source groupware suite combining email, calendar, CRM, file sharing, and team chat for self-hosted deployment.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Germany$q$,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$EGroupware is an open-source groupware suite with email, calendar, CRM, and file sharing, self-hosted for full data control.$q$,
  og_description = $q$EGroupware is an open-source groupware suite with email, calendar, CRM, and file sharing, self-hosted for full data control.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e78263bf-152d-483f-a33a-9b78428215b6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e78263bf-152d-483f-a33a-9b78428215b6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$Calendar & scheduling$q$, $q$Appointment management with reminders and resource booking for meeting rooms and equipment.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$Integrated email client$q$, $q$Webmail linked directly to contacts, calendar entries, and shared files.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$Contact management & CRM$q$, $q$Shared address books and customer relationship tracking for sales and support teams.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$File management$q$, $q$Secure document storage with granular, per-user and per-group permissions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$Chat & video conferencing$q$, $q$Team messaging plus video calls via Jitsi or BigBlueButton integration.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$Collaborative document editing$q$, $q$Real-time co-editing of office documents through a Collabora Online integration.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$Kanban boards & helpdesk$q$, $q$Project boards and a ticketing module for support and task workflows.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$AI-assisted search and text tools$q$, $q$Hybrid full-text and RAG search plus AI helpers for email and text fields, introduced in newer versions.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$Free, self-hosted Community Edition with full data control$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$Broad all-in-one feature set covering email, CRM, files, and chat$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$German-based vendor emphasizing data sovereignty$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$Mobile apps available alongside the web interface$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$Advanced support and some modules require the paid EPL edition or a cloud plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$Self-hosting requires ongoing server administration$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$Newer AI and e-invoicing features are still maturing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$Is EGroupware free?$q$, $q$The Community Edition is free and open source for self-hosting. A paid Enterprise Public License edition and hosted cloud plans add support and extra features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$Can EGroupware be used on mobile devices?$q$, $q$Yes, it offers a responsive web interface along with mobile apps for smartphones and tablets.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$Who develops EGroupware?$q$, $q$EGroupware GmbH, a Germany-based company, develops, hosts, and supports the platform.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$Does EGroupware include AI features?$q$, $q$Recent versions add AI-assisted hybrid search and AI tools for composing email and text content.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$Self-hosted office replacement$q$, $q$Organizations replacing Microsoft 365 or Google Workspace with an on-premises suite.$q$, $q$SMEs and public sector teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$Data-sovereign collaboration$q$, $q$Teams that must keep email, files, and CRM data within their own or EU infrastructure.$q$, $q$Government and regulated organizations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$Community Edition$q$, $q$Free$q$, $q$N/A$q$, $q$["Self-hosted install","Core groupware modules","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$Enterprise (EPL) / Cloud$q$, $q$Contact sales$q$, $q$Annual$q$, $q$["Vendor support","Additional modules","Optional cloud hosting"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$EGroupware is an open-source collaboration platform built around email, calendar, contacts, file management, and CRM. It positions itself as an alternative to hosted office suites for organizations that want to keep their data on their own servers.$q$, $q$The Community Edition is free and self-hosted, while EGroupware GmbH, the German company behind the project, also sells a paid Enterprise Public License (EPL) edition and cloud-hosted plans that add support and extra modules such as e-invoicing (XRechnung/ZUGFeRD) and hybrid full-text/RAG search.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$EGroupware targets SMEs, government agencies, and educational institutions that need an integrated communication and project suite while keeping infrastructure under their own control, particularly in markets where data sovereignty is a priority.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e78263bf-152d-483f-a33a-9b78428215b6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Group Office ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source groupware and CRM platform for email, calendar, files, and business collaboration, self-hosted or hosted online.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$'s-Hertogenbosch, Netherlands$q$,
  languages = ARRAY[$q$English$q$, $q$Dutch$q$]::text[],
  seo_meta_description = $q$Group-Office is an open-source groupware and CRM platform for email, calendar, files, and projects, self-hosted or hosted online.$q$,
  og_description = $q$Group-Office is an open-source groupware and CRM platform for email, calendar, files, and projects, self-hosted or hosted online.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '75c612e3-c807-4326-9997-c8d5eb872687';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '75c612e3-c807-4326-9997-c8d5eb872687' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$Document co-editing$q$, $q$Real-time collaborative editing alongside meeting scheduling and chat.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$CRM & email marketing$q$, $q$Contact management, sales pipeline, and email marketing tools.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$Project management$q$, $q$Asset storage, time tracking, cost monitoring, and progress tracking per project.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$File management$q$, $q$Secure storage, sharing, and template-based collaborative editing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$Studio module builder$q$, $q$Create custom business apps and modules directly inside Group-Office.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$Cross-device sync$q$, $q$IMAP, ActiveSync, CalDAV, CardDAV, and WebDAV support for iOS, macOS, Android, and Windows.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$Free, self-hosted Community Edition$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$Open protocol sync across iOS, macOS, Android, and Windows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$Combines groupware and CRM in one product$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$Extendable through the built-in Studio module builder$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$Hosted Online Edition pricing is not published on the website$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$Self-hosting requires server setup and maintenance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$Smaller ecosystem and community than major SaaS collaboration suites$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$Is Group-Office free?$q$, $q$The Community Edition is free and open source for self-hosting. A hosted Online Edition with a free trial is also available.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$Does Group-Office sync with mobile devices?$q$, $q$Yes, via open protocols including ActiveSync, CalDAV, CardDAV, and WebDAV on iOS, macOS, Android, and Windows.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$Who makes Group-Office?$q$, $q$Intermesh BV, a company headquartered in 's-Hertogenbosch, Netherlands.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$Can I build custom features in Group-Office?$q$, $q$Yes, the Studio feature lets administrators create custom modules within the platform.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$Self-hosted groupware + CRM$q$, $q$SMBs wanting one open-source system for email, calendar, and customer management.$q$, $q$Small and mid-size businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$Custom business apps$q$, $q$Teams building bespoke workflow tools on top of Group-Office using Studio.$q$, $q$Agencies and internal IT teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$Community Edition$q$, $q$Free$q$, $q$N/A$q$, $q$["Self-hosted install","Full source access","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$Online Edition$q$, $q$Free trial, then contact sales$q$, $q$Monthly$q$, $q$["Hosted by Intermesh","Daily backups","99.9% uptime target"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Group-Office is an open-source groupware and CRM platform from Intermesh BV, a company based in 's-Hertogenbosch, Netherlands. It bundles email, calendar, contacts, CRM, file sharing, and project management into a single web interface.$q$, $q$It syncs with desktop and mobile devices over open protocols (IMAP, Microsoft ActiveSync, CalDAV, CardDAV, and WebDAV), and its Studio feature lets administrators build custom modules without external development tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$The platform suits privacy-focused businesses that want on-premises or European-hosted collaboration and CRM, with the option to extend the system for their own workflows via Studio.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75c612e3-c807-4326-9997-c8d5eb872687', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Openmeetings ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source video conferencing platform with whiteboard, screen sharing, and recording, developed by the Apache Software Foundation.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Apache OpenMeetings is a free, open-source, self-hosted video conferencing platform with whiteboard, recording, and file sharing.$q$,
  og_description = $q$Apache OpenMeetings is a free, open-source, self-hosted video conferencing platform with whiteboard, recording, and file sharing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '02606861-acdd-47b6-b630-9860c5848608';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '02606861-acdd-47b6-b630-9860c5848608' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$Video/audio conferencing$q$, $q$Audio+video, audio-only, video-only, or picture-only modes with adjustable quality.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$Interactive whiteboard$q$, $q$Multiple whiteboard instances supporting drawing and import of PDF, DOC, ODT, and PPT files.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$Screen sharing & recording$q$, $q$Record sessions and download them as MP4 files.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$File explorer$q$, $q$Drag-and-drop file management with private and public drive areas.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$Calendar & invitations$q$, $q$Schedule meetings and send secure invitation links.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$Polls & moderation$q$, $q$Create polls/surveys and manage granular moderator permissions.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$Completely free under the Apache License$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$Self-hosted for full control over meeting data$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$Combines video, whiteboard, recording, and file sharing in one server$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$Runs in the browser via HTML5, no plugin required$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$Requires self-hosting and Kurento media server configuration$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$No official native mobile apps (browser-based access only)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$Smaller community and slower release cadence than commercial video platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$Is Apache OpenMeetings free?$q$, $q$Yes, it is fully open source and free under the Apache License with no paid tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$Who maintains OpenMeetings?$q$, $q$It is a project of the Apache Software Foundation, maintained by its open-source community.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$Can I self-host OpenMeetings?$q$, $q$Yes, it is designed to be deployed on your own servers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$Does OpenMeetings support recording?$q$, $q$Yes, sessions can be recorded and downloaded as MP4 files.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$Self-hosted webinars and classes$q$, $q$Educational institutions running online lessons without a commercial video vendor.$q$, $q$Schools and training organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$Internal video conferencing$q$, $q$Organizations that need meeting infrastructure they fully control and host.$q$, $q$IT teams and privacy-focused organizations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Apache OpenMeetings is an open-source video conferencing and collaboration server released under the Apache License. It uses the Kurento media server for streaming and provides browser-based audio/video calls, a multi-instance whiteboard, screen sharing with MP4 recording, and file management with private and public drives.$q$, $q$As an Apache Software Foundation project, it is entirely community-maintained and free to self-host, with no vendor-controlled paid tier.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('02606861-acdd-47b6-b630-9860c5848608', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$OpenMeetings suits organizations and developers who want a self-hosted video conferencing and webinar server they can integrate into their own infrastructure, such as educational platforms or internal collaboration tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('02606861-acdd-47b6-b630-9860c5848608', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('02606861-acdd-47b6-b630-9860c5848608', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('02606861-acdd-47b6-b630-9860c5848608', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── SOGo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source groupware server providing webmail, calendar, and contacts with CalDAV, CardDAV, and ActiveSync device sync.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$SOGo is a free, open-source groupware server offering webmail, calendar, and contacts with CalDAV, CardDAV, and ActiveSync sync.$q$,
  og_description = $q$SOGo is a free, open-source groupware server offering webmail, calendar, and contacts with CalDAV, CardDAV, and ActiveSync sync.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2c574afd-be4a-449c-adfa-0158130d6f1d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2c574afd-be4a-449c-adfa-0158130d6f1d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$AJAX webmail interface$q$, $q$Browser-based email client for managing messages, folders, and search.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$Calendar & tasks$q$, $q$Shared calendaring and task lists synced across devices.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$Contacts / address book$q$, $q$Shared address books accessible via CardDAV.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$Open protocol sync$q$, $q$CalDAV, CardDAV, GroupDAV, and Microsoft ActiveSync support for native mobile sync.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$Outlook integration$q$, $q$Connects to Microsoft Outlook via a third-party synchronizer.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$Proven at scale$q$, $q$Deployed in production environments handling thousands of concurrent users.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$Free and open source under GPL/LGPL$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$Standards-based sync avoids vendor lock-in$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$Native mobile device support without extra apps, via ActiveSync$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$Scales to large, multi-thousand-user deployments$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$Interface is more utilitarian than modern SaaS webmail clients$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$Outlook integration requires a separate third-party connector$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$Commercial premium support is a paid add-on outside the free core$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$Is SOGo free?$q$, $q$Yes, the core software is free and open source under the GNU GPL/LGPL.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$Does SOGo work with Outlook?$q$, $q$Yes, through a third-party synchronizer connector, alongside native CalDAV/CardDAV/ActiveSync support for other clients.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$Can I try SOGo before installing it?$q$, $q$Yes, a free online demo is available on the SOGo website.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$Who supports SOGo?$q$, $q$It is maintained by its open-source community and Alinto, which also offers paid premium support.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$Exchange replacement$q$, $q$Organizations moving off Exchange to an open standards-based groupware server.$q$, $q$IT teams and hosting providers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$Multi-device mail and calendar sync$q$, $q$Businesses needing native calendar/contact sync across phones and desktops without extra software.$q$, $q$SMBs and ISPs$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$SOGo is an open-source groupware server that provides an AJAX-based webmail, calendar, and address book interface, built around open standards rather than a proprietary protocol. It supports CalDAV, CardDAV, GroupDAV, and Microsoft ActiveSync, so it syncs natively with iPhone, Android, Windows Phone, and desktop clients, including Outlook through a third-party connector.$q$, $q$The software is released under the GNU GPL/LGPL and is maintained by its community together with Alinto. Commercial premium support is available as a paid add-on for organizations that want dedicated assistance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$SOGo fits organizations and hosting providers that want a scalable, standards-based alternative to Exchange, capable of serving thousands of concurrent mailboxes without vendor lock-in.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c574afd-be4a-449c-adfa-0158130d6f1d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Tine ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$German open-source groupware suite for email, calendar, CRM, and project time tracking, self-hosted or via managed cloud.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Hamburg, Germany$q$,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$Tine is a German open-source groupware suite for email, calendar, CRM, and project time tracking, self-hosted or cloud-hosted.$q$,
  og_description = $q$Tine is a German open-source groupware suite for email, calendar, CRM, and project time tracking, self-hosted or cloud-hosted.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '13d8e1cf-dc46-4ceb-a3df-aaf2719813b1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '13d8e1cf-dc46-4ceb-a3df-aaf2719813b1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Calendar$q$, $q$Appointment management with recurring events and resource planning.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Email$q$, $q$Built-in email client for workplace communication.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Address book / relationship manager$q$, $q$Contact management framed around ongoing relationships, not just records.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Task & project management$q$, $q$Project-oriented task tracking in place of a simple to-do list.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$File manager$q$, $q$Document storage and sharing with access controls.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Project time tracking & billing$q$, $q$Time logging tied to projects for accounting and invoicing.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$CRM$q$, $q$Customer relationship management with mobile access.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Germany-based vendor with a data-sovereignty focus$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Combines groupware, CRM, and project time tracking in one suite$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Self-hosted community edition available$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Open-source core$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Cloud/enterprise pricing is not published on the website$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Smaller international community than major groupware suites$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Self-hosting requires server administration$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Is Tine free?$q$, $q$A self-hosted community edition is free; cloud and enterprise options are paid, with pricing available on request.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Who develops Tine?$q$, $q$METAWAYS Infosystems GmbH, headquartered in Hamburg, Germany.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Does Tine include CRM?$q$, $q$Yes, it includes a CRM module with mobile access alongside its groupware features.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Can Tine track project time for billing?$q$, $q$Yes, it includes project time tracking tied to billing and accounting.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Data-sovereign groupware$q$, $q$German/EU organizations needing collaboration tools hosted under local jurisdiction.$q$, $q$Businesses and public institutions$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Combined CRM and time tracking$q$, $q$Agencies that need CRM, task management, and billable time tracking in one system.$q$, $q$Consultancies and agencies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Community Edition$q$, $q$Free$q$, $q$N/A$q$, $q$["Self-hosted install","Core groupware and CRM modules"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$Cloud / Enterprise$q$, $q$Contact sales$q$, $q$Annual$q$, $q$["Managed hosting","Vendor support"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Tine is a groupware suite developed by METAWAYS Infosystems GmbH, headquartered in Hamburg, Germany. It combines calendar, email, an address book positioned as a relationship manager, task and project management, file storage, project time tracking with billing, and a CRM module with mobile access.$q$, $q$The website references both a community edition and cloud/enterprise options, though specific pricing for the paid tiers is not published.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Tine targets businesses and organizations, particularly in Germany and the EU, that need integrated groupware plus project time tracking and CRM with the option of data-sovereign hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('13d8e1cf-dc46-4ceb-a3df-aaf2719813b1', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Zimbra Collaboration ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Email and collaboration suite with webmail, calendar, file sharing, and chat, offering a free open-source edition and paid enterprise tiers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2003,
  company_size = NULL,
  headquarters = $q$Buffalo, New York, USA$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Zimbra Collaboration offers webmail, calendar, and file sharing with a free open-source edition and paid enterprise tiers.$q$,
  og_description = $q$Zimbra Collaboration offers webmail, calendar, and file sharing with a free open-source edition and paid enterprise tiers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fac8e051-0c40-4179-bbbd-8363f2ad6985';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fac8e051-0c40-4179-bbbd-8363f2ad6985' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Webmail$q$, $q$Browser-based email with search and message organization tools.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Shared calendars$q$, $q$Team scheduling across time zones with shared calendar views.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Briefcase file sharing$q$, $q$Secure document storage and sharing with granular permissions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Team chat$q$, $q$Enterprise messaging with file sharing and group collaboration.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$In-browser document editing$q$, $q$Create and edit office documents without leaving the webmail interface.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Security controls$q$, $q$S/MIME encryption, two-factor authentication, and compliance archiving on paid tiers.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Mobile & desktop sync$q$, $q$ActiveSync support for iOS/Android plus Outlook and desktop client integration.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Mature platform with a large installed base of mailboxes worldwide$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Flexible deployment: on-premises, hybrid, or private cloud$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Strong optional security features (S/MIME, 2FA, compliance archiving)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Free open-source core server available$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$High-availability clustering and advanced encryption require a paid Network Edition$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Pricing for paid tiers is not published and requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Community edition receives less formal support than licensed tiers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Is there a free version of Zimbra?$q$, $q$Yes, an open-source community edition provides the core mail server for free; advanced features require a paid Network Edition.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Who owns Zimbra?$q$, $q$Zimbra is owned and operated by Synacor, Inc., headquartered in Buffalo, New York.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Does Zimbra support mobile devices?$q$, $q$Yes, via ActiveSync for iOS and Android as well as Outlook integration.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Can Zimbra be deployed on-premises?$q$, $q$Yes, it supports on-premises, hybrid, and private-cloud deployment.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Regulated-industry email$q$, $q$Finance, government, and education organizations needing on-prem email with compliance controls.$q$, $q$Enterprises and public institutions$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Exchange migration$q$, $q$Organizations moving off Microsoft Exchange to a self-hosted or hybrid alternative.$q$, $q$IT departments$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Open-Source Edition$q$, $q$Free$q$, $q$N/A$q$, $q$["Core mail server","Self-hosted","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Network Edition Standard$q$, $q$Contact sales$q$, $q$Annual$q$, $q$["Vendor support","Additional collaboration features"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$Network Edition Professional$q$, $q$Contact sales$q$, $q$Annual$q$, $q$["High-availability clustering","Advanced security and archiving"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Zimbra Collaboration is an email and collaboration suite combining webmail, shared calendars, contacts, tasks, and file sharing (Briefcase) with team chat and in-browser document editing. Founded in 2003, it is now owned and operated by Synacor, Inc., headquartered in Buffalo, New York.$q$, $q$The platform is available as a free open-source community edition covering the core mail server, alongside paid Network Edition Standard and Professional tiers that add features such as high-availability clustering, S/MIME encryption, two-factor authentication, and compliance archiving. Exact pricing for the paid tiers is not published on the site.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Zimbra is aimed at organizations that need on-premises, hybrid, or private-cloud email with strong compliance and security controls, including regulated industries such as finance, government, and education.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fac8e051-0c40-4179-bbbd-8363f2ad6985', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Endurain ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source fitness activity tracker and Strava alternative for logging workouts, gear, and health metrics.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Endurain is a free, open-source, self-hosted fitness tracker and Strava alternative for workouts, gear, and health metrics.$q$,
  og_description = $q$Endurain is a free, open-source, self-hosted fitness tracker and Strava alternative for workouts, gear, and health metrics.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7ef40ba1-79b2-4345-9ec2-bc2a4731b77e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7ef40ba1-79b2-4345-9ec2-bc2a4731b77e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$Activity import$q$, $q$Import workouts from GPX, TCX, and FIT files.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$Strava & Garmin Connect integration$q$, $q$Sync activities with existing Strava and Garmin accounts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$Gear tracking$q$, $q$Track components and gear such as bikes, shoes, and wetsuits.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$Multi-user support$q$, $q$Admin-managed accounts for multiple users on one instance.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$Health metrics logging$q$, $q$Log weight, steps, and sleep alongside workout data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$SSO and MFA$q$, $q$Single sign-on via OIDC/SAML and multi-factor authentication via TOTP.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$Full data ownership through self-hosting$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$Free under the AGPL-3.0+ open-source license$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$Imports from and syncs with Strava and Garmin Connect$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$Includes enterprise-style auth options (SSO, MFA) for a self-hosted project$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$Requires Docker and self-hosting experience to deploy$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$Built and maintained largely by a single developer, so support is community-based$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$Commercial use of the Endurain trademark requires permission$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$Is Endurain free?$q$, $q$Yes, it is free and open source under the AGPL-3.0+ license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$Does Endurain work with Strava or Garmin?$q$, $q$Yes, it integrates with both Strava and Garmin Connect for syncing activities.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$How is Endurain deployed?$q$, $q$It is deployed via Docker on your own server, typically using the provided docker-compose examples.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$Does Endurain support multiple users?$q$, $q$Yes, a single instance supports multiple users with admin controls.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$Self-hosted Strava alternative$q$, $q$Athletes who want to log and analyze workouts without a commercial cloud platform.$q$, $q$Cyclists, runners, and other endurance athletes$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$Shared household fitness server$q$, $q$Families or small groups running one multi-user instance for tracking activities together.$q$, $q$Home lab / self-hosting enthusiasts$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Endurain is a self-hosted fitness activity tracker built as an alternative to services like Strava, giving users full control over their workout data and where it is hosted. It imports activities from GPX, TCX, and FIT files and can integrate with Strava and Garmin Connect.$q$, $q$Built with a Vue.js/TypeScript frontend and a Python FastAPI backend on PostgreSQL, it is released under the AGPL-3.0+ license and deployed via Docker.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Endurain suits cyclists, runners, and other athletes who want to own their activity data, plus households or small groups running a shared, multi-user fitness server instead of a commercial cloud platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ef40ba1-79b2-4345-9ec2-bc2a4731b77e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── FitTrackee ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source outdoor activity tracker for logging workouts from GPX files with statistics, maps, and federation.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$]::text[],
  seo_meta_description = $q$FitTrackee is a free, open-source, self-hosted outdoor activity tracker with GPX import, statistics, and ActivityPub federation.$q$,
  og_description = $q$FitTrackee is a free, open-source, self-hosted outdoor activity tracker with GPX import, statistics, and ActivityPub federation.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b2325b7f-fda2-40f8-adc4-5f3940ce498f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b2325b7f-fda2-40f8-adc4-5f3940ce498f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$GPX-based workout tracking$q$, $q$Import GPX files (or a zip of files) to generate workouts with map and elevation/speed charts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$Manual workout entry$q$, $q$Log a workout by entering date, time, duration, and distance without a file.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$Statistics dashboard$q$, $q$Track distance, duration, elevation gain, average speed, and pace over time.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$Equipment tracking$q$, $q$Associate gear such as shoes or bikes with individual workouts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$REST API$q$, $q$Documented API with OAuth 2.0 for third-party integrations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$ActivityPub federation$q$, $q$Optional federation for sharing activity across instances without a central platform.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$Full control of workout data through self-hosting$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$Free under the AGPL open-source license$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$ActivityPub federation enables social features without a central server$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$Documented REST API for building integrations$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$The project describes itself as under heavy development, so stability and features are still evolving$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$Smaller feature set than mature commercial activity trackers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$Self-hosting requires setting up and maintaining a server$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$Is FitTrackee free?$q$, $q$Yes, it is free and open source under the AGPL license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$Does FitTrackee support GPX file import?$q$, $q$Yes, workouts can be created from GPX files or entered manually.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$Does FitTrackee have an API?$q$, $q$Yes, it provides a documented REST API with OAuth 2.0 authentication.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$Can FitTrackee instances federate with each other?$q$, $q$Yes, it supports optional ActivityPub-based federation.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$Private Strava alternative$q$, $q$Runners and cyclists who want to keep workout data on their own server.$q$, $q$Individual athletes$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$Federated activity sharing$q$, $q$Clubs or communities wanting to share activities across instances without a central provider.$q$, $q$Sports clubs and Fediverse users$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$FitTrackee is a self-hosted, open-source web application for tracking outdoor activities. Workouts can be created by uploading a GPX file (or a zip of several GPX files), or entered manually without a file, and are shown with maps and elevation/speed charts via OpenStreetMap.$q$, $q$It includes a statistics dashboard, equipment tracking, multi-user support with comments and follow requests, a documented REST API with OAuth 2.0, and optional ActivityPub-based federation. It is released under the AGPL license and remains under active development.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$FitTrackee is aimed at individuals, small clubs, and privacy-conscious athletes who want a self-hosted alternative to Strava or Garmin Connect, including those interested in federated, non-centralized activity sharing.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b2325b7f-fda2-40f8-adc4-5f3940ce498f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Mere Medical ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source app that aggregates personal health records from patient portals like MyChart into one local, private view.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Mere Medical is a free, open-source app that aggregates health records from patient portals like MyChart into one private view.$q$,
  og_description = $q$Mere Medical is a free, open-source app that aggregates health records from patient portals like MyChart into one private view.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1a73a78a-9eb5-44c7-beb9-2f36900d5602';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1a73a78a-9eb5-44c7-beb9-2f36900d5602' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$Multi-portal aggregation$q$, $q$Connects to Epic MyChart, Cerner Health, Allscripts Connect, OnPatient, and FollowMyHealth.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$Local data storage$q$, $q$Records are stored on the user's device rather than a third-party cloud by default.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$SMART on FHIR standard$q$, $q$Uses HL7 SMART on FHIR protocols for secure, standards-based connections to provider portals.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$Offline access$q$, $q$Full functionality is available without an internet connection once records are synced.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$No registration required$q$, $q$Users can start using the app immediately without creating an account.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$Self-hosting option$q$, $q$Can be deployed on a personal server for users who want to run their own instance.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$Health data stays local and private by default$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$No signup required to try it$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$Aggregates multiple patient portals into one place$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$Free and open source$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$Only covers providers/portals that support SMART on FHIR or a supported connector$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$Each provider portal must be connected manually$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$Self-hosting requires technical setup$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$Is Mere Medical free?$q$, $q$Yes, it is free and open source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$Does Mere Medical store my data in the cloud?$q$, $q$By default, data is stored locally on your device; a self-hosted option is also available.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$Which patient portals does it support?$q$, $q$It connects to portals such as Epic MyChart, Cerner Health, Allscripts Connect, OnPatient, and FollowMyHealth via SMART on FHIR.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$Do I need to create an account?$q$, $q$No, Mere Medical can be used without registering an account.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$Consolidating scattered medical records$q$, $q$Patients who have seen multiple healthcare systems and want one unified record view.$q$, $q$Patients with multiple providers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$Private local health record keeping$q$, $q$Individuals who want their medical history stored locally instead of in a vendor cloud.$q$, $q$Privacy-conscious patients and caregivers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Mere Medical is a free, open-source personal health record app that pulls medical records from multiple patient portals, including Epic MyChart, Cerner Health, Allscripts Connect, OnPatient, and FollowMyHealth, into a single unified view.$q$, $q$It connects to providers using the SMART on FHIR standard, stores data locally on the user's device rather than in the cloud by default, works offline, and requires no account registration to start. A self-hosted deployment option is also available for users who want to run their own instance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Mere Medical is built for patients whose medical history is spread across several healthcare systems, and for privacy-conscious individuals who want to keep their health records under their own control rather than in a hospital or vendor cloud.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1a73a78a-9eb5-44c7-beb9-2f36900d5602', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── OpenEMR ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$The most widely used open-source electronic health records and practice management system, free to self-host or run in the cloud.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2001,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$OpenEMR is a free, open-source, ONC-certified electronic health records and practice management system, self-hosted or cloud.$q$,
  og_description = $q$OpenEMR is a free, open-source, ONC-certified electronic health records and practice management system, self-hosted or cloud.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '183473d1-eb82-4807-95c3-e4a1c525575e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '183473d1-eb82-4807-95c3-e4a1c525575e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Patient scheduling$q$, $q$Advanced scheduling with automated workflows and patient reminders.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Electronic prescribing$q$, $q$E-prescribing built into the clinical workflow.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Integrated medical billing$q$, $q$HIPAA ASC X12-compliant billing tools.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$CMS reporting$q$, $q$Built-in reporting to support CMS program requirements.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Lab integration$q$, $q$Automated lab ordering and results processing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Clinical decision support$q$, $q$A rules engine to support clinical decision-making.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Fine-grained access controls$q$, $q$HIPAA-compliant, role-based security and permissions.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Multi-language support$q$, $q$Interface support for over 30 languages.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$ONC-certified (version 8) for U.S. federal health IT compliance$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Free to self-host with no software licensing cost$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Free hosted edition available for U.S.-based providers via certified partners$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Large global community plus a professional support vendor network$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Self-hosting requires HIPAA-aware server administration and security practices$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Depth of features means a learning curve for new practices$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$The official free hosted edition is limited to U.S.-based providers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Is OpenEMR really free?$q$, $q$Yes, it is free, open-source software under the GPL, self-hostable at no licensing cost, with a free hosted option for U.S.-based providers via certified partners.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Is OpenEMR ONC certified?$q$, $q$Yes, version 8 achieved ONC Certification confirming compliance with U.S. federal health IT standards.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Can I get OpenEMR hosted for me?$q$, $q$Yes, certified partners offer free hosting for U.S.-based providers, and a professional support vendor network offers paid hosting and support options.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Who supports OpenEMR?$q$, $q$It's supported by a volunteer open-source community, community forums and chat channels, and a network of professional support vendors.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Independent practice EHR$q$, $q$Small and mid-size medical practices needing a certified EHR without licensing fees.$q$, $q$Independent practices and clinics$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Global health organizations$q$, $q$NGOs and district hospitals needing a free, adaptable EHR across many languages and regions.$q$, $q$International health organizations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Self-hosted$q$, $q$Free$q$, $q$N/A$q$, $q$["Full source access","Self-managed deployment","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Free hosted (U.S. providers)$q$, $q$Free$q$, $q$N/A$q$, $q$["No servers or setup required","Offered via certified partners"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$Certified partner support/hosting$q$, $q$Contact partners$q$, $q$Varies$q$, $q$["Paid implementation and hosting","Professional support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$OpenEMR is described by its maintainers as the most popular open-source electronic health records (EHR) and medical practice management system. Its origins trace back to 2001, and it has been publicly available under the GNU General Public License since 2002. Version 8 achieved ONC Certification, confirming compliance with U.S. federal health IT standards.$q$, $q$The software is free to self-host on premises or in the cloud, and a free, fully hosted edition is also offered to U.S.-based healthcare providers through certified partners, alongside a network of professional support vendors for organizations that want paid implementation or hosting help.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$OpenEMR serves a wide range of healthcare settings, from independent practices and district hospitals to international NGOs such as the Peace Corps and IPPF, particularly organizations that need certified EHR functionality without ongoing software licensing fees.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('183473d1-eb82-4807-95c3-e4a1c525575e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── wger ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$wger is a free, self-hosted fitness manager for planning workouts, tracking nutrition, and logging body progress.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$wger is a free, self-hosted, open-source fitness manager for workout planning, nutrition tracking, and progress logging with Android/iOS apps.$q$,
  og_description = $q$wger is a free, self-hosted, open-source fitness manager for workout planning, nutrition tracking, and progress logging with Android/iOS apps.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2c05a9b7-fdb5-409f-8a14-64eb71fbdace';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2c05a9b7-fdb5-409f-8a14-64eb71fbdace' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$Workout routine builder$q$, $q$Create structured training plans with configurable, automatic weight-progression rules across sessions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$Nutrition and calorie tracking$q$, $q$Log meals against a food database sourced from Open Food Facts, including barcode scanning in the mobile apps.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$Body measurement and progress photos$q$, $q$Track body weight and custom measurements over time, with a gallery for progress photos.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$Community exercise wiki$q$, $q$A shared, editable database of exercises that any instance can draw on and contribute to.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$REST API$q$, $q$A documented API for building integrations, scripts, or third-party clients against your own wger data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$Mobile apps$q$, $q$Native-quality Flutter apps for Android and iOS with offline sync, available via app stores, F-Droid, and Flathub.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$Basic gym management$q$, $q$Multi-user support that lets a trainer or small gym manage multiple members' plans from one instance.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$Completely free and self-hosted, with no subscription or data lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$Covers workouts, nutrition, and body tracking in a single tool$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$Active open-source project with regular releases and Docker deployment$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$Well-documented REST API for custom integrations$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$Official Android and iOS apps, not just a mobile web view$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$Requires comfort with Docker or Python/Django deployment to self-host$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$No official managed cloud/SaaS version for non-technical users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$UI and feature depth are more utilitarian than polished commercial fitness apps$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$No built-in coaching, social, or marketplace features$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$Is wger really free?$q$, $q$Yes. wger is licensed as free/libre open-source software (AGPL) with no paid tiers; you self-host it yourself.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$Do I need to know how to code to run wger?$q$, $q$No coding is required, but you do need basic familiarity with Docker or a Linux server to deploy and maintain your own instance.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$Does wger have a mobile app?$q$, $q$Yes, official Flutter-based apps are available for Android and iOS, including offline workout logging and barcode food scanning.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$Can I use wger to manage clients as a personal trainer?$q$, $q$wger supports multiple users on one instance with basic gym-management features, so a trainer can track several members' plans.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$Personal fitness and nutrition tracking$q$, $q$Individuals who want to plan workouts and log meals and body metrics without handing data to a commercial fitness app.$q$, $q$Self-hosters and privacy-conscious fitness enthusiasts$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$Small gym or trainer client management$q$, $q$A trainer running one wger instance to plan routines and track progress for several clients.$q$, $q$Independent personal trainers and small gyms$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$wger (pronounced 'workout manager') is a free, libre, open-source (FLOSS) fitness application built with Django and Python. It covers workout routine planning with automatic weight-progression rules, a nutrition and calorie log backed by the Open Food Facts database, body-weight and custom measurement tracking, and a progress photo gallery.$q$, $q$The project is self-hostable via Docker, and it also ships native-quality Flutter mobile apps for Android and iOS with offline sync and barcode-based food logging. A public REST API is available for anyone who wants to build integrations or automations on top of their own data.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$wger suits self-hosters, home lab enthusiasts, and small gyms or trainers who want a fitness and nutrition tracker they fully control, without a subscription or a third party holding their training data. Its community-maintained exercise wiki and multilingual translations (managed via Weblate) also make it a practical option for non-English-speaking users.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c05a9b7-fdb5-409f-8a14-64eb71fbdace', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;

-- ── Wingfit ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Wingfit is a minimalist, self-hostable app for planning workouts, tracking personal records, and syncing smartwatch data.$q$,
  pricing_model = $q$Free (self-hosted)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Wingfit is a minimalist, free, self-hostable app for planning workouts, tracking personal records, and importing smartwatch training data.$q$,
  og_description = $q$Wingfit is a minimalist, free, self-hostable app for planning workouts, tracking personal records, and importing smartwatch training data.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'aa9d2774-9a4d-4792-8ad7-4de1b095e3bf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'aa9d2774-9a4d-4792-8ad7-4de1b095e3bf' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$Workout planning$q$, $q$Build and organize training routines ahead of time.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$Personal record tracking$q$, $q$Log and monitor personal bests across exercises and sessions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$Smartwatch data integration$q$, $q$Pull in performance data recorded by a connected wearable.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$Statistics and visualization$q$, $q$View training history and performance trends through the app's dashboard.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$One-command Docker deployment$q$, $q$Runs via Docker Compose with no configuration required by default, or Docker run with a mounted data volume.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$Free to self-host, with no telemetry or tracking$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$Simple, minimalist interface focused on core workout tracking$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$Fast Docker Compose setup for anyone already running a home server$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$Modern, actively maintained tech stack (Angular 19, FastAPI)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$License is non-commercial (CC BY-NC-SA), not a standard OSI open-source license$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$Requires Docker/self-hosting knowledge; no official managed hosting for non-technical users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$Small, single-maintainer project without a large plugin or integration ecosystem$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$No official native mobile app; smartwatch data is imported rather than tracked live in-app$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$Is Wingfit free?$q$, $q$Yes, Wingfit is free to self-host. The developer accepts voluntary donations but does not charge for the app itself.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$Is Wingfit fully open source?$q$, $q$The source code is public on GitHub, but it's released under a CC BY-NC-SA 4.0 license, which restricts commercial use rather than granting unrestricted OSI open-source rights.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$How do I try Wingfit before self-hosting it?$q$, $q$A live demo is available directly on wingfit.fr.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$What do I need to run Wingfit myself?$q$, $q$A machine that can run Docker; the project deploys via Docker Compose with persistent storage for your data.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$Personal workout logging$q$, $q$Individuals tracking their own training plans and personal records outside of commercial fitness apps.$q$, $q$Home-lab and self-hosting enthusiasts$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$Smartwatch data consolidation$q$, $q$Bringing wearable-recorded workout data into one self-hosted place instead of a vendor's cloud app.$q$, $q$Wearable device owners who value data ownership$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Wingfit is a lightweight fitness-tracking application for planning training routines, recording personal records, and pulling in data from a connected smartwatch. It is built with an Angular/PrimeNG/Tailwind frontend and a FastAPI/SQLModel/SQLite backend, and it deploys with a single Docker Compose command.$q$, $q$The source is publicly available on GitHub and can be self-hosted with no telemetry or tracking, though it is published under a CC BY-NC-SA 4.0 license, meaning the code is source-available for personal, non-commercial modification and sharing rather than a fully unrestricted OSI open-source license. A live public demo is hosted at wingfit.fr.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Wingfit suits individuals who want a no-frills, self-hosted way to plan workouts and track personal records without the account creation, ads, or data collection of mainstream fitness apps, especially those who already run a home Docker server.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa9d2774-9a4d-4792-8ad7-4de1b095e3bf', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── admidio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Admidio is a free, self-hosted membership management system for associations, clubs, and other organizations.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2004,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$Admidio is a free, open-source, self-hosted membership management system for associations, clubs, and organizations.$q$,
  og_description = $q$Admidio is a free, open-source, self-hosted membership management system for associations, clubs, and organizations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Member and role management$q$, $q$Manage member records with configurable roles and per-group access rights.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Event management$q$, $q$Create events with member registration and cancellation handling.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Exportable member lists$q$, $q$Generate customizable lists exported to Excel, PDF, or CSV.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Photo gallery$q$, $q$Upload and organize photo albums for members to browse.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Document distribution$q$, $q$Share files and documents with members through the platform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Bulk CSV import$q$, $q$Import and update member records in bulk via CSV files.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Plugin extensibility$q$, $q$Extend core functionality through community and custom plugins.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Completely free and open source, with no subscription cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Purpose-built for associations and clubs rather than generic CRM use$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Long-running project (since the mid-2000s) with an active community$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Granular, group-based permission system$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Self-hosted, so member data stays under the organization's control$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Requires a self-managed PHP/web server environment to install and maintain$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Interface is more functional than modern in design compared to newer SaaS tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$No official managed hosting offered by the project itself$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Smaller ecosystem than large commercial membership platforms$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Is Admidio free to use?$q$, $q$Yes, Admidio is free, open-source software with no licensing cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Can Admidio be installed on an existing website?$q$, $q$Yes, it's designed to be installed on an existing homepage or set up as a new site on your own web server.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Does Admidio support member payments or dues?$q$, $q$Admidio focuses on member and event management with role-based access; payment/dues handling depends on available plugins rather than a built-in billing system.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Who maintains Admidio?$q$, $q$It is maintained as a community open-source project, with development history dating back to the mid-2000s and code hosted on GitHub.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Association and club membership management$q$, $q$Non-profits, sports clubs, and associations managing member records, roles, and communications.$q$, $q$Volunteer administrators and webmasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Event registration for member organizations$q$, $q$Organizing events with member sign-up and cancellation tracking.$q$, $q$Clubs and community groups$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Admidio is a free, open-source membership management system built for associations, clubs, and other groups that need to organize members and share information among them. It combines user and role management with modular tools: exportable member lists (Excel, PDF, CSV), event creation with registration and cancellation, a photo gallery, document/file distribution, and CSV-based bulk import of member records.$q$, $q$Access is controlled through a flexible rights system so different groups or departments within an organization can be granted different permissions. The project has been developed continuously since the mid-2000s and is extensible through plugins, with community support through a forum, blog, and social channels.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Admidio is aimed at webmasters and volunteer administrators running associations, sports clubs, non-profits, and other member-based organizations that want to self-host their own membership database and event system rather than relying on a paid SaaS platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Domoticz ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Domoticz is a free, open-source, self-hosted home automation system that runs entirely on local hardware.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2012,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Domoticz is a free, open-source, self-hosted home automation system supporting 150+ devices with no cloud dependency.$q$,
  og_description = $q$Domoticz is a free, open-source, self-hosted home automation system supporting 150+ devices with no cloud dependency.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '079c889d-8df9-4612-92ff-bb745bc64902';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '079c889d-8df9-4612-92ff-bb745bc64902' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Broad device support$q$, $q$Connects to 150+ smart home device types and protocols, including Z-Wave, Zigbee, MQTT, and Philips Hue.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Local-only operation$q$, $q$Runs and stores all data on your own hardware with no cloud dependency.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Multiple scripting options$q$, $q$Automate with dzVents, Lua, Python scripting, or the Blockly visual editor.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Energy monitoring$q$, $q$Tracks energy consumption and integrates with smart meters.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Lightweight footprint$q$, $q$Runs on constrained hardware such as a Raspberry Pi Zero, using well under 50MB of RAM.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Mobile notifications$q$, $q$Sends push notifications to iOS and Android devices.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Responsive web interface$q$, $q$A single HTML5 dashboard that works across desktop and mobile browsers.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Completely free and open source, with no subscription fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Runs locally with no mandatory cloud dependency, preserving privacy$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Very lightweight, runs well on inexpensive hardware like a Raspberry Pi Zero$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Broad protocol and device support built up over more than a decade$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Multiple scripting/automation options for different skill levels$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Interface looks dated compared to newer smart-home platforms$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Steeper learning curve for advanced automation scripting than no-code competitors$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Requires self-hosting and manual maintenance; no official managed cloud version$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Community-driven support rather than dedicated commercial customer service$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Is Domoticz free?$q$, $q$Yes, Domoticz is 100% free and open source under the GPL-3.0 license, with no paid tiers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Does Domoticz require an internet connection?$q$, $q$No, it runs entirely on local hardware and does not depend on a cloud service to function.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$What hardware can run Domoticz?$q$, $q$It runs on Linux, Windows, macOS, Raspberry Pi (including the Pi Zero), and via Docker.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Does Domoticz support Zigbee and Z-Wave?$q$, $q$Yes, along with MQTT, Philips Hue, and over 150 other supported devices and protocols.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Local-only smart home control$q$, $q$Homeowners who want to control lights, sensors, and switches without sending data to a cloud vendor.$q$, $q$Privacy-conscious smart home users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$Low-cost home automation on Raspberry Pi$q$, $q$Running a full home automation hub on inexpensive, low-power hardware.$q$, $q$Raspberry Pi and DIY hardware hobbyists$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Domoticz is a free and open-source (GPL-3.0) home automation system that monitors and controls lights, switches, and sensors (temperature, humidity, energy, and more) from a self-hosted web interface. It runs entirely on local hardware with no cloud dependency, supporting Linux, Windows, macOS, Raspberry Pi, and Docker.$q$, $q$The platform is lightweight enough to run on a Raspberry Pi Zero (under 50MB RAM) yet supports 150+ device protocols and brands including Z-Wave, Zigbee, MQTT, and Philips Hue. Automations can be written using its built-in dzVents scripting, Lua, Python, or the Blockly visual programming editor, and it sends mobile push notifications for iOS and Android.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Domoticz appeals to privacy-conscious smart-home users and Raspberry Pi hobbyists who want reliable local control over their devices without a subscription or a cloud vendor able to change terms, pricing, or availability.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('079c889d-8df9-4612-92ff-bb745bc64902', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── EMQX ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$EMQX is an MQTT broker and IoT data platform for connecting devices, available self-hosted or as managed cloud/enterprise service.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2017,
  company_size = NULL,
  headquarters = $q$Menlo Park, California, United States$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$EMQX is an MQTT broker for IoT and connected-vehicle data, free to self-host on a single node with paid cloud and enterprise tiers.$q$,
  og_description = $q$EMQX is an MQTT broker for IoT and connected-vehicle data, free to self-host on a single node with paid cloud and enterprise tiers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e5acefb5-8215-460f-9c6a-0a3d1e382f7e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e5acefb5-8215-460f-9c6a-0a3d1e382f7e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$MQTT broker core$q$, $q$Connects and routes real-time messages from millions of IoT/device connections.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$Self-hosted deployment$q$, $q$Free to run yourself on a single node under the current Business Source License terms.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$Managed cloud options$q$, $q$Serverless pay-as-you-go, single-tenant Dedicated Flex, and Bring Your Own Cloud (BYOC) hosted plans.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$HTTP management API$q$, $q$Programmatic API for managing brokers, rules, and integrations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$40+ data integrations$q$, $q$Built-in connectors to route MQTT data into databases, streaming platforms, and analytics tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$High availability clustering$q$, $q$Multi-node clustering for large-scale, high-throughput deployments (requires a commercial license under current terms).$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$Free to self-host on a single node, suitable for smaller or evaluation deployments$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$Scales to enterprise-grade, high-throughput IoT and vehicle connectivity workloads$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$Multiple managed cloud tiers (serverless to dedicated) for teams that don't want to run their own infrastructure$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$Extensive integration ecosystem for routing MQTT data into other systems$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$As of v5.9, self-hosted multi-node clustering and commercial hosting require a paid license rather than being free under Apache 2.0$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$Pricing for Dedicated Flex and Enterprise plans is not fully transparent and often requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$Licensing model (Business Source License) is more complex to evaluate than a straightforward open-source license$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$Is EMQX still open source?$q$, $q$The core code remains source-available, and single-node self-hosted use stays free, but as of v5.9 (2025) EMQX uses the Business Source License 1.1 rather than pure Apache 2.0 — multi-node clustering and commercial hosting require a paid license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$What does the free EMQX Serverless cloud tier include?$q$, $q$It's pay-as-you-go with a free monthly quota (up to roughly 1 million session minutes) and supports up to 1,000 connections before charges apply.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$Can I self-host EMQX for free?$q$, $q$Yes, single-node self-hosted deployments remain free under the current license terms.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$Does EMQX offer enterprise support?$q$, $q$Yes, through its Enterprise self-managed plan and Dedicated Flex/BYOC cloud plans, which include SLAs and priority support.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$IoT device connectivity$q$, $q$Connecting and streaming data from large fleets of sensors and connected devices.$q$, $q$IoT platform and product engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$Connected vehicle data streaming$q$, $q$Handling real-time telemetry from vehicles at automotive scale.$q$, $q$Automotive and mobility companies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$Small-scale self-hosted MQTT broker$q$, $q$Running a single-node MQTT broker for home labs, prototypes, or small IoT projects at no cost.$q$, $q$Developers and hobbyists$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$Self-Managed (single node)$q$, $q$Free$q$, NULL, $q$["Source-available under BSL 1.1","Free for single-node production and non-production use"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$Serverless (Cloud)$q$, $q$$0 + usage-based$q$, $q$monthly$q$, $q$["Pay-as-you-go beyond free quota","Up to 1,000 connections in free tier","TLS/SSL encryption","Basic monitoring"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$Dedicated Flex (Cloud)$q$, $q$From $234/month$q$, $q$monthly$q$, $q$["Single-tenant cluster in an isolated VPC","40+ integrations","99.99% uptime SLA","24/7 support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$Enterprise (Self-Managed)$q$, $q$Custom$q$, $q$annual$q$, $q$["Deploy on-prem, edge, or any cloud","Custom plugins","Professional services and priority support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$EMQX is an MQTT message broker used to connect and stream real-time data from IoT devices, vehicles, and industrial systems into analytics and AI pipelines. The open-source project traces back to 2013 (originally released as emqttd), and the company behind it, EMQ, was founded in 2017 and is headquartered in Menlo Park, California, with additional offices including Boston, Frankfurt, Stockholm, and locations in China.$q$, $q$Historically, EMQX's Community Edition was released under the permissive Apache License 2.0. As of version 5.9 (2025), EMQ unified the Community and Enterprise editions into one platform under the Business Source License (BSL) 1.1: the source remains viewable, downloadable, and modifiable, and single-node production and non-production use stay free, but multi-node clustering, commercial hosting, and embedding EMQX in a sold product now require a commercial license (BSL converts to Apache 2.0 after a set time period per release).$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$EMQX is aimed at engineering teams building IoT, connected-vehicle, or industrial data platforms that need a scalable MQTT broker — from hobbyists running a single self-hosted node for free, up to enterprises that need EMQX's fully managed cloud (Serverless, Dedicated Flex, BYOC) or on-prem Enterprise deployments with SLAs and support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e5acefb5-8215-460f-9c6a-0a3d1e382f7e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── evcc ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$evcc is a free, open-source, self-hosted energy manager that optimizes EV charging with solar power, dynamic tariffs, and batteries.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$evcc is a free, open-source, self-hosted energy manager that optimizes EV charging using solar power, dynamic tariffs, and batteries.$q$,
  og_description = $q$evcc is a free, open-source, self-hosted energy manager that optimizes EV charging using solar power, dynamic tariffs, and batteries.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3bbf9b79-3028-47ee-bd1d-05dbaf8b833d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3bbf9b79-3028-47ee-bd1d-05dbaf8b833d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$Solar-aware charging$q$, $q$Automatically adjusts charging power to follow available solar surplus.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$Dynamic tariff optimization$q$, $q$Times charging to the cheapest or greenest available grid electricity using dynamic pricing data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$Multi-device load management$q$, $q$Coordinates charging across multiple charge points to avoid exceeding available capacity.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$Battery and heat pump coordination$q$, $q$Integrates home battery storage and heat pump operation into the overall energy strategy.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$Grid signal compliance$q$, $q$Supports grid operator control signals such as Germany's §14a controllable consumption device rules.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$Mobile companion apps$q$, $q$iOS and Android apps for monitoring and controlling charging remotely.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$Free, open-source, and self-hosted with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$Works across many charger, inverter, and battery brands rather than one ecosystem$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$Actively maintained with regular releases and a responsive community$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$Runs on inexpensive hardware like a Raspberry Pi$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$Requires self-hosting and some technical setup to configure hardware integrations$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$No official paid support tier; help comes from the community and documentation$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$Feature depth for a given setup depends on how well your specific hardware is supported$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$Is evcc free to use?$q$, $q$Yes, evcc is free and open source; the project accepts optional sponsorships but doesn't charge for the software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$What hardware do I need to run evcc?$q$, $q$A small always-on device such as a Raspberry Pi, or any machine that can run Docker.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$Does evcc work without solar panels?$q$, $q$Yes, it can also optimize charging purely around dynamic electricity pricing or grid signals, though solar-surplus charging is one of its core use cases.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$Does evcc support multiple EV chargers at once?$q$, $q$Yes, it includes multi-device load management to coordinate charging across several charge points.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$Solar surplus EV charging$q$, $q$Automatically charging an EV using excess solar production instead of grid power.$q$, $q$Homeowners with solar panels and an EV$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$Dynamic-tariff cost optimization$q$, $q$Scheduling charging to the cheapest hours under a dynamic electricity tariff.$q$, $q$EV owners on variable-rate electricity plans$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$evcc is an open-source, self-hosted energy management system that coordinates electric vehicle charging with home solar production, grid electricity, battery storage, and heat pumps. It automatically shifts or throttles charging power to follow available solar surplus or the cheapest/greenest available electricity, using dynamic tariff data where available.$q$, $q$It's community-developed, deployable on a Raspberry Pi or via Docker, and configured through a browser-based interface. evcc supports multi-device load management across several charging points and includes companion apps for iOS and Android. The project accepts sponsorships to fund ongoing development but does not charge for the core software.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$evcc is built for homeowners who already have (or are planning) an EV, solar panels, and/or a home battery, and who want vendor-independent, self-hosted control over when and how their vehicle charges rather than being locked into a single charger manufacturer's app.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3bbf9b79-3028-47ee-bd1d-05dbaf8b833d', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;

-- ── FHEM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$FHEM is a free, open-source Perl server for home automation, controlling devices and logging sensor data locally.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2005,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$FHEM is a free, open-source, self-hosted Perl server for home automation with 430+ community modules and no cloud dependency.$q$,
  og_description = $q$FHEM is a free, open-source, self-hosted Perl server for home automation with 430+ community modules and no cloud dependency.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c12bd7ea-536c-4be0-9ac5-7f0daa0d7911';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c12bd7ea-536c-4be0-9ac5-7f0daa0d7911' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$430+ community modules$q$, $q$A large library of modules covering diverse home automation protocols and hardware.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$Auto-discovery of devices$q$, $q$Automatically creates devices and logs when new sensor data is received.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$Timed and event-based automation$q$, $q$Trigger commands on a schedule or in response to specific events.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$Multiple control interfaces$q$, $q$Accessible via web UI, smartphone apps, telnet, or direct TCP/IP.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$Third-party integrations$q$, $q$Works with Alexa, HomeKit, MQTT, and various audio/video systems.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$Self-hosted server$q$, $q$Runs 24/7 on a NAS, Raspberry Pi, or PC that the user controls.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$Completely free and open source under GPL v2$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$Very broad protocol and hardware support via its module ecosystem$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$Runs locally with no cloud dependency$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$Backed by a registered non-profit association (FHEM e.V.) rather than a single vendor$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$Steep learning curve, especially for non-German speakers, since much community documentation is in German$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$Interface and configuration are text/config-driven rather than modern no-code style$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$Requires a dedicated always-on server to run$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$Smaller international community than newer home automation platforms$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$Is FHEM free?$q$, $q$Yes, FHEM is free and open-source software licensed under GPL v2.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$What hardware does FHEM need?$q$, $q$A 24/7 server such as a NAS, Raspberry Pi, or PC running Perl, plus any protocol-specific hardware (like USB sticks) for the devices you want to control.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$Does FHEM work with Alexa or HomeKit?$q$, $q$Yes, integrations exist for Alexa, HomeKit, MQTT, and several other ecosystems through its module library.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$Who maintains FHEM?$q$, $q$It was created by Rudolf Koenig and is maintained by a large community of contributors, supported by the non-profit FHEM e.V.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$DIY smart home automation$q$, $q$Controlling lights, shutters, heating, and sensors from a single self-hosted server.$q$, $q$Technically-minded homeowners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$Energy and sensor logging$q$, $q$Recording temperature, power consumption, and other sensor data over time.$q$, $q$Home automation hobbyists$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$FHEM is a free, GPL-licensed Perl server for home automation, created by Rudolf Koenig. It automates tasks like controlling lights, shutters, and heating, while logging sensor data such as temperature and power consumption. It's controlled via web interfaces, smartphones, telnet, or direct TCP/IP connections, with support for text, JSON, and XML interfaces over TCP/IP, SSL, or HTTP.$q$, $q$The project has grown to more than 430 community-contributed modules covering a wide range of automation protocols and hardware, and it integrates with systems like Alexa, HomeKit, and MQTT. FHEM e.V. is a registered non-profit association that promotes the software and open standards around it.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$FHEM is aimed at technically-minded homeowners, especially in the German-speaking DIY smart-home community, who want deep customization and broad hardware/protocol support without depending on cloud services.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c12bd7ea-536c-4be0-9ac5-7f0daa0d7911', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── FlowForge ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$FlowForge (now FlowFuse) builds on open-source Node-RED to deploy, manage, and secure low-code flows across teams and sites.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (self-hosted)$q$,
  founded_year = 2021,
  company_size = NULL,
  headquarters = $q$United Kingdom$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$FlowForge (now FlowFuse) extends open-source Node-RED for teams to deploy and manage low-code flows across devices and sites.$q$,
  og_description = $q$FlowForge (now FlowFuse) extends open-source Node-RED for teams to deploy and manage low-code flows across devices and sites.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1ae3dedf-781d-4eba-bac7-7d80412bd2db';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1ae3dedf-781d-4eba-bac7-7d80412bd2db' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Built on Node-RED$q$, $q$Extends the open-source Node-RED low-code flow engine rather than replacing it.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Centralized deployment and version control$q$, $q$Manage and roll out flow changes across many devices and production sites from one place.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Device Agent$q$, $q$Remote deployment agent for pushing flows to edge devices in the field.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Self-hosted option$q$, $q$A free, self-hostable Starter edition, plus air-gapped self-hosted deployments for compliance-sensitive environments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Team collaboration and RBAC$q$, $q$Role-based access control, SSO, and audit logging on paid plans.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Built-in MQTT broker$q$, $q$Included MQTT broker capacity on Pro and Enterprise plans for IoT/OT connectivity.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Built on the mature, widely-used open-source Node-RED project$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Free self-hosted Starter tier for evaluation or small deployments$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Designed specifically for managing Node-RED at industrial/multi-site scale$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$SOC 2 Type 1/2 certified cloud offering for compliance-conscious buyers$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Company and product rebranded from FlowForge to FlowFuse, which can cause confusion when searching for it under the older name$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Paid Cloud Pro and Enterprise plans are priced for teams/organizations, not casual individual use$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Full pricing for Pro/Enterprise self-hosted tiers requires contacting sales$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Is FlowForge the same as FlowFuse?$q$, $q$Yes. FlowForge rebranded to FlowFuse; flowforge.com now redirects to flowfuse.com, and it's the same company and product line built on Node-RED.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Is the open-source edition free?$q$, $q$Yes, the self-hosted Starter/open-source edition is free, supporting up to 5 instances and 5 team members.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Do I need to already use Node-RED?$q$, $q$No, but the platform is specifically designed to extend and manage Node-RED, so familiarity with Node-RED helps.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$What does the paid Cloud plan add?$q$, $q$Paid Cloud plans add hosted instances, team collaboration, an MQTT broker, SSO, and support with uptime SLAs on top of the free open-source core.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Multi-site industrial flow deployment$q$, $q$Rolling out and version-controlling Node-RED flows across many factories or production lines.$q$, $q$Manufacturing and industrial IT/OT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Managed cloud Node-RED hosting$q$, $q$Teams that want hosted Node-RED instances without managing their own servers.$q$, $q$Small teams and developers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Starter (Self-Hosted / Open Source)$q$, $q$Free$q$, NULL, $q$["Up to 5 instances","Up to 5 team members","Core flow management"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Starter (Cloud)$q$, $q$From $20/month$q$, $q$monthly$q$, $q$["1 hosted instance","2 team members","FlowFuse Expert AI assistance","Blueprints"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Pro (Cloud)$q$, $q$From $425/month$q$, $q$monthly$q$, $q$["5 hosted/remote instances","20 team members","MQTT broker","99.5% SLA support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$Enterprise$q$, $q$Custom$q$, $q$annual$q$, $q$["20+ hosted/remote instances","Unlimited team members","SSO","Device group management","99.9% SLA"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$FlowForge was founded in 2021 by Nick O'Leary, co-creator of the open-source Node-RED visual programming tool, alongside Zeger-Jan van de Weg. The company has since rebranded as FlowFuse (flowforge.com now redirects to flowfuse.com), and its platform builds on Node-RED to help teams deploy, version, and centrally manage low-code flows across distributed devices and production sites, connecting core systems like MES/ERP/SCADA to shop-floor operations.$q$, $q$An open-source, self-hostable Starter edition remains free (up to 5 instances and 5 team members), while paid Cloud-hosted (Starter, Pro, Enterprise) and self-hosted Pro/Enterprise plans add team collaboration, device management, SSO, an MQTT broker, and enterprise support and SLAs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$FlowForge/FlowFuse targets manufacturing and industrial teams that already use or want to use Node-RED at scale — coordinating flows across many devices and sites — as well as smaller teams that want a managed, cloud-hosted Node-RED without running their own infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1ae3dedf-781d-4eba-bac7-7d80412bd2db', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── FMD Server ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$FMD Server is the open-source backend behind Find My Device (FMD Android), letting you self-host device location and control.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$FMD Server is the open-source, self-hostable backend for Find My Device (FMD Android), a privacy-friendly device location tool.$q$,
  og_description = $q$FMD Server is the open-source, self-hostable backend for Find My Device (FMD Android), a privacy-friendly device location tool.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$Remote device location$q$, $q$Look up the location of a paired Android device through the web interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$Remote device control$q$, $q$Trigger remote actions on the paired device, such as those exposed by the FMD Android app.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$Decentralized architecture$q$, $q$Run your own server instance instead of depending on a single central provider.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$Free hosted option$q$, $q$A publicly hosted server is available for users who don't want to self-host.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$F-Droid distribution$q$, $q$The companion Android app is distributed via F-Droid and custom repositories.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$Fully open source with a self-hostable server component$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$Privacy-friendly alternative to Google's Find My Device for location recovery$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$Works well with de-Googled or custom Android ROMs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$Free hosted server option available for users who don't want to run their own$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$Requires pairing with the separate FMD Android app to be useful$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$Self-hosting requires following GitLab-hosted setup documentation$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$Smaller community and less polished UX than mainstream device-finding services$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$Is FMD Server free?$q$, $q$Yes, both self-hosting your own FMD Server and using the project's public hosted server are free.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$Do I need the FMD Android app too?$q$, $q$Yes, FMD Server is the backend/web interface; you also need the FMD Android app installed on the device you want to locate or control.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$Can I self-host FMD Server?$q$, $q$Yes, the project provides self-hosting documentation, and the code is open source on GitLab.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$Where can I get the FMD Android app?$q$, $q$It's available via F-Droid and custom repositories, in addition to being paired with FMD Server.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$Privacy-respecting device recovery$q$, $q$Locating or remotely controlling a lost Android phone without relying on Google's cloud.$q$, $q$Privacy-conscious Android users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$Self-hosted find-my-device for custom ROMs$q$, $q$Adding find-my-device capability to de-Googled or custom Android builds.$q$, $q$Custom ROM and de-Googled phone users$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$FMD Server is the web server and web interface component of the FMD (Find My Device) project, a decentralized, open-source system for locating and remotely controlling Android phones. The companion FMD Android app connects to an FMD Server instance so the owner can look up the device's location or trigger remote actions through a browser.$q$, $q$The project offers a public hosted server for convenience, but its code is open source and hosted on GitLab, and users can self-host their own FMD Server instance for full control over their location data instead of relying on the maintainers' hosted option.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$FMD Server is for Android users, especially those on de-Googled or privacy-focused ROMs, who want a Find My Device-style recovery tool without routing their location data through Google's infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a27aac5d-ba7b-4216-98f7-3b5ba2d3cd80', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Gladys ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Gladys Assistant is a free, open-source, self-hosted home automation platform with an optional paid Gladys Plus tier for remote access.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2013,
  company_size = NULL,
  headquarters = $q$France$q$,
  languages = ARRAY[$q$English$q$, $q$French$q$]::text[],
  seo_meta_description = $q$Gladys Assistant is a free, open-source, self-hosted home automation platform with no-code scenes and an optional paid remote-access tier.$q$,
  og_description = $q$Gladys Assistant is a free, open-source, self-hosted home automation platform with no-code scenes and an optional paid remote-access tier.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '82491f2c-b6b1-4919-82ea-838eafd86db9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '82491f2c-b6b1-4919-82ea-838eafd86db9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$Central dashboard$q$, $q$Monitor temperature, cameras, presence, and other device data from one screen.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$No-code scene automation$q$, $q$Build automation routines and scenes without writing code.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$Voice-controlled automation$q$, $q$Includes a built-in voice assistant for controlling devices and scenes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$Broad device support$q$, $q$Integrates with thousands of devices via Zigbee, Matter, MQTT, and dedicated connectors.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$Local-first data storage$q$, $q$Core functionality runs and stores data locally with no mandatory cloud dependency.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$Gladys Plus remote access (paid)$q$, $q$End-to-end encrypted remote access and mobile apps for controlling your home away from your local network.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$Core platform is 100% free, open source, and self-hosted forever$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$No-code scene and automation builder is approachable for non-developers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$Broad protocol support (Zigbee, Matter, MQTT) for thousands of devices$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$Optional paid tier adds secure remote access without giving up the free self-hosted core$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$Full functionality (remote access, mobile apps, backups) requires the paid Gladys Plus subscription$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$Requires Docker/Linux familiarity to self-host$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$Smaller device/integration catalog than some larger commercial smart-home ecosystems$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$Is Gladys Assistant free?$q$, $q$Yes, the core Gladys software is 100% free and open source and can be self-hosted indefinitely at no cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$What does Gladys Plus add?$q$, $q$Gladys Plus is an optional paid subscription (from about €5.83/month) that adds end-to-end encrypted remote access, mobile apps, encrypted backups, remote camera streaming, and AI features.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$Do I need coding skills to use Gladys?$q$, $q$No, scenes and automations are built through a no-code interface.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$What hardware can run Gladys?$q$, $q$Any Linux machine that supports Docker, including a Raspberry Pi, NAS, or mini-PC.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$No-code home automation$q$, $q$Building smart home scenes and routines without programming.$q$, $q$Non-technical smart home users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$Privacy-first smart home with optional remote access$q$, $q$Running automation locally, then adding secure remote access via Gladys Plus when needed.$q$, $q$Privacy-conscious homeowners$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$Gladys (Core, Self-Hosted)$q$, $q$Free$q$, NULL, $q$["Open-source core platform","No-code automation and scenes","Local data storage","Voice control"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$Gladys Plus – Lite$q$, $q$€5.83/month (€69.99/year)$q$, $q$monthly or annual$q$, $q$["End-to-end encrypted remote access","Google Home & Amazon Alexa integration","Open REST API","Family accounts"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$Gladys Plus – Plus$q$, $q$€8.33/month (€99.99/year)$q$, $q$monthly or annual$q$, $q$["Everything in Lite","Daily encrypted backups","Remote camera streaming","AI features","MCP server"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Gladys Assistant is an open-source home automation platform founded by Pierre-Gilles Leymarie that lets users monitor and control smart home devices from a central dashboard, without requiring coding knowledge. Core Gladys is 100% free and open source, deployable via Docker on a Raspberry Pi, NAS, mini-PC, or any Linux machine, and supports thousands of devices through Zigbee, Matter, MQTT, and other integrations with local-first data storage.$q$, $q$An optional paid subscription, Gladys Plus, adds end-to-end encrypted remote access, mobile apps for iOS/Android, Google Home and Amazon Alexa integration, encrypted backups, remote camera streaming, and AI features, priced starting around €5.83/month (Lite) or €8.33/month (Plus) when billed annually.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Gladys is aimed at privacy-conscious users who are comfortable with Docker/Linux and want a no-code way to build smart home scenes and automations, with an optional paid upgrade for those who also want secure remote access and mobile convenience without exposing their own network.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82491f2c-b6b1-4919-82ea-838eafd86db9', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Home Assistant ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source home automation platform that unifies smart home devices under one local, privacy-focused dashboard.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2013,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Home Assistant is a free, open-source home automation platform that runs locally and connects thousands of smart home devices and brands.$q$,
  og_description = $q$Home Assistant is a free, open-source home automation platform that runs locally and connects thousands of smart home devices and brands.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'caf4aea6-fd20-4af6-9d16-4a5cbc4d2503';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'caf4aea6-fd20-4af6-9d16-4a5cbc4d2503' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Local-first control$q$, $q$Automations, dashboards, and voice processing can run entirely on local hardware without cloud dependency.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Massive integration library$q$, $q$Thousands of community-maintained integrations connect brands like Philips Hue, Zigbee/Z-Wave devices, Sonos, and more.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Automation engine$q$, $q$Trigger-condition-action automations plus scripts and scenes for complex home behavior.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Voice assistant (Assist)$q$, $q$A built-in, privacy-focused voice assistant that can process commands locally.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Add-ons via Supervisor$q$, $q$Home Assistant OS supports add-ons for extending the system, such as running additional services alongside the core.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Energy dashboard$q$, $q$Tracks and visualizes home energy production and consumption over time.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Fully free and open source with no required subscription$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Extremely broad device and protocol support$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Strong focus on local control and data privacy$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Large, active community and documentation base$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Initial setup and configuration have a learning curve for non-technical users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Best experience typically requires dedicated hardware (e.g., Raspberry Pi or mini PC)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Remote access and voice assistant integrations require the optional paid cloud subscription$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Is Home Assistant free?$q$, $q$Yes, the core Home Assistant software is free and open source under the Apache 2.0 license. An optional paid Home Assistant Cloud subscription from Nabu Casa adds remote access and voice assistant integrations.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Do I need special hardware to run Home Assistant?$q$, $q$Home Assistant can run on a Raspberry Pi, a mini PC, a NAS, or a virtual machine. Official hardware like Home Assistant Green and Home Assistant Yellow are also sold as ready-to-use options.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Does Home Assistant work without internet access?$q$, $q$Most local automations and device control continue to work without internet access since Home Assistant is designed to run locally.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Who maintains Home Assistant?$q$, $q$Home Assistant is stewarded by the Open Home Foundation, a nonprofit organization, with funding support from Nabu Casa's Home Assistant Cloud subscriptions.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Whole-home automation$q$, $q$Combine lighting, climate, locks, and sensors from different brands into unified automations.$q$, $q$Smart home hobbyists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Local energy monitoring$q$, $q$Track solar production and household energy consumption with the built-in energy dashboard.$q$, $q$Homeowners with solar or smart meters$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Privacy-focused smart home$q$, $q$Run device automation and voice control locally without relying on manufacturer clouds.$q$, $q$Privacy-conscious users$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Home Assistant Core$q$, $q$Free$q$, $q$N/A$q$, $q$["Full local home automation platform","Community integrations","Self-hosted"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$Home Assistant Cloud (Nabu Casa, optional)$q$, $q$$6.50/month or $65/year$q$, $q$monthly or annual$q$, $q$["Secure remote access","Google Assistant & Amazon Alexa integration","Cloud text-to-speech/speech-to-text"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Home Assistant is an open-source home automation platform started by Paulus Schoutsen in 2013 and now stewarded by the nonprofit Open Home Foundation. It runs locally (typically on a Raspberry Pi, mini PC, or NAS) and connects thousands of smart home devices and services through community-built integrations, letting users automate their homes without depending on a vendor's cloud.$q$, $q$The project prioritizes local control and privacy: automations and voice commands can run entirely on your own network. An optional paid subscription, Home Assistant Cloud from Nabu Casa, adds secure remote access and Google Assistant/Amazon Alexa integration, but the core platform is fully usable without it.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Home Assistant is aimed at hobbyists, developers, and privacy-conscious homeowners who want to combine devices from many brands (lighting, climate, locks, cameras, energy monitors, media players) into a single automation system rather than juggling several manufacturer apps.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('caf4aea6-fd20-4af6-9d16-4a5cbc4d2503', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;

-- ── ioBroker ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, Node.js-based integration platform for connecting and automating smart home and IoT devices.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$ioBroker is a free, open-source Node.js integration platform that connects smart home and IoT devices through community-built adapters.$q$,
  og_description = $q$ioBroker is a free, open-source Node.js integration platform that connects smart home and IoT devices through community-built adapters.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '040370f5-8835-4009-88cd-4a1d8b345969';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '040370f5-8835-4009-88cd-4a1d8b345969' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', $q$Adapter ecosystem$q$, $q$Hundreds of community adapters connect devices, protocols (MQTT, KNX, Zigbee, Z-Wave), and cloud services.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', $q$Visual scripting (Blockly/JavaScript)$q$, $q$Automations can be built visually with Blockly or written directly in JavaScript/TypeScript.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', $q$Web-based admin interface$q$, $q$Manage adapters, objects, and instances through a browser-based admin panel.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', $q$Cross-platform hosting$q$, $q$Runs on Raspberry Pi, Docker containers, Linux, macOS, and Windows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', $q$State/object database$q$, $q$Central data store lets different adapters and automations share device state consistently.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', $q$Free and open source with a very large adapter library$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', $q$Runs on low-cost hardware like the Raspberry Pi$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', $q$Flexible visual and code-based automation scripting$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', $q$Active community, especially in German-speaking regions$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', $q$Documentation and community support skew toward German$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', $q$Adapter quality varies since many are community-maintained$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', $q$Requires Node.js familiarity for advanced customization$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', $q$Is ioBroker free?$q$, $q$Yes, ioBroker is free, open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', $q$What hardware does ioBroker run on?$q$, $q$ioBroker runs on any device capable of running Node.js, including Raspberry Pi, Docker containers, Linux, macOS, and Windows.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', $q$Does ioBroker support Zigbee and Z-Wave devices?$q$, $q$Yes, ioBroker has community adapters for Zigbee, Z-Wave, KNX, MQTT, and many other protocols and device brands.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', $q$Multi-protocol smart home hub$q$, $q$Bridge devices using different protocols (Zigbee, Z-Wave, KNX, MQTT) into one automation system.$q$, $q$DIY smart home builders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', $q$Building automation$q$, $q$Integrate building management protocols like KNX alongside consumer smart home devices.$q$, $q$Home automation enthusiasts and installers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ioBroker is an open-source, Node.js-based integration platform for home and building automation. It uses a modular architecture of "adapters" — community-built connectors for hundreds of smart home devices, protocols, and cloud services — that all publish data into a shared object and state database, so different systems can interoperate through one hub.$q$, $q$It runs on Raspberry Pi, Docker, Linux, macOS, and Windows, and is popular in the German-speaking DIY smart home community, though its documentation and adapters also support English.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$ioBroker suits technically inclined users who want a flexible, self-hosted hub to bridge many different smart home ecosystems, sensors, and building automation protocols under one system, with visual scripting for automations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('040370f5-8835-4009-88cd-4a1d8b345969', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Onloc ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted device location tracker that lets you monitor and manage your own devices without third-party services.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Onloc is a free, open-source, self-hosted app for tracking and remotely commanding your own devices without a third-party cloud.$q$,
  og_description = $q$Onloc is a free, open-source, self-hosted app for tracking and remotely commanding your own devices without a third-party cloud.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e1493d3f-721d-4cee-8c01-f904dc3274ec';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e1493d3f-721d-4cee-8c01-f904dc3274ec' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', $q$Self-hosted server$q$, $q$Run your own Onloc backend so location data stays under your control.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', $q$Location history$q$, $q$View a device's current location plus a history of past positions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', $q$Remote device commands$q$, $q$Send commands to tracked devices, such as playing an alert sound to help locate a phone.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', $q$Android app$q$, $q$Official Android client distributed via F-Droid, GitHub releases, and Obtainium.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', $q$Home Assistant integration$q$, $q$Surface tracked device locations inside a Home Assistant smart home setup.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', $q$Free, open-source, and self-hosted for full data ownership$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', $q$No reliance on third-party location tracking services$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', $q$Home Assistant integration for existing smart home users$q$, 2);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', $q$Android app only — no iOS client$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', $q$Requires running and maintaining your own server$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', $q$Smaller community/project compared to established device trackers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', $q$Is Onloc free?$q$, $q$Yes, Onloc is free, open-source software that you self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', $q$Does Onloc have an iOS app?$q$, $q$Onloc's official client is distributed as an Android app; no iOS app is documented on the official site.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', $q$Can Onloc integrate with Home Assistant?$q$, $q$Yes, Onloc documents an integration for use with Home Assistant.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', $q$Self-hosted device tracking$q$, $q$Track the location of personal Android devices without a third-party cloud service.$q$, $q$Privacy-conscious individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', $q$Smart home location awareness$q$, $q$Feed device location data into Home Assistant automations.$q$, $q$Home Assistant users$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Onloc is a self-hosted device tracking application that lets users see the current and historical location of their own devices and send them remote commands, without routing data through a third-party cloud service. Users run their own Onloc server and pair it with the Onloc Android app to report location.$q$, $q$It is aimed at people who want the functionality of a "find my device" style tracker while keeping location data on infrastructure they control, and it includes an integration with Home Assistant for surfacing device positions in a broader smart home setup.$q$]::text[], 0);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e1493d3f-721d-4cee-8c01-f904dc3274ec', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── openHAB ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Vendor- and technology-agnostic open-source home automation platform built in Java.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2010,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$openHAB is a free, open-source, vendor-agnostic home automation platform that integrates devices and protocols from many manufacturers.$q$,
  og_description = $q$openHAB is a free, open-source, vendor-agnostic home automation platform that integrates devices and protocols from many manufacturers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '00ff6895-5fbd-49c5-9a5f-500fdaab2761';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '00ff6895-5fbd-49c5-9a5f-500fdaab2761' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', $q$Bindings ecosystem$q$, $q$Hundreds of community bindings connect devices and protocols like Zigbee, Z-Wave, KNX, and MQTT.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', $q$Rule engine$q$, $q$Define automations using openHAB's rule DSL, JavaScript, Python, or a visual blocky-style editor.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', $q$Multiple UI options$q$, $q$Includes the Main UI, a customizable sitemap-based UI, and support for third-party dashboards.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', $q$Persistence services$q$, $q$Log and store historical item state data for charting and analysis.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', $q$Cross-platform runtime$q$, $q$Runs on any system supporting Java, including Raspberry Pi, Linux, and Windows.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', $q$Free, open source, and technology-agnostic across many device ecosystems$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', $q$Backed by a dedicated nonprofit foundation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', $q$Strong local control with no forced cloud dependency$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', $q$Flexible rule engine supporting multiple scripting languages$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', $q$Steeper learning curve than some consumer-focused home automation tools$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', $q$Java-based runtime can be heavier on constrained hardware$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', $q$UI and setup experience is less polished than commercial alternatives$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', $q$Is openHAB free?$q$, $q$Yes, openHAB is free, open-source software licensed and maintained by the nonprofit openHAB Foundation.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', $q$What hardware does openHAB need?$q$, $q$openHAB runs on anything that supports Java, including a Raspberry Pi, NAS devices, and standard Linux or Windows machines.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', $q$Does openHAB support Zigbee and Z-Wave?$q$, $q$Yes, community bindings provide support for Zigbee, Z-Wave, KNX, MQTT, and many other protocols and brands.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', $q$Multi-vendor home automation$q$, $q$Unify devices from different manufacturers and protocols under one automation system.$q$, $q$Advanced smart home users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', $q$Local, cloud-independent control$q$, $q$Run home automation entirely on local infrastructure without cloud dependency.$q$, $q$Privacy-focused homeowners$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$openHAB (open Home Automation Bus) is an open-source home automation platform that started in 2010 with the goal of being vendor- and technology-agnostic, integrating devices and systems from many different manufacturers and protocols into a single automation environment. It is written in Java and runs on hardware such as a Raspberry Pi, NAS, or generic Linux/Windows server.$q$, $q$The project is stewarded by the openHAB Foundation e.V., a nonprofit organization that promotes free and open-source home automation, and it maintains a large binding (integration) ecosystem contributed by its community.$q$]::text[], 0);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('00ff6895-5fbd-49c5-9a5f-500fdaab2761', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── OpenRemote ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source IoT device management platform for connecting, automating, and visualizing connected devices at scale.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Eindhoven, Netherlands$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$OpenRemote is a free, open-source IoT device management platform for connecting, automating, and visualizing connected devices at scale.$q$,
  og_description = $q$OpenRemote is a free, open-source IoT device management platform for connecting, automating, and visualizing connected devices at scale.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '86bb955c-8712-45a0-8f45-aeab54c99a6f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '86bb955c-8712-45a0-8f45-aeab54c99a6f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$Device connectivity$q$, $q$Link and manage devices and data sources from many manufacturers through one manager interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$Rules and automation$q$, $q$Define rules and scripts to automate behavior across connected assets.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$Dashboards and maps$q$, $q$Build real-time dashboards and geographic maps from device data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$Asset provisioning$q$, $q$Provision and manage IoT assets at scale.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$Custom app development$q$, $q$Build custom applications on top of the platform using web components.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$Fully open-source core with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$Designed for large-scale, multi-device-type IoT deployments$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$Optional professional services for organizations that want managed hosting$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$Used by municipalities and enterprises across multiple sectors$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$Aimed at organizations and integrators rather than individual home users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$Professional/managed offerings are not priced publicly$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$Requires more setup effort than consumer smart-home tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$Is OpenRemote free?$q$, $q$The OpenRemote platform itself is 100% open source and free to self-host. OpenRemote also offers paid professional services for configuration, development, and hosting.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$Who uses OpenRemote?$q$, $q$OpenRemote is used by manufacturers, systems integrators, and organizations including municipalities for IoT device management across sectors like energy, buildings, and smart cities.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$Where is OpenRemote based?$q$, $q$OpenRemote's head office is in Eindhoven, Netherlands, with additional offices in other regions.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$Smart building management$q$, $q$Connect and automate building systems and monitor them through dashboards.$q$, $q$Building system integrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$Municipal IoT deployments$q$, $q$Manage connected city infrastructure like sensors and energy systems.$q$, $q$Smart city teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$Fleet and asset tracking$q$, $q$Provision and monitor distributed connected assets at scale.$q$, $q$IoT solution providers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$Open Source$q$, $q$Free$q$, $q$N/A$q$, $q$["Self-hosted IoT platform","Full source code access","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$Professional Services$q$, $q$Custom / contact sales$q$, $q$N/A$q$, $q$["Configuration and custom development","Managed hosting"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$OpenRemote is a 100% open-source IoT device management platform used to connect, monitor, and automate connected devices and systems, aimed primarily at manufacturers, integrators, and organizations building IoT solutions for sectors like energy, smart buildings, cities, and fleets. The core software is free to self-host with no vendor lock-in.$q$, $q$For organizations that don't want to self-manage the platform, OpenRemote also offers paid professional services covering configuration, custom development, and managed hosting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$OpenRemote targets manufacturers, systems integrators, and organizations that need a device-agnostic platform to manage large numbers of connected assets, rather than individual consumer smart-home users.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('86bb955c-8712-45a0-8f45-aeab54c99a6f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── SIP Irrigation Control ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source DIY sprinkler and irrigation control software that runs on a Raspberry Pi.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$SIP is free, open-source DIY sprinkler and irrigation control software that runs on a Raspberry Pi with a web-based dashboard.$q$,
  og_description = $q$SIP is free, open-source DIY sprinkler and irrigation control software that runs on a Raspberry Pi with a web-based dashboard.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '985dacad-07a6-451c-b58a-1273bc999b4c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '985dacad-07a6-451c-b58a-1273bc999b4c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', $q$Web-based control interface$q$, $q$Manage and monitor irrigation stations through a responsive browser-based dashboard.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', $q$Raspberry Pi hardware support$q$, $q$Runs on Raspberry Pi paired with relay boards or compatible controller boards.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', $q$Plugin architecture$q$, $q$Extend functionality with plugins without modifying the core codebase.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', $q$Node-RED integration$q$, $q$Build visual, flow-based automation logic alongside irrigation scheduling.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', $q$Multiple hardware interfaces$q$, $q$Supports relay boards, OpenSprinkler interface boards, and TIAO Smart Sprinkler controllers.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', $q$Runs on inexpensive Raspberry Pi hardware$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', $q$Extensible through plugins and Node-RED$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', $q$Active community wiki and discussion forum$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', $q$Requires DIY hardware assembly and Raspberry Pi setup$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', $q$No official mobile app$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', $q$Aimed at hobbyists comfortable with self-installation, not turnkey users$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', $q$What hardware do I need for SIP?$q$, $q$SIP runs on a Raspberry Pi paired with a compatible relay board, OpenSprinkler interface board, or TIAO Smart Sprinkler controller.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', $q$Is SIP free?$q$, $q$Yes, SIP is free, open-source irrigation control software.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', $q$Can SIP integrate with other automation tools?$q$, $q$Yes, SIP supports integration with Node-RED for building custom automation flows.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', $q$DIY sprinkler automation$q$, $q$Build a custom, self-hosted irrigation controller using a Raspberry Pi.$q$, $q$Home automation hobbyists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', $q$Custom irrigation scheduling$q$, $q$Program watering schedules and integrate with flow-based automation via Node-RED.$q$, $q$Gardeners and makers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$SIP is free, open-source DIY sprinkler/irrigation control software built with a Python backend and a JavaScript/jQuery web interface, designed to run on a Raspberry Pi. It lets hobbyists build and program custom irrigation controllers using low-cost hardware like relay boards, OpenSprinkler interface boards, or TIAO Smart Sprinkler controllers.$q$, $q$A plugin architecture lets developers extend the system without touching the core code, and it can integrate with Node-RED for visual, flow-based automation logic.$q$]::text[], 0);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('985dacad-07a6-451c-b58a-1273bc999b4c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── SOLECTRUS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted dashboard for visualizing solar power generation, consumption, costs, and savings.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$German$q$, $q$English$q$]::text[],
  seo_meta_description = $q$SOLECTRUS is a free, open-source, self-hosted dashboard for visualizing solar power generation, consumption, costs, and savings.$q$,
  og_description = $q$SOLECTRUS is a free, open-source, self-hosted dashboard for visualizing solar power generation, consumption, costs, and savings.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5a231e16-9bac-4260-965f-8748c267e354';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5a231e16-9bac-4260-965f-8748c267e354' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', $q$Live monitoring$q$, $q$Displays near real-time solar production and consumption data with frequent refresh.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', $q$Historical analytics$q$, $q$Tracks power generation, consumption, cost, and savings trends over time.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', $q$Weather forecast integration$q$, $q$Incorporates weather forecast data alongside energy metrics.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', $q$MQTT support$q$, $q$Ingests data from inverters and energy meters via MQTT.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', $q$Kiosk mode$q$, $q$Runs in a full-screen display mode suitable for dedicated wall-mounted screens.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', $q$Multi-device access$q$, $q$Accessible from desktop, smartphone, and tablet browsers.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', $q$Detailed, frequently refreshed solar energy visualizations$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', $q$Runs on low-cost hardware like a Raspberry Pi or NAS$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', $q$Kiosk mode good for dedicated dashboard displays$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', $q$Interface and documentation are primarily in German$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', $q$Requires Docker/self-hosting setup skills$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', $q$Depends on compatible data sources (e.g., MQTT-capable inverters/meters)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', $q$Is SOLECTRUS free?$q$, $q$Yes, SOLECTRUS is free, open-source software available on GitHub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', $q$What do I need to run SOLECTRUS?$q$, $q$SOLECTRUS is typically deployed via Docker on hardware like a Raspberry Pi, NAS, or small VPS, alongside InfluxDB for data storage.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', $q$Does SOLECTRUS support MQTT data sources?$q$, $q$Yes, it supports MQTT for pulling in data from compatible solar inverters and energy meters.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', $q$Home solar monitoring$q$, $q$Visualize solar production, consumption, and savings on a self-hosted dashboard.$q$, $q$Homeowners with solar installations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', $q$Wall-mounted energy display$q$, $q$Run SOLECTRUS in kiosk mode on a dedicated screen for at-a-glance energy stats.$q$, $q$Solar system owners$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$SOLECTRUS is a self-hosted, open-source dashboard for monitoring and visualizing photovoltaic (solar) energy systems, built on Ruby on Rails and InfluxDB. It displays live and historical data on power generation, consumption, costs, and savings, refreshing readings roughly every 5 seconds.$q$, $q$It's typically deployed via Docker on a Raspberry Pi, NAS (e.g., Synology, Proxmox), or a small server, and supports MQTT for pulling in data from inverters and energy meters, plus a kiosk mode for dedicated wall-mounted displays.$q$]::text[], 0);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5a231e16-9bac-4260-965f-8748c267e354', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Tasmota ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source alternative firmware for ESP8266/ESP32-based smart devices, enabling local control without vendor cloud services.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Tasmota is free, open-source firmware for ESP8266/ESP32 smart devices that enables local control without vendor cloud dependency.$q$,
  og_description = $q$Tasmota is free, open-source firmware for ESP8266/ESP32 smart devices that enables local control without vendor cloud dependency.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4a94ac23-3cd5-4a86-822c-cdd69541e32e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4a94ac23-3cd5-4a86-822c-cdd69541e32e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Local control$q$, $q$Control devices over the local network via web UI, MQTT, or HTTP without cloud dependency.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Broad device support$q$, $q$Supports a wide range of ESP8266/ESP32-based smart plugs, switches, lights, and sensors.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$MQTT integration$q$, $q$Publishes device state and accepts commands over MQTT for use with home automation hubs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Rules engine$q$, $q$Built-in rules let devices trigger actions based on conditions without an external controller.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$OTA firmware updates$q$, $q$Devices can be updated over the air once flashed with Tasmota.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Web-based configuration$q$, $q$Configure Wi-Fi, modules, and device settings through a built-in web interface.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Removes dependency on manufacturer cloud services$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Wide compatibility with inexpensive ESP8266/ESP32 devices$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Integrates well with Home Assistant, openHAB, and other hubs via MQTT$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Requires flashing firmware, which carries some risk of bricking a device$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Not all devices are officially supported or easy to flash$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Manufacturer warranties are typically voided after flashing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Is Tasmota free?$q$, $q$Yes, Tasmota is free, open-source firmware.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$What devices can run Tasmota?$q$, $q$Tasmota runs on ESP8266 and ESP32-based smart devices, including many smart plugs, switches, and sensors, most notably from Sonoff.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Does Tasmota work with Home Assistant?$q$, $q$Yes, Tasmota devices integrate with Home Assistant and other hubs via MQTT.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Cloud-free smart plugs and switches$q$, $q$Flash inexpensive smart devices to remove cloud dependency and enable local control.$q$, $q$Privacy-conscious smart home users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Home automation hub integration$q$, $q$Connect Tasmota-flashed devices to Home Assistant or openHAB via MQTT.$q$, $q$DIY home automation builders$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Tasmota is free, open-source firmware that replaces the stock firmware on ESP8266 and ESP32-based smart devices — such as smart plugs, switches, and sensors from brands like Sonoff — with a version that supports local control via MQTT, HTTP, and a built-in web UI, without requiring a manufacturer's cloud service.$q$, $q$It's widely used alongside home automation platforms like Home Assistant and openHAB, giving users full local control over inexpensive smart devices and reducing dependency on vendor apps.$q$]::text[], 0);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Thingsboard ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source IoT platform for device connectivity, data processing, visualization, and device management.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2016,
  company_size = NULL,
  headquarters = $q$New York, NY, USA$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$ThingsBoard is an open-source IoT platform for device connectivity, data visualization, and device management, free to self-host.$q$,
  og_description = $q$ThingsBoard is an open-source IoT platform for device connectivity, data visualization, and device management, free to self-host.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8e405b1d-8563-4f77-89f4-97e61f455d64';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8e405b1d-8563-4f77-89f4-97e61f455d64' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$Device connectivity$q$, $q$Connect devices using MQTT, CoAP, and HTTP with secure device authentication.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$Rule engine$q$, $q$Flexible processing chains for transforming data and triggering alarms.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$Dashboard widgets$q$, $q$Over 600 customizable widgets for building real-time visualizations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$Multi-tenancy$q$, $q$Supports multiple independent tenants within a single installation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$Horizontal scalability$q$, $q$Microservices architecture supports scaling without downtime.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$Device management APIs$q$, $q$Provision, monitor, and manage devices with defined entity relationships.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$Free, full-featured Community Edition under Apache 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$Scales from small self-hosted deployments to large enterprise use$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$Large widget library for building dashboards without heavy coding$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$Used by well-known enterprises for production IoT deployments$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$Professional Edition and Cloud pricing are not published — requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$Complex feature set has a learning curve for small projects$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$Community Edition lacks some enterprise support and advanced features found in Professional Edition$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$Is ThingsBoard free?$q$, $q$The ThingsBoard Community Edition is free and open source under the Apache 2.0 license. A paid Professional Edition and a managed Cloud (PaaS) option are also available.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$What protocols does ThingsBoard support?$q$, $q$ThingsBoard supports industry-standard IoT protocols including MQTT, CoAP, and HTTP.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$Can ThingsBoard scale to large deployments?$q$, $q$Yes, ThingsBoard uses a microservices architecture designed for horizontal scaling without downtime.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$Industrial IoT monitoring$q$, $q$Collect and visualize sensor and device data from industrial equipment.$q$, $q$Industrial and manufacturing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$Multi-tenant device platforms$q$, $q$Build a device management platform serving multiple independent customers or business units.$q$, $q$IoT solution providers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$Custom IoT dashboards$q$, $q$Create real-time dashboards from device telemetry using built-in widgets.$q$, $q$Developers and data teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$Community Edition$q$, $q$Free$q$, $q$N/A$q$, $q$["Self-hosted deployment","Core device management and rule engine","600+ dashboard widgets"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$Professional Edition$q$, $q$Custom / contact sales$q$, $q$N/A$q$, $q$["Enterprise features","Vendor support","On-premises or cloud deployment"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$ThingsBoard Cloud$q$, $q$Custom / contact sales$q$, $q$N/A$q$, $q$["Fully managed hosting","No infrastructure management"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ThingsBoard is an open-source IoT platform for device connectivity, data collection, processing, visualization, and device management, supporting standard IoT protocols like MQTT, CoAP, and HTTP. The free Community Edition is Apache 2.0 licensed and self-hosted, offering the platform's core functionality including a rule engine, multi-tenancy, and over 600 customizable dashboard widgets.$q$, $q$ThingsBoard Inc., founded in 2016, also offers a paid Professional Edition with enterprise features and support, plus a managed ThingsBoard Cloud (PaaS) option for organizations that don't want to self-host.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$ThingsBoard is aimed at organizations and developers building IoT solutions at scale — device manufacturers, industrial companies, and system integrators — rather than individual consumer smart-home users.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8e405b1d-8563-4f77-89f4-97e61f455d64', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── WebThings Gateway ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source smart home gateway built on W3C Web of Things standards, focused on privacy and local control.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$WebThings Gateway is a free, open-source smart home hub built on W3C Web of Things standards, focused on privacy and local control.$q$,
  og_description = $q$WebThings Gateway is a free, open-source smart home hub built on W3C Web of Things standards, focused on privacy and local control.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e3732b36-1f7f-4598-84f0-2ab858cfea63';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e3732b36-1f7f-4598-84f0-2ab858cfea63' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', $q$Unified device control$q$, $q$Monitor and manage smart home devices through a single web interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', $q$Rules engine$q$, $q$Build automations with a drag-and-drop rules interface.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', $q$Floorplan visualization$q$, $q$View device locations and status on interactive floorplans.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', $q$Historical data logging$q$, $q$Log sensor data over time to review patterns and usage.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', $q$Add-ons for extensibility$q$, $q$Add-ons extend compatibility with additional devices and protocols.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', $q$W3C Web of Things standards$q$, $q$Built on open W3C standards intended to promote device interoperability.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', $q$Free and open source with a focus on privacy and local control$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', $q$Standards-based approach (W3C Web of Things) rather than a proprietary protocol$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', $q$Extensible via add-ons$q$, 2);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', $q$Raspberry Pi-specific release is deprecated; Docker/Snap setup requires more technical comfort$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', $q$No longer developed by Mozilla, now maintained by a smaller team (Krellian Ltd.)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', $q$Smaller device/add-on ecosystem than larger platforms like Home Assistant$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', $q$Is WebThings Gateway still maintained?$q$, $q$Yes, it is currently maintained by Krellian Ltd. after originally being developed by Mozilla, and version 2.0 is distributed via Docker, Snap, and source code.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', $q$Is WebThings Gateway free?$q$, $q$Yes, it is free, open-source software.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', $q$Can I still run WebThings Gateway on a Raspberry Pi?$q$, $q$The dedicated Raspberry Pi image (version 1.1) is marked as deprecated; current deployment is via Docker or Snap.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', $q$Private smart home hub$q$, $q$Control smart home devices locally without depending on manufacturer cloud services.$q$, $q$Privacy-focused smart home users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', $q$Standards-based device integration$q$, $q$Connect devices using the W3C Web of Things standard rather than proprietary protocols.$q$, $q$Developers building interoperable IoT setups$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$WebThings Gateway is open-source software for building a private, self-hosted smart home hub, built on W3C Web of Things standards. It was originally developed by Mozilla and is now maintained by Krellian Ltd. It emphasizes privacy, security, and interoperability by letting users control their smart home devices from a single web interface without relying on manufacturer cloud services.$q$, $q$The gateway is distributed via Docker, Snap, and source code as version 2.0; the older Raspberry Pi-specific release (1.1) has been marked as deprecated in favor of the newer distribution methods.$q$]::text[], 0);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e3732b36-1f7f-4598-84f0-2ab858cfea63', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Cannery ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted app for tracking ammunition inventory and logging shooting sessions.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Cannery is a free, open-source, self-hosted app for tracking ammunition inventory and logging shooting sessions.$q$,
  og_description = $q$Cannery is a free, open-source, self-hosted app for tracking ammunition inventory and logging shooting sessions.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c31deb25-5ad3-4424-a471-a168e2a0264c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c31deb25-5ad3-4424-a471-a168e2a0264c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$Ammunition inventory tracking$q$, $q$Log ammunition by type and caliber to keep a running count of what you have on hand.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$Shooting session logging$q$, $q$Record range trips and automatically deduct rounds used from your tracked inventory.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$Self-hosted deployment$q$, $q$Runs via Docker Compose, deployed behind your own reverse proxy on port 4000.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$Privacy by design$q$, $q$Because it's self-hosted, ammunition data stays on infrastructure you or someone you trust controls.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$Open-source codebase$q$, $q$Source is published under AGPLv3 and hosted on Codeberg for anyone to inspect, fork, or contribute to.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$Free and fully open source under AGPLv3$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$Keeps sensitive ammunition data under your own control$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$Simple Docker Compose deployment$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$Purpose-built for firearm/ammo tracking rather than generic inventory$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$Requires self-hosting know-how (Docker, reverse proxy) to run$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$No official managed cloud hosting from the project itself$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$Narrow focus limited to ammunition, not general inventory or gear$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$Is Cannery free to use?$q$, $q$Yes. Cannery is free, open-source software licensed under AGPLv3.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$How do I host Cannery?$q$, $q$Cannery ships as a Docker Compose setup; you run the container and reverse proxy to it on port 4000.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$Does Cannery offer a hosted version?$q$, $q$There's no official commercial cloud plan. Users self-host or use an instance run by someone they trust.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$What does Cannery track?$q$, $q$Ammunition inventory by caliber/type, plus shooting sessions that deduct rounds used from your stock.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$Personal ammo tracking$q$, $q$Track how much ammunition you have left after each range trip.$q$, $q$Individual firearm owners and hobbyist shooters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$Shared club instance$q$, $q$Run a single self-hosted Cannery instance for a small group or shooting club to track shared or individual stock.$q$, $q$Shooting clubs and groups of friends$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Cannery is a self-hosted firearm and ammunition tracker built for shooters who want to keep tabs on their ammo supply without handing that data to a third party. Users log the ammunition they own, then record shooting sessions that automatically deduct rounds fired from the on-hand count, giving an accurate running total of remaining stock.$q$, $q$The project is open source (AGPLv3) and distributed as a Docker Compose deployment, so anyone comfortable running a small self-hosted service can stand up their own private instance, or use one hosted by someone they trust rather than a commercial provider.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Cannery is aimed at individual firearm owners and reloaders who want a private, ad-free way to track ammunition levels and range usage, plus small shooting clubs or groups of friends who want to share a single self-hosted instance.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c31deb25-5ad3-4424-a471-a168e2a0264c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── HomeBox (SysAdminsMedia) ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted inventory and organization system for tracking household belongings.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$HomeBox (SysAdminsMedia) is a free, open-source, self-hosted inventory system for tracking home items, warranties, and documents.$q$,
  og_description = $q$HomeBox (SysAdminsMedia) is a free, open-source, self-hosted inventory system for tracking home items, warranties, and documents.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'edf1831f-3d22-4a14-9dc1-185e22d2141d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'edf1831f-3d22-4a14-9dc1-185e22d2141d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$Item organization$q$, $q$Organize belongings with categories, locations, and tags for fast filtering.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$Powerful search$q$, $q$Search across your entire inventory to quickly find where an item is stored.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$Image uploads$q$, $q$Attach photos to items for easier identification.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$Document and warranty tracking$q$, $q$Store receipts, manuals, and warranty documents alongside each item.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$Purchase and maintenance history$q$, $q$Track purchase details and maintenance events over an item's lifetime.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$QR code generation$q$, $q$Generate QR labels for instant item lookup via the mobile web UI.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$Bulk import/export$q$, $q$Use reusable item templates with CSV import and export for bulk data entry.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$REST API$q$, $q$Automate inventory updates through a full REST API.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$Free and open source, no account or subscription required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$Lightweight Go binary with a small memory footprint$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$Simple to self-host via Docker or as a bare-metal binary$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$Supports both SQLite (simple) and Postgres (larger installs)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$Actively maintained community continuation after the original project stalled$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$Self-hosting is required; there's no official managed cloud plan from the project$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$Focused on household/personal use rather than enterprise asset management$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$The community fork is relatively young, having resumed development in 2024$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$Is HomeBox free?$q$, $q$Yes, HomeBox is free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$How is this different from the original HomeBox project?$q$, $q$The original project by hay-kot stalled in 2024; SysAdminsMedia forked it and continues active development.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$What database does HomeBox use?$q$, $q$SQLite by default for simplicity, with Postgres supported for larger deployments.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$Can I deploy HomeBox without Docker?$q$, $q$Yes, it can run as a bare-metal binary in addition to Docker deployment.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$Household inventory$q$, $q$Catalog belongings, warranties, and receipts for a home.$q$, $q$Homeowners and renters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$Shared equipment tracking$q$, $q$Track shared gear and tools with locations and maintenance history.$q$, $q$Makerspaces and small households$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$HomeBox is a lightweight, self-hosted inventory and organization system built for home users. Written in Go with an embedded web UI, it's designed to be fast and easy to deploy, with idle memory usage typically under 50MB for the whole container.$q$, $q$This edition, maintained by SysAdminsMedia, is a community-driven continuation of the original HomeBox project by hay-kot, which stalled in 2024. SysAdminsMedia forked the codebase and resumed active development, and the software remains free and open source.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$HomeBox suits homeowners, renters, and hobbyists who want a private, searchable catalog of their belongings, warranties, and maintenance records instead of relying on spreadsheets.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('edf1831f-3d22-4a14-9dc1-185e22d2141d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Inventaire ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, non-profit platform for cataloging your books and sharing, lending, or giving them to friends and communities.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$France$q$,
  languages = ARRAY[$q$English$q$, $q$French$q$]::text[],
  seo_meta_description = $q$Inventaire is a free, open-source, non-profit platform for cataloging books and sharing, lending, or giving them to friends and communities.$q$,
  og_description = $q$Inventaire is a free, open-source, non-profit platform for cataloging books and sharing, lending, or giving them to friends and communities.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '17bcec27-a728-457f-9bcf-8278ac304f04';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '17bcec27-a728-457f-9bcf-8278ac304f04' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$Personal book inventory$q$, $q$Catalog the books you own using entries linked to an open, Wikidata-backed bibliographic database.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$Give, lend, or sell$q$, $q$Mark each book with what you're willing to do with it and to whom.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$Visibility controls$q$, $q$Share your inventory publicly, or restrict it to friends and specific groups.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$Community and group libraries$q$, $q$Used by collectives to run shared libraries around specific topics or languages.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$Self-hostable federation$q$, $q$Anyone can run their own Inventaire instance in addition to the main inventaire.io site.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$Completely free, non-profit, and open source (AGPLv3)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$Built on open bibliographic data rather than a closed proprietary catalog$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$Fine-grained control over who can see each book$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$Supports both individual and community/collective library use$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$Focused narrowly on physical book sharing, not general inventory management$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$Self-hosting your own instance requires technical setup$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$Smaller community/network effect than mainstream book-cataloging apps$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$Is Inventaire free?$q$, $q$Yes, it's a free, non-profit, open-source project.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$Who runs Inventaire?$q$, $q$The Inventaire Association, a French non-profit formed in 2019 to fund full-time contributors.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$Can I self-host Inventaire?$q$, $q$Yes, the software is open source and anyone can run their own federated instance.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$How does Inventaire get its book data?$q$, $q$It builds on an open, multilingual knowledge graph connected to Wikidata and other library sources.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$Personal library sharing$q$, $q$Track your own books and let friends know what's available to borrow or take.$q$, $q$Individual readers and book collectors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$Collective/topic libraries$q$, $q$Run a shared library instance for a group organized around a topic or language.$q$, $q$Reading collectives and community groups$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Inventaire lets people build an inventory of the books they own, mark which ones they're willing to give, lend, or sell, and choose who can see that inventory: the public, or just friends and specific groups. Book data is built on top of an open, multilingual knowledge graph connected to Wikidata, national libraries, and the fediverse rather than a closed proprietary catalog.$q$, $q$The project is stewarded by the Inventaire Association, a French non-profit created in 2019 to support full-time contributors, though the idea for the project dates back to 2011-2013. It is fully open source under AGPLv3, and the flagship instance runs at inventaire.io, with anyone free to run their own federated instance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Inventaire is used by individual book lovers who want to track and share their personal libraries, as well as by small collective-run libraries organized around specific topics or languages.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('17bcec27-a728-457f-9bcf-8278ac304f04', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Inventree ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source inventory management system for parts, stock control, and bill-of-materials tracking, built on Python/Django.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$InvenTree is a free, open-source inventory management system for parts, stock control, BOMs, and production build tracking.$q$,
  og_description = $q$InvenTree is a free, open-source inventory management system for parts, stock control, BOMs, and production build tracking.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7ecc3f02-c0cd-49b1-9080-12b8eb327cb3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7ecc3f02-c0cd-49b1-9080-12b8eb327cb3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$Parts organization$q$, $q$Categorize and structure parts for easy browsing and management.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$Supplier management$q$, $q$Link suppliers to parts and track purchasing information.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$Stock tracking$q$, $q$Track stock across cascading storage locations, with support for serialized items.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$Bill of materials (BOM)$q$, $q$Upload and download BOMs in multiple formats for multi-level assemblies.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$Build tracking$q$, $q$Monitor production builds and allocate components against them.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$Custom reporting$q$, $q$Generate reports from customizable templates.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$REST API and plugins$q$, $q$Integrate with other systems via a RESTful API and Python bindings, and extend behavior with plugins.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$Official mobile apps$q$, $q$Native Android and iOS apps for barcode scanning and on-the-go stock lookups.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$Free and fully open source, self-hostable$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$Strong BOM and production-build tracking beyond simple stock counts$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$REST API and plugin system for customization and integration$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$Official native mobile apps for Android and iOS$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$Active development with third-party managed-hosting options available$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$No official first-party cloud hosting; self-hosting or a third-party host is required$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$Requires familiarity with Python/Django-based deployments for advanced setups$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$Official mobile apps carry a separate one-time purchase price on app stores$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$Is InvenTree free?$q$, $q$Yes, the core InvenTree software is free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$Does InvenTree offer hosted cloud plans?$q$, $q$Not directly from the project, but third parties such as Elestio and Stellar Hosted offer managed InvenTree hosting.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$Is there a mobile app?$q$, $q$Yes, official InvenTree apps are available on Google Play and the Apple App Store for barcode scanning and stock lookups.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$Can InvenTree track bills of materials?$q$, $q$Yes, it supports uploading/downloading BOMs and tracking production builds against them.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$Small business inventory$q$, $q$Track parts, suppliers, and stock levels for a small manufacturing or electronics business.$q$, $q$Small-to-medium businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$Hobbyist electronics inventory$q$, $q$Organize personal component stock with BOMs for DIY builds.$q$, $q$Makers and electronics hobbyists$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$InvenTree is an open-source inventory management system that provides parts management and stock control for small-to-medium businesses and hobbyists. It organizes parts into categories, links them to suppliers, tracks stock across cascading storage locations with serialization support, and supports bill-of-materials (BOM) upload/download plus build tracking for production runs.$q$, $q$Built on Python and Django, InvenTree is self-hosted and exposes a RESTful API with Python bindings, along with a plugin system for extending functionality. Official companion apps are available on the Google Play Store and Apple App Store for barcode scanning and mobile stock lookups. Third-party providers such as Elestio and Stellar Hosted offer managed InvenTree hosting, but the core project itself remains free and self-hosted.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$InvenTree fits small-to-medium businesses, electronics makers, and hobbyists who need flexible parts and stock tracking with BOM and production-build support, without the cost of a full enterprise ERP.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ecc3f02-c0cd-49b1-9080-12b8eb327cb3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Open QuarterMaster ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted inventory management system designed to scale from small retail to large warehouses.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Open QuarterMaster is a free, open-source, self-hosted inventory management system that scales from small retail to warehouses.$q$,
  og_description = $q$Open QuarterMaster is a free, open-source, self-hosted inventory management system that scales from small retail to warehouses.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5643f8fa-5baa-4b88-b21e-5e0c97a9a43a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5643f8fa-5baa-4b88-b21e-5e0c97a9a43a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$Core API$q$, $q$Central API that handles generic inventory tasks: what's stored, where, and related facts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$Base Station frontend$q$, $q$Web interface for direct, easy navigation of inventory managed by the Core API.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$Plugin architecture$q$, $q$Extend the base system with plugins for advanced reporting, warehouse management, and more.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$Scalable design$q$, $q$Architecture intended to adapt from small retail setups to large warehouse operations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$No vendor lock-in$q$, $q$Fully open-source with no licensing fees, so data and deployment stay under your control.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$Free and open source with no licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$Modular plugin system for extending core functionality$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$Actively developed in the open on GitHub with community Discord support$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$Designed to scale from small businesses to large warehouses$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$Requires self-hosting and technical setup (Debian-based deployment documented)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$Smaller community compared to more established inventory platforms$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$Advanced modules like warehouse management depend on the plugin ecosystem maturing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$Is Open QuarterMaster free?$q$, $q$Yes, the software is free and open source; the project also sells optional branded merchandise separately.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$Who maintains Open QuarterMaster?$q$, $q$It's developed and maintained by Epic Breakfast Productions.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$Can it scale to a warehouse?$q$, $q$Yes, its modular design is intended to adapt from small retail to large warehouse operations.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$How do I deploy it?$q$, $q$The project's quickstart guide documents deployment on Debian-based systems.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$Small retail inventory$q$, $q$Track stock for a small retail operation without a licensing cost.$q$, $q$Small retailers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$Warehouse/distribution inventory$q$, $q$Extend the core system with plugins for warehouse-scale operations.$q$, $q$Distribution centers and larger operations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Open QuarterMaster is an open-source inventory management system centered on a Core API that handles the generic tasks of tracking what's stored where. A frontend called the Base Station provides direct, easy-to-navigate access to inventory data, and a plugin architecture lets teams add capabilities such as advanced reporting or warehouse management on top of the core.$q$, $q$The project is maintained by Epic Breakfast Productions and developed in the open on GitHub, with documentation and a Discord community for support. It's built with no licensing fees or vendor lock-in, and is designed to scale from small retail operations to large distribution warehouses.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Open QuarterMaster targets teams that need customizable, self-hosted inventory management at any scale, from small retailers to distribution centers, without paying for a proprietary system.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5643f8fa-5baa-4b88-b21e-5e0c97a9a43a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Part-DB ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted inventory system for tracking and organizing electronic components.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$Russian$q$, $q$Japanese$q$]::text[],
  seo_meta_description = $q$Part-DB is a free, open-source, self-hosted inventory system for tracking electronic components with barcode and KiCad support.$q$,
  og_description = $q$Part-DB is a free, open-source, self-hosted inventory system for tracking electronic components with barcode and KiCad support.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '22f25c2f-1b4c-48c2-90e3-6d5df186e020';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '22f25c2f-1b4c-48c2-90e3-6d5df186e020' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$Component organization$q$, $q$Structure parts by category, footprint, manufacturer, and storage location.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$Barcode and label support$q$, $q$Generate and scan barcodes/labels for physical component bins.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$Distributor integration$q$, $q$Pull part data automatically from Digikey, Mouser, and Octopart.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$KiCad integration$q$, $q$Connect with KiCad for electronics design workflows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$Project/BOM management$q$, $q$Track projects with bill-of-materials functionality.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$User permissions and 2FA$q$, $q$Fine-grained group permissions with optional two-factor authentication.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$Event logging and version history$q$, $q$Track changes to inventory over time.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$REST API$q$, $q$Access and update inventory data programmatically via a RESTful API.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$Free and fully open source under AGPLv3$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$Purpose-built for electronic component tracking with distributor auto-fill$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$Multiple deployment options (Docker, Debian, Kubernetes/Helm, Proxmox LXC)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$Multi-language interface (8 languages)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$KiCad integration for hardware design workflows$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$Requires self-hosting and database setup$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$Interface and workflow are specialized for electronics, not general inventory$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$Community-supported without a commercial support option$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$Is Part-DB free?$q$, $q$Yes, it's completely free and open source under AGPLv3, supported by optional donations.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$What databases does Part-DB support?$q$, $q$MySQL, SQLite, and PostgreSQL.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$Can Part-DB pull part data automatically?$q$, $q$Yes, it integrates with Digikey, Mouser, and Octopart to fetch part information.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$Does Part-DB integrate with KiCad?$q$, $q$Yes, it offers integration for electronics design workflows in KiCad.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$Hobbyist component tracking$q$, $q$Organize a personal collection of electronic parts with barcodes.$q$, $q$Electronics hobbyists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$Makerspace shared inventory$q$, $q$Track shared components across a makerspace or lab with group permissions.$q$, $q$Makerspaces and educational institutions$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Part-DB is a web-based, open-source inventory system purpose-built for tracking electronic components. It organizes parts by category, footprint, manufacturer, and storage location, supports barcode/label generation and scanning, and offers parametric search and filtering for finding components quickly.$q$, $q$The system includes project/BOM management, event logging with version history, two-factor authentication, and fine-grained user permissions with groups. It integrates with distributors such as Digikey, Mouser, and Octopart to auto-fill part information, and supports KiCad for electronics design workflows. Part-DB is licensed under AGPLv3 and can be deployed via Docker, direct installation on Debian, Kubernetes/Helm, or Proxmox VE LXC, backed by MySQL, SQLite, or PostgreSQL.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Part-DB serves electronics hobbyists managing personal component stock, makerspaces with shared inventories, small companies, and educational institutions running electronics labs.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('22f25c2f-1b4c-48c2-90e3-6d5df186e020', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Shelf ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source equipment and asset management platform for tracking gear, bookings, and custody with QR codes.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Shelf is an open-source asset management platform for tracking equipment, bookings, and custody with QR codes and mobile apps.$q$,
  og_description = $q$Shelf is an open-source asset management platform for tracking equipment, bookings, and custody with QR codes and mobile apps.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4af91cc7-bff6-4870-8966-384ef1477386';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4af91cc7-bff6-4870-8966-384ef1477386' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$QR code asset tracking$q$, $q$Tag and track assets at scale using QR codes and printable labels.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Bookings and reservations$q$, $q$Reserve equipment and avoid double bookings with a booking calendar.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Custody management$q$, $q$Track who currently has custody of each asset for accountability.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Location tracking$q$, $q$Monitor where assets are stored or currently located.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Audits$q$, $q$Run equipment audits to verify inventory accuracy.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Mobile apps$q$, $q$Native iOS and Android apps for scanning and managing assets on the go.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Custom fields$q$, $q$Add custom fields to assets, unlimited on paid plans.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$CSV import/export$q$, $q$Bulk import or export asset data on paid plans.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Open-source codebase available on GitHub$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Free tier with unlimited assets for a single user$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$No per-seat pricing on paid plans$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Native mobile apps included on all plans$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Purpose-built booking system to prevent equipment conflicts$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Bookings and reservations require the paid Team plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Advanced features like SSO/SAML are Enterprise-only or an add-on$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Self-hosting the open-source version requires your own setup versus using the hosted product$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Is Shelf free?$q$, $q$Yes, there's a free Personal plan with unlimited assets for one user; paid plans unlock team features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Is Shelf open source?$q$, $q$Yes, its code is available on GitHub and it can be self-hosted.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Does Shelf have a mobile app?$q$, $q$Yes, native apps are available for iOS and Android.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Can Shelf handle equipment bookings?$q$, $q$Yes, the Team and Enterprise plans include bookings, reservations, and a booking calendar.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Media/production gear tracking$q$, $q$Track cameras, lenses, and equipment with bookings to avoid conflicts.$q$, $q$Production companies and film studios$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Institutional asset management$q$, $q$Manage shared equipment across departments with custody tracking.$q$, $q$Universities and research facilities$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Personal$q$, $q$Free$q$, $q$N/A$q$, $q$["Unlimited assets","1 user","3 custom fields","Locations and kits","Advanced asset index"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Plus$q$, $q$$34/month$q$, $q$monthly$q$, $q$["Everything in Personal","Unlimited custom fields","CSV import/export","Email support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Team$q$, $q$$67/month$q$, $q$monthly$q$, $q$["Everything in Plus","Unlimited team members","Bookings and reservations","Booking calendar and pull lists"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, $q$["Everything in Team","SSO/SAML/SCIM","Dedicated account manager and SLA","Priority support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Shelf (shelf.nu) is an open-source asset and equipment management platform built to replace spreadsheets for tracking gear. It lets teams tag assets with QR codes and labels, manage bookings and reservations to prevent scheduling conflicts, track custody of who currently holds an item, monitor asset locations, and run audits.$q$, $q$The code is open source and available on GitHub, and Shelf also offers a hosted product with a free personal tier and paid Plus, Team, and Enterprise plans. Native mobile apps are available for iOS and Android, and there's no per-user pricing on any plan.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Shelf is used across universities, production companies and film studios, professional sports organizations, scientific research facilities, and utility/media companies that need to track physical equipment and prevent double bookings.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Atomic Server ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted headless CMS and real-time graph database built around the Atomic Data specification.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Atomic Server is a free, open-source, self-hosted headless CMS and real-time graph database with API and AI/MCP integration.$q$,
  og_description = $q$Atomic Server is a free, open-source, self-hosted headless CMS and real-time graph database with API and AI/MCP integration.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd84ff4aa-f743-48ec-bcc7-7292ca1a5767';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd84ff4aa-f743-48ec-bcc7-7292ca1a5767' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Lightweight self-hosted binary$q$, $q$8MB, dependency-free server that runs on Linux, Windows, macOS, and ARM.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$RESTful API (JSON-AD)$q$, $q$Programmatic access to structured Atomic Data over a REST API.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Real-time sync$q$, $q$Websocket-based real-time synchronization across clients.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Ontology Editor$q$, $q$Define custom data models/schemas visually.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Table editing and documents$q$, $q$Airtable-style tables and collaborative documents built on the same data layer.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Full-text fuzzy search$q$, $q$Search across stored data with fuzzy matching.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Event-sourced versioning$q$, $q$Track and roll back changes using an event-sourced history model.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$AI integration via MCP$q$, $q$Connect AI assistants to your data through the Model Context Protocol.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$MIT licensed and fully open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Extremely lightweight and fast to self-host$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Cross-platform binary (Linux, Windows, macOS, ARM)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Real-time collaboration features (tables, docs, chat) built in$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Native AI/MCP integration for connecting assistants to structured data$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Still in alpha, with breaking changes expected before 1.0$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Atomic Data's graph-based model has a learning curve versus traditional relational CMS tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Smaller ecosystem/community than mainstream headless CMS platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Is Atomic Server free?$q$, $q$Yes, it's free and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$What platforms does it run on?$q$, $q$Linux, Windows, macOS, and ARM devices, as a single lightweight binary.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Is Atomic Server production-ready?$q$, $q$It's currently in alpha status, and breaking changes are expected before a 1.0 release.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Does it support AI integration?$q$, $q$Yes, it integrates with AI assistants via the Model Context Protocol (MCP).$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Structured content management$q$, $q$Model and serve structured data as a lightweight headless CMS.$q$, $q$Developers building content-driven apps$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Real-time collaborative data apps$q$, $q$Build collaborative tables, documents, or chat on a shared real-time data layer.$q$, $q$Teams building internal tools$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Atomic Server is an open-source headless CMS and real-time graph database for creating, sharing, and modeling structured data using the Atomic Data format. It's distributed as an 8MB, dependency-free binary that runs on Linux, Windows, macOS, and ARM devices, with sub-millisecond median response times.$q$, $q$It ships with a React-based Data Browser frontend, a RESTful API returning JSON-AD, full-text fuzzy search, real-time sync over websockets, event-sourced version history, an Ontology Editor for custom data models, Airtable-style table editing, collaborative documents, group chat, and AI integration via the MCP protocol. The project is MIT licensed, with JavaScript/TypeScript libraries (@tomic/lib, @tomic/react, @tomic/svelte), a Rust library, and a CLI tool. As of research, the project is in alpha status with breaking changes expected before a 1.0 release.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Atomic Server is aimed at developers and teams building self-hosted, collaborative applications or structured-content systems who want a lightweight, real-time alternative to heavier headless CMS or graph database stacks.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── LibreKB ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted knowledge base application for building documentation and support sites.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$LibreKB is a free, open-source, self-hosted knowledge base application for building documentation and support sites.$q$,
  og_description = $q$LibreKB is a free, open-source, self-hosted knowledge base application for building documentation and support sites.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c69e1506-7e03-4ddc-b000-d2233369bdcb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c69e1506-7e03-4ddc-b000-d2233369bdcb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$Article editor$q$, $q$Write and format knowledge base articles using a TinyMCE-based editor.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$User groups and permissions$q$, $q$Manage contributors and readers with predefined user groups.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$Password reset via email$q$, $q$Built-in email-based password recovery for user accounts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$Custom branding$q$, $q$Customize the look and branding of your knowledge base.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$Responsive design$q$, $q$Bootstrap-based UI that works across desktop and mobile browsers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$Flexible deployment$q$, $q$Runs on standard PHP/MySQL hosting or via Docker.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$Completely free and open source (GPL-3.0)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$Runs on widely available, inexpensive PHP/MySQL hosting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$No vendor lock-in versus commercial knowledge base SaaS tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$Customizable branding for internal or public-facing documentation$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$Requires self-hosting and basic server administration$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$Smaller feature set than mature commercial knowledge base platforms$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$No official managed cloud hosting from the project$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$Is LibreKB free?$q$, $q$Yes, it's 100% free and open source under GPL-3.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$What do I need to host LibreKB?$q$, $q$Standard PHP and MySQL hosting, or Docker.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$Can I customize the branding?$q$, $q$Yes, LibreKB supports customizable branding for your knowledge base.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$Does LibreKB support user permissions?$q$, $q$Yes, it includes user management with predefined groups.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$Internal documentation$q$, $q$Host internal team documentation on your own infrastructure.$q$, $q$Small businesses and IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$Public support/help center$q$, $q$Publish a self-hosted help center for customers.$q$, $q$Organizations wanting to avoid SaaS knowledge base fees$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$LibreKB is a self-hosted, PHP-based knowledge base web application for creating and managing documentation or support content. It includes user management with predefined groups, a TinyMCE-based article editor, email-based password resets, and a responsive Bootstrap interface with customizable branding.$q$, $q$The project is 100% free and open source under the GPL-3.0 license, runs on MySQL, and can be deployed on nearly any standard web host or via Docker, without vendor lock-in.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$LibreKB fits organizations and small businesses that want an affordable, self-hosted alternative to commercial knowledge base or help-center software.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c69e1506-7e03-4ddc-b000-d2233369bdcb', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Chamilo LMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source e-learning platform used to deliver online courses, training, and certifications.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2010,
  company_size = NULL,
  headquarters = $q$Belgium$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Chamilo LMS is a free, open-source e-learning platform for online courses, training, and certifications, backed by BeezNest.$q$,
  og_description = $q$Chamilo LMS is a free, open-source e-learning platform for online courses, training, and certifications, backed by BeezNest.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e674cd08-a074-41e5-a462-469391a5b739';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e674cd08-a074-41e5-a462-469391a5b739' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$Online course delivery$q$, $q$Build and deliver structured online courses to learners.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$Certifications$q$, $q$Issue training certifications on course completion.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$Online events$q$, $q$Host and manage online learning events within the platform.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$GDPR compliance$q$, $q$Built with GDPR compliance for handling learner data in the EU.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$Community support$q$, $q$Access community forums and a training catalog for support and learning resources.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$Free and open source with no licensing cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$Recognized as a UN Digital Public Good$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$GDPR compliant, relevant for EU-based institutions$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$Large existing user base (41M+ reported learners)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$Backed by a dedicated company (BeezNest) actively developing the platform$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$Self-hosting requires server setup and maintenance$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$Fewer built-in integrations than some commercial LMS platforms$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$Support beyond community resources may require BeezNest's paid services$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$Is Chamilo LMS free?$q$, $q$Yes, Chamilo is free, open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$Who develops Chamilo?$q$, $q$BeezNest, a Belgium-based open-source software company, has governed and produced most of Chamilo's code since 2015.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$When was Chamilo founded?$q$, $q$The Chamilo project was founded in 2010, building on code originating from the Claroline project (2001).$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$Is Chamilo GDPR compliant?$q$, $q$Yes, the platform is GDPR compliant.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$Is Chamilo recognized by any standards bodies?$q$, $q$Yes, it's certified as a Digital Public Good by the UN-backed Digital Public Goods Alliance.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$Institutional online learning$q$, $q$Deliver courses, training, and certifications for a school or university.$q$, $q$Educational institutions$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$Corporate training$q$, $q$Run employee training programs and track completion/certification.$q$, $q$Enterprises and training organizations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Chamilo LMS is a free, open-source e-learning platform used to deliver online courses, training programs, certifications, and events. The project was founded in 2010 as a fork intended to protect the openness of an earlier free-software e-learning platform, and its codebase traces back further to the Claroline project first published in 2001.$q$, $q$Chamilo is recognized as a Digital Public Good by the UN-backed Digital Public Goods Alliance and is GDPR compliant. It has been governed by BeezNest, a Belgium-based open-source software company, since 2015 (and specifically Belgium since January 2026); BeezNest has produced roughly 90% of the platform's code. Chamilo reports over 41 million learners worldwide using the platform.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Chamilo is used by educational institutions, training organizations, and enterprises that need a free, self-hostable LMS for course delivery, certification, and online events.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e674cd08-a074-41e5-a462-469391a5b739', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── edX ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A global online learning marketplace offering courses, professional certificates, and degrees from top universities and companies.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2012,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$edX offers online courses, professional certificates, and degrees from top universities and companies, with free auditing and paid verified credentials.$q$,
  og_description = $q$edX offers online courses, professional certificates, and degrees from top universities and companies, with free auditing and paid verified credentials.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5e95356b-e091-45fd-baab-10b9302b101c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5e95356b-e091-45fd-baab-10b9302b101c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Audit and Verified tracks$q$, $q$Most courses can be audited for free, with a paid verified track that adds graded assignments and a certificate.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Professional certificate programs$q$, $q$MicroMasters, MicroBachelors, and XSeries programs bundle multiple courses into a stackable credential.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Full online degree programs$q$, $q$Bachelor's and master's degrees are offered through edX's university partners.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Executive education$q$, $q$Short-form professional programs aimed at working professionals and leadership development.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Broad catalog$q$, $q$Courses span AI, data science, programming, business, and many other subjects from recognized institutions.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Powered by Open edX$q$, $q$The underlying platform is the open-source Open edX project, which other organizations can self-host independently.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Free auditing gives access to most course content without payment$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Courses and degrees come from well-known universities and companies$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Stackable credentials (MicroMasters, MicroBachelors) can count toward full degrees$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Offers both self-paced and instructor-paced course formats$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Verified certificates, credential programs, and degrees require payment$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$edx.org itself is not self-hosted; running your own instance requires the separate Open edX project$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Course quality, pacing, and support vary by partner institution$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Is edX free?$q$, $q$Auditing most courses is free; earning a verified certificate, MicroMasters credential, or degree requires payment.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Can I self-host edX?$q$, $q$edx.org itself is a hosted service. Organizations that want to run their own instance use the free, open-source Open edX platform separately.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Who created edX?$q$, $q$edX was founded in 2012 by Harvard University and MIT.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Does edX offer full degrees?$q$, $q$Yes, edX offers bachelor's and master's degree programs from partner universities alongside individual courses and certificates.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Free skill building$q$, $q$Audit courses at no cost to learn a new subject or skill.$q$, $q$Individual learners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Career credentials$q$, $q$Earn verified certificates and MicroMasters credentials to advance a career.$q$, $q$Working professionals$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Accredited degrees$q$, $q$Enroll in accredited online bachelor's or master's degree programs.$q$, $q$Prospective students$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Audit Track$q$, $q$Free$q$, $q$Per course$q$, $q$["Access to course materials","No certificate"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$Verified Track$q$, $q$Varies by course$q$, $q$Per course$q$, $q$["Graded assignments","Verified certificate upon completion"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$edX was founded in 2012 by Harvard University and MIT as an online course marketplace, and today offers courses, professional certificates, and full degree programs from universities and companies around the world.$q$, $q$Learners can audit most course content for free or pay for a verified track that includes graded work and a certificate. edX also offers stacked credential programs such as MicroMasters, MicroBachelors, and XSeries, as well as full bachelor's and master's degree programs delivered with partner universities.$q$, $q$The site itself is a hosted, commercial platform rather than self-hosted software. Organizations that want to run their own branded learning site instead use the separate open-source Open edX platform, which powers edX.org and hundreds of other independent learning sites.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$edX serves individual learners looking to build skills for free, professionals pursuing certificates and career-focused credentials, and prospective students seeking accredited online degrees from partner institutions.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e95356b-e091-45fd-baab-10b9302b101c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Gibbon ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source school management software that schools can self-host to manage students, timetables, and communication.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2010,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Gibbon is a free, open-source, self-hosted school management platform for students, teachers, and parents, founded in 2010.$q$,
  og_description = $q$Gibbon is a free, open-source, self-hosted school management platform for students, teachers, and parents, founded in 2010.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '23a978e7-3e1a-4d34-b4db-5a37d2dff05c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '23a978e7-3e1a-4d34-b4db-5a37d2dff05c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$Student information management$q$, $q$Central records for students across enrollment, contacts, and academic history.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$Timetabling tools$q$, $q$Tools for building and managing class schedules.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$Planning, teaching, and assessment$q$, $q$Modules that support lesson planning, gradebooks, and assessment tracking.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$Role-based access$q$, $q$Configurable access levels for students, teachers, parents, and administrators.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$26-language translation support$q$, $q$Actively translated interface, including right-to-left text and UTF-8 encoding.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$Extensible module system$q$, $q$A themeable, modular architecture that schools and developers can extend.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$Completely free and open source with no licensing cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$Full data ownership since schools self-host their own data$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$Highly configurable roles and permissions$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$Actively translated into 26 languages by a volunteer community$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$Requires a server and technical setup to self-host$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$Smaller ecosystem than commercial school management vendors$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$Support relies on documentation and community rather than a dedicated vendor$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$Is Gibbon free?$q$, $q$Yes, Gibbon is completely free and open source; schools can self-host it at no licensing cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$Who built Gibbon?$q$, $q$Gibbon was founded in 2010 by Ross Parker at International College Hong Kong and is now maintained by the Gibbon Foundation with community contributors.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$Is Gibbon available in languages other than English?$q$, $q$Yes, Gibbon is available in 26 actively translated languages, including right-to-left languages.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$Do I need technical skills to run Gibbon?$q$, $q$Yes, since it's self-hosted, schools need to install it on their own server (or via a hosting provider) and maintain their own backups.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$Independent and international schools$q$, $q$Host their own student data instead of relying on an external SaaS vendor.$q$, $q$School administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$Homeschool co-ops and small schools$q$, $q$Use a free alternative to paid school management software.$q$, $q$Small or under-resourced schools$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Gibbon was founded in 2010 by Ross Parker at International College Hong Kong and has grown into a free, open-source school platform maintained by the Gibbon Foundation with community contributors on GitHub.$q$, $q$The software is designed as a unified access point for students, teachers, parents, and administrators, covering student information, timetabling, planning, teaching, and assessment. Because it is self-hosted, schools can host it on their own servers, back it up, redistribute it, and modify it as needed.$q$, $q$Gibbon is available in 26 actively translated languages, including right-to-left languages, and its module system is designed to be flexible, extensible, and themeable.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Gibbon is used by international schools, public schools, homeschools, and under-resourced or refugee schools around the world that need a free, self-hosted alternative to commercial school management systems.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23a978e7-3e1a-4d34-b4db-5a37d2dff05c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Helium ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A free, open-source student planner that combines class schedules, assignments, and grade tracking in one calendar.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Helium is a free, open-source student planner app for tracking classes, assignments, and grades on web, iOS, and Android.$q$,
  og_description = $q$Helium is a free, open-source student planner app for tracking classes, assignments, and grades on web, iOS, and Android.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4cbf934b-aea7-4a55-98f6-4e21939c1ec3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4cbf934b-aea7-4a55-98f6-4e21939c1ec3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$Unified academic calendar$q$, $q$Month, week, day, agenda, and to-do views combine classes, assignments, and personal events.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$Grade tracker and calculator$q$, $q$Real-time grade calculations, including 'what could I get' and 'what do I need' projections.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$At-risk class alerts$q$, $q$Surfaces struggling classes automatically based on customizable thresholds.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$Rich notebook$q$, $q$Formatted note-taking tied to specific classes and assignments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$Reminders$q$, $q$Push notifications and email alerts before deadlines.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$External calendar sync$q$, $q$Supports Google, Apple, and iCal calendar subscriptions.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$Native mobile apps$q$, $q$iOS and Android apps are available alongside the web app.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$Completely free and ad-free, funded by Patreon supporters$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$Open-source codebase available on GitHub$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$Native iOS and Android apps in addition to the web app$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$Grade projection tools help students track academic standing$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$Aimed at individual students rather than institutions$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$Sustained by voluntary funding rather than a dedicated support team$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$Self-hosting the open-source backend requires technical setup$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$Is Helium free?$q$, $q$Yes, Helium is completely free and ad-free, funded through Patreon supporters.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$Is Helium open source?$q$, $q$Yes, its Django backend and related tools are open source on GitHub under the HeliumEdu organization.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$What platforms does Helium support?$q$, $q$Helium is available as a web app plus native iOS and Android apps.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$Can I export my data from Helium?$q$, $q$Yes, Helium supports full data export and import in JSON format.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$College coursework tracking$q$, $q$Track assignments, grades, and deadlines across multiple classes.$q$, $q$College and university students$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$High school planning$q$, $q$Plan coursework and monitor at-risk classes before grades slip.$q$, $q$High school students$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Helium is a student planning app that brings classes, assignments, personal events, grades, and notes together in one color-coded calendar. It's funded entirely through Patreon supporters, which keeps it free and ad-free rather than run as a paid product.$q$, $q$The Django backend and related tools are open source on GitHub under the HeliumEdu organization, led by Alex Laird with community contributors welcome. Users retain full control of their data, including complete export and import in JSON format.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Helium is aimed at high school, college, and university students who want a single tool for tracking classes, assignments, deadlines, and grades instead of juggling separate calendar and spreadsheet apps.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4cbf934b-aea7-4a55-98f6-4e21939c1ec3', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── ILIAS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An open-source learning management system, in use since 1998, that universities, schools, and enterprises can self-host.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 1998,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$ILIAS is a free, open-source learning management system in use since 1998, self-hostable by universities, schools, and enterprises.$q$,
  og_description = $q$ILIAS is a free, open-source learning management system in use since 1998, self-hostable by universities, schools, and enterprises.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bc4665f4-feb7-4c9e-a25a-245306d04d1f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bc4665f4-feb7-4c9e-a25a-245306d04d1f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$Course and learning-module management$q$, $q$Tools for building and organizing online learning content.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$Assessment and test engine$q$, $q$Built-in tools for creating and grading online tests.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$Standards-compliant content support$q$, $q$Designed to fulfill common e-learning content and interoperability requirements.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$Role-based user and group management$q$, $q$Configurable access for different learner and administrator roles.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$Free GPL self-hosting$q$, $q$Downloadable and self-hostable at no licensing cost.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$Professional partner network$q$, $q$Third-party providers offer managed hosting, customization, and training.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$Mature, long-track-record open-source LMS in use since 1998$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$Free to self-host under the GPL license$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$Supported by a professional partner network for hosting, customization, and training$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$Serves diverse sectors: education, enterprise, and government$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$Site and documentation are primarily in German and English$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$Self-hosting requires server administration skills$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$Enterprise-grade support requires going through third-party partners rather than ILIAS itself$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$Is ILIAS free?$q$, $q$Yes, ILIAS is free open-source software released under the GPL; anyone can download and self-host it.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$How old is ILIAS?$q$, $q$ILIAS began as a project at the University of Cologne in 1998, making it one of the longer-running open-source LMS projects.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$Can I use ILIAS without running my own server?$q$, $q$Yes, a network of professional service providers offers managed ILIAS hosting for organizations that don't want to self-host.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$Who uses ILIAS?$q$, $q$Universities, schools, enterprises, and public administration organizations use ILIAS for e-learning and training.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$University-scale e-learning$q$, $q$Deliver large-scale online courses and assessments.$q$, $q$Higher education institutions$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$Corporate training$q$, $q$Run self-hosted training programs with full data control.$q$, $q$Corporate L&D teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ILIAS began as a project at the University of Cologne in 1998 and has grown into a long-running, GPL-licensed open-source learning management system used internationally.$q$, $q$Organizations can download ILIAS and self-host it on their own servers, or use one of a network of professional service providers that offer managed ILIAS hosting, customization, and training for those who prefer not to run it themselves.$q$, $q$The platform serves four main sectors: universities, enterprises, schools, and public administration, each of which can implement individual learning scenarios and training programs on top of the same core software.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$ILIAS is used by universities and vocational schools running e-learning at scale, enterprises needing self-hosted corporate training, and public-sector organizations with data-sovereignty requirements.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bc4665f4-feb7-4c9e-a25a-245306d04d1f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── INGInious ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An open-source automated grading platform that gives students instant feedback on programming assignments.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2014,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$]::text[],
  seo_meta_description = $q$INGInious is a free, open-source platform that automatically grades programming assignments and integrates with Moodle and edX.$q$,
  og_description = $q$INGInious is a free, open-source platform that automatically grades programming assignments and integrates with Moodle and edX.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '455123f9-8dc8-466a-b9ac-7b565c629ede';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '455123f9-8dc8-466a-b9ac-7b565c629ede' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$Automated grading and feedback$q$, $q$Automatically evaluates programming submissions and returns feedback rather than a simple pass/fail.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$Non-binary feedback$q$, $q$Gives partial-credit style feedback designed to help students improve.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$LMS integration$q$, $q$Integrates with Moodle and edX/Open edX.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$Self-hostable deployment$q$, $q$Deployable by teachers from the open-source GitHub repository.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$Multiple skill levels supported$q$, $q$Works for beginners through university-level programming coursework.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$AGPL open-source licensing$q$, $q$Free to use and modify under the AGPL license.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$Free, self-hosted automated grading reduces manual instructor workload$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$Integrates with existing LMS platforms like Moodle and edX$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$Supports a wide range of programming skill levels$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$Actively developed since 2014 with institutional backing$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$Focused on programming/CS education rather than general LMS features$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$Requires technical setup to self-host$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$Smaller documentation and community compared to mainstream LMS projects$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$Is INGInious free?$q$, $q$Yes, INGInious is free and open source under the AGPL license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$What is INGInious used for?$q$, $q$It automatically grades and gives feedback on programming assignments, functioning as an online teaching assistant.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$Can INGInious integrate with other LMS tools?$q$, $q$Yes, it integrates with Moodle and edX/Open edX.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$Who created INGInious?$q$, $q$INGInious originated at Université catholique de Louvain and has been under active development since 2014.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$Automated coding assignment grading$q$, $q$Automate grading of programming assignments for a course.$q$, $q$University CS instructors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$Self-directed programming practice$q$, $q$Practice coding and get instant feedback outside a formal class.$q$, $q$Individual learners$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$INGInious originated at Université catholique de Louvain and has been in active development since 2014, with partial funding from Wallonie. It's released under the AGPL license and describes itself as an online teaching assistant.$q$, $q$The platform automatically evaluates programming submissions and returns non-binary feedback intended to help students improve, rather than a simple pass/fail result. It supports learners from beginners through university-level coursework in a single environment.$q$, $q$Teachers can download INGInious from GitHub and self-host it, and it integrates with existing learning management systems including Moodle and edX/Open edX.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$INGInious is built for computer science instructors who need automated grading for programming exercises, and for students who want instant feedback while learning to code.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('455123f9-8dc8-466a-b9ac-7b565c629ede', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Open eClass ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A free, open-source learning management system from Greece's GUnet, self-hostable for course delivery and e-learning.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2003,
  company_size = NULL,
  headquarters = $q$Athens, Greece$q$,
  languages = ARRAY[$q$English$q$, $q$Greek$q$]::text[],
  seo_meta_description = $q$Open eClass is a free, open-source LMS developed by Greece's GUnet since 2003, available to self-host or use via a free hosted instance.$q$,
  og_description = $q$Open eClass is a free, open-source LMS developed by Greece's GUnet since 2003, available to self-host or use via a free hosted instance.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '128ae277-f9ab-42e4-8593-e90d754504e5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '128ae277-f9ab-42e4-8593-e90d754504e5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$Course creation and content management$q$, $q$Tools to build and organize course content.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$Automated exercises and quizzes$q$, $q$Built-in tools for creating graded exercises.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$Learning pathways and analytics$q$, $q$Tracks learner progress and performance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$Multimedia and e-book integration$q$, $q$Supports rich media content within courses.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$Communication tools$q$, $q$Synchronous and asynchronous communication for instructors and students.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$Self-hosting or free hosted instance$q$, $q$Downloadable self-hosted install or GUnet's free hosted option.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$Free and open source with a long operating track record since 2003$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$Available in multiple languages$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$Option to self-host or use GUnet's free managed instance$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$Backed by an academic network with institutional support$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$Primary community and documentation emphasis is on the Greek academic sector$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$Self-hosting requires server setup and maintenance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$Smaller international adoption compared to platforms like Moodle$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$Is Open eClass free?$q$, $q$Yes, Open eClass is free, open-source software distributed under the GNU GPL license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$Who develops Open eClass?$q$, $q$It's developed by GUnet, the Greek Universities Network eLearning group, based in Athens.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$Can I try Open eClass without installing it?$q$, $q$Yes, GUnet provides a demo instance and a free hosted instance in addition to the downloadable self-hosted version.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$How long has Open eClass been around?$q$, $q$It has been developed and distributed since 2003.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$Academic course delivery$q$, $q$Deliver accredited online courses at universities.$q$, $q$Higher education institutions$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$Vocational and enterprise training$q$, $q$Manage employee or student training programs.$q$, $q$Training organizations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Open eClass (formerly GUnet eClass) has been developed and distributed since 2003 by the GUnet eLearning group, part of the Greek Universities Network based in Athens, and is released as open-source software under the GNU GPL license.$q$, $q$The platform provides course creation, automated exercises, learning pathways, performance analytics, multimedia and e-book integration, and both synchronous and asynchronous communication tools.$q$, $q$Organizations can download and self-host Open eClass, or use GUnet's demo and free hosted instances instead of running their own installation.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Open eClass is used by universities, adult-education centers, vocational training institutes, and enterprises — particularly within Greece's academic network — that need a free LMS.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('128ae277-f9ab-42e4-8593-e90d754504e5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── OpenOLAT ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An open-source learning management system for testing, courses, and collaboration, self-hostable or available via managed hosting.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2011,
  company_size = NULL,
  headquarters = $q$Zürich, Switzerland$q$,
  languages = ARRAY[$q$German$q$, $q$English$q$]::text[],
  seo_meta_description = $q$OpenOLAT is an open-source LMS forked from OLAT in 2011, free to self-host, with optional commercial hosting from frentix in Zurich.$q$,
  og_description = $q$OpenOLAT is an open-source LMS forked from OLAT in 2011, free to self-host, with optional commercial hosting from frentix in Zurich.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a2781d6d-0be8-4b83-b404-3a5b91254b15';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a2781d6d-0be8-4b83-b404-3a5b91254b15' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$eTesting and assessment$q$, $q$Built-in tools for creating and grading tests and exams.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$Video integration$q$, $q$Video content with interactive elements embedded in courses.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$Webconferencing via BigBlueButton$q$, $q$Live sessions integrated directly into the platform.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$Enterprise authentication$q$, $q$Supports LDAP, Active Directory, OAuth2, and Shibboleth for user management.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$Calendar and attendance tracking$q$, $q$Scheduling and attendance tools built into the platform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$Document collaboration$q$, $q$Document management and collaborative editing tools.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$Free self-hosting or managed hosting$q$, $q$Run it yourself for free, or use frentix's commercial hosting service.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$Mature codebase with roots going back to 1999$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$Free to self-host with no licensing cost$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$Built-in enterprise authentication integrations (LDAP/AD/OAuth2/Shibboleth)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$Commercial managed hosting available for organizations that don't want to self-host$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$Primary documentation and market focus is German-speaking regions$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$Self-hosting requires Java application server expertise$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$Managed hosting pricing isn't published and requires contacting frentix directly$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$Is OpenOLAT free?$q$, $q$Yes, the self-hosted OpenOLAT software is free and open source; frentix separately offers paid managed hosting for those who don't want to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$Who maintains OpenOLAT?$q$, $q$frentix GmbH, a Zurich-based spin-off of the University of Zurich, has developed OpenOLAT since forking it from OLAT in 2011.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$What authentication systems does OpenOLAT support?$q$, $q$It supports LDAP, Active Directory, OAuth2, and Shibboleth for user management.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$Does OpenOLAT include video conferencing?$q$, $q$Yes, it integrates BigBlueButton for webconferencing.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$University and school course delivery$q$, $q$Deliver testing, courses, and grading online.$q$, $q$Educational institutions$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$Corporate and government training$q$, $q$Run internal training with enterprise authentication support.$q$, $q$Corporate L&D and public-sector teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$OpenOLAT was forked in 2011 from the original OLAT platform, which the University of Zurich launched in 1999. The fork is developed by frentix GmbH, a Zurich-based spin-off founded in 2006 by one of OLAT's original creators.$q$, $q$OpenOLAT is open-source software available on GitHub for self-hosting. frentix also offers commercial managed hosting for organizations that would rather not run and maintain the platform themselves.$q$, $q$The platform includes testing and assessment tools, video integration, webconferencing via BigBlueButton, and enterprise authentication support (LDAP, Active Directory, OAuth2, and Shibboleth).$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$OpenOLAT serves schools, universities, corporate training departments, and government or administrative bodies, with a market focus concentrated in German-speaking regions.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a2781d6d-0be8-4b83-b404-3a5b91254b15', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── QST ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A free, open-source, self-hosted assessment platform for building quizzes, exams, and surveys with automatic grading.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$QST is a free, open-source, self-hosted assessment platform for quizzes, exams, and surveys with automatic grading and STEM support.$q$,
  og_description = $q$QST is a free, open-source, self-hosted assessment platform for quizzes, exams, and surveys with automatic grading and STEM support.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '21d33fd5-20b2-4b49-8ccd-579b0f9edba6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '21d33fd5-20b2-4b49-8ccd-579b0f9edba6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$Multi-tenant architecture$q$, $q$One server installation can host unlimited independent organizations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$Integrated gradebook$q$, $q$Automatic marking for objective questions and manual grading for essays.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$Multiple question types$q$, $q$Multiple choice, matching, true/false, short answer, essay, and surveys with skip logic.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$Built-in math and chemistry editor$q$, $q$WYSIWYG equation editor powered by MathJax for STEM content.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$Memory recall mode$q$, $q$A question mode that displays content once and then removes it, testing active recall.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$Broad import/export formats$q$, $q$Supports QST XML, Moodle XML, QTI, Word XML, and PDF.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$Free with no licensing restrictions, including commercial or rebranded use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$Strong STEM support via a built-in math and chemistry equation editor$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$Flexible question-import formats, including Moodle XML and QTI$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$Multi-tenant design suits hosting providers or districts running many schools$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$Focused narrowly on assessments rather than full course delivery$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$Smaller community than mainstream quiz tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$Requires self-hosting and server maintenance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$Is QST free?$q$, $q$Yes, QST is free and open source under GPLv2, with no licensing fees even for commercial or rebranded use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$Is QST a full LMS?$q$, $q$No, it's a dedicated assessment platform for quizzes, exams, surveys, and assignments rather than a complete course-management system.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$Can QST import questions from other formats?$q$, $q$Yes, it supports QST XML, Moodle XML, QTI, Word XML, and PDF import/export.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$Does QST support math and science notation?$q$, $q$Yes, it includes a built-in WYSIWYG math/chemistry equation editor powered by MathJax.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$District-wide testing server$q$, $q$Run a shared, multi-tenant testing server for multiple schools.$q$, $q$School administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$STEM assessment authoring$q$, $q$Build quizzes and exams with equations and automatic grading.$q$, $q$Math and science teachers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$QST is a self-hosted, open-source assessment platform released under GPLv2, built specifically for quizzes, exams, surveys, and assignments rather than being a full learning management system.$q$, $q$It supports multi-tenancy, so a single server installation can host unlimited independent organizations, and it includes a gradebook with automatic marking for objective questions alongside manual grading for essays.$q$, $q$The license allows running QST as a paid service without releasing source code, and permits rebranding or commercial use without additional licensing fees.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$QST is built for teachers, trainers, and organizations that need a dedicated testing and quiz tool — including STEM educators who need math and chemistry notation — rather than a complete course-management system.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21d33fd5-20b2-4b49-8ccd-579b0f9edba6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── RELATE ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An open-source, Django-based courseware platform with Git-backed content, automatic grading, and code sandboxing.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$RELATE is a free, open-source, Django-based courseware platform with Git-tracked content and sandboxed automatic code grading.$q$,
  og_description = $q$RELATE is a free, open-source, Django-based courseware platform with Git-tracked content and sandboxed automatic code grading.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9bf9becd-f896-4366-81eb-031d10afdd43';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9bf9becd-f896-4366-81eb-031d10afdd43' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$Git-integrated content$q$, $q$Course content changes are tracked with Git, with staged previews before students see them.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$Text-based authoring$q$, $q$Courses are written in YAML and Markdown rather than a WYSIWYG editor.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$Sandboxed code execution$q$, $q$Automatic grading and plotting support for programming assignments run in a sandbox.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$Quizzes and surveys$q$, $q$Interactive assessments alongside live in-class activities.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$Engagement analytics$q$, $q$Tracks student participation and performance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$In-class messaging$q$, $q$Instant messaging support via XMPP for live classroom activities.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$Multi-course hosting$q$, $q$One RELATE installation can host multiple courses.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$Fine-grained, text-based control over grading and access rules$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$Deep Git integration supports safe, staged content iteration$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$Sandboxed code execution suits programming and data-science courses$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$Free and self-hostable open-source software$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$Workflow assumes familiarity with Git and YAML/Markdown authoring$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$Smaller community and ecosystem than mainstream LMS projects$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$Requires self-hosting and Django deployment expertise$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$Is RELATE free?$q$, $q$Yes, RELATE is free, open-source software that organizations can self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$Who built RELATE?$q$, $q$RELATE was developed by Andreas Kloeckner and is maintained on GitHub as an open-source project.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$How is course content managed in RELATE?$q$, $q$Content is authored in YAML and Markdown and tracked with Git, letting instructors preview new material while students use a stable version.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$Does RELATE support automatic grading of code?$q$, $q$Yes, it includes sandboxed code execution with automatic grading and plotting support.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$Programming and data-science courses$q$, $q$Automatically grade code submissions in a sandboxed environment.$q$, $q$University instructors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$Version-controlled course management$q$, $q$Manage multiple courses with Git-tracked content.$q$, $q$Technical course instructors$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$RELATE is an open-source courseware platform built on Django by Andreas Kloeckner and hosted on GitHub. Courses are authored in plain-text YAML and Markdown, with content changes tracked deeply through Git so instructors can preview new material while students continue on a stable version.$q$, $q$The platform includes sandboxed code execution with automatic grading and plotting support, interactive quizzes and surveys, in-class instant messaging via XMPP, and engagement analytics. A single installation can host multiple courses at once.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$RELATE suits instructors who are comfortable with Git and text-based authoring and who want fine-grained control over grading rules, sandboxed code execution, and multi-course hosting on one installation.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9bf9becd-f896-4366-81eb-031d10afdd43', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── RosarioSIS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A free, open-source student information system for K-12 schools to manage grades, scheduling, attendance, and billing.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2012,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$Spanish$q$, $q$Portuguese$q$, $q$Italian$q$, $q$Russian$q$, $q$Ukrainian$q$, $q$Czech$q$, $q$Greek$q$, $q$Turkish$q$, $q$German$q$, $q$Vietnamese$q$, $q$Bulgarian$q$]::text[],
  seo_meta_description = $q$RosarioSIS is a free, open-source student information system for K-12 schools, covering grades, scheduling, attendance, and billing.$q$,
  og_description = $q$RosarioSIS is a free, open-source student information system for K-12 schools, covering grades, scheduling, attendance, and billing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '54383e70-4d96-4382-b653-361b0eb6367d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '54383e70-4d96-4382-b653-361b0eb6367d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$Student records and grading$q$, $q$Core student information and gradebook management.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$Scheduling and attendance$q$, $q$Tools for building class schedules and tracking attendance.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$Billing and food service$q$, $q$Modules for school billing and food service management.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$Discipline tracking$q$, $q$Records and tracks student discipline incidents.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$Responsive interface$q$, $q$Mobile-friendly design with statistical charts and PDF generation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$Online registration$q$, $q$Lets families register students online.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$Moodle integration$q$, $q$Connects with the Moodle LMS.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$Completely free and open source under GPL v2$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$Broad module coverage beyond just gradebook: attendance, billing, food service, discipline$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$Translated into a dozen languages for international schools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$Responsive design works on mobile devices$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$Primarily designed for K-12 workflows, so higher-ed use requires more customization$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$Self-hosting requires a PHP and PostgreSQL/MySQL server plus ongoing maintenance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$Some add-ons are offered as paid extras alongside the free core$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$Is RosarioSIS free?$q$, $q$Yes, the core RosarioSIS platform is free and open source under the GNU GPL v2 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$What database does RosarioSIS use?$q$, $q$It runs on PHP with either a PostgreSQL or MySQL database.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$What languages is RosarioSIS available in?$q$, $q$It's translated into English plus French, Spanish, Portuguese, Italian, Russian, Ukrainian, Czech, Greek, Turkish, German, Vietnamese, and Bulgarian.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$Does RosarioSIS integrate with an LMS?$q$, $q$Yes, it integrates with Moodle.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$K-12 student information system$q$, $q$Self-host a full student information system covering grades, attendance, and billing.$q$, $q$K-12 school administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$Multilingual school communities$q$, $q$Use built-in translations for non-English-speaking school communities.$q$, $q$International and multilingual schools$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$RosarioSIS began around 2012 as a project for a school in Colombia, originating as a fork of Centre/SIS, and has since grown into a free, open-source student information system built with PHP and either PostgreSQL or MySQL.$q$, $q$The software is distributed under the GNU GPL v2 license and covers students, grades, scheduling, attendance, billing, discipline, and food service, alongside a responsive design, statistical charts, PDF generation, online registration, and Moodle LMS integration.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$RosarioSIS is primarily designed for K-12 schools that want a self-hosted, free alternative to commercial student information systems, though its flexible architecture can be adapted for universities and academies as well.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('54383e70-4d96-4382-b653-361b0eb6367d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── CNCjs ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, web-based interface for controlling CNC milling machines running Grbl, Smoothieware, or TinyG/g2core.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$CNCjs is a free, open-source, web-based control interface for Grbl, Smoothieware, and TinyG CNC machines, self-hosted on a Raspberry Pi or PC.$q$,
  og_description = $q$CNCjs is a free, open-source, web-based control interface for Grbl, Smoothieware, and TinyG CNC machines, self-hosted on a Raspberry Pi or PC.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$3D G-code visualizer$q$, $q$Renders the toolpath in 3D so operators can preview a job before cutting.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$Multi-firmware support$q$, $q$Works with Grbl, Smoothieware, and TinyG/g2core controller boards.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$Remote, multi-client access$q$, $q$Multiple browser sessions can connect to the same serial port simultaneously over the network.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$Z-probe support$q$, $q$Built-in probing workflow for setting tool height on the workpiece.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$Watch directory$q$, $q$Automatically picks up new G-code files dropped into a monitored folder.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$Responsive layout$q$, $q$Usable on tablets and phones under 720px wide, not just desktop browsers.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$Completely free and open source under MIT$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$Runs on cheap hardware like a Raspberry Pi$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$Supports several popular hobbyist CNC firmwares$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$Accessible remotely from any browser on the network$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$Requires some technical setup (Node.js, serial connection configuration)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$No official mobile app, only a responsive web UI$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$Development is community-driven with no commercial support line$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$Is CNCjs free to use?$q$, $q$Yes. CNCjs is open-source software released under the MIT License, free to download, run, and modify.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$What CNC controllers does CNCjs support?$q$, $q$It supports Grbl, Smoothieware, and TinyG/g2core controller firmware.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$Do I need special hardware to run CNCjs?$q$, $q$No — it runs on a Raspberry Pi or any computer with Node.js installed, connected to the CNC controller via USB, Bluetooth, or Wi-Fi.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$Can multiple people control the machine at once?$q$, $q$CNCjs allows multiple concurrent HTTP connections to the same serial port, so several browser clients can view or interact with the same session.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$Hobbyist CNC control$q$, $q$Run and monitor a desktop CNC mill from a browser instead of dedicated desktop software.$q$, $q$CNC hobbyists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$Makerspace shared machines$q$, $q$Give multiple members remote, browser-based access to a shop's CNC router.$q$, $q$Makerspaces and shared workshops$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$CNCjs is a full-featured, browser-based interface for CNC milling controllers. Instead of relying on a dedicated desktop application, it runs as a server (typically on a Raspberry Pi or any machine with Node.js) and streams G-code to the machine's controller board over USB, Bluetooth, or Wi-Fi.$q$, $q$It supports the most common hobbyist and prosumer CNC firmwares — Grbl, Smoothieware, and TinyG/g2core — and includes a 3D G-code visualizer, a widget-based workspace, keyboard shortcuts, and a watch-directory feature for automatically loading new files.$q$, $q$The project is released under the MIT License and is maintained as community open-source software, with desktop wrapper builds available for Linux, macOS, and Windows in addition to the core web server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$CNCjs is aimed at CNC hobbyists, makerspaces, and small workshops who want to run a networked, remotely-accessible control panel for their machine without buying commercial CNC control software.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fae91cc1-45e7-4da3-9ef3-7c8d2bf1c7d8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Fluidd ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source web dashboard for controlling and monitoring 3D printers running the Klipper firmware.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Fluidd is a free, open-source web interface for monitoring and controlling 3D printers running Klipper firmware, self-hosted via Moonraker.$q$,
  og_description = $q$Fluidd is a free, open-source web interface for monitoring and controlling 3D printers running Klipper firmware, self-hosted via Moonraker.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e77b193d-a129-4b8a-ad01-cfd44b2a8850';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e77b193d-a129-4b8a-ad01-cfd44b2a8850' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$Live thermal monitoring$q$, $q$Real-time charts for hotend, bed, and chamber temperatures.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$Multi-webcam support$q$, $q$Displays feeds via MJPEG, HLS, or WebRTC streams.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$G-code viewer$q$, $q$Visualizes prints with multi-tool and object-exclusion support.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$Built-in file manager and editor$q$, $q$Upload, search, and edit G-code and config files with syntax highlighting from the browser.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$Multi-printer management$q$, $q$Control and monitor several printers from a single Fluidd instance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$Print history and statistics$q$, $q$Tracks completed prints and surfaces usage statistics over time.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$Free and open source under GPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$Responsive design works well on phones and tablets$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$Customizable themes and dashboard layout$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$Active community and regular updates$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$Requires a Klipper + Moonraker setup, not usable with stock printer firmware$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$No official commercial support$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$Some configuration knowledge of Klipper is needed to get the most out of it$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$Does Fluidd work with any 3D printer?$q$, $q$No — it's built specifically for printers running Klipper firmware with Moonraker as the API backend.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$Is Fluidd free?$q$, $q$Yes, Fluidd is free, open-source software released under the GPL-3.0 license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$Can I run multiple printers from one Fluidd install?$q$, $q$Yes, Fluidd supports managing multiple printers from a single installation.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$How is Fluidd funded?$q$, $q$It's built by volunteer contributors and funded through community sponsorships rather than sales.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$Remote print monitoring$q$, $q$Watch temperatures, webcam feed, and print progress from any browser on the network.$q$, $q$Klipper-based 3D printer owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$Multi-printer farm dashboard$q$, $q$Manage several Klipper printers from a single Fluidd instance.$q$, $q$Small print farms and makerspaces$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Fluidd is a lightweight, responsive web interface built for 3D printers running Klipper firmware and controlled through Moonraker. It gives operators a dashboard for real-time monitoring and control: live temperature charts, a G-code viewer with object-exclusion support, multi-webcam viewing (MJPEG, HLS, WebRTC), and print history with statistics.$q$, $q$The interface is customizable with different layouts, color themes, and a dark mode, and includes a built-in code editor for tweaking config and macro files directly from the browser. A single Fluidd installation can also manage more than one printer.$q$, $q$Fluidd is released under the GPL-3.0 license and built by volunteer contributors, with the project accepting sponsorships to keep development going and the tool free for the Klipper community.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$It's built for hobbyists and small shops running Klipper-based 3D printers who want a fast, self-hosted control panel as an alternative to Mainsail or the stock Klipper web front ends.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e77b193d-a129-4b8a-ad01-cfd44b2a8850', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── LinuxCNC ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source software that turns a Linux PC into a controller for mills, lathes, plasma cutters, and other CNC machines.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$LinuxCNC is free, open-source GPLv2 software that controls mills, lathes, plasma cutters, and other CNC machines from a Linux PC.$q$,
  og_description = $q$LinuxCNC is free, open-source GPLv2 software that controls mills, lathes, plasma cutters, and other CNC machines from a Linux PC.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '439efd18-8520-4a40-8b29-fb1b7b9c33f9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '439efd18-8520-4a40-8b29-fb1b7b9c33f9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$Broad machine support$q$, $q$Drives mills, lathes, 3D printers, laser cutters, plasma cutters, and robot arms.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$Real-time motion control$q$, $q$Uses Linux real-time extensions for precise timing-critical machine control.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$G-code interpreter$q$, $q$Reads standard G-code programs to drive tool paths.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$Advanced machining features$q$, $q$Supports rigid tapping, cutter compensation, and other advanced CNC capabilities.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$Multiple GUIs$q$, $q$Offers several graphical front ends to suit different workflows and machine types.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$Hardware interface flexibility$q$, $q$Works with parallel port setups as well as Mesa FPGA motion control cards.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$Completely free under GPLv2$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$Supports a very wide range of machine types beyond just mills$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$Long-established project with active forums and documentation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$Runs on low-cost Linux hardware$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$Requires Linux and often a real-time kernel, adding setup complexity$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$Steeper learning curve than consumer CNC control software$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$No corporate backing or paid support tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$Is LinuxCNC free?$q$, $q$Yes, LinuxCNC is free and open source, released under the GNU GPLv2 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$What operating system does LinuxCNC require?$q$, $q$It runs under Linux, generally with a real-time kernel extension for precise motion timing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$What kinds of machines can LinuxCNC control?$q$, $q$Mills, lathes, 3D printers, laser cutters, plasma cutters, robot arms, hexapods, and other CNC-style machines.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$How do I install LinuxCNC?$q$, $q$It can be installed on Debian or Ubuntu, or run from an official Live/Install DVD or USB image.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$Hobby CNC mill control$q$, $q$Drive a home or garage CNC mill or router using free, GPL-licensed motion control software.$q$, $q$CNC hobbyists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$Industrial machine retrofits$q$, $q$Replace an aging proprietary controller on an older industrial machine tool.$q$, $q$Machine builders and retrofitters$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$LinuxCNC is software for controlling CNC machines — milling machines, lathes, 3D printers, laser cutters, plasma cutters, robot arms, hexapods, and more. It runs on Linux, typically with real-time kernel extensions for the precise timing CNC motion control requires, and reads standard G-code to drive machine axes.$q$, $q$It supports several graphical front ends, advanced motion features like rigid tapping and cutter compensation, and works with a wide range of motion-control hardware interfaces (parallel port, Mesa FPGA boards, and others).$q$, $q$The full source code is released under the GNU GPLv2 license. LinuxCNC can be installed on Debian or Ubuntu, or run directly from an official Live/Install DVD or USB image.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$LinuxCNC is aimed at machine builders, retrofitters, and CNC hobbyists who need a full-featured, no-cost motion control system for a wide variety of machine types, from small hobby mills to large industrial retrofits.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('439efd18-8520-4a40-8b29-fb1b7b9c33f9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Mainsail ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source web interface for managing and monitoring 3D printers running Klipper firmware.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Mainsail is a free, open-source web dashboard for controlling and monitoring 3D printers that run Klipper firmware via Moonraker.$q$,
  og_description = $q$Mainsail is a free, open-source web dashboard for controlling and monitoring 3D printers that run Klipper firmware via Moonraker.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6a6419f3-298f-4290-865a-3d302e88068a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6a6419f3-298f-4290-865a-3d302e88068a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$Multi-printer dashboard$q$, $q$Manage and monitor several Klipper printers from one interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$Bed mesh visualization$q$, $q$Renders bed leveling mesh data graphically.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$Macro management$q$, $q$Organizes G-code macros with support for parameters.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$Power device control$q$, $q$Turns relays and smart plugs on/off directly from the dashboard.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$Webcam and timelapse support$q$, $q$Displays live camera feeds and can assemble print timelapses.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$Print history and analytics$q$, $q$Tracks past prints along with performance statistics.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$Free and open source under GPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$Multiple installation paths including a ready-made OS image$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$Rich feature set for print farms (multi-printer, power control, timelapse)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$Actively maintained with community funding$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$Only works with Klipper firmware via Moonraker, not stock printer firmware$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$No official paid support channel$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$Initial setup requires some familiarity with Klipper/Moonraker configuration$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$Is Mainsail free to use?$q$, $q$Yes, Mainsail is free, open-source software licensed under GPL-3.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$Does Mainsail work without Klipper?$q$, $q$No, Mainsail is built specifically for Klipper firmware and requires the Moonraker API to communicate with the printer.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$How do I install Mainsail?$q$, $q$Via the MainsailOS image for Raspberry Pi/Orange Pi, Docker, manual installation, or the hosted my.mainsail.xyz option.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$Can Mainsail manage more than one printer?$q$, $q$Yes, a single Mainsail dashboard can manage multiple printers.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$Klipper printer control$q$, $q$Monitor and operate a Klipper-based 3D printer remotely from a browser.$q$, $q$3D printing hobbyists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$Small print farm management$q$, $q$Run and track several Klipper printers from a single dashboard with power control and timelapse.$q$, $q$Small print farms$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Mainsail is a web-based control interface for 3D printers running Klipper firmware, communicating with the printer through the Moonraker API. It provides real-time temperature and progress tracking, a bed mesh visualizer, a G-code file manager and editor, macro organization with parameter support, and print history with performance analytics.$q$, $q$The dashboard also supports webcam integration, timelapse, control of power devices such as relays and smart plugs, slicer integration, and multiple languages. Mainsail can be installed as part of MainsailOS (a Raspberry Pi / Orange Pi image), via Docker, through manual installation, or accessed through the hosted my.mainsail.xyz option, and it can manage more than one printer from a single dashboard.$q$, $q$The project is released under the GPL-3.0 license and is maintained by community contributors, funded in part through Patreon and GitHub Sponsors.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Mainsail suits Klipper-based 3D printer owners — from single-machine hobbyists to small print farms — who want a fast, customizable control dashboard without paying for commercial print-farm software.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6a6419f3-298f-4290-865a-3d302e88068a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Manyfold ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source digital asset manager for organizing, tagging, and sharing 3D print file collections.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Manyfold is a free, open-source, self-hosted asset manager for organizing, tagging, and sharing 3D print file collections.$q$,
  og_description = $q$Manyfold is a free, open-source, self-hosted asset manager for organizing, tagging, and sharing 3D print file collections.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ded501a2-3874-4feb-b810-f1dff8c8fb1d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ded501a2-3874-4feb-b810-f1dff8c8fb1d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$Interactive 3D preview$q$, $q$View models directly in the browser before printing.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$Rich metadata and tagging$q$, $q$Organize models by tag, creator, collection, source, and compatibility notes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$Automatic file tidying$q$, $q$Reorganizes and renames files on disk based on customizable metadata rules.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$Duplicate and problem detection$q$, $q$Flags duplicate files, nested models, and inefficient formats in a library.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$Public/private sharing$q$, $q$Share collections selectively, including federation over ActivityPub.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$Self-hosted Docker deployment$q$, $q$Runs as a self-hosted Rails application via Docker.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$Free and open source under AGPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$Purpose-built for the mess of 3D-print file libraries specifically$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$Automatic tidying saves manual file organization work$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$Optional public instance available for trying it without self-hosting$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$Requires Rails/PostgreSQL infrastructure to self-host$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$Community-run project without commercial support$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$Best suited to users with sizeable model libraries, overkill for a handful of files$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$Is Manyfold free?$q$, $q$Yes, Manyfold is free, open-source software licensed under AGPL-3.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$Can I try Manyfold without self-hosting it?$q$, $q$Yes, the project runs a public shared instance that anyone can join in addition to the self-hosting option.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$What file formats does Manyfold support?$q$, $q$It's built around common 3D print formats such as STL and OBJ, with previews and metadata organization for print files.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$How does Manyfold organize files?$q$, $q$Through tags, creators, collections, and metadata, with an automatic 'tidy' feature that renames and reorganizes files based on that metadata.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$3D model library organization$q$, $q$Bring order to a large folder of downloaded STL/OBJ files with tags and metadata.$q$, $q$3D printing hobbyists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$Collection sharing$q$, $q$Share curated model collections publicly or privately, including via the Fediverse.$q$, $q$Makerspaces and model creators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Manyfold is a self-hosted digital asset manager built specifically for 3D print files. It lets users browse an interactive 3D preview of models, organize a growing library with tags, creators, collections, and metadata like source or print-compatibility notes, and automatically tidy files by renaming and reorganizing them according to that metadata.$q$, $q$The tool can flag duplicate files, nested archives, and inefficient formats to help keep a large model library clean, and it supports sharing collections publicly or privately, including federation with the Fediverse via ActivityPub.$q$, $q$Manyfold is built with Ruby on Rails, PostgreSQL, and Three.js/Mittsu for 3D rendering, and is released under the AGPL-3.0 license. It can be self-hosted via Docker, or tried on a shared public instance run by the project.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Manyfold is for 3D printing enthusiasts and makerspaces with large, sprawling collections of STL/OBJ files downloaded from sites like Thingiverse, MyMiniFactory, or Patreon, who want one organized, searchable library instead of a messy folder tree.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ded501a2-3874-4feb-b810-f1dff8c8fb1d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Octoprint ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source web interface for remotely controlling and monitoring consumer 3D printers.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$OctoPrint is free, open-source AGPL software for remotely controlling and monitoring consumer 3D printers with webcam and plugin support.$q$,
  og_description = $q$OctoPrint is free, open-source AGPL software for remotely controlling and monitoring consumer 3D printers with webcam and plugin support.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '33fedead-cbf1-426b-aefe-c1f89bb34b01';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '33fedead-cbf1-426b-aefe-c1f89bb34b01' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$Live webcam monitoring$q$, $q$Watch prints in progress via a connected camera feed.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$G-code visualization$q$, $q$Previews the toolpath and tracks print progress.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$Plugin ecosystem$q$, $q$Official plugin repository for extending functionality with community add-ons.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$Timelapse recording$q$, $q$Automatically records timelapse videos of prints.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$Built-in STL slicing$q$, $q$Can slice STL files directly within the interface.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$User access control$q$, $q$Restricts printer control to authorized users.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$Free and open source under AGPL$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$Enormous plugin ecosystem covering most 3D printer add-ons$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$Long track record and large community$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$Works with most consumer 3D printers, not tied to one firmware$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$Typically requires a dedicated Raspberry Pi or similar always-on host$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$UI can feel dated compared to newer Klipper-based interfaces like Mainsail/Fluidd$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$Plugin quality varies since most are community-maintained$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$Is OctoPrint free?$q$, $q$Yes, OctoPrint is free and open source, released under the AGPL license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$Does OctoPrint work with any 3D printer?$q$, $q$It's compatible with most consumer 3D printers, not limited to a single firmware.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$Who maintains OctoPrint?$q$, $q$It was created and is maintained by Gina Häußge, who works on it full-time with community and sponsorship support.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$Can I extend OctoPrint's functionality?$q$, $q$Yes, through its plugin system and the official OctoPrint plugin repository.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$Remote 3D print monitoring$q$, $q$Watch progress via webcam and control a 3D printer from anywhere on the network.$q$, $q$3D printing hobbyists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$Print farm job control$q$, $q$Manage multiple printers with plugins for queueing, notifications, and timelapses.$q$, $q$Small print farms and makerspaces$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$OctoPrint is a web interface that lets users control and monitor 3D printers remotely from a browser. It covers live webcam monitoring, print progress and G-code visualization, temperature monitoring and adjustment, manual head movement and custom commands, job control (start/stop/pause), timelapse recording, and event hooks for scripting system actions.$q$, $q$A plugin system with an official plugin repository extends OctoPrint with community-built add-ons for things like bed-leveling visualization and printer-specific integrations, and user access controls allow multi-user setups with permissions.$q$, $q$OctoPrint is Free and Open Source Software released under the GNU Affero General Public License (AGPL), created and maintained by Gina Häußge, who works full-time on the project and is supported through community and corporate sponsorship.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$OctoPrint is the standard remote-control layer for hobbyist 3D printer owners running consumer printers (originally targeted at RepRap-style and similar machines) who want to monitor and manage prints without standing next to the printer.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('33fedead-cbf1-426b-aefe-c1f89bb34b01', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── AdventureLog ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted travel journal and trip planner with an interactive map, itineraries, and travel statistics.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$AdventureLog is a free, open-source, self-hosted travel journal with an interactive map, trip planning, and travel statistics.$q$,
  og_description = $q$AdventureLog is a free, open-source, self-hosted travel journal with an interactive map, trip planning, and travel statistics.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ae7e7673-dded-4176-856d-7eaad4bbfe3e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ae7e7673-dded-4176-856d-7eaad4bbfe3e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Interactive world map$q$, $q$Visualizes visited and planned destinations geographically.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Adventure logging$q$, $q$Records trips with photos, descriptions, dates, and personal ratings.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Trip planning and itineraries$q$, $q$Plans upcoming trips with flight details and packing checklists.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Travel statistics dashboard$q$, $q$Tracks countries, regions, and cities visited over time.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Collaborative sharing$q$, $q$Shares trips with friends and family for joint planning or viewing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Geospatial backend$q$, $q$Uses Django with PostGIS for accurate location and mapping data.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Free and open source under GPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Full self-hosting keeps travel data private$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Combines journaling, planning, and statistics in one tool$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Multiple deployment options including Docker, Proxmox, and Synology NAS$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$No dedicated native mobile app, only a responsive web UI$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Requires self-hosting infrastructure and setup effort$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Community-maintained without a commercial support tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Is AdventureLog free?$q$, $q$Yes, AdventureLog is free, open-source software released under the GPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Do I need to self-host AdventureLog?$q$, $q$Yes, it's designed to be self-hosted, with install options including Docker, Proxmox, and Synology NAS.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Does AdventureLog have a mobile app?$q$, $q$There is no dedicated mobile app; the web interface is responsive for use on mobile browsers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Can I share trips with other people?$q$, $q$Yes, AdventureLog includes collaborative features for sharing trips with friends and family.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Private travel journaling$q$, $q$Log adventures with photos and ratings on a self-hosted, private instance.$q$, $q$Individual travelers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Group trip planning$q$, $q$Plan itineraries and share packing lists and flight details with travel companions.$q$, $q$Families and travel groups$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AdventureLog is a self-hosted travel companion for logging adventures, planning trips, and tracking where you've been. It offers an interactive world map for visited and planned destinations, detailed adventure entries with photos, descriptions, dates and ratings, and trip planning with itineraries, flight information, and packing checklists.$q$, $q$A statistics dashboard shows countries visited, regions explored, and cities logged, and a countries/regions explorer visualizes coverage on a map. Collaborative features let users share trips with friends and family.$q$, $q$Built with SvelteKit and TailwindCSS on the frontend and Django with PostGIS on the backend, AdventureLog is released under the GPL-3.0 license. It can be deployed via Docker, on Proxmox, or on Synology NAS, and the project accepts sponsorships to support development.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$AdventureLog fits travelers who want to keep a private, self-hosted record of trips and travel statistics — without handing their travel history to a third-party SaaS service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── AirTrail ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source personal flight tracking app that logs and visualizes your flight history on a private server.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$AirTrail is a free, open-source, self-hosted personal flight tracker that logs and visualizes flight history on your own server.$q$,
  og_description = $q$AirTrail is a free, open-source, self-hosted personal flight tracker that logs and visualizes flight history on your own server.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'af972f5d-442a-4182-b478-b2ab2783c080';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'af972f5d-442a-4182-b478-b2ab2783c080' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Interactive flight map$q$, $q$Visualizes flown routes and destinations on a world map.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Data import$q$, $q$Imports flight history from MyFlightRadar24, Flighty, OpenFlights, and other sources.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Flight statistics$q$, $q$Calculates total distance, flight time, and airline breakdowns.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Multi-user support$q$, $q$Supports multiple accounts with authentication and OAuth login.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Searchable flight history$q$, $q$Filters and searches through logged flights.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Self-hosted privacy$q$, $q$Keeps all flight data on the user's own server with no third-party tracking.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Full data privacy through self-hosting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Imports data from popular flight-tracking apps$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Simple Docker/Docker Compose deployment$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Requires self-hosting on a Linux server with Docker$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$No official managed cloud hosting$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Smaller community than more established self-hosted travel tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Is AirTrail free?$q$, $q$Yes, AirTrail is free, open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$How do I install AirTrail?$q$, $q$It's deployed via Docker or Docker Compose on a Linux host.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Can I import my existing flight history?$q$, $q$Yes, AirTrail supports importing data from services such as MyFlightRadar24, Flighty, and OpenFlights.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Does AirTrail support multiple users?$q$, $q$Yes, it includes multi-user support with authentication and OAuth login options.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Personal flight logging$q$, $q$Track and visualize your own flight history privately on a self-hosted server.$q$, $q$Aviation enthusiasts and frequent flyers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$Family flight tracking$q$, $q$Log and compare flight statistics across multiple user accounts on one instance.$q$, $q$Families of frequent travelers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AirTrail is a modern, self-hosted personal flight tracking system for aviation enthusiasts who want to log and analyze their flight history without sending the data to a third-party service. It plots flights and routes on an interactive world map and can import flight history from platforms like MyFlightRadar24, Flighty, and OpenFlights.$q$, $q$The app provides searchable flight history, statistics such as total distance, flight time, and airline breakdowns, multi-user support with authentication and OAuth login, and both light and dark themes.$q$, $q$AirTrail is open source, deployable via Docker or Docker Compose on any Linux host, and is developed by Johan Ohly. The project emphasizes that flight data stays entirely on the user's own server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$AirTrail is built for frequent flyers and aviation enthusiasts who want a private alternative to cloud flight-tracking apps, with full ownership of their travel history.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af972f5d-442a-4182-b478-b2ab2783c080', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Dawarich ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Privacy-focused, self-hosted location history tracker offering an open-source alternative to Google Timeline.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Berlin, Germany$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Dawarich is a self-hosted, open-source location history tracker and Google Timeline alternative, free to self-host with an optional paid cloud plan.$q$,
  og_description = $q$Dawarich is a self-hosted, open-source location history tracker and Google Timeline alternative, free to self-host with an optional paid cloud plan.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5b11a993-2f55-40d0-abfa-c3ac9710bd48';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5b11a993-2f55-40d0-abfa-c3ac9710bd48' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Interactive route mapping$q$, $q$Visualizes location history and daily movement on an interactive map.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Timeline replay$q$, $q$Replays a day's movements chronologically.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Trip journaling$q$, $q$Attaches photos and notes to trips for a travel journal.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Scratch map$q$, $q$Shows countries visited as a filled-in world map.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Data export$q$, $q$Exports location history to GPX or GeoJSON formats.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Native mobile apps$q$, $q$iOS and Android apps support offline tracking with automatic sync.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Third-party integrations$q$, $q$Works with OwnTracks, GPSLogger, Immich, PhotoPrism, and Google Takeout imports.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Self-hosted version is free with all Pro features included$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Open source under AGPL-3.0$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Native mobile apps for continuous location logging$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Optional managed cloud plan removes the need to self-host$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Self-hosting requires running a Rails application and keeping it updated$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Cloud plans are a recurring subscription if you skip self-hosting$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Full accuracy depends on quality of imported/tracked location data$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Is Dawarich free?$q$, $q$The self-hosted version is completely free and includes all Pro-tier features. A paid managed cloud service is also available starting at €49.99/year.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$What license is Dawarich released under?$q$, $q$It's open source under the GNU AGPL-3.0 license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Can I import my Google Timeline data?$q$, $q$Yes, Dawarich supports importing data from Google Takeout, along with OwnTracks and GPSLogger.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Does Dawarich have mobile apps?$q$, $q$Yes, native iOS and Android apps are available, including offline tracking with automatic sync.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Personal location history$q$, $q$Replace Google Timeline with a self-hosted, privacy-respecting location log.$q$, $q$Privacy-conscious individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Travel journaling$q$, $q$Combine location history with photos and notes to document trips.$q$, $q$Frequent travelers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Self-Hosted$q$, $q$Free$q$, $q$N/A$q$, $q$["All Pro features included","Full data ownership","Open source (AGPL-3.0)"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Cloud Lite$q$, $q$€49.99/year$q$, $q$yearly$q$, $q$["12-month location history","Basic features","Free trial"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Cloud Pro$q$, $q$€119.99/year$q$, $q$yearly$q$, $q$["Unlimited history","Advanced visualizations","API access"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$Cloud Family$q$, $q$€299.99/year$q$, $q$yearly$q$, $q$["5 user accounts","All Pro features"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Dawarich is a location tracking and history visualization app built as a privacy-focused alternative to Google Timeline. Users import location data from sources like Google Takeout, OwnTracks, and GPSLogger, and integrate with photo tools such as Immich and PhotoPrism, then explore it through interactive maps, a daily timeline replay, and a 'scratch map' showing countries visited.$q$, $q$The app includes trip management with photo integration, travel journaling, distance and city analytics, and export to GPX or GeoJSON, along with native iOS and Android apps for tracking on the go and offline sync when reconnected.$q$, $q$Dawarich is open source under the AGPL-3.0 license and can be fully self-hosted for free with all Pro-tier features included. The developer, Berlin-based ZeitFlow UG, also offers an optional managed cloud service with paid tiers: Lite at €49.99/year (12-month history), Pro at €119.99/year (unlimited history, advanced visualizations, API access), and Family at €299.99/year (5 users), each with a free trial.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Dawarich suits privacy-conscious users who want the convenience of a location-history timeline like Google's, but stored on infrastructure they control, as well as users who'd rather pay for a managed cloud instance than run their own server.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b11a993-2f55-40d0-abfa-c3ac9710bd48', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── GraphHopper ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Routing and route optimization API and open-source engine for building navigation, delivery, and mapping applications.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Munich, Germany$q$,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$GraphHopper is a routing and route optimization API built on OpenStreetMap, with an open-source engine and paid plans from €69/month.$q$,
  og_description = $q$GraphHopper is a routing and route optimization API built on OpenStreetMap, with an open-source engine and paid plans from €69/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a06850cf-38ac-4eb8-ba1c-a0710d10ee23';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a06850cf-38ac-4eb8-ba1c-a0710d10ee23' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Routing API$q$, $q$Calculates turn-by-turn directions across car, bike, scooter, truck, and pedestrian profiles.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Route optimization$q$, $q$Solves multi-vehicle, multi-stop routing problems for delivery and field service.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Geocoding$q$, $q$Converts addresses to coordinates and back.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Map matching$q$, $q$Snaps noisy GPS traces onto the actual road network.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Isochrones$q$, $q$Generates reachability areas within a given travel time.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Custom vehicle profiles$q$, $q$Lets developers define routing profiles for specific vehicle dimensions and access restrictions.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Open-source routing engine$q$, $q$The core GraphHopper Routing Engine and jsprit optimization library can be self-hosted.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Free tier available for non-commercial use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Open-source routing engine can be self-hosted instead of using the paid API$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Covers routing, optimization, geocoding, and map matching in one platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Global coverage powered by OpenStreetMap data$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Free tier is non-commercial only and capped at low request limits$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Paid plans can get expensive at higher usage tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Self-hosting the open-source engine requires infrastructure and OSM data management$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Is GraphHopper free?$q$, $q$There is a free tier limited to 500 credits/day and non-commercial use. Paid plans start at €69/month for commercial use with higher limits.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Is GraphHopper open source?$q$, $q$The core GraphHopper Routing Engine, the jsprit optimization library, and GraphHopper Maps are open source and can be self-hosted.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$What can I build with the GraphHopper API?$q$, $q$Routing, turn-by-turn navigation, route optimization for multiple vehicles, geocoding, map matching, and isochrones.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Where is GraphHopper based?$q$, $q$The company is headquartered in Munich, Germany.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Delivery route optimization$q$, $q$Plan efficient multi-stop routes for delivery fleets to cut time and fuel costs.$q$, $q$Logistics and delivery companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$In-app navigation$q$, $q$Add turn-by-turn directions and mapping to a consumer or enterprise application.$q$, $q$App developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Self-hosted routing$q$, $q$Run the open-source GraphHopper engine on your own infrastructure using OpenStreetMap data.$q$, $q$Teams needing full data control$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Free$q$, $q$€0/month$q$, $q$monthly$q$, $q$["500 credits/day","Up to 5 locations per request","1 vehicle","Routing, optimization, geocoding, map matching APIs","Forum support","Non-commercial use only"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Basic$q$, $q$€69/month$q$, $q$monthly$q$, $q$["5,000 credits/day","Up to 30 locations per request","2 vehicles","Email support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Standard$q$, $q$€199/month$q$, $q$monthly$q$, $q$["15,000 credits/day","Up to 80 locations per request","10 vehicles","20-minute isochrone limit","Email support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Premium$q$, $q$€479/month$q$, $q$monthly$q$, $q$["50,000 credits/day","Up to 200 locations per request","20 vehicles","30-minute isochrone limit","Email and telephone support"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$Custom$q$, $q$Contact for pricing$q$, $q$custom$q$, $q$["Up to 10,000 locations per request","Up to 200 vehicles","Volume discounts"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$GraphHopper is a directions and route-optimization platform built on OpenStreetMap data. Developers use its Directions API to add routing, turn-by-turn navigation, geocoding, map matching, isochrones, and multi-vehicle route optimization to their own applications, with pre-built profiles for cars, bikes, scooters, delivery trucks, cargo bikes, and outdoor activities like hiking and mountain biking, plus support for custom vehicle profiles.$q$, $q$The underlying GraphHopper Routing Engine, the jsprit optimization library, and GraphHopper Maps are open source, so teams that prefer to self-host can run the routing engine themselves instead of using the hosted API.$q$, $q$The company, headquartered in Munich, Germany, offers a free non-commercial tier (500 credits/day, up to 5 locations per request) alongside paid Basic (€69/month), Standard (€199/month), and Premium (€479/month) plans that raise daily credit limits, max locations per request, and support level, plus a custom enterprise tier for higher volume.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$GraphHopper serves developers and companies building logistics, delivery, field-service, or mapping applications that need routing and route optimization — from hobbyist projects on the free tier to enterprise fleets on the Premium or custom plans — as well as teams that want to self-host the open-source routing engine directly.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a06850cf-38ac-4eb8-ba1c-a0710d10ee23', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Nominatim ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source geocoding engine that turns OpenStreetMap data into address search and reverse geocoding, self-hosted or via a public API.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Nominatim is an open-source geocoding engine that searches and reverse-geocodes OpenStreetMap data, free to self-host or use via its public API.$q$,
  og_description = $q$Nominatim is an open-source geocoding engine that searches and reverse-geocodes OpenStreetMap data, free to self-host or use via its public API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '48148d92-39dd-4402-8645-08c7801fdbd5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '48148d92-39dd-4402-8645-08c7801fdbd5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$Forward geocoding$q$, $q$Free-form or structured address and place-name search against OpenStreetMap data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$Reverse geocoding$q$, $q$Look up the nearest address or OSM object for a given set of coordinates.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$Live OSM data$q$, $q$Can apply OpenStreetMap's minutely diffs so search results stay current.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$Flexible scale$q$, $q$Runs on anything from a single laptop with a regional extract to a full planet import.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$Public demo API$q$, $q$A hosted instance is available for occasional, low-volume use under OSMF's usage policy.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$Multi-language place names$q$, $q$Returns localized place names where OSM data provides them.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$Free and fully open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$No usage caps when self-hosted on your own infrastructure$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$Near-real-time OpenStreetMap data updates$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$Scales from a single machine to a planet-wide dataset$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$Backed by the large OpenStreetMap community$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$A full planet import requires significant server memory and disk space$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$The public demo API has strict rate limits and is not meant for production traffic$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$No official commercial support or SLA$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$Tuning search ranking and imports has a learning curve$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$Is Nominatim free?$q$, $q$Yes. It's fully open source, and you can self-host it or use the public demo API for occasional use under its usage policy.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$What data does it use?$q$, $q$Nominatim geocodes exclusively from OpenStreetMap data.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$Can I use the public API for production traffic?$q$, $q$Only for light, infrequent use per the OSM Foundation's usage policy. Heavier production usage requires self-hosting your own instance.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$Does Nominatim do routing?$q$, $q$No, it only handles geocoding and reverse geocoding. Pair it with a routing engine like OSRM or OpenRouteService for directions.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$What hardware does self-hosting require?$q$, $q$A full planet install needs substantial RAM and disk space, while smaller regional extracts can run on much more modest hardware.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$Address search boxes$q$, $q$Add address and place autocomplete search to a map-based application.$q$, $q$Web and app developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$Reverse geocoding for logistics$q$, $q$Convert GPS coordinates from delivery or fleet data into readable addresses.$q$, $q$Logistics and delivery platforms$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$Privacy-conscious geocoding$q$, $q$Self-host geocoding to avoid sending address queries to third-party commercial APIs.$q$, $q$Government agencies and privacy-focused enterprises$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Nominatim is an open-source geocoding tool that uses OpenStreetMap data to find locations by name or address, and to reverse-geocode coordinates into the nearest address. It supports free-form queries as well as structured queries with specific fields like street, city, and country.$q$, $q$The software can be self-hosted at any scale, from a small laptop install covering a single region to a full planet-wide dataset, and it can incorporate near-real-time OpenStreetMap edits through minutely data updates. A public demo instance is also available for occasional, light use under the OpenStreetMap Foundation's Nominatim usage policy.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Nominatim suits developers and organizations that need address search or reverse geocoding inside their own applications without depending on a commercial geocoding API, particularly teams with privacy, cost, or data-sovereignty requirements that make self-hosting attractive.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('48148d92-39dd-4402-8645-08c7801fdbd5', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Open Source Routing Machine (OSRM) ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source C++ routing engine that computes fast driving, cycling, and walking directions from OpenStreetMap data.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$OSRM is a free, open-source C++ routing engine that calculates fast car, bike, and foot directions from OpenStreetMap data, self-hosted via Docker.$q$,
  og_description = $q$OSRM is a free, open-source C++ routing engine that calculates fast car, bike, and foot directions from OpenStreetMap data, self-hosted via Docker.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '86baafbf-f9bc-4449-a7f2-056ec61dfb90';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '86baafbf-f9bc-4449-a7f2-056ec61dfb90' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$High-performance routing$q$, $q$Computes routes across continental-scale networks in milliseconds using preprocessing algorithms.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$Multiple transport profiles$q$, $q$Car, bicycle, and foot routing, customizable through Lua profile scripts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$OSM-based data import$q$, $q$Builds routing graphs directly from OpenStreetMap extracts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$HTTP API$q$, $q$JSON endpoints for routing, distance/time matrices, map matching, trip optimization, and nearest-point lookup.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$Public demo$q$, $q$A live demo is available at map.project-osrm.org for quick testing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$Docker-friendly deployment$q$, $q$Commonly self-hosted with prebuilt Docker images.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$Extremely fast route computation at scale$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$Free under a permissive 2-clause BSD license$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$Actively maintained with a strong open-source community$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$Flexible transport profiles via Lua scripting$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$Well-documented HTTP API$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$Self-hosting large regions or the full planet requires significant RAM and preprocessing time$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$No built-in map UI — developers must build their own frontend$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$No official commercial support or SLA$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$Turn-by-turn instruction quality is more basic than some commercial routing engines$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$Is OSRM free?$q$, $q$Yes, it's open source under a 2-clause BSD license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$What data source does it use?$q$, $q$OpenStreetMap extracts.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$Does OSRM support public transit routing?$q$, $q$No, OSRM focuses on road-network routing for car, bike, and foot. For multimodal transit routing, use a tool like OpenTripPlanner.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$Can I try it without installing anything?$q$, $q$Yes, via the public demo at map.project-osrm.org.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$What routing algorithms does it support?$q$, $q$Contraction Hierarchies (CH) and Multi-Level Dijkstra (MLD), both preprocessing-based approaches for fast queries.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$In-app turn-by-turn directions$q$, $q$Embed driving, cycling, or walking directions in a custom map application.$q$, $q$Developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$Fleet route optimization$q$, $q$Use the matrix and trip APIs to plan efficient multi-stop routes.$q$, $q$Logistics and delivery companies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$Offline or air-gapped routing$q$, $q$Self-host routing for environments where a third-party directions API isn't an option.$q$, $q$Enterprises and government agencies$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$OSRM is a modern C++ routing engine built for finding shortest paths across road networks. It's designed for speed, handling continental-sized road networks within milliseconds using contraction-hierarchy-based preprocessing.$q$, $q$It supports car, bicycle, and walking profiles that can be customized through Lua scripting, imports data directly from OpenStreetMap extracts, and exposes an HTTP API for routing, table (matrix), map matching, trip, and nearest-point queries. It's distributed under a permissive 2-clause BSD license and is commonly self-hosted via Docker.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$OSRM is aimed at developers building mapping, logistics, or fleet applications who need fast, self-hosted routing without relying on a commercial directions API.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('86baafbf-f9bc-4449-a7f2-056ec61dfb90', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── OpenRouteService ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source routing and geospatial analysis platform built on OpenStreetMap data, self-hostable or used via HeiGIT's hosted API.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Heidelberg, Germany$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$OpenRouteService offers open-source routing, isochrones, and matrix APIs built on OpenStreetMap data, self-hostable or via HeiGIT's free/paid hosted API.$q$,
  og_description = $q$OpenRouteService offers open-source routing, isochrones, and matrix APIs built on OpenStreetMap data, self-hostable or via HeiGIT's free/paid hosted API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bc74d5c2-961f-4a99-a34b-c92eee310096';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bc74d5c2-961f-4a99-a34b-c92eee310096' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Multi-mode directions$q$, $q$Routing for car, bicycle, walking, and wheelchair-accessible profiles.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Isochrones$q$, $q$Generate reachability areas showing where you can travel within a given time or distance.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Matrix service$q$, $q$Compute many-to-many travel times and distances in a single request.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$POI and geocoding endpoints$q$, $q$Look up points of interest and place names alongside routing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Elevation data$q$, $q$Retrieve elevation profiles along a route.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Vehicle routing optimization$q$, $q$Solve multi-stop fleet routing problems.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Official SDKs$q$, $q$Client libraries for Python, R, JavaScript, and a QGIS plugin.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Self-hostable backend$q$, $q$The full routing engine is open source and can be deployed on your own infrastructure.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Free tier available for small and moderate usage$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Fully open-source backend that can be self-hosted$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Backed by an academic institute with a humanitarian focus$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Covers more than basic routing — isochrones, matrix, elevation, and optimization$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Multiple official SDKs and a QGIS plugin$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$The free hosted-API tier has daily request limits (for example, 500 isochrone requests per day)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Self-hosting global-scale data requires significant infrastructure$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Paid plans are needed for high-volume production use of the hosted API$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Documentation is spread across several sub-projects$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Is OpenRouteService free?$q$, $q$The backend is open source and free to self-host. The hosted API offers a free tier with daily request limits, plus paid plans for higher volume.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Who operates the hosted service?$q$, $q$HeiGIT gGmbH, affiliated with Heidelberg University in Germany.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$What data does it use?$q$, $q$OpenStreetMap.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Can I self-host instead of using the hosted API?$q$, $q$Yes, all server code is open source on GitHub for self-deployment.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Does it support wheelchair-accessible routing?$q$, $q$Yes, a wheelchair routing profile is included alongside car, bike, and pedestrian profiles.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Custom mapping apps$q$, $q$Add routing, isochrones, or matrix calculations to a mapping application.$q$, $q$Developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Disaster-response analysis$q$, $q$Use reachability and routing analysis for humanitarian planning.$q$, $q$NGOs and humanitarian organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Fleet route optimization$q$, $q$Plan efficient multi-stop delivery routes using the matrix and optimization services.$q$, $q$Logistics teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Free$q$, $q$Free$q$, NULL, $q$["Access to the hosted API","Daily request limits (e.g., 500 isochrone requests/day)"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$Paid API plans$q$, $q$Contact HeiGIT for pricing$q$, NULL, $q$["Higher request limits for production workloads"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$OpenRouteService is a geospatial routing and analysis platform built on OpenStreetMap data. It offers directions for cars, bicycles, pedestrians, and wheelchair users, along with isochrone (reachability) generation, many-to-many time/distance matrices, point-of-interest discovery, elevation data, and vehicle-routing optimization for fleets.$q$, $q$All server code is open source and available on GitHub for self-hosting, while a hosted API with a free tier and paid plans is operated by HeiGIT gGmbH (Heidelberg Institute for Geoinformation Technology), affiliated with Heidelberg University. Official SDKs are available for Python, R, JavaScript, and QGIS.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$It fits developers who need more than basic routing — isochrones, matrices, or elevation data — as well as humanitarian and academic teams that benefit from HeiGIT's mission-driven focus on open geospatial tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bc74d5c2-961f-4a99-a34b-c92eee310096', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── OpenStreetMap ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, collaboratively-built map of the world with open data that anyone can use, edit, or build tools on top of.$q$,
  pricing_model = $q$Free (open data)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2004,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$OpenStreetMap is a free, editable world map built by volunteers, offering open data under the ODbL license for any app or self-hosted geo stack.$q$,
  og_description = $q$OpenStreetMap is a free, editable world map built by volunteers, offering open data under the ODbL license for any app or self-hosted geo stack.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '57200a8f-f3cf-4f52-8aed-098c07fbd667';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '57200a8f-f3cf-4f52-8aed-098c07fbd667' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Free editable world map$q$, $q$Anyone can register and contribute edits to the map.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Open license data$q$, $q$Data is available under the ODbL, free to reuse with attribution.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Editing tools$q$, $q$Web-based (iD) and desktop (JOSM) editors for contributing map data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Global coverage$q$, $q$Roads, buildings, points of interest, and trails maintained by a worldwide volunteer community.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$API access$q$, $q$Programmatic access for querying and editing map data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Ecosystem foundation$q$, $q$Powers third-party open-source tools like Nominatim, OSRM, OpenRouteService, and tile servers.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Completely free and open data$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Global community of active volunteer contributors$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$No vendor lock-in — data can be downloaded and self-hosted$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Powers a large open-source geospatial tool ecosystem$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Frequently updated, with minutely change feeds available$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Data completeness and accuracy vary by region$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Building a full application requires separate tools for geocoding, routing, and tile rendering$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Editing conventions have a learning curve for new contributors$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$No official SLA — governed by a volunteer community and the OpenStreetMap Foundation$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Is OpenStreetMap free to use?$q$, $q$Yes, the data is free under the Open Database License (ODbL), which requires attribution.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Who maintains OpenStreetMap?$q$, $q$A global community of volunteer mappers, with the project operated on their behalf by the OpenStreetMap Foundation.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Can I download the map data?$q$, $q$Yes, full-planet and regional data extracts are publicly downloadable.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Does OSM provide routing or geocoding itself?$q$, $q$No, OSM provides the underlying map data. Separate open-source tools like OSRM, OpenRouteService, and Nominatim provide routing and geocoding on top of it.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Can businesses use OSM data commercially?$q$, $q$Yes, under the ODbL's attribution and share-alike terms.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Base map data for apps$q$, $q$Use free, open map data as the foundation for a custom mapping application.$q$, $q$Developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Humanitarian mapping$q$, $q$Contribute and use community-mapped data for disaster response and relief efforts.$q$, $q$NGOs and humanitarian mapping volunteers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$Self-hosted geo stacks$q$, $q$Avoid proprietary map vendors by building an internal stack on OSM data.$q$, $q$Enterprises and government agencies$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$OpenStreetMap is a collaboratively-built mapping platform that provides map data for thousands of websites, mobile apps, and hardware devices. Volunteer contributors worldwide document roads, trails, cafes, railway stations, and countless other features using aerial imagery, GPS traces, and field verification.$q$, $q$The data is open and free to use under the Open Database License (ODbL), which requires attribution and share-alike terms for derivative databases. The project is operated on behalf of its community by the OpenStreetMap Foundation, and it underpins a large ecosystem of open-source geo tools, including geocoders, routers, and tile servers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$OpenStreetMap suits developers, researchers, and organizations that want free, downloadable map data without vendor lock-in, as well as anyone who wants to contribute local mapping knowledge to a shared public resource.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('57200a8f-f3cf-4f52-8aed-098c07fbd667', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── OpenTripPlanner ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source multimodal trip-planning server that combines transit, walking, cycling, and driving directions from OSM and GTFS data.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2009,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$OpenTripPlanner is a free, open-source multimodal trip planner combining transit, walking, cycling, and driving using GTFS and OpenStreetMap data.$q$,
  og_description = $q$OpenTripPlanner is a free, open-source multimodal trip planner combining transit, walking, cycling, and driving using GTFS and OpenStreetMap data.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5f8129e3-98ab-4d78-94b2-3a35a0efb279';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5f8129e3-98ab-4d78-94b2-3a35a0efb279' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$Multimodal itinerary planning$q$, $q$Combines transit, walking, biking, and driving legs into a single trip.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$GTFS and OSM ingestion$q$, $q$Builds its routing graph from standard transit (GTFS) and OpenStreetMap data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$Web API$q$, $q$Exposes trip-planning queries over a documented API.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$JavaScript client libraries$q$, $q$Reference clients for integrating trip planning into web and mobile apps.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$Used by transit agencies$q$, $q$Powers regional and national journey-planning services around the world.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$Active open-source development$q$, $q$Regularly released and maintained by a community of contributors.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$Proven at scale by public transit agencies worldwide$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$Combines multiple transport modes in a single planner$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$Backed by an active, long-running developer community$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$Flexible self-hosted deployment$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$Requires preparing and maintaining GTFS and OSM data inputs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$Self-hosting needs familiarity with Java server infrastructure$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$No official hosted SaaS offering from the project itself$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$A production-ready frontend UI must be built separately or adapted from community clients$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$Is OpenTripPlanner free?$q$, $q$Yes, it's fully open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$What data does it need?$q$, $q$GTFS transit feeds and OpenStreetMap extracts for the area you want to cover.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$Who uses OTP?$q$, $q$Public transit agencies, transportation consultancies, researchers, and app developers worldwide.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$Does it include a map UI?$q$, $q$OTP provides an API and reference clients; most deployments build or customize a frontend on top of it.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$When did the project launch?$q$, $q$OpenTripPlanner launched in 2009.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$Regional transit trip planners$q$, $q$Power a public-facing journey planner for a transit agency's network.$q$, $q$Public transit agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$Multimodal directions in apps$q$, $q$Add combined transit, walking, and cycling directions to a travel app.$q$, $q$Developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$Transportation network analysis$q$, $q$Analyze accessibility and travel times across a transit network.$q$, $q$Researchers and transportation planners$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$OpenTripPlanner (OTP) is a collection of open-source software for multimodal trip planning and transportation analysis. It finds itineraries that combine transit, pedestrian, bicycle, and car segments through networks built from OpenStreetMap and GTFS transit data.$q$, $q$Since launching in 2009, OTP has attracted a thriving community of users and developers, with support from public agencies, startups, and transportation consultancies. It's typically self-hosted as a server, exposed through a web API, with JavaScript client libraries available for building web and mobile trip-planning interfaces.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$OTP is built for public transit agencies, transportation researchers, and developers who need to offer or analyze multimodal journey planning without relying on a proprietary trip-planning service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5f8129e3-98ab-4d78-94b2-3a35a0efb279', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── TileServer GL ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source vector and raster map tile server for serving custom map styles from MBTiles and other tile sources.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$TileServer GL is a free, open-source self-hosted server for serving vector and raster map tiles from MBTiles, deployable via Docker.$q$,
  og_description = $q$TileServer GL is a free, open-source self-hosted server for serving vector and raster map tiles from MBTiles, deployable via Docker.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '60df7045-6dba-4088-8dad-1316174aa0df';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '60df7045-6dba-4088-8dad-1316174aa0df' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$Vector and raster tile serving$q$, $q$Serves MapLibre/Mapbox GL vector styles as well as server-rendered raster tiles.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$Static image generation$q$, $q$Render map snapshots server-side for a given location and style.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$WMTS support$q$, $q$Exposes tiles via WMTS for compatibility with standard GIS clients.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$Docker deployment$q$, $q$Official Docker images make self-hosting straightforward.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$Lightweight variant$q$, $q$tileserver-gl-light serves vector tiles only, without raster rendering, for a smaller footprint.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$Style and data source configuration$q$, $q$Manage map styles and tile data sources through configuration files.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$Simple Docker-based self-hosting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$Supports both vector and raster tile workflows$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$Lightweight variant available for vector-only setups$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$Compatible with standard formats like MBTiles$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$Requires pre-generated tile data (e.g., via tippecanoe or similar tools)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$Documentation is fairly technical and developer-focused$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$No hosted SaaS offering from the project itself$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$Custom styling requires familiarity with the MapLibre/Mapbox GL style spec$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$Is TileServer GL free?$q$, $q$Yes, it's open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$What tile formats does it support?$q$, $q$MBTiles-based vector and raster tiles, along with WMTS endpoints.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$Who maintains it?$q$, $q$It's maintained under the MapTiler organization on GitHub.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$Can I run it in Docker?$q$, $q$Yes, an official Docker image is provided.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$What's the difference between TileServer GL and the Light variant?$q$, $q$The Light variant serves vector tiles only, without server-side raster rendering, for a smaller resource footprint.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$Self-hosted custom map styles$q$, $q$Serve your own branded map style instead of using a third-party tile provider.$q$, $q$Developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$Offline or private map serving$q$, $q$Host map tiles internally for tools that can't rely on external services.$q$, $q$Enterprises and GIS teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$Embedded map tile serving$q$, $q$Serve pre-rendered tiles to embedded or IoT devices.$q$, $q$IoT and embedded developers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$TileServer GL is a self-hosted tile server for serving rendered map tiles, vector tile styles, static map images, and WMTS endpoints. It's maintained under the MapTiler organization and is commonly deployed via Docker or npm.$q$, $q$It supports both vector-tile-only setups (via the lighter tileserver-gl-light variant) and full server-side raster rendering, making it a common choice for teams that want to host their own map styles instead of relying on a third-party map tile provider.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$It's aimed at developers and GIS teams who want to self-host custom map styles or serve pre-generated tiles for a web app, internal tool, or embedded device.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('60df7045-6dba-4088-8dad-1316174aa0df', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Traccar ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted GPS tracking platform for monitoring vehicles and devices in real time across hundreds of tracker protocols.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2009,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Traccar is a free, open-source GPS tracking platform for real-time vehicle and device monitoring, self-hosted or via an optional hosted cloud account.$q$,
  og_description = $q$Traccar is a free, open-source GPS tracking platform for real-time vehicle and device monitoring, self-hosted or via an optional hosted cloud account.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '74308889-bf28-4f84-8e8e-f6ebecc1b93a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '74308889-bf28-4f84-8e8e-f6ebecc1b93a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Real-time GPS tracking$q$, $q$Live map view of all connected tracking devices.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Broad protocol support$q$, $q$Compatible with a very wide range of GPS tracker hardware and brands.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Geofencing and alerts$q$, $q$Push and email notifications for events like geofence breaches, harsh driving, or maintenance reminders.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Reporting$q$, $q$Location history, trip analysis, route replay, and summary reports.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Web admin interface$q$, $q$Browser-based dashboard for managing devices, users, and geofences.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Mobile client apps$q$, $q$Official Traccar Client apps let a phone act as a GPS tracker.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Free and open source to self-host$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Extremely broad device and protocol compatibility$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Real-time tracking with geofencing and alerting$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Long-running, actively maintained project (since 2009)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Optional hosted cloud account for those who don't want to self-host$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Full support and some conveniences are tied to the hosted cloud plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Self-hosting requires ongoing server maintenance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Interface is functional but less polished than some commercial fleet platforms$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Configuring specific device protocols can require technical know-how$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Is Traccar free?$q$, $q$The core server software is free and open source to self-host. A hosted cloud account is also offered as an alternative to self-hosting.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$What devices does it support?$q$, $q$Traccar supports a very wide range of GPS tracker hardware through its large library of communication protocols.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Can I self-host Traccar?$q$, $q$Yes, it runs on Windows, Linux, and other platforms, with installers and source code on the official site.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Does Traccar have mobile apps?$q$, $q$Yes, official Traccar Client apps are available for using a phone as a tracker.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$How long has Traccar existed?$q$, $q$Since 2009.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Fleet management$q$, $q$Track and manage a fleet of vehicles in real time with geofencing and reports.$q$, $q$Small fleet operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Personal or family tracking$q$, $q$Monitor personal devices or vehicles for safety and location history.$q$, $q$Individuals$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Asset tracking$q$, $q$Track equipment or shipments across a logistics operation.$q$, $q$Logistics and supply chain teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Self-hosted$q$, $q$Free$q$, NULL, $q$["Full server source code","Self-managed infrastructure with no device caps"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$Cloud account$q$, $q$Contact for pricing$q$, NULL, $q$["Hosted Traccar instance","No server maintenance required"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Traccar is a modern GPS tracking system for real-time location monitoring of vehicles, personal devices, and other tracked assets. It supports a very wide range of GPS tracker hardware through a large library of communication protocols.$q$, $q$The core server is free and open source, with installers and source code available for self-hosting on Windows, Linux, and other platforms. Traccar also offers an optional hosted cloud account for users who don't want to manage their own server infrastructure.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Traccar fits small fleet operators, logistics teams, and individuals who want real-time tracking, geofencing, and reporting for vehicles or devices, whether self-hosted for full control or via a hosted account for convenience.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('74308889-bf28-4f84-8e8e-f6ebecc1b93a', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;

-- ── TRIP ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Minimalist self-hosted map tracker and trip planner for visualizing points of interest and organizing multi-day trip itineraries.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$TRIP is a free, open-source, self-hosted app for mapping points of interest and planning multi-day trip itineraries, with no telemetry.$q$,
  og_description = $q$TRIP is a free, open-source, self-hosted app for mapping points of interest and planning multi-day trip itineraries, with no telemetry.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cd1da66a-312f-432a-8e37-1dc816cc5520';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cd1da66a-312f-432a-8e37-1dc816cc5520' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$POI map tracking$q$, $q$Pin and organize points of interest on an interactive map.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$Trip planning$q$, $q$Build multi-day itineraries with trip details.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$Collaboration and sharing$q$, $q$Share trips and plans with travel companions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$No telemetry$q$, $q$Privacy-focused design with no tracking or ads.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$Docker deployment$q$, $q$Simple self-hosted setup via docker-compose.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$Free and fully open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$Privacy-first with no telemetry or tracking$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$Simple Docker-based self-hosting$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$Combines POI tracking and trip planning in one tool$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$Lightweight, minimalist interface$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$Smaller community compared to established mapping platforms$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$Focused on POI tracking and itinerary planning rather than routing or navigation$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$Self-hosting requires basic Docker familiarity$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$Fewer integrations than large commercial travel-planning apps$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$Is TRIP free?$q$, $q$Yes, it's completely open source and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$Does TRIP collect any data?$q$, $q$No, the project states it has no telemetry, tracking, or ads.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$How do I deploy TRIP?$q$, $q$Via Docker, using the provided docker-compose configuration.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$Can I share trips with others?$q$, $q$Yes, TRIP supports collaborating and sharing trip plans with travel companions.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$Does TRIP provide turn-by-turn navigation?$q$, $q$No, it focuses on POI tracking and itinerary planning rather than routing or navigation.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$Multi-day trip planning$q$, $q$Plan and organize a trip itinerary with friends or family.$q$, $q$Travelers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$Personal POI tracking$q$, $q$Keep a personal map of favorite or planned-to-visit places.$q$, $q$Individuals$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$Privacy-conscious travel planning$q$, $q$Use a self-hosted alternative to commercial trip-planning apps.$q$, $q$Privacy-focused users$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$TRIP is a self-hosted application that combines a minimalist point-of-interest (POI) map tracker with a trip planner, letting you visualize places you care about and organize the details of an upcoming trip.$q$, $q$The project emphasizes privacy, with no telemetry, tracking, or ads, and is deployed through Docker using a provided docker-compose configuration. It's completely open source, with documentation maintained by its developer, itskovacs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$TRIP suits travelers and self-hosting enthusiasts who want a lightweight, privacy-respecting alternative to commercial trip-planning apps for tracking places and planning itineraries with travel companions.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd1da66a-312f-432a-8e37-1dc816cc5520', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Downtify ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source Docker tool that downloads Spotify playlists and tracks as tagged audio files.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Downtify is a free, open-source, self-hosted Docker tool for downloading Spotify playlists as tagged MP3/FLAC/OGG files with synced lyrics.$q$,
  og_description = $q$Downtify is a free, open-source, self-hosted Docker tool for downloading Spotify playlists as tagged MP3/FLAC/OGG files with synced lyrics.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0608cdcb-8ede-4cee-a620-9cc6d15af341';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0608cdcb-8ede-4cee-a620-9cc6d15af341' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Spotify link input$q$, $q$Paste a track, album, or playlist link without needing API keys or a Spotify account.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$YouTube Music matching$q$, $q$Finds the closest matching audio via yt-dlp based on Spotify's public metadata.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Metadata tagging$q$, $q$Writes proper tags and album art using mutagen.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Multiple audio formats$q$, $q$Supports MP3, FLAC, M4A, OGG, and OPUS at a chosen bitrate.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Synced lyrics$q$, $q$Fetches and embeds plain and time-synced lyrics from lrclib.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Playlist Monitor$q$, $q$Automatically downloads new songs added to watched Spotify playlists.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Web player and M3U export$q$, $q$Built-in playback plus M3U playlist export for Jellyfin, Navidrome, and Plex.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$No Spotify API keys or account required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Supports multiple audio formats and embedded synced lyrics$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Playlist Monitor automates downloads of new tracks$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Exports playlists compatible with popular self-hosted media servers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$The legal status of downloading copyrighted music this way is ambiguous and use is at the user's own risk$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Audio quality depends on the closest match found on YouTube Music rather than the original source file$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Small independent project without formal support$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Requires Docker for deployment$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Is Downtify legal to use?$q$, $q$The project's own documentation states it does not support unauthorized downloading of copyrighted material and takes no responsibility for user actions — check your local laws and Spotify's terms before using it.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Do I need a Spotify account or API key?$q$, $q$No, Downtify reads public metadata from Spotify's embed pages without requiring credentials.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$What audio formats are supported?$q$, $q$MP3, FLAC, M4A, OGG, and OPUS.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Can it monitor playlists for new songs automatically?$q$, $q$Yes, via the Playlist Monitor feature.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Does it work with Jellyfin, Navidrome, or Plex?$q$, $q$Yes, it can export M3U playlists that those media servers pick up automatically.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Personal offline music library$q$, $q$Build a local, tagged music library from Spotify playlists.$q$, $q$Individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Feeding a self-hosted media server$q$, $q$Populate Jellyfin, Navidrome, or Plex with tagged audio files.$q$, $q$Self-hosted media enthusiasts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$Archiving playlists with lyrics$q$, $q$Keep a personal archive of playlists including synced lyrics.$q$, $q$Music collectors$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Downtify is a self-hosted music downloader that takes a Spotify link and produces a tagged audio file, without requiring API keys or a Spotify account. It reads the metadata Spotify exposes on its public embed pages, finds the closest matching audio on YouTube Music, and hands the file to yt-dlp and ffmpeg for download, with tags written by mutagen.$q$, $q$The whole pipeline runs in a single Docker container. Features include a Playlist Monitor that automatically downloads new songs added to watched playlists, support for MP3, FLAC, M4A, OGG, and OPUS formats, embedded plain and time-synced lyrics from lrclib, a built-in web player, and M3U export compatible with self-hosted media servers like Jellyfin, Navidrome, and Plex. The project's own documentation states it does not support unauthorized downloading of copyrighted material and takes no responsibility for user actions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Downtify is aimed at self-hosted media enthusiasts who already run tools like Jellyfin, Navidrome, or Plex and want a way to populate a personal library from Spotify playlists.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0608cdcb-8ede-4cee-a620-9cc6d15af341', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Lidarr ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted music collection manager that automates monitoring, downloading, and organizing albums via Usenet and BitTorrent.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Lidarr is a free, open-source, self-hosted music collection manager that automates monitoring, downloading, and organizing albums via Usenet/BitTorrent.$q$,
  og_description = $q$Lidarr is a free, open-source, self-hosted music collection manager that automates monitoring, downloading, and organizing albums via Usenet/BitTorrent.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '95c108e4-15cb-4703-b18c-02fcb91adb45';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '95c108e4-15cb-4703-b18c-02fcb91adb45' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Automated release monitoring$q$, $q$Watches RSS feeds for new releases from followed artists.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Indexer and download client integration$q$, $q$Works with configured Usenet and BitTorrent indexers and download clients.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Automatic import and renaming$q$, $q$Organizes and renames files according to a configurable naming scheme.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Quality profiles and upgrades$q$, $q$Automatically upgrades library files to better quality when available.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Calendar view$q$, $q$Tracks upcoming album releases.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Import lists$q$, $q$Syncs followed artists from services like Last.fm.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Cross-platform support$q$, $q$Runs on Windows, Linux, macOS, Docker, BSD, and Synology NAS.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Automates music library growth, tagging, and organization$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Broad platform support, including Docker and NAS$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Integrates with the wider *arr ecosystem (Sonarr, Radarr, Prowlarr)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Actively developed with a large community$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Requires separately configured indexers and download clients to be useful$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Initial setup and configuration has a learning curve$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$No official mobile app$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Legal considerations depend entirely on the indexers and content sources you use$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Is Lidarr free?$q$, $q$Yes, it's free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Does Lidarr download music itself?$q$, $q$No, it automates the process by interfacing with separate download clients and indexers that you configure.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$What platforms does Lidarr run on?$q$, $q$Windows, Linux, macOS, Docker, BSD, and Synology NAS.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Does Lidarr work with Usenet and torrents?$q$, $q$Yes, both are supported through configurable indexers and download clients.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Can Lidarr upgrade existing files automatically?$q$, $q$Yes, using customizable quality profiles.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Automated music library$q$, $q$Automate growing and organizing a personal music library alongside Usenet or torrent clients.$q$, $q$Self-hosted media enthusiasts$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Library organization$q$, $q$Tag and organize an existing large music collection.$q$, $q$Music collectors$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$Full *arr automation stack$q$, $q$Pair with Sonarr, Radarr, and Prowlarr for a complete home media automation setup.$q$, $q$Home server and NAS users$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Lidarr is a music collection manager for Usenet and BitTorrent users. It monitors RSS feeds for new album releases from artists you follow, then interfaces with the download clients and indexers you configure to retrieve, organize, and rename music files, including automatically upgrading existing library files when higher-quality versions become available.$q$, $q$It's part of the wider *arr family of automation tools (alongside Sonarr and Radarr) and is open source, running on Windows, Linux, macOS, Docker, BSD, and Synology NAS devices with a web-based management interface.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Lidarr suits home server and NAS users who already use Usenet or torrent indexers and download clients and want to automate music library growth, tagging, and organization rather than managing it manually.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95c108e4-15cb-4703-b18c-02fcb91adb45', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;


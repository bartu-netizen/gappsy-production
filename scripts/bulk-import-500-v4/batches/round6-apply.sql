-- Enrichment batch: Thanos, Graylog, Fluentd, Fluent Bit, Vector, Logstash, Jaeger, Zipkin, Bugsink, Coroot, OpenTelemetry, StreamSets, Debezium, Estuary Flow, GrowthLoop, Redash, Lightdash, Evidence, Cube, SQLMesh, Dataform, Rundeck, MLflow, Kubeflow, DVC, ClearML, Feast, BentoML, Weights & Biases, Comet, Evidently, Arize Phoenix, Langfuse, Helicone, OpenLLMetry, PromptLayer, LangSmith, Dify, Flowise, Langflow, AnythingLLM, Open WebUI, LibreChat, Jan, GPT4All, Ollama, LocalAI, vLLM, LiteLLM, OpenRouter, Together AI, Fireworks AI, Replicate, Modal, RunPod, Baseten, Anyscale, Ray, Label Studio, CVAT, Labelbox, SuperAnnotate, Roboflow, Ultralytics
-- Publishes 64 bulk-imported tool(s) with full editorial content.

-- ── Thanos ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open source system that extends Prometheus with a global query view and unlimited metrics retention via object storage.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Thanos is an open source, CNCF incubating project that adds highly available, long-term Prometheus metrics storage and querying.$q$,
  og_description = $q$Thanos is an open source, CNCF incubating project that adds highly available, long-term Prometheus metrics storage and querying.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a66f3bc4-b0a5-4c55-9356-c797b9ad54a2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a66f3bc4-b0a5-4c55-9356-c797b9ad54a2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Global Query View$q$, $q$Query metrics across multiple Prometheus servers and clusters from a single endpoint.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Unlimited Retention$q$, $q$Store historical metrics indefinitely by offloading data to object storage such as S3, GCS, Azure, Swift, or Tencent COS.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Prometheus API Compatible$q$, $q$Works with Grafana and any other tool that supports the Prometheus Query API.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Downsampling & Compaction$q$, $q$Optimizes long-range historical queries and lets teams configure data retention policies.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Free and open source under the Apache 2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$CNCF incubating project with an active community and Slack$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Works natively with existing Grafana and Prometheus tooling$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Enables effectively unlimited metrics retention via object storage$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Used in production by large organizations including Adobe, ByteDance, eBay, and Monzo$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Self-hosted only; no managed cloud offering$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Requires configuring and operating an object storage backend$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Adds operational complexity on top of running Prometheus itself$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Is Thanos free to use?$q$, $q$Yes. Thanos is open source under the Apache 2.0 license with no paid tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Does Thanos replace Prometheus?$q$, $q$No. Thanos extends Prometheus by adding global querying across clusters and long-term storage in object storage.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Does Thanos work with Grafana?$q$, $q$Yes. Thanos exposes a Prometheus-compatible query API that Grafana and other Prometheus-aware tools can use.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Is Thanos a CNCF project?$q$, $q$Yes, Thanos is a Cloud Native Computing Foundation incubating project.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Multi-cluster metrics querying$q$, $q$Teams running Prometheus across multiple clusters use Thanos to query metrics globally from one place.$q$, $q$Platform and SRE teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Long-term metrics retention$q$, $q$Organizations that need to retain metrics beyond Prometheus's local storage limits offload data to object storage via Thanos.$q$, $q$DevOps and infrastructure teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$overview$q$, $q$What is Thanos?$q$, 2, ARRAY[$q$Thanos is an open source, highly available Prometheus setup with long-term storage capabilities. It extends Prometheus by enabling a global query view across multiple Prometheus servers and clusters, plus unlimited metrics retention using object storage providers like S3, GCS, Azure Blob Storage, and Tencent COS.$q$, $q$Thanos is a CNCF incubating project, originally founded by Improbable, and is used in production by organizations including Adobe, ByteDance, eBay, Monzo, and SoundCloud.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$who-its-for$q$, $q$Who Thanos is for$q$, 2, ARRAY[$q$Thanos is built for platform, SRE, and infrastructure teams running Prometheus at scale who need cross-cluster querying, long-term metrics retention, and Grafana-compatible dashboards without switching monitoring tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Graylog ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Centralized log management and SIEM platform with a free open-source edition and paid enterprise/security tiers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Houston, TX, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Graylog is a log management and SIEM platform offering a free open-source edition plus paid Enterprise, Security, and Cloud tiers.$q$,
  og_description = $q$Graylog is a log management and SIEM platform offering a free open-source edition plus paid Enterprise, Security, and Cloud tiers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5f805c48-e5b0-4af0-83dd-98deb8ee69d9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5f805c48-e5b0-4af0-83dd-98deb8ee69d9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$AI-powered anomaly detection$q$, $q$Uses AI-assisted analytics to surface unusual activity and potential threats in log data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$Pipeline management and log routing$q$, $q$Built-in processing pipelines let teams route, transform, and enrich log data as it's ingested.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$Tiered data archival$q$, $q$Archives older data to cheaper storage tiers to control retention costs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$UEBA$q$, $q$User and Entity Behavior Analytics to identify risky or anomalous user activity.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$Investigation automation and SOAR$q$, $q$Automates security investigations and response workflows in the Security edition.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$Flexible deployment$q$, $q$Available as cloud-hosted, on-premises, or hybrid deployments.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$Free, source-available Graylog Open edition available$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$Scales up to full SIEM capabilities via the Security tier$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$Supports cloud, on-premises, and hybrid deployment models$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$Tiered/archival storage helps control long-term log retention costs$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$Pricing for paid tiers is not published and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$Advanced SIEM, UEBA, and SOAR features are limited to paid editions$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$Multiple product tiers (Security, Enterprise, API Security, Cloud, Small Business) can make choosing the right plan confusing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$Is Graylog free?$q$, $q$Yes, Graylog Open is a free, source-available edition. Paid tiers (Security, Enterprise, Cloud, Small Business) add additional capabilities and require a license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$Can Graylog be self-hosted?$q$, $q$Yes. Graylog supports cloud, on-premises, and hybrid deployment models.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$Is Graylog a SIEM?$q$, $q$Graylog Security is positioned as a full SIEM offering with threat detection, UEBA, and investigation automation on top of Graylog's log management core.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$Where is Graylog headquartered?$q$, $q$Graylog's headquarters is in Houston, TX, with additional offices in London, UK and Hamburg, Germany.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$Centralized log management$q$, $q$Teams aggregate logs from applications and infrastructure into Graylog for search and analysis.$q$, $q$DevOps and IT operations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$Security operations and SIEM$q$, $q$Security teams use Graylog Security for threat detection, UEBA, and automated investigations.$q$, $q$SecOps and security teams at lean security organizations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$overview$q$, $q$What is Graylog?$q$, 2, ARRAY[$q$Graylog is a centralized log management and SIEM platform designed for lean security and operations teams, offering real-time threat detection, log analysis, and automated investigations.$q$, $q$It ships as Graylog Open, a free source-available edition, alongside paid tiers — Graylog Security, Graylog Enterprise, Graylog API Security, Graylog Cloud Platform, and Graylog Small Business — that add SIEM, SOAR, and cloud-hosted capabilities.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', $q$who-its-for$q$, $q$Who Graylog is for$q$, 2, ARRAY[$q$Graylog suits IT operations teams that need centralized log search and lean security teams that need SIEM-level threat detection and investigation automation without a large security operations budget.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5f805c48-e5b0-4af0-83dd-98deb8ee69d9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Fluentd ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open source, CNCF-graduated data collector that unifies logging across systems with over 500 plugins.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Fluentd is a free, open source, CNCF-graduated log collector with 500+ plugins used by AWS, Microsoft, and Nintendo.$q$,
  og_description = $q$Fluentd is a free, open source, CNCF-graduated log collector with 500+ plugins used by AWS, Microsoft, and Nintendo.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0d623697-0839-419d-b74c-5c99fda783e0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0d623697-0839-419d-b74c-5c99fda783e0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', $q$Unified logging layer$q$, $q$Decouples data sources from backend systems so logs can be collected once and routed anywhere.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', $q$500+ plugins$q$, $q$A large plugin ecosystem connects Fluentd to a wide range of data sources and output destinations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', $q$Simple core, flexible extensibility$q$, $q$A minimal core architecture is extended through plugins rather than built-in feature bloat.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', $q$CNCF graduated project$q$, $q$Governed as a Cloud Native Computing Foundation graduated project.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', $q$Free and open source under the Apache 2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', $q$CNCF graduated project with mature governance$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', $q$Very large plugin ecosystem (500+ plugins)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', $q$Proven at scale, used by AWS, Microsoft, Atlassian, Nintendo, and Twilio$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', $q$Reported to be used by 5,000+ data-driven companies$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', $q$Fluentd is a data collector only — it has no built-in storage or dashboard, so it must be paired with tools like Elasticsearch or Grafana for visualization$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', $q$Requires selecting and configuring plugins for most real-world source/output combinations$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', $q$Is Fluentd free?$q$, $q$Yes. Fluentd is fully open source under the Apache 2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', $q$Is Fluentd a CNCF project?$q$, $q$Yes, Fluentd is a Cloud Native Computing Foundation graduated project.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', $q$Does Fluentd include a dashboard?$q$, $q$No. Fluentd is a data collector that forwards logs to backend systems; visualization is handled by downstream tools.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', $q$How many plugins does Fluentd support?$q$, $q$Fluentd has more than 500 plugins for various data sources and output destinations.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', $q$Unified log collection$q$, $q$Organizations use Fluentd to collect logs from many sources and route them to one or more backend systems.$q$, $q$DevOps and platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', $q$Large-scale log aggregation$q$, $q$Companies with large server fleets use Fluentd to centralize logging; the largest reported deployment collects logs from over 50,000 servers.$q$, $q$Large-scale infrastructure teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', $q$overview$q$, $q$What is Fluentd?$q$, 2, ARRAY[$q$Fluentd is an open source data collector that provides a unified logging layer, decoupling data sources from backend systems. It is a CNCF graduated project with a plugin ecosystem of more than 500 plugins covering data sources and outputs.$q$, $q$Fluentd is used by over 5,000 data-driven companies, including AWS, Microsoft, Atlassian, Nintendo, Twilio, and Line, with its largest known deployment collecting logs from more than 50,000 servers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', $q$who-its-for$q$, $q$Who Fluentd is for$q$, 2, ARRAY[$q$Fluentd is for DevOps and platform teams that need a vendor-neutral, extensible log collector to unify data from many sources before sending it to storage, analytics, or SIEM systems.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0d623697-0839-419d-b74c-5c99fda783e0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Fluent Bit ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lightweight, CNCF-graduated telemetry agent for collecting, processing, and forwarding logs, metrics, and traces.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Fluent Bit is a free, open source, CNCF-graduated telemetry agent with native OpenTelemetry support and a ~450KB footprint.$q$,
  og_description = $q$Fluent Bit is a free, open source, CNCF-graduated telemetry agent with native OpenTelemetry support and a ~450KB footprint.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c5592933-959b-4725-9845-baccff52192d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c5592933-959b-4725-9845-baccff52192d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$Native OpenTelemetry support$q$, $q$Ingests and delivers data using the OTLP protocol natively.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$Dynamic routing$q$, $q$Routes data across multiple destinations using a zero-copy strategy.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$100+ plugins$q$, $q$Over 100 input, filter, and output plugins for connecting to different sources and backends.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$Minimal footprint$q$, $q$Roughly 450KB in size with zero external dependencies, suited to containerized environments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$Event-driven architecture$q$, $q$Asynchronous, event-driven design built for high-throughput telemetry pipelines.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$Free and open source under the Apache 2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$CNCF graduated project under the Fluent organization$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$Extremely lightweight (~450KB) with no external dependencies$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$Native OpenTelemetry (OTLP) ingestion and delivery$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$Used by major cloud and observability vendors including Google Cloud, Microsoft, AWS, Datadog, and Splunk$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$A telemetry pipeline agent only — no built-in storage or dashboard, so it requires pairing with a backend for visualization$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$As a C-based agent, custom plugin development has a steeper learning curve than higher-level tools$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$Is Fluent Bit free?$q$, $q$Yes, Fluent Bit is open source and free to use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$Is Fluent Bit related to Fluentd?$q$, $q$Yes, both are CNCF graduated projects under the Fluent organization.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$Does Fluent Bit support OpenTelemetry?$q$, $q$Yes, Fluent Bit has native OTLP ingestion and delivery support.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$How lightweight is Fluent Bit?$q$, $q$Fluent Bit has a footprint of roughly 450KB with zero external dependencies.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$Container and Kubernetes log collection$q$, $q$Teams deploy Fluent Bit as a lightweight agent inside containers and Kubernetes clusters to forward telemetry data.$q$, $q$Platform and cloud infrastructure teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$High-throughput telemetry pipelines$q$, $q$Organizations processing large volumes of logs, metrics, and traces use Fluent Bit for its high-throughput, low-resource design.$q$, $q$SRE and observability teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$overview$q$, $q$What is Fluent Bit?$q$, 2, ARRAY[$q$Fluent Bit is a fast, lightweight, and highly scalable logging, metrics, and traces processor and forwarder designed for cloud and containerized environments. It is a CNCF graduated project under the Fluent organization, with native OpenTelemetry (OTLP) support and more than 100 input, filter, and output plugins.$q$, $q$The project is used by major cloud and observability vendors including Google Cloud, Microsoft, AWS, Datadog, and Splunk, and the site cites throughput of over 1 petabyte of data per day across its user base.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c5592933-959b-4725-9845-baccff52192d', $q$who-its-for$q$, $q$Who Fluent Bit is for$q$, 2, ARRAY[$q$Fluent Bit is built for teams running containerized or cloud-native infrastructure who need a low-overhead agent to collect and route telemetry data without adding significant CPU or memory cost.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5592933-959b-4725-9845-baccff52192d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5592933-959b-4725-9845-baccff52192d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5592933-959b-4725-9845-baccff52192d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Vector ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Rust-built, open source observability pipeline tool for collecting, transforming, and routing logs and metrics.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Vector is a free, open source, Rust-built observability pipeline tool maintained by Datadog, with 47 sources and 62 sinks.$q$,
  og_description = $q$Vector is a free, open source, Rust-built observability pipeline tool maintained by Datadog, with 47 sources and 62 sinks.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8ccfa422-ec09-4a81-8ffc-cee3d57641ca';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8ccfa422-ec09-4a81-8ffc-cee3d57641ca' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$Built in Rust$q$, $q$A memory-efficient, high-performance runtime built in Rust.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$Vector Remap Language (VRL)$q$, $q$A programmable transform language for parsing and reshaping observability data in the pipeline.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$Flexible deployment topologies$q$, $q$Can be deployed as a daemon, sidecar, or aggregator across distributed, centralized, or stream-based architectures.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$47 sources and 62 sinks$q$, $q$Broad connectivity including Kafka, Elasticsearch, AWS S3, Splunk, Datadog, and Kubernetes logs.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$Single static binary$q$, $q$Ships as a single binary with no dependencies and no external runtime required.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$Maintained by Datadog with an active GitHub project (13k+ stars, 300+ contributors)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$High performance thanks to its Rust implementation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$Wide range of integrations: 47 sources, 18 transforms, and 62 sinks$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$Simple deployment as a single dependency-free binary$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$A pipeline tool only — no built-in storage or visualization, so it must be paired with a backend$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$Maintained primarily by a single vendor (Datadog) rather than a neutral foundation$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$Is Vector free?$q$, $q$Yes, Vector is open source and free to use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$Who maintains Vector?$q$, $q$Vector is maintained by Datadog.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$What language is Vector written in?$q$, $q$Vector is built in Rust for performance and memory efficiency.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$How many integrations does Vector support?$q$, $q$Vector supports 47 sources, 18 transforms, and 62 sinks according to its website.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$Building observability pipelines$q$, $q$Teams use Vector to collect, transform, and route logs and metrics between many sources and destinations.$q$, $q$DevOps and observability engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$High-throughput log/metric routing$q$, $q$Organizations needing a low-overhead, high-performance pipeline component deploy Vector as a daemon, sidecar, or aggregator.$q$, $q$Platform teams running large-scale infrastructure$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$overview$q$, $q$What is Vector?$q$, 2, ARRAY[$q$Vector is a lightweight, ultra-fast, open source tool for building observability pipelines, built in Rust and maintained by Datadog. It collects, transforms, and routes logs and metrics using the Vector Remap Language (VRL) for programmable transforms.$q$, $q$It ships as a single dependency-free binary and supports 47 sources, 18 transforms, and 62 sinks, including Kafka, Elasticsearch, AWS S3, Splunk, and Datadog.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', $q$who-its-for$q$, $q$Who Vector is for$q$, 2, ARRAY[$q$Vector is for DevOps and observability teams that need a fast, resource-efficient pipeline to move logs and metrics between many different sources and destinations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ccfa422-ec09-4a81-8ffc-cee3d57641ca', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Logstash ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open source server-side data processing pipeline that ingests, transforms, and ships data into the Elastic Stack.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Logstash is a free, open source data processing pipeline by Elastic with 200+ plugins for ingesting and transforming data.$q$,
  og_description = $q$Logstash is a free, open source data processing pipeline by Elastic with 200+ plugins for ingesting and transforming data.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'dbaa6caa-3a8b-44a6-a307-4debcee9af7a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'dbaa6caa-3a8b-44a6-a307-4debcee9af7a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$Broad input support$q$, $q$Pulls data from logs, metrics, web applications, data stores, and AWS services.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$In-flight filtering$q$, $q$Parses and transforms data using grok parsing, geo-coordinate extraction, and PII anonymization.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$200+ plugins$q$, $q$A plugin ecosystem with a development API for extending inputs, filters, and outputs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$Persistent queues$q$, $q$Guarantees at-least-once delivery with dead letter queue support for failed events.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$Pipeline Management UI$q$, $q$Centralized UI for orchestrating and monitoring pipeline deployments.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$Open source and free to download$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$Large plugin ecosystem (200+ plugins)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$Tightly integrated with Elasticsearch and the rest of the Elastic Stack$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$Persistent queues and dead letter queues improve delivery reliability$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$Designed to pair with the Elastic Stack (Elasticsearch/Kibana) as its primary destination$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$Pricing and tiering for the broader Elastic Stack are not detailed on the Logstash product page$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$Is Logstash free?$q$, $q$Yes, Logstash is open source and free to download.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$What does Logstash do?$q$, $q$Logstash ingests data from many sources, transforms it in-flight using filters, and sends it to a destination such as Elasticsearch.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$How many plugins does Logstash have?$q$, $q$Logstash has more than 200 plugins for inputs, filters, and outputs.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$Is Logstash part of the Elastic Stack?$q$, $q$Yes, Logstash is a core component of the Elastic Stack alongside Elasticsearch and Kibana.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$Log ingestion and transformation$q$, $q$Teams use Logstash to parse and enrich log data before sending it to Elasticsearch for search and analysis.$q$, $q$DevOps and data engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$PII redaction and data normalization$q$, $q$Organizations use Logstash filters to anonymize sensitive fields and normalize data formats in-flight.$q$, $q$Compliance-conscious engineering teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$overview$q$, $q$What is Logstash?$q$, 2, ARRAY[$q$Logstash is an open source server-side data processing pipeline that ingests data from a multitude of sources, transforms it, and sends it to a destination such as Elasticsearch. It includes filters for grok parsing, geo-coordinate extraction, and PII anonymization, plus persistent queues for at-least-once delivery.$q$, $q$Logstash is part of the Elastic Stack and offers a plugin ecosystem of more than 200 inputs, filters, and outputs, along with a Pipeline Management UI for orchestrating deployments.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', $q$who-its-for$q$, $q$Who Logstash is for$q$, 2, ARRAY[$q$Logstash suits engineering teams already using or planning to use the Elastic Stack who need a flexible pipeline for ingesting, transforming, and routing log and event data.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dbaa6caa-3a8b-44a6-a307-4debcee9af7a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Jaeger ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open source, CNCF-graduated distributed tracing platform for monitoring and troubleshooting microservices.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Jaeger is a free, open source, CNCF-graduated distributed tracing platform with native OpenTelemetry and ClickHouse support.$q$,
  og_description = $q$Jaeger is a free, open source, CNCF-graduated distributed tracing platform with native OpenTelemetry and ClickHouse support.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '117d354d-ba1d-4901-852d-f37b6680c972';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '117d354d-ba1d-4901-852d-f37b6680c972' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$Distributed request tracing$q$, $q$Maps request flow across distributed microservice systems.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$Root cause analysis$q$, $q$Helps identify performance bottlenecks and track down the root causes of errors.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$Service dependency analysis$q$, $q$Analyzes and visualizes dependencies between services.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$Native OTLP support$q$, $q$Natively supports the OpenTelemetry Protocol as of version 1.35.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$ClickHouse storage backend$q$, $q$Native ClickHouse support was added as a storage backend in version 2.18.0, alongside other storage options.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$CNCF graduated project with an open governance model$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$Native OpenTelemetry (OTLP) support$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$Multiple storage backend options including ClickHouse$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$Open governance with mentorship programs and maintainer pathways$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$Requires setting up and operating a separate storage backend (e.g. ClickHouse, Elasticsearch, or Cassandra)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$Focused on distributed tracing only — no built-in metrics or log collection$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$Self-hosted only; no managed cloud offering mentioned$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$Is Jaeger free?$q$, $q$Yes, Jaeger is 100% open source and free to use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$Is Jaeger a CNCF project?$q$, $q$Yes, Jaeger is a Cloud Native Computing Foundation graduated project.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$Does Jaeger support OpenTelemetry?$q$, $q$Yes, Jaeger has native OTLP support as of version 1.35.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$What storage backends does Jaeger support?$q$, $q$Jaeger supports multiple storage backends, including native ClickHouse support added in version 2.18.0.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$Microservices troubleshooting$q$, $q$Teams use Jaeger to trace requests across microservices and identify latency or error root causes.$q$, $q$SRE and backend engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$Service dependency mapping$q$, $q$Organizations use Jaeger's dependency analysis to understand how services interact in complex architectures.$q$, $q$Platform and architecture teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$overview$q$, $q$What is Jaeger?$q$, 2, ARRAY[$q$Jaeger is an open source, distributed tracing platform for monitoring and troubleshooting complex microservices-based systems. It maps request flow across distributed systems, identifies performance bottlenecks, and tracks the root causes of errors.$q$, $q$Jaeger is a CNCF graduated project with an open governance model, native OpenTelemetry (OTLP) support since version 1.35, and native ClickHouse storage support since version 2.18.0.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', $q$who-its-for$q$, $q$Who Jaeger is for$q$, 2, ARRAY[$q$Jaeger is for SRE and backend teams running microservices architectures who need distributed tracing to diagnose latency and errors across service boundaries.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('117d354d-ba1d-4901-852d-f37b6680c972', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Zipkin ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open source distributed tracing system originally built at Twitter to troubleshoot latency in microservice architectures.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Zipkin is a free, open source distributed tracing system originally built at Twitter for troubleshooting microservice latency.$q$,
  og_description = $q$Zipkin is a free, open source distributed tracing system originally built at Twitter for troubleshooting microservice latency.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b18b84bf-1a80-44d2-8619-43e15614d140';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b18b84bf-1a80-44d2-8619-43e15614d140' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$Trace collection and lookup$q$, $q$Gathers timing data across services and lets you look up individual traces.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$Query by service, tag, or duration$q$, $q$Search traces by service, operation name, tags, and duration.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$Dependency diagrams$q$, $q$Visualizes request flows and dependencies between applications.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$Multiple transport protocols$q$, $q$Supports HTTP, Kafka, Apache ActiveMQ, gRPC, and RabbitMQ for reporting trace data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$Pluggable storage$q$, $q$Stores trace data in-memory or in persistent backends like Apache Cassandra or Elasticsearch.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$Originated from and battle-tested at Twitter's scale$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$Flexible transport protocol support (HTTP, Kafka, gRPC, RabbitMQ, ActiveMQ)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$Pluggable storage backends including Cassandra and Elasticsearch$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$Includes dependency diagram visualization out of the box$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$Requires a separate persistent storage backend (Cassandra or Elasticsearch) for production use$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$Requires instrumenting applications with tracer libraries$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$Focused on distributed tracing only — no built-in metrics or log collection$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$Is Zipkin free?$q$, $q$Yes, Zipkin is open source software available on GitHub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$Where did Zipkin originate?$q$, $q$Zipkin was initially built to store data on Cassandra, reflecting its origins and heavy internal use at Twitter.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$What storage does Zipkin use?$q$, $q$Zipkin supports in-memory storage for testing or persistent storage such as Apache Cassandra or Elasticsearch for production.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$What transport protocols does Zipkin support?$q$, $q$Zipkin supports HTTP, Kafka, Apache ActiveMQ, gRPC, and RabbitMQ.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$Latency troubleshooting$q$, $q$Teams use Zipkin to identify and resolve latency issues in microservice architectures.$q$, $q$Backend and SRE teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$Service dependency visualization$q$, $q$Organizations use Zipkin's dependency diagrams to understand how requests flow between applications.$q$, $q$Platform engineering teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$overview$q$, $q$What is Zipkin?$q$, 2, ARRAY[$q$Zipkin is an open source distributed tracing system that gathers timing data to troubleshoot latency problems in service architectures. It was initially built to store data on Cassandra, reflecting its origins and heavy use within Twitter.$q$, $q$Zipkin supports multiple transport protocols (HTTP, Kafka, ActiveMQ, gRPC, RabbitMQ) and pluggable storage backends including in-memory, Cassandra, and Elasticsearch, with dependency diagram visualization included.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', $q$who-its-for$q$, $q$Who Zipkin is for$q$, 2, ARRAY[$q$Zipkin is for engineering teams running microservice architectures who need a free, open source tool to trace requests and diagnose latency across services.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b18b84bf-1a80-44d2-8619-43e15614d140', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Bugsink ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open source error tracking platform that's a Sentry SDK-compatible drop-in alternative to Sentry.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€16/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Bugsink is an open source, Sentry SDK-compatible error tracking tool with a free self-hosted option and hosted plans from €16/month.$q$,
  og_description = $q$Bugsink is an open source, Sentry SDK-compatible error tracking tool with a free self-hosted option and hosted plans from €16/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b5e89d16-61c3-4ade-882a-138e2a553e12';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b5e89d16-61c3-4ade-882a-138e2a553e12' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Stacktrace analysis$q$, $q$Shows local variables and code context alongside stack traces for debugging.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Automatic issue grouping$q$, $q$Consolidates related errors into single issues automatically.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Search and tagging$q$, $q$Search and filter errors by release, environment, user, and other tags.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Sourcemap support$q$, $q$Resolves minified code back to original sources using sourcemaps.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Sentry SDK compatibility$q$, $q$Works as a drop-in replacement for Sentry, using the existing Sentry SDKs.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Alerting notifications$q$, $q$Sends alerts when new or recurring errors occur.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Self-hosted deployment is free with unlimited users and all features$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Drop-in compatibility with existing Sentry SDKs simplifies migration$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Open source with 1.9K GitHub stars$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Hosted plans start at a low entry price (€16/month for 75K events)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Free hosted tier available for evaluation (15K events/month)$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Free hosted tier is capped at 15K events/month with single-user access$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Self-hosted event volume is limited by your own hardware capacity$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Higher-volume hosted plans (600K to 50M+ events/month) add meaningfully to cost$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Is Bugsink free?$q$, $q$Self-hosted Bugsink is free with unlimited users and all features. The hosted version has a free tier limited to 15K events/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Is Bugsink compatible with Sentry?$q$, $q$Yes, Bugsink is designed to be a drop-in replacement using existing Sentry SDKs.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$How much does hosted Bugsink cost?$q$, $q$Hosted plans start at €16/month for 75K events, scaling up to €158/month for 3M events, with higher-volume plans available.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Can Bugsink be self-hosted?$q$, $q$Yes, self-hosting is free and includes unlimited users and all features, with event volume limited by your own hardware.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Self-hosted error monitoring$q$, $q$Teams that want full control over their error data self-host Bugsink for free.$q$, $q$Engineering teams with self-hosting infrastructure$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Cost-effective Sentry alternative$q$, $q$Teams looking to reduce error-tracking costs at scale switch to Bugsink's hosted plans while keeping their existing Sentry SDK integrations.$q$, $q$Cost-conscious engineering teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Self-hosted$q$, $q$Free$q$, NULL, $q$["Unlimited users","All features included","Event volume depends on your own hardware"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Hosted Free$q$, $q$Free$q$, $q$monthly$q$, $q$["15K events/month","Single user","5K events retained"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Hosted 75K$q$, $q$€16/month$q$, $q$monthly$q$, $q$["75K events/month"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Hosted 600K$q$, $q$€50/month$q$, $q$monthly$q$, $q$["600K events/month"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$Hosted 3M$q$, $q$€158/month$q$, $q$monthly$q$, $q$["3M events/month"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$overview$q$, $q$What is Bugsink?$q$, 2, ARRAY[$q$Bugsink is a self-hosted error tracking platform for monitoring when and why code fails in production. It is designed as a Sentry-compatible drop-in alternative, working with existing Sentry SDKs.$q$, $q$Bugsink is open source (1.9K GitHub stars) and offers both a free self-hosted deployment and hosted plans starting at €16/month for 75K events, up to higher-volume tiers for 50M+ events/month.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', $q$who-its-for$q$, $q$Who Bugsink is for$q$, 2, ARRAY[$q$Bugsink is for engineering teams already using Sentry's SDKs who want a self-hosted or lower-cost alternative for error tracking without changing their instrumentation.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b5e89d16-61c3-4ade-882a-138e2a553e12', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Coroot ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open source, eBPF-based observability platform offering AI-powered root cause analysis with zero code instrumentation.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$1/monitored CPU core/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Coroot is an open source eBPF observability platform with AI-powered root cause analysis, a free Community Edition, and plans from $1/core.$q$,
  og_description = $q$Coroot is an open source eBPF observability platform with AI-powered root cause analysis, a free Community Edition, and plans from $1/core.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '883b2808-6d12-4830-b483-eca7281f59f1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '883b2808-6d12-4830-b483-eca7281f59f1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$eBPF-based zero instrumentation$q$, $q$Collects metrics, logs, traces, and profiles without requiring code changes to applications.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$AI-powered root cause analysis$q$, $q$Identifies issues and suggests fixes using AI-driven analysis.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$Service maps and continuous profiling$q$, $q$Visualizes service relationships and continuously profiles application performance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$SLO tracking and smart alerting$q$, $q$Tracks service-level objectives and generates alerts based on them.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$Cost monitoring$q$, $q$Tracks infrastructure cost alongside performance data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$SSO and RBAC$q$, $q$Single sign-on and role-based access control available on the Standard edition and above.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$Free, open source Community Edition available on GitHub (7,300+ stars, 25M+ downloads)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$Zero-instrumentation monitoring via eBPF, requiring no code changes$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$Transparent, usage-based pricing for the Standard edition ($1 per monitored CPU core/month)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$14-day full-feature trial with no credit card required$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$Self-hosted deployment gives full control over data$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$Community Edition lacks SSO, RBAC, and premium support included in paid tiers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$Premium edition pricing requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$Standard/Premium editions require ongoing per-core billing that scales with cluster size$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$Is Coroot free?$q$, $q$Yes, the Community Edition is free and available on GitHub. Paid Standard and Premium editions add features like SSO, RBAC, and 24x7 support.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$How is Coroot's Standard edition priced?$q$, $q$The Standard edition is priced at $1 per monitored CPU core per month, with volume discounts available.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$Does Coroot require code instrumentation?$q$, $q$No, Coroot uses eBPF to collect metrics, logs, traces, and profiles without requiring code changes.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$Is there a free trial?$q$, $q$Yes, Coroot offers a 14-day full-feature trial with no credit card required.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$Kubernetes and container observability$q$, $q$SRE and DevOps teams use Coroot's eBPF-based monitoring to get full-stack visibility into containerized environments without instrumenting code.$q$, $q$SRE and DevOps teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$Cost-effective Datadog/New Relic alternative$q$, $q$Teams looking to reduce observability spend use Coroot's self-hosted or per-core pricing as an alternative to Datadog or New Relic.$q$, $q$Cost-conscious platform teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Self-hosted","eBPF-based monitoring","Available on GitHub"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$Standard Edition$q$, $q$$1/monitored CPU core/month$q$, $q$monthly$q$, $q$["eBPF-based monitoring","SLO tracking","Smart alerting","Slack/PagerDuty/Teams integration","Deployment tracking","Cost monitoring","Continuous profiling","AI-powered root cause analysis","SSO and RBAC","Business-hours support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$Premium Edition$q$, $q$Contact sales$q$, NULL, $q$["24x7 support with phone","Premium onboarding","Capacity planning","Air-gapped installation support","Team training"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$overview$q$, $q$What is Coroot?$q$, 2, ARRAY[$q$Coroot is a full-stack observability platform that uses eBPF technology and AI for root cause analysis, providing metrics, logs, traces, and continuous profiling without requiring code instrumentation. It covers applications, databases, infrastructure, cloud, and network monitoring in a unified interface.$q$, $q$Coroot offers a free, open source Community Edition (7,300+ GitHub stars, 25M+ downloads) alongside a paid Standard edition priced at $1 per monitored CPU core per month, and a Premium edition available via sales for larger organizations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', $q$who-its-for$q$, $q$Who Coroot is for$q$, 2, ARRAY[$q$Coroot is for SREs and DevOps teams running Kubernetes and containerized environments who want observability and AI-assisted root cause analysis without instrumenting application code, at a lower cost than traditional APM vendors.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('883b2808-6d12-4830-b483-eca7281f59f1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── OpenTelemetry ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open source, vendor-neutral framework for collecting traces, metrics, and logs from cloud-native applications.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2019,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OpenTelemetry is a CNCF-graduated open source observability framework for capturing traces, metrics, and logs across 12+ languages.$q$,
  og_description = $q$OpenTelemetry is a CNCF-graduated open source observability framework for capturing traces, metrics, and logs across 12+ languages.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '567932b8-eb63-435b-a35e-b252afd5a120';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '567932b8-eb63-435b-a35e-b252afd5a120' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$Auto-instrumentation$q$, $q$Zero-code agents automatically capture telemetry for many popular languages and frameworks.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$Vendor-neutral APIs and SDKs$q$, $q$A single set of client libraries spans 12+ languages, including Java, Python, Go, JavaScript, and .NET.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$OpenTelemetry Collector$q$, $q$A standalone service with 200+ components for receiving, processing, and exporting telemetry data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$Unified signal model$q$, $q$Traces, metrics, and logs are correlated through shared context propagation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$Backend flexibility$q$, $q$Export telemetry to any OTLP-compatible observability backend without changing instrumentation code.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$CNCF governance$q$, $q$A CNCF graduated project, formed from the merger of OpenTracing and OpenCensus.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$Fully open source and free with no licensing cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$Avoids vendor lock-in by decoupling instrumentation from any specific backend$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$Broad language support (12+ languages) and a large contributor community$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$CNCF graduated status signals project maturity and long-term stability$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$Requires engineering effort to instrument applications and operate the Collector pipeline$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$No built-in storage, visualization, or alerting — a separate backend is required$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$Auto-instrumentation coverage and stability varies by language$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$Is OpenTelemetry free to use?$q$, $q$Yes, OpenTelemetry is a fully open source project with no licensing fees.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$Who maintains OpenTelemetry?$q$, $q$It's a CNCF graduated project formed from the merger of the OpenTracing and OpenCensus projects.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$Does OpenTelemetry include a dashboard or storage product?$q$, $q$No, OpenTelemetry only handles instrumentation, collection, and export; you send data to a separate observability backend of your choice.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$What languages does OpenTelemetry support?$q$, $q$It provides SDKs for 12+ languages, including Java, Python, Go, JavaScript, .NET, Ruby, PHP, Rust, C++, and Swift.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$Cloud-native application observability$q$, $q$Engineering teams instrument microservices to capture distributed traces, metrics, and logs without vendor lock-in.$q$, $q$Platform and SRE teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$Vendor migration and multi-backend export$q$, $q$Teams route the same telemetry to multiple or new observability backends without re-instrumenting code.$q$, $q$DevOps and observability teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$overview$q$, $q$What is OpenTelemetry?$q$, 2, ARRAY[$q$OpenTelemetry is an open source observability framework that provides a single set of APIs, SDKs, and agents for capturing distributed traces, metrics, and logs from applications.$q$, $q$It is a CNCF graduated project, formed from the 2019 merger of the OpenTracing and OpenCensus projects, and its Collector component includes 200+ components for processing and exporting telemetry to any OTLP-compatible backend.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', $q$who-its-for$q$, $q$Who OpenTelemetry is for$q$, 2, ARRAY[$q$OpenTelemetry is built for platform, SRE, and backend engineering teams who need vendor-neutral instrumentation across cloud-native applications and want to avoid locking their telemetry pipeline into a single observability vendor.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('567932b8-eb63-435b-a35e-b252afd5a120', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── StreamSets ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$StreamSets (now IBM StreamSets) is a hybrid, multi-cloud platform for building and running streaming and batch data pipelines.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$IBM StreamSets is a hybrid data integration platform for building real-time and batch pipelines across cloud and on-prem systems.$q$,
  og_description = $q$IBM StreamSets is a hybrid data integration platform for building real-time and batch pipelines across cloud and on-prem systems.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'af41f8fc-b90f-4d77-80ef-840d3baf8120';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'af41f8fc-b90f-4d77-80ef-840d3baf8120' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$Pre-built connectors$q$, $q$A library of connectors for databases, applications, and cloud services with a drag-and-drop pipeline designer.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$No-code/low-code pipeline builder$q$, $q$An intuitive visual interface for building data pipelines without heavy coding.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$Automatic data drift handling$q$, $q$Pipelines automatically adapt to schema changes in source data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$Streaming and batch in one platform$q$, $q$Real-time streaming and scheduled batch processing are supported from the same tool.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$Multi-cloud and hybrid deployment$q$, $q$Deployable on AWS, Azure, Google Cloud, in a private VPC, or on local infrastructure.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$Central control plane$q$, $q$A unified interface for monitoring and managing pipelines across environments.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$Handles both streaming and batch data integration in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$Automatic data drift handling reduces pipeline maintenance$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$Broad deployment flexibility across multi-cloud, hybrid, and on-prem environments$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$Now backed by IBM's enterprise support and ecosystem$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$Pricing is not publicly listed and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$Enterprise-oriented tool that is likely a heavier lift for very small teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$Now sold and supported as an IBM product following its acquisition$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$Is StreamSets free to use?$q$, $q$No, StreamSets (now IBM StreamSets) is a commercial platform priced by contacting IBM sales; no public free tier is listed.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$Who owns StreamSets today?$q$, $q$StreamSets is now part of IBM's product portfolio and is marketed as IBM StreamSets.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$Can StreamSets run outside the public cloud?$q$, $q$Yes, it supports deployment on AWS, Azure, Google Cloud, in a private VPC, or on local infrastructure.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$Does StreamSets support both streaming and batch pipelines?$q$, $q$Yes, it can ingest and transform structured, semi-structured, and unstructured data in both real-time streaming and batch modes.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$Hybrid, multi-cloud data pipelines$q$, $q$Organizations connect on-prem and cloud data sources into unified pipelines for real-time decision-making.$q$, $q$Enterprise data engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$Resilient pipelines with schema drift$q$, $q$Teams running pipelines against evolving source schemas rely on automatic drift handling instead of manual pipeline fixes.$q$, $q$Data engineers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$overview$q$, $q$What is StreamSets?$q$, 2, ARRAY[$q$StreamSets is a hybrid, multi-cloud data integration platform for building, running, and monitoring streaming and batch data pipelines, with pre-built connectors and automatic handling of upstream schema changes.$q$, $q$StreamSets was acquired and is now marketed and sold as IBM StreamSets, deployable on AWS, Azure, Google Cloud, in a private VPC, or on local infrastructure.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', $q$who-its-for$q$, $q$Who StreamSets is for$q$, 2, ARRAY[$q$StreamSets targets enterprise data engineering teams that need to move structured, semi-structured, and unstructured data across hybrid and multi-cloud environments with minimal pipeline maintenance.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af41f8fc-b90f-4d77-80ef-840d3baf8120', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Debezium ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Debezium is an open source change data capture (CDC) platform that streams row-level database changes into Kafka in real time.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2016,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Debezium is an open source CDC platform that streams real-time row-level changes from databases like MySQL, PostgreSQL, and MongoDB into Kafka.$q$,
  og_description = $q$Debezium is an open source CDC platform that streams real-time row-level changes from databases like MySQL, PostgreSQL, and MongoDB into Kafka.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8fe9ecc9-4076-431c-b5a3-fbde13581137';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8fe9ecc9-4076-431c-b5a3-fbde13581137' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$Low-latency change data capture$q$, $q$Captures row-level changes from multiple database systems with low latency.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$Durable, replicated event log$q$, $q$Change events are recorded in Kafka topics, providing a durable and replicated log.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$Broad database connector support$q$, $q$Connectors are available for MySQL, PostgreSQL, MongoDB, Oracle, SQL Server, MariaDB, and generic JDBC sources.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$Fault-tolerant resumption$q$, $q$Applications can resume from the last processed change after a restart without losing events.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$Flexible deployment$q$, $q$Runs via Kafka Connect or can be embedded directly inside applications.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$Fully open source under the Apache License 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$Supports a wide range of major relational and NoSQL databases$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$Strong fault tolerance backed by Kafka's durability guarantees$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$Active community with 12.9k+ GitHub stars and 3k+ forks$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$Requires operating and understanding Kafka or Kafka Connect infrastructure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$No official managed/hosted offering from the Debezium project itself$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$Initial setup and tuning of connectors can require CDC expertise$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$Is Debezium free?$q$, $q$Yes, Debezium is fully open source under the Apache License 2.0 (with ANTLR grammars under the MIT License).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$What databases does Debezium support?$q$, $q$Connectors are available for MySQL, PostgreSQL, MongoDB, Oracle, SQL Server, MariaDB, and generic JDBC sources.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$Does Debezium require Kafka?$q$, $q$Debezium typically runs via Kafka Connect, though it can also be embedded directly into applications.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$Who maintains Debezium?$q$, $q$The project is maintained by the Commonhaus Foundation with an active open source community.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$Real-time data synchronization$q$, $q$Teams stream database changes into Kafka to keep downstream systems, caches, or search indexes in sync.$q$, $q$Data engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$Event-driven microservices$q$, $q$Applications react to row-level database changes as events rather than polling for updates.$q$, $q$Backend and platform engineers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$overview$q$, $q$What is Debezium?$q$, 2, ARRAY[$q$Debezium is an open source change data capture (CDC) platform that monitors databases and streams row-level changes into Kafka topics as a durable, replicated event log.$q$, $q$Started in 2016, Debezium is licensed under the Apache License 2.0, maintained by the Commonhaus Foundation, and provides connectors for MySQL, PostgreSQL, MongoDB, Oracle, SQL Server, and MariaDB.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', $q$who-its-for$q$, $q$Who Debezium is for$q$, 2, ARRAY[$q$Debezium is for data engineering and backend teams who need to stream real-time database changes into Kafka for synchronization, caching, or event-driven microservice architectures.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8fe9ecc9-4076-431c-b5a3-fbde13581137', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Estuary Flow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Estuary Flow is a real-time data integration platform with 200+ connectors for streaming ETL/ELT, CDC, and batch pipelines.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$0.50/GB + $100/connector per month (Cloud plan)$q$,
  founded_year = 2019,
  company_size = NULL,
  headquarters = $q$New York, NY, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Estuary Flow is a real-time data integration platform offering 200+ connectors, CDC, and streaming ETL/ELT with a free developer tier.$q$,
  og_description = $q$Estuary Flow is a real-time data integration platform offering 200+ connectors, CDC, and streaming ETL/ELT with a free developer tier.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c4addc67-46f9-4aeb-9550-246f4f8c3d78';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c4addc67-46f9-4aeb-9550-246f4f8c3d78' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$200+ connectors$q$, $q$Pre-built connectors spanning databases, data warehouses, and SaaS applications.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$Real-time CDC and streaming$q$, $q$Log-based change data capture and streaming with sub-100ms latency.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$Batch processing support$q$, $q$Batch pipelines are supported alongside real-time streaming.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$Flexible deployment models$q$, $q$Available as Public Cloud, Private Cloud, or Bring-Your-Own-Cloud (BYOC).$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$Access controls$q$, $q$Role-based access control and SSH tunnel support for secure connections.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$Ecosystem integrations$q$, $q$Works with dbt Cloud, Kafka, Snowflake, and Apache Iceberg.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$Free Developer plan with 10GB/month and 2 concurrent connectors$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$Broad connector library covering 200+ sources and destinations$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$Sub-100ms latency for real-time use cases$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$Flexible deployment options, including BYOC for data residency needs$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$Cloud plan pricing is usage-based ($/GB plus per-connector), which can be less predictable than flat pricing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$Enterprise features like SSO, custom SLAs, and HIPAA reports require the negotiated Enterprise tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$No fully self-hosted open source option confirmed on the pricing page$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$Does Estuary Flow have a free plan?$q$, $q$Yes, the Developer plan is free and includes 10GB/month of data and 2 concurrent connectors.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$How is the paid Cloud plan priced?$q$, $q$It's usage-based at $0.50 per GB plus $100 per connector, billed monthly, with a 30-day free trial.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$Does Estuary Flow support change data capture?$q$, $q$Yes, it supports log-based CDC as well as streaming and batch data movement.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$Is there an Enterprise plan?$q$, $q$Yes, Enterprise pricing is custom and adds SOC 2/HIPAA compliance reports, SSO, custom SLAs, and BYOC/private deployments.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$Real-time analytics pipelines$q$, $q$Teams stream operational data into warehouses like Snowflake or BigQuery within milliseconds for up-to-date analytics.$q$, $q$Data engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$AI application data feeds$q$, $q$Teams feed current, real-time data into AI agents and applications instead of relying on stale batch exports.$q$, $q$AI and ML engineering teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$Developer$q$, $q$Free$q$, NULL, $q$["10GB/month data allowance","2 concurrent connectors"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$Cloud$q$, $q$$0.50/GB + $100/connector$q$, $q$monthly$q$, $q$["200+ fully-managed connectors","Unlimited users","Role-based access control and SSH tunnel support","Bring your own cloud storage","dbt Cloud and Kafka integration","30-day free trial"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Volume-based discounts","SOC 2 and HIPAA compliance reports","Single sign-on and custom SLAs","Private and BYOC deployments","Custom connector development"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$overview$q$, $q$What is Estuary Flow?$q$, 2, ARRAY[$q$Estuary Flow is a real-time data integration platform that moves and transforms data using streaming, change data capture, and batch processing across more than 200 connectors.$q$, $q$Founded in 2019 and headquartered in New York, Estuary offers a free Developer tier, a usage-based Cloud plan, and a negotiated Enterprise tier with BYOC and compliance features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', $q$who-its-for$q$, $q$Who Estuary Flow is for$q$, 2, ARRAY[$q$Estuary Flow is built for data engineering teams that need real-time or near-real-time data delivery for analytics, operations, or AI applications, without waiting on scheduled batch jobs.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c4addc67-46f9-4aeb-9550-246f4f8c3d78', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── GrowthLoop ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$GrowthLoop is an agentic, composable customer data platform that activates cloud data warehouses for AI-driven marketing campaigns.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2015,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$GrowthLoop is a composable CDP that uses AI agents to build audiences, orchestrate journeys, and activate marketing campaigns from cloud data.$q$,
  og_description = $q$GrowthLoop is a composable CDP that uses AI agents to build audiences, orchestrate journeys, and activate marketing campaigns from cloud data.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '45050474-ebf1-4a46-89d7-f47f4521c45f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '45050474-ebf1-4a46-89d7-f47f4521c45f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$AI Studio$q$, $q$An agentic interface for building campaigns using natural-language goals instead of SQL.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$Visual audience segmentation$q$, $q$A no-code audience builder with AI-generated segment suggestions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$Universal Journeys$q$, $q$Multi-channel campaign orchestration across batch, real-time, or automated delivery.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$Data Manager$q$, $q$A visual interface for mapping and connecting cloud data warehouse datasets.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$Composable AI decisioning$q$, $q$Measures incremental lift and continuously optimizes campaign performance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$Warehouse-native integrations$q$, $q$Connects directly to Google BigQuery, Snowflake, Databricks, and Amazon Redshift.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$Built directly on top of existing cloud data warehouses rather than a separate data silo$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$AI agent interface reduces reliance on SQL and engineering for campaign building$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$Named a 2025 Google Cloud Partner of the Year$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$Integrates with 50+ advertising, CRM, and customer success destinations$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$Pricing is not publicly listed and requires a sales demo$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$The composable, warehouse-native model requires an existing cloud data warehouse investment$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$Enterprise-focused, likely not suited for very small teams or budgets$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$Does GrowthLoop publish its pricing?$q$, $q$No, pricing isn't publicly listed; companies must request a custom quote through a demo.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$What data warehouses does GrowthLoop connect to?$q$, $q$It integrates with Google BigQuery, Snowflake, Databricks, and Amazon Redshift.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$What is GrowthLoop's AI Studio?$q$, $q$It's an agentic interface that lets marketers describe campaign goals in natural language instead of writing SQL.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$Who is GrowthLoop built for?$q$, $q$Enterprise marketing and data teams across industries like retail, finance, media, telecom, and commerce.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$Warehouse-native audience activation$q$, $q$Marketing teams build and sync audience segments directly from their cloud data warehouse to ad and CRM platforms.$q$, $q$Enterprise marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$AI-assisted campaign orchestration$q$, $q$Teams use natural-language AI agents to launch and optimize multi-channel journeys without writing SQL.$q$, $q$Growth and lifecycle marketers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$overview$q$, $q$What is GrowthLoop?$q$, 2, ARRAY[$q$GrowthLoop is an agentic, composable customer data platform that activates data directly from cloud warehouses like BigQuery, Snowflake, Databricks, and Redshift, rather than duplicating it into a separate CDP.$q$, $q$The platform combines a visual audience builder, multi-channel journey orchestration, and an AI agent interface (AI Studio) that lets marketers describe campaign goals in natural language.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', $q$who-its-for$q$, $q$Who GrowthLoop is for$q$, 2, ARRAY[$q$GrowthLoop targets enterprise marketing and data teams in industries such as retail, finance, media and entertainment, telecom, and commerce that already run a cloud data warehouse and want to activate that data for marketing without SQL bottlenecks.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('45050474-ebf1-4a46-89d7-f47f4521c45f', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;

-- ── Redash ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Redash is an open source tool for querying multiple data sources and building shareable SQL dashboards, now maintained under Databricks.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Redash is an open source SQL query and dashboard tool for connecting to multiple databases, visualizing data, and sharing dashboards.$q$,
  og_description = $q$Redash is an open source SQL query and dashboard tool for connecting to multiple databases, visualizing data, and sharing dashboards.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b4fe35bb-b786-4c89-83e9-c43385bfe93b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b4fe35bb-b786-4c89-83e9-c43385bfe93b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$SQL editor$q$, $q$A query interface with schema browsing and click-to-insert query building.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$Drag-and-drop dashboards$q$, $q$Build and customize dashboards from query results.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$Broad data source support$q$, $q$Connects to SQL, NoSQL, Big Data, and API-based data sources.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$Scheduled refresh$q$, $q$Automatically refreshes data from connected sources on a schedule.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$Sharing and alerting$q$, $q$Share dashboards with teammates or the public, and set alerts on query results.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$Reusable query snippets$q$, $q$Save query snippets for reuse across dashboards.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$Fully open source with no vendor lock-in and self-hosting support$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$Connects to a wide range of SQL, NoSQL, and API data sources$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$Simple, lightweight setup for teams that just need SQL dashboards$q$, 2);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$Owned by Databricks since 2020 and now in maintenance mode, with infrequent releases$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$The original hosted Redash Cloud service was shut down in November 2021$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$The community forum is read-only, limiting official support channels$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$Lacks the AI and semantic-layer features found in newer open source BI tools$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$Is Redash free?$q$, $q$Yes, Redash is an open source, self-hosted project with no licensing cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$Is Redash still actively developed?$q$, $q$Redash has been in maintenance mode since Databricks acquired it in 2020, with infrequent releases.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$Is there a hosted version of Redash?$q$, $q$No, the original Redash Cloud hosted service was discontinued in November 2021; only self-hosting is currently available.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$What data sources does Redash support?$q$, $q$It supports SQL, NoSQL, Big Data, and API-based data sources.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$Self-hosted SQL dashboards$q$, $q$Teams that want a lightweight, self-hosted way to query databases and share dashboards without a commercial BI license.$q$, $q$Small data and engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$Ad hoc data exploration$q$, $q$Analysts write and save SQL queries against connected databases to explore data without building a full BI project.$q$, $q$Data analysts$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$overview$q$, $q$What is Redash?$q$, 2, ARRAY[$q$Redash is an open source data analytics and visualization platform for connecting to multiple data sources, writing SQL queries, and building shareable dashboards.$q$, $q$Databricks acquired Redash in 2020; the hosted Redash Cloud service was shut down in November 2021, and the open source project has since been in maintenance mode with infrequent releases.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', $q$who-its-for$q$, $q$Who Redash is for$q$, 2, ARRAY[$q$Redash suits small data and engineering teams that want a free, self-hosted SQL query and dashboard tool without needing the newer AI or semantic-layer capabilities found in actively developed BI platforms.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4fe35bb-b786-4c89-83e9-c43385bfe93b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Lightdash ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lightdash is an open source, AI-native BI platform built on dbt that lets teams build governed dashboards as code.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$3,000/month (Cloud Pro, unlimited users)$q$,
  founded_year = 2021,
  company_size = NULL,
  headquarters = $q$London, United Kingdom$q$,
  languages = '{}',
  seo_meta_description = $q$Lightdash is an open source, dbt-native BI platform with AI agents, a governed semantic layer, and BI-as-code workflows.$q$,
  og_description = $q$Lightdash is an open source, dbt-native BI platform with AI agents, a governed semantic layer, and BI-as-code workflows.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c32a6cb9-22d2-4149-b6bc-129ecd02b8c3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c32a6cb9-22d2-4149-b6bc-129ecd02b8c3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$Agentic analytics$q$, $q$AI agents that build dashboards and answer questions autonomously.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$Conversational interface$q$, $q$Ask data questions in natural language via the UI or Slack.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$BI-as-code$q$, $q$Review, version control, and CI/CD-integrate analytics changes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$Native dbt integration$q$, $q$Syncs models and metrics directly from dbt projects.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$Governed semantic layer$q$, $q$An open semantic layer for consistent metric definitions across the organization.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$Developer tooling$q$, $q$CLI, preview environments, and automated validation for analytics engineers.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$Open source core available for self-hosting at no cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$Cloud Pro pricing is flat and unlimited-seat rather than per-user$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$Deep native dbt integration for teams already using dbt$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$BI-as-code workflow suits engineering-led analytics teams$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$Cloud Pro starts at $3,000/month, a significant jump from the free self-hosted tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$Self-hosted tier only includes community Slack support$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$Best suited to teams already invested in dbt; less turnkey for non-dbt users$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$Is Lightdash free?$q$, $q$Yes, the open source version can be self-hosted for free; Cloud Pro and Enterprise are paid tiers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$How much does Lightdash Cloud Pro cost?$q$, $q$Cloud Pro is $3,000/month with unlimited users rather than per-seat pricing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$Does Lightdash require dbt?$q$, $q$It's built around native dbt integration, syncing models and metrics directly from dbt projects.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$Can Lightdash be self-hosted?$q$, $q$Yes, the open source edition can be self-hosted on your own infrastructure.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$dbt-native self-serve analytics$q$, $q$Analytics engineering teams expose governed dbt metrics to business users without duplicating logic in a separate BI tool.$q$, $q$Analytics engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$AI-assisted dashboard building$q$, $q$Business users ask questions in natural language and let AI agents build dashboards grounded in the semantic layer.$q$, $q$Business analysts$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$Open Source (Self-Hosted)$q$, $q$Free$q$, NULL, $q$["Core BI features","Self-hosted deployment on your own infrastructure","Community Slack support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$Cloud Pro$q$, $q$$3,000/month$q$, $q$monthly$q$, $q$["Unlimited users and visualizations","Native dbt integration and open semantic layer","Scheduled reports and alerting","Charts and dashboards as code","AI agents and MCP capabilities","Dedicated support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Cloud or on-premise deployment","SSO, SAML, and SCIM 2.0","SOC 2 compliance with HIPAA and BAA support","Hands-on migration support","Priority support with defined SLAs"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$overview$q$, $q$What is Lightdash?$q$, 2, ARRAY[$q$Lightdash is an open source business intelligence platform built around a governed semantic layer and native dbt integration, letting teams build dashboards as code and review them via version control and CI/CD.$q$, $q$Founded in 2021 and based in London, Lightdash offers a free, self-hostable open source edition alongside a flat-priced Cloud Pro plan and a custom Enterprise tier.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', $q$who-its-for$q$, $q$Who Lightdash is for$q$, 2, ARRAY[$q$Lightdash is built for analytics engineers and data teams already using dbt who want a BI-as-code workflow, plus business users who want AI-assisted, self-serve access to governed metrics.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c32a6cb9-22d2-4149-b6bc-129ecd02b8c3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Evidence ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Evidence is an open source, code-first BI framework that builds interactive data products and reports using SQL and Markdown.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$15/user/month (Team plan)$q$,
  founded_year = 2021,
  company_size = NULL,
  headquarters = $q$Toronto, Canada$q$,
  languages = '{}',
  seo_meta_description = $q$Evidence is an open source BI-as-code framework for building fast, interactive data reports and dashboards using SQL and Markdown.$q$,
  og_description = $q$Evidence is an open source BI-as-code framework for building fast, interactive data reports and dashboards using SQL and Markdown.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5512df11-bacf-4edc-8977-91af599645ef';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5512df11-bacf-4edc-8977-91af599645ef' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$Code-based development$q$, $q$Build reports using SQL and Markdown instead of a drag-and-drop UI.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$Interactive visualizations$q$, $q$Publication-quality, responsive charts and data apps.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$High performance querying$q$, $q$Sub-second query times on millions of records via intelligent caching.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$Broad data source support$q$, $q$Connects to Snowflake, BigQuery, ClickHouse, PostgreSQL, MySQL, and DuckDB, among others.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$Enterprise security$q$, $q$Row-level security, page-level access control, and single sign-on on paid tiers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$AI development tools$q$, $q$AI agent assistance for documentation lookup, schema checking, and error debugging.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$Open source core framework free to self-host$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$Code-first, git-friendly workflow suits engineering-led data teams$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$Backed by Y Combinator, with SOC 2 Type II compliance on the Cloud product$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$Cloud plans include unlimited users and unlimited projects$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$Requires comfort writing SQL and Markdown rather than a drag-and-drop UI$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$Paid Cloud tiers are billed per user, which can add up for larger teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$Advanced features like SSO and white-labeling require the Pro or Enterprise tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$Is Evidence open source?$q$, $q$Yes, Evidence is built on an open source framework with a free, self-hostable core.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$How much does Evidence Cloud cost?$q$, $q$The Team plan starts at $15/user/month, with Pro at $25/user/month and custom Enterprise pricing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$Do I need to know SQL to use Evidence?$q$, $q$Yes, Evidence reports are built using SQL and Markdown rather than a drag-and-drop interface.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$What data sources does Evidence support?$q$, $q$It connects to warehouses and databases including Snowflake, BigQuery, ClickHouse, PostgreSQL, MySQL, and DuckDB.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$Code-based data reports$q$, $q$Data teams build and version-control polished reports and dashboards using SQL and Markdown in a git workflow.$q$, $q$Analytics engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$Embedded, white-labeled reporting$q$, $q$Companies embed branded, interactive reports for customers using the Enterprise tier's white-labeling.$q$, $q$Product and data teams building customer-facing reports$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$Team$q$, $q$$15/user/month$q$, $q$monthly$q$, $q$["Unlimited users and projects","Row-level security","Page-level access control","Log in with Google","1,000 AI credits/user/month"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$Pro$q$, $q$$25/user/month$q$, $q$monthly$q$, $q$["Everything in Team","Single sign-on (SSO)","Directory sync (SCIM)","Private Slack support","3,000 AI credits/user/month"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Everything in Pro","White labeling","Embedded reports","Multi-region support","Dedicated support","Custom AI credit volume"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$overview$q$, $q$What is Evidence?$q$, 2, ARRAY[$q$Evidence is an open source, code-first business intelligence framework for building interactive, publication-quality data reports and dashboards using only SQL and Markdown.$q$, $q$Founded in 2021 in Toronto and backed by Y Combinator, Evidence offers a free open source core plus paid Cloud tiers (Team, Pro, Enterprise) billed per user, with unlimited users and projects on every Cloud plan.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', $q$who-its-for$q$, $q$Who Evidence is for$q$, 2, ARRAY[$q$Evidence is for analytics engineers and data teams who prefer a code-first, version-controlled workflow over drag-and-drop BI tools, including teams that need to embed white-labeled reports for customers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5512df11-bacf-4edc-8977-91af599645ef', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Cube ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cube is an open source semantic layer and agentic analytics platform for governed BI and embedded, AI-powered analytics.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$40/developer/month (Starter plan)$q$,
  founded_year = 2016,
  company_size = NULL,
  headquarters = $q$San Francisco, CA, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Cube is an open source semantic layer platform offering AI analytics chat, dashboards, and embedded analytics for SaaS products.$q$,
  og_description = $q$Cube is an open source semantic layer platform offering AI analytics chat, dashboards, and embedded analytics for SaaS products.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7ae35df8-1db0-4f11-b030-bac3223a2cbe';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7ae35df8-1db0-4f11-b030-bac3223a2cbe' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Analytics Chat$q$, $q$Natural-language querying grounded in a governed semantic model.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Workbooks and dashboards$q$, $q$Governed analytics surfaces for internal business intelligence.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Embedded analytics$q$, $q$Multi-tenant, AI-powered analytics embedded into customer-facing products.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Core Data APIs$q$, $q$Customizable programmatic access to the semantic data layer.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Ecosystem integrations$q$, $q$Works with Claude, ChatGPT, Slack, and Power BI via a DAX API.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Open source semantic layer$q$, $q$A community-driven core with 18,000+ GitHub stars and 350+ contributors.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Free-forever tier available for hobbyist and small projects$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Large, active open source community (18,000+ GitHub stars, 350+ contributors)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Serves both internal BI and embedded, customer-facing analytics from one semantic layer$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Used in production by large companies such as Walmart, Tesla, and Webflow$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Paid Starter and Premium tiers are priced per developer, which can scale with team size$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Enterprise-grade SLAs, BYOC, and SSO are reserved for the top paid tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Requires modeling effort to build out the semantic layer before value is realized$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Is Cube free?$q$, $q$Yes, Cube offers a free-forever tier for small projects, plus paid Starter, Premium, and Enterprise tiers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$How much does Cube cost?$q$, $q$The Starter plan is $40 per developer/month and Premium is $80 per developer/month; Enterprise is custom-priced.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Is Cube open source?$q$, $q$Yes, Cube maintains an open source repository with 18,000+ GitHub stars and 350+ contributors.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Can Cube power embedded analytics for a SaaS product?$q$, $q$Yes, the Premium and Enterprise tiers support multi-tenant embedded dashboards and analytics chat for customers.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Governed internal BI$q$, $q$Data teams build a single semantic layer so dashboards, chat, and APIs all return consistent metrics.$q$, $q$Data and analytics engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Embedded customer-facing analytics$q$, $q$SaaS companies embed multi-tenant dashboards and AI analytics chat directly into their own products.$q$, $q$SaaS product teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Free$q$, $q$Free$q$, NULL, $q$["Connect any data source","Semantic layer IDE","Data exploration in workbooks","Publish dashboards","Analytics chat"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Starter$q$, $q$$40/developer/month$q$, $q$monthly$q$, $q$["Everything in Free","Extended agent limits","Premium LLMs","Unlimited workbooks","Cube Store caching","Semantic Layer Sync"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Premium$q$, $q$$80/developer/month$q$, $q$monthly$q$, $q$["Everything in Starter","Explorer and Viewer roles","Embedded dashboards","Embedded analytics chat","Unlimited queries","99.950% uptime SLA"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Everything in Premium","99.990% uptime SLA","Single-tenant installation","Bring Your Own Cloud (BYOC)","Bring Your Own LLM","SSO with SAML 2.0","DAX API for Power BI"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$overview$q$, $q$What is Cube?$q$, 2, ARRAY[$q$Cube is an agentic analytics platform built on an open source semantic layer, providing consistent, governed answers across internal dashboards, analytics chat, and embedded customer-facing analytics.$q$, $q$Founded in 2016 and based in San Francisco, Cube offers a free-forever tier plus paid Starter, Premium, and custom Enterprise plans priced per developer.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', $q$who-its-for$q$, $q$Who Cube is for$q$, 2, ARRAY[$q$Cube is for data and analytics engineering teams that need a governed semantic layer for internal BI, and for SaaS product teams that need to embed multi-tenant analytics or AI chat directly into their applications.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ae35df8-1db0-4f11-b030-bac3223a2cbe', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── SQLMesh ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SQLMesh is an open source SQL/Python data transformation framework from Tobiko Data, with dbt-compatible pipelines and virtual environments.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2022,
  company_size = NULL,
  headquarters = $q$San Mateo, CA, USA$q$,
  languages = '{}',
  seo_meta_description = $q$SQLMesh is an open source data transformation framework with virtual environments, unit testing, and dbt-compatible pipelines.$q$,
  og_description = $q$SQLMesh is an open source data transformation framework with virtual environments, unit testing, and dbt-compatible pipelines.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5c5bacf6-63dd-435b-b336-2b016854189b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5c5bacf6-63dd-435b-b336-2b016854189b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Virtual Data Environments$q$, $q$Isolated development environments without extra data warehouse costs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Plan/Apply workflow$q$, $q$A Terraform-style workflow to preview the impact of changes before deploying.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Automated testing and audits$q$, $q$Automatic unit test generation and built-in data audits.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Column-level lineage$q$, $q$Lineage tracking and pre-execution error detection.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Multi-dialect SQL support$q$, $q$Transpiles across 10+ SQL dialects using the SQLGlot library.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$dbt compatibility$q$, $q$Designed to be backward compatible with existing dbt projects.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Core framework is free and open source under the Apache License 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Virtual environments reduce warehouse costs during development$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Built-in testing, auditing, and lineage reduce the need for extra tooling$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$dbt-compatible, easing migration for existing dbt users$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Tobiko Cloud pricing isn't public and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Newer project than dbt, so its community and ecosystem are smaller$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Tobiko Data was acquired by Fivetran in September 2025, which may affect its roadmap$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Is SQLMesh free?$q$, $q$Yes, the core SQLMesh framework is open source and free under the Apache License 2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$What is Tobiko Cloud?$q$, $q$It's the paid commercial platform built on SQLMesh, adding collaboration, observability, and cost tracking, priced via a platform fee plus consumption.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Is SQLMesh compatible with dbt?$q$, $q$Yes, SQLMesh is designed to be backward compatible with existing dbt projects.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Who built SQLMesh?$q$, $q$SQLMesh was created by Tobiko Data, which was acquired by Fivetran in September 2025.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Cost-efficient dbt alternative$q$, $q$Data teams migrate from or run alongside dbt while cutting warehouse costs using virtual development environments.$q$, $q$Data engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Safer pipeline changes$q$, $q$Teams use the Plan/Apply workflow to preview downstream impact before deploying SQL or Python transformation changes.$q$, $q$Analytics engineers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$SQLMesh (Open Source)$q$, $q$Free$q$, NULL, $q$["Virtual Data Environments","Plan/Apply workflow","Unit testing and audits","Column-level lineage","10+ SQL dialect support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Tobiko Cloud$q$, $q$Custom (platform fee + consumption)$q$, NULL, $q$["Everything in SQLMesh","Collaboration","Observability","Cost tracking","No seat or project limits"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$overview$q$, $q$What is SQLMesh?$q$, 2, ARRAY[$q$SQLMesh is an open source data transformation framework for running and deploying SQL and Python pipelines, with virtual development environments, automated testing, and column-level lineage.$q$, $q$Created by Tobiko Data (founded 2022, San Mateo, CA; acquired by Fivetran in September 2025), SQLMesh is free and open source under the Apache License 2.0, with a paid Tobiko Cloud platform for teams needing collaboration and observability.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$who-its-for$q$, $q$Who SQLMesh is for$q$, 2, ARRAY[$q$SQLMesh is for data engineering and analytics engineering teams looking for a dbt-compatible transformation framework with lower warehouse costs and safer, previewable deployments.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Dataform ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Google Cloud service for developing, testing, version-controlling, and scheduling SQL-based data transformation workflows in BigQuery.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Dataform is Google Cloud's service for building, testing, and scheduling SQL/SQLX data transformation pipelines directly in BigQuery.$q$,
  og_description = $q$Dataform is Google Cloud's service for building, testing, and scheduling SQL/SQLX data transformation pipelines directly in BigQuery.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6e6b8492-4c4d-4131-97c2-330cb025a664';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6e6b8492-4c4d-4131-97c2-330cb025a664' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$SQLX transformations$q$, $q$Write BigQuery data transformations in SQLX, an extension of SQL with built-in dependency management, or use plain SQL.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$Git-native version control$q$, $q$Connects to GitHub, GitLab, Azure DevOps, or Bitbucket so workflow code is versioned and reviewed like software.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$Data quality assertions$q$, $q$Define assertions that automatically test transformed tables for correctness as part of a workflow run.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$Dependency graph visualization$q$, $q$An interactive graph shows how tables and transformation steps depend on each other, making pipelines easier to debug.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$Reusable JavaScript logic$q$, $q$JavaScript blocks let teams encapsulate reusable functions and generate SQL dynamically across pipelines.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$Inline documentation$q$, $q$Tables and columns can be documented directly in code, keeping documentation next to the transformation logic.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$Runs natively inside BigQuery with no separate infrastructure to provision or manage$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$Git-based version control and code review are built in$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$Data quality assertions catch broken transformations automatically$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$Dependency graph visualization simplifies understanding complex pipelines$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$Works only with BigQuery; not usable with other data warehouses$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$Runs on a plain V8 JavaScript runtime, so Node.js modules and dependencies are not supported$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$No separate Dataform pricing plan; costs are driven entirely by underlying BigQuery query usage$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$Is Dataform free to use?$q$, $q$Dataform itself has no separate license fee. You pay standard Google Cloud BigQuery costs for the queries and storage it uses.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$What language does Dataform use?$q$, $q$Dataform uses SQLX, an extension of standard SQL with dependency management, along with JavaScript for reusable logic.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$Does Dataform support version control?$q$, $q$Yes, Dataform integrates with GitHub, GitLab, Azure DevOps, and Bitbucket for Git-based version control.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$Can Dataform be used with warehouses other than BigQuery?$q$, $q$No, Dataform in Google Cloud is built specifically to run transformations inside BigQuery.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$Analytics engineering pipelines$q$, $q$Build and schedule SQL-based ELT pipelines that transform raw BigQuery data into refined, tested tables.$q$, $q$Data analysts and analytics engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$Data quality validation$q$, $q$Use assertions to automatically catch data quality issues in reporting and analytics tables.$q$, $q$Data teams responsible for reporting accuracy$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$Collaborative pipeline development$q$, $q$Manage transformation logic as version-controlled code with review workflows across a data team.$q$, $q$Data engineering teams working in BigQuery$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$overview$q$, $q$What is Dataform?$q$, 2, ARRAY[$q$Dataform is a Google Cloud service that helps data analysts and engineers develop, test, version-control, and schedule complex SQL-based data transformation workflows inside BigQuery. It manages the transform stage of an ELT pipeline, turning raw loaded data into refined, tested tables.$q$, $q$Workflows are written in SQLX, an extension of SQL with dependency management, or plain SQL, with JavaScript available for reusable logic. Dataform integrates with Git providers for version control and includes built-in data quality assertions and dependency graph visualization.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', $q$who-its-for$q$, $q$Who Dataform is for$q$, 2, ARRAY[$q$Dataform is built for data analysts, analytics engineers, and data engineering teams who already use BigQuery and want to manage transformation logic with software engineering practices such as version control, testing, and code review, without standing up separate transformation infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6e6b8492-4c4d-4131-97c2-330cb025a664', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Rundeck ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source orchestration platform for automating operational tasks, runbooks, and self-service workflows, with a paid Enterprise edition from PagerDuty.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$San Francisco, California, US$q$,
  languages = '{}',
  seo_meta_description = $q$Rundeck is an open-source orchestration platform for automating IT operations and self-service runbooks, with a paid Enterprise edition from PagerDuty.$q$,
  og_description = $q$Rundeck is an open-source orchestration platform for automating IT operations and self-service runbooks, with a paid Enterprise edition from PagerDuty.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$Job scheduling and orchestration$q$, $q$Define, schedule, and run operational workflows and runbooks across existing infrastructure and automation tools.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$Self-service automation$q$, $q$Lets non-admin users trigger pre-approved jobs and workflows without needing direct system access.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$Integrations with existing automation$q$, $q$Connects with Ansible, containers, cloud providers, databases, and storage systems rather than replacing them.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$Encrypted key storage$q$, $q$Stores passwords and keys with encryption for secure job execution.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$Community plugin ecosystem$q$, $q$Extends functionality through community-built and certified plugins for tools like PagerDuty, ServiceNow, Datadog, and AWS SNS.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$Enterprise Runners$q$, $q$The commercial edition adds Enterprise Runners for executing jobs across multiple isolated environments.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$Free, open-source Community Edition licensed under Apache 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$Broad plugin ecosystem for integrating with existing automation tooling$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$Enables self-service automation, reducing manual operational overhead$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$Backed by PagerDuty with an optional commercial Enterprise tier and managed cloud option$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$Community Edition requires self-hosting and self-managed updates/patches$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$High availability clustering, SSO, and certified enterprise plugins require the paid Enterprise tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$Enterprise pricing is not publicly listed and requires contacting sales$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$Is Rundeck free?$q$, $q$Yes, the Community Edition is free and open source under the Apache 2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$Who owns Rundeck?$q$, $q$Rundeck is owned by PagerDuty, which offers a commercial Enterprise edition and managed cloud option alongside the open-source Community Edition.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$What does the Enterprise edition add?$q$, $q$High availability clustering, single sign-on, certified enterprise plugins, load-balanced job queuing, and dedicated support.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$Can Rundeck run as a managed cloud service?$q$, $q$Yes, PagerDuty offers a managed cloud edition with an SLA, handling patching, monitoring, and compliance.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$IT operations automation$q$, $q$Automate routine operational tasks like provisioning, patching, deployments, and configuration changes.$q$, $q$DevOps and IT operations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$Self-service runbook execution$q$, $q$Give teams controlled, self-service access to run pre-approved operational jobs without full system access.$q$, $q$Platform engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$Incident remediation workflows$q$, $q$Trigger automated remediation jobs tied into incident response processes.$q$, $q$Site reliability engineering (SRE) teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$Community$q$, $q$Free$q$, NULL, $q$["Apache 2.0 open-source license","Job scheduling and workflow orchestration","Community plugins","Self-hosted deployment"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$Enterprise$q$, $q$Custom quote$q$, NULL, $q$["High availability clustering","Single sign-on","Certified enterprise plugins","Priority support"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$overview$q$, $q$What is Rundeck?$q$, 2, ARRAY[$q$Rundeck is an orchestration platform for automating operational tasks and workflows, described by its maker as "the orchestration tool for all of your existing automation." It layers scheduling, self-service access, and workflow control on top of existing automation tools rather than replacing them.$q$, $q$Rundeck is available as a free, open-source Community Edition under the Apache 2.0 license, and as a commercial Enterprise edition and managed cloud offering from its owner, PagerDuty, which adds high availability, SSO, and certified integrations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', $q$who-its-for$q$, $q$Who Rundeck is for$q$, 2, ARRAY[$q$Rundeck fits DevOps, IT operations, and platform engineering teams that want to standardize and delegate operational tasks such as provisioning, deployments, and configuration changes, and organizations that want self-hosted control with the option to add PagerDuty's commercial support and managed cloud offering.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0fb3e39-f5c6-463d-becd-ea6bca2dd8bd', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── MLflow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source platform for tracking, evaluating, and deploying machine learning models and AI agent/LLM applications, backed by the Linux Foundation.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$MLflow is a free, open-source platform for tracking, evaluating, and deploying ML models and AI agent/LLM applications, backed by the Linux Foundation.$q$,
  og_description = $q$MLflow is a free, open-source platform for tracking, evaluating, and deploying ML models and AI agent/LLM applications, backed by the Linux Foundation.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '731c611d-030c-488a-b3cb-8255aa73e8ab';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '731c611d-030c-488a-b3cb-8255aa73e8ab' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$Production tracing$q$, $q$Built on OpenTelemetry, MLflow's tracing works with any LLM provider or agent framework to debug production AI applications.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$Evaluation suite$q$, $q$Includes 50+ built-in metrics and LLM-judge based evaluation to assess AI application quality across multiple dimensions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$Prompt management$q$, $q$Versions and tracks prompts with lineage tracking, supporting testing and optimization over time.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$AI Gateway$q$, $q$Provides a unified API interface for managing multiple LLM providers with rate limiting and cost control.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$Agent Server$q$, $q$A FastAPI-based server for hosting and deploying agents to production with built-in tracing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$Broad framework support$q$, $q$Integrates with 100+ ML/AI frameworks and tools, including LangChain, OpenAI, and PyTorch.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$Completely free and open source under the Apache 2.0 license with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$Backed by the Linux Foundation and Databricks, with a large contributor community$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$Supports Python, TypeScript/JavaScript, Java, and R$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$Covers both classic ML experiment tracking and modern LLM/agent observability$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$Self-hosting and operating the tracking server and backend infrastructure is the user's responsibility$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$The open-source project itself has no official managed cloud offering (separate managed versions exist from vendors such as Databricks)$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$Is MLflow free?$q$, $q$Yes, MLflow is fully open source under the Apache 2.0 license with no paid tier from the project itself.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$Who maintains MLflow?$q$, $q$MLflow is backed by the Linux Foundation and Databricks, with contributions from a large open-source community.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$What languages does MLflow support?$q$, $q$MLflow supports Python, TypeScript/JavaScript, Java, and R.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$Can MLflow trace LLM or agent applications?$q$, $q$Yes, MLflow includes production-grade tracing built on OpenTelemetry that works with any LLM provider or agent framework.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$ML experiment tracking$q$, $q$Log, compare, and reproduce machine learning experiments and model versions.$q$, $q$Data scientists and ML engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$LLM and agent observability$q$, $q$Trace, evaluate, and monitor production AI applications built on LLMs and agent frameworks.$q$, $q$AI engineers building production AI applications$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$Prompt management$q$, $q$Version and track prompts with lineage across iterations of an AI application.$q$, $q$Teams building and iterating on LLM-based products$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$overview$q$, $q$What is MLflow?$q$, 2, ARRAY[$q$MLflow is an open-source AI engineering platform for tracking, evaluating, and deploying machine learning models as well as agent and LLM-based applications. It provides tracing built on OpenTelemetry, an evaluation suite with built-in metrics and LLM judges, prompt versioning, an AI Gateway for managing LLM providers, and an Agent Server for production deployment.$q$, $q$The project is entirely free and open source under the Apache 2.0 license, is backed by the Linux Foundation and Databricks, and supports Python, TypeScript/JavaScript, Java, and R, integrating with more than 100 ML and AI frameworks.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', $q$who-its-for$q$, $q$Who MLflow is for$q$, 2, ARRAY[$q$MLflow suits data scientists and ML engineers who need experiment tracking and model management, as well as AI engineers building and operating production agent and LLM applications who need observability, evaluation, and prompt management without vendor lock-in.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('731c611d-030c-488a-b3cb-8255aa73e8ab', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Kubeflow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, Kubernetes-native toolkit of modular projects for building and deploying machine learning pipelines and AI platforms.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Kubeflow is a free, open-source, Kubernetes-native toolkit for building ML pipelines and AI platforms, governed by the CNCF.$q$,
  og_description = $q$Kubeflow is a free, open-source, Kubernetes-native toolkit for building ML pipelines and AI platforms, governed by the CNCF.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '47cd8f03-df02-4827-a41a-94df72cd0222';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '47cd8f03-df02-4827-a41a-94df72cd0222' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$Modular subproject ecosystem$q$, $q$A composable set of Kubernetes-native projects, including Pipelines, Notebooks, Trainer, Katib, and a Central Dashboard, adoptable individually or as a full distribution.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$Kubeflow Pipelines$q$, $q$Orchestrates end-to-end machine learning workflows as reusable, versioned pipelines.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$Katib AutoML$q$, $q$Runs automated hyperparameter tuning and neural architecture search jobs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$Notebooks$q$, $q$Provides managed, Kubernetes-hosted interactive development environments for data scientists.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$Central Dashboard$q$, $q$Gives a unified UI for accessing and managing the various Kubeflow subprojects.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$Multi-framework support$q$, $q$Works with common ML frameworks including PyTorch, JAX, XGBoost, and Hugging Face.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$Fully open source and free, governed as an official Cloud Native Computing Foundation (CNCF) project$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$Deployable on any Kubernetes cluster, avoiding single-cloud lock-in$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$Modular architecture lets teams adopt only the subprojects they need$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$Large contributor community (3,000+ contributors and 33.1K+ GitHub stars per the project site)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$Requires provisioning and operating a Kubernetes cluster$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$Operational complexity can be steep for teams new to Kubernetes$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$No official managed/hosted offering from the Kubeflow project itself$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$Is Kubeflow free?$q$, $q$Yes, Kubeflow is completely open source and free to use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$Does Kubeflow require Kubernetes?$q$, $q$Yes, Kubeflow is designed to run on Kubernetes and can be deployed on any cluster.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$Who governs Kubeflow?$q$, $q$Kubeflow is maintained as an official project of the Cloud Native Computing Foundation (CNCF).$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$What ML frameworks does Kubeflow support?$q$, $q$Kubeflow works with frameworks including PyTorch, JAX, XGBoost, and Hugging Face.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$Building AI platforms on Kubernetes$q$, $q$Compose Kubeflow subprojects into a full AI/ML platform running on existing Kubernetes infrastructure.$q$, $q$Platform and ML engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$Automated hyperparameter tuning$q$, $q$Use Katib to run automated hyperparameter optimization and architecture search jobs.$q$, $q$Data scientists and ML researchers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$Multi-tenant ML pipeline orchestration$q$, $q$Run and manage versioned ML pipelines for multiple teams on shared Kubernetes infrastructure.$q$, $q$Enterprise ML platform teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$overview$q$, $q$What is Kubeflow?$q$, 2, ARRAY[$q$Kubeflow is the foundation of tools for building AI platforms on Kubernetes. It is a composable, modular ecosystem of Kubernetes-native projects, including Pipelines, Notebooks, Trainer, Katib for AutoML, and a Central Dashboard, that teams can adopt individually or deploy together as a full Kubeflow Community Distribution.$q$, $q$It is completely open source and governed as an official Cloud Native Computing Foundation (CNCF) project, with self-hosted deployment on any Kubernetes cluster and support for frameworks such as PyTorch, JAX, XGBoost, and Hugging Face.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', $q$who-its-for$q$, $q$Who Kubeflow is for$q$, 2, ARRAY[$q$Kubeflow is built for data scientists, ML engineers, and platform teams that already run Kubernetes and want a Kubernetes-native way to build, orchestrate, and scale machine learning pipelines and AI platforms without depending on a single cloud vendor.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('47cd8f03-df02-4827-a41a-94df72cd0222', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── DVC ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source Git extension for versioning datasets, ML pipelines, and experiments, now stewarded by lakeFS.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$DVC is a free, open-source Git extension for versioning data, ML pipelines, and experiments, now maintained by lakeFS.$q$,
  og_description = $q$DVC is a free, open-source Git extension for versioning data, ML pipelines, and experiments, now maintained by lakeFS.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1c8e4152-687c-4455-b1b5-b86303960027';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1c8e4152-687c-4455-b1b5-b86303960027' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$Git-based data versioning$q$, $q$Applies a Git-like model to version datasets and models alongside code, without a dedicated server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$Reproducible pipelines$q$, $q$Defines ML pipelines in code so data transformations and training steps can be reproduced reliably.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$Experiment tracking$q$, $q$Tracks and compares machine learning experiment runs within the same Git-based workflow.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$VS Code extension$q$, $q$A marketplace extension brings DVC workflows directly into the VS Code editor.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$Lightweight, serverless design$q$, $q$Works as a Git extension for individual data scientists and small teams without standing up separate infrastructure.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$Continued open-source stewardship$q$, $q$As of the lakeFS acquisition, DVC remains 100% open source with a stated commitment to no paywalled features.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$Familiar Git-like workflow lowers the learning curve for developers already using Git$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$Actively maintained after being acquired by lakeFS in November 2025, with a stated commitment to remain fully open source$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$Editor integration via a VS Code extension$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$Designed for individual and small-team projects rather than large-scale enterprise data infrastructure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$The recent ownership change (acquisition by lakeFS) may raise questions about the long-term product roadmap$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$No separate paid tier for DVC itself; teams needing enterprise scale are directed toward lakeFS$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$Is DVC free?$q$, $q$Yes, DVC is free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$Who maintains DVC now?$q$, $q$lakeFS acquired the DVC open-source project from Iterative in November 2025 and now stewards its continued development, with a stated commitment to keep it 100% open source.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$What is DVC used for?$q$, $q$DVC versions data, ML pipelines, and experiments using a Git-like model, bringing software engineering practices to data science workflows.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$Does DVC require a dedicated server?$q$, $q$No, DVC works as a lightweight Git extension without needing a separate server.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$Reproducible ML experiments$q$, $q$Version datasets and models alongside code to make ML experiments reproducible.$q$, $q$Data scientists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$Small-team ML pipeline management$q$, $q$Manage data and pipeline versioning for smaller data science projects without extra infrastructure.$q$, $q$Individual practitioners and small data science teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$Scaling data versioning$q$, $q$Provides a migration path toward lakeFS for teams that outgrow small-scale data versioning.$q$, $q$Growing ML and data engineering teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$overview$q$, $q$What is DVC?$q$, 2, ARRAY[$q$DVC (Data Version Control) is a free, open-source Git extension that lets teams manage data the way code is managed, applying a Git-like model to version datasets, ML pipelines, and experiments. It is designed to be lightweight, working alongside standard Git repositories without requiring a dedicated server.$q$, $q$In November 2025, DVC was acquired by lakeFS, which now stewards its continued open-source development while positioning its own product for larger-scale, enterprise data versioning needs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', $q$who-its-for$q$, $q$Who DVC is for$q$, 2, ARRAY[$q$DVC fits individual data scientists and small data science or ML teams who want reproducible, Git-based versioning of data and pipelines without operating separate data infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1c8e4152-687c-4455-b1b5-b86303960027', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── ClearML ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI infrastructure platform for GPU cluster management, ML experiment tracking, and GenAI app deployment, with open-source and paid hosted tiers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$15/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$ClearML is an AI infrastructure platform for GPU management, experiment tracking, and GenAI deployment, with a free tier and open-source core.$q$,
  og_description = $q$ClearML is an AI infrastructure platform for GPU management, experiment tracking, and GenAI deployment, with a free tier and open-source core.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f1140885-6be9-4e12-8a14-e60b800377b9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f1140885-6be9-4e12-8a14-e60b800377b9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$Experiment tracking and model repository$q$, $q$Logs experiments, models, and artifacts in a central, searchable repository.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$Dataset versioning$q$, $q$Versions datasets alongside experiments for reproducibility.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$Pipeline and agent orchestration$q$, $q$Orchestrates ML pipelines and job scheduling through ClearML agents.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$Hyperparameter optimization$q$, $q$Automates hyperparameter search, available from the Pro tier upward.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$Cloud auto-scaling$q$, $q$Auto-scales compute across AWS, GCP, and Azure, available from the Pro tier upward.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$GPU infrastructure control plane$q$, $q$Manages GPU clusters with multi-tenancy, role-based access control, and billing at the Enterprise tier.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$Free Community plan with core experiment tracking and model management for up to 3 users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$100% open-source, self-hosted option available on GitHub$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$Cloud-agnostic, supporting AWS, GCP, Azure, on-premises, and air-gapped deployments$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$Enterprise tier supports Slurm/PBS integration, LDAP, and air-gapped environments$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$Free Community plan is capped at 3 users with limited storage (100GB) and API calls (1M/month)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$Advanced features such as hyperparameter optimization and cloud auto-scaling require the paid Pro tier or higher$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$Scale and Enterprise tier pricing is custom quote-only and not publicly listed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$Is ClearML free?$q$, $q$Yes, ClearML offers a free Community plan for up to 3 users, plus a fully open-source self-hosted version on GitHub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$How much does the ClearML Pro plan cost?$q$, $q$The Pro plan starts at $15 per user per month plus usage costs, for up to 10 users.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$Does ClearML support on-premises deployment?$q$, $q$Yes, the Scale and Enterprise tiers support VPC and on-premises deployment, including air-gapped environments.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$What's included in the ClearML free tier?$q$, $q$The Community plan includes 100GB of artifact storage, 1GB of metric events, and 1M API calls per month.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$ML experiment tracking$q$, $q$Track experiments, models, and artifacts in a central repository.$q$, $q$Data scientists and ML engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$GPU cluster orchestration$q$, $q$Manage and allocate GPU infrastructure across teams with multi-tenancy and RBAC.$q$, $q$MLOps and infrastructure teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$GenAI application deployment$q$, $q$Deploy and monitor LLM-based applications with access controls and vector database support.$q$, $q$Enterprise AI teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$Community$q$, $q$$0$q$, $q$monthly$q$, $q$["Up to 3 users","100GB artifact storage","1GB metric events","1M API calls/month","Dataset versioning","Experiment management"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$Pro$q$, $q$$15/user/month + usage$q$, $q$monthly$q$, $q$["Up to 10 users","120GB artifact storage","Cloud auto-scaling (AWS, GCP, Azure)","Hyperparameter optimization","Pipeline triggers"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$Scale$q$, $q$Custom quote$q$, NULL, $q$["VPC deployment","8-48 GPUs","SSO","Fractional GPUs","Multi-cluster support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$Enterprise$q$, $q$Custom quote$q$, NULL, $q$["VPC or on-premises (including air-gapped)","Slurm/PBS integration","LDAP","Role-based access control","White-glove support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$overview$q$, $q$What is ClearML?$q$, 2, ARRAY[$q$ClearML is an AI infrastructure platform that manages GPU resources, ML model development, and GenAI application deployment across on-premises, cloud, and hybrid environments. It combines an infrastructure control plane for GPU clusters, an AI development center for experiment tracking and CI/CD, and a GenAI app engine for LLM deployment.$q$, $q$ClearML offers a free Community plan and a fully open-source self-hosted version on GitHub, alongside paid Pro, Scale, and Enterprise tiers that add auto-scaling, hyperparameter optimization, and on-premises/air-gapped deployment options.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', $q$who-its-for$q$, $q$Who ClearML is for$q$, 2, ARRAY[$q$ClearML suits data scientists and ML engineers who need experiment tracking, as well as MLOps and infrastructure teams managing GPU clusters, and enterprise AI teams deploying GenAI applications that require access controls and on-premises or air-gapped deployment options.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1140885-6be9-4e12-8a14-e60b800377b9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Feast ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source feature store that serves consistent structured data for ML training and real-time inference, including vector search for RAG.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Feast is a free, open-source feature store that serves structured data for ML training, real-time inference, and RAG vector search.$q$,
  og_description = $q$Feast is a free, open-source feature store that serves structured data for ML training, real-time inference, and RAG vector search.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f7aac8e5-93a6-4551-b76b-53dae46d786f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f7aac8e5-93a6-4551-b76b-53dae46d786f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$Real-time and batch feature serving$q$, $q$Serves the same feature definitions consistently for both model training and low-latency inference.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$Offline store integrations$q$, $q$Connects to offline stores including Snowflake, BigQuery, Redshift, PostgreSQL, Spark, and DuckDB.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$Online store integrations$q$, $q$Connects to online stores including Redis, DynamoDB, Cassandra, MySQL, and PostgreSQL.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$Vector similarity search$q$, $q$Supports vector databases such as Milvus and Qdrant for retrieval-augmented generation (RAG) use cases.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$Consistent feature definitions$q$, $q$Ensures the same feature logic is used across training and serving to avoid training/serving skew.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$Linux Foundation governance$q$, $q$Project governance and development is overseen by the Linux Foundation AI & Data.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$Fully free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$Broad ecosystem of offline and online store integrations$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$Used in production by large companies including Robinhood, NVIDIA, Discord, Walmart, Shopify, and Salesforce per the project site$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$Supports both classic ML feature serving and vector search for RAG$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$Requires self-hosting and integrating with existing data infrastructure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$No official managed/hosted service from the Feast project itself$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$Operational complexity of running and connecting multiple online/offline store backends$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$Is Feast free?$q$, $q$Yes, Feast is fully open source with no licensing cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$Who governs the Feast project?$q$, $q$The Linux Foundation AI & Data oversees Feast's project governance and development.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$What is Feast used for?$q$, $q$Feast serves ML features consistently for both training and real-time inference, and supports vector search for RAG applications.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$What online stores does Feast support?$q$, $q$Feast supports online stores including Redis, DynamoDB, Cassandra, MySQL, PostgreSQL, and vector databases like Milvus and Qdrant.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$Real-time recommendations$q$, $q$Serve user interaction features consistently for recommendation models in production.$q$, $q$ML engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$Fraud detection and risk scoring$q$, $q$Serve historical and behavioral features for fraud detection and financial risk models.$q$, $q$Data science teams in fintech/risk$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$RAG feature and vector retrieval$q$, $q$Use vector similarity search to retrieve context for retrieval-augmented generation applications.$q$, $q$AI engineers building LLM applications$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$overview$q$, $q$What is Feast?$q$, 2, ARRAY[$q$Feast is an open-source feature store that delivers structured data to AI and LLM applications at scale during both training and inference. It connects to a wide range of offline stores (Snowflake, BigQuery, Redshift, PostgreSQL, Spark, DuckDB) and online stores (Redis, DynamoDB, Cassandra, MySQL, PostgreSQL), and supports vector databases such as Milvus and Qdrant for RAG use cases.$q$, $q$The project is fully free and open source, governed by the Linux Foundation AI & Data, and is used in production by companies including Robinhood, NVIDIA, Discord, Walmart, Shopify, and Salesforce according to the project site.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', $q$who-its-for$q$, $q$Who Feast is for$q$, 2, ARRAY[$q$Feast is built for ML engineering and data science teams that need consistent feature definitions across training and real-time inference, including teams building fraud detection, recommendation, or RAG-based LLM applications.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f7aac8e5-93a6-4551-b76b-53dae46d786f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── BentoML ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source Python framework for packaging and serving ML/AI models in production, with an optional usage-based managed cloud, Bento Cloud.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$BentoML is a free, open-source framework for serving ML/AI models, with an optional usage-based managed cloud platform, Bento Cloud.$q$,
  og_description = $q$BentoML is a free, open-source framework for serving ML/AI models, with an optional usage-based managed cloud platform, Bento Cloud.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9a4996b9-281e-4443-a143-16669b9aebee';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9a4996b9-281e-4443-a143-16669b9aebee' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Open model catalog$q$, $q$Includes pre-optimized models such as Llama, DeepSeek, Flux, and Qwen ready for deployment.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Custom model serving$q$, $q$Serves custom models across frameworks including vLLM, PyTorch, JAX, and Transformers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Auto-scaling with scale-to-zero$q$, $q$Supports cold-start acceleration and scale-to-zero to control compute costs on Bento Cloud.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Multi-region deployment$q$, $q$Deploys and scales inference workloads across multiple regions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$LLM Gateway$q$, $q$Provides a unified interface for routing requests to multiple LLM providers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Flexible deployment options$q$, $q$Deployable self-hosted, bring-your-own-cloud (AWS, GCP, Azure), on-premises, or via the managed Bento Cloud.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Free, community-driven open-source core framework$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Supports multiple serving patterns: real-time, asynchronous, batch, and multi-step workflows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Bento Cloud's Starter tier uses usage-based pricing with no fixed monthly commitment$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Flexible deployment: self-hosted, bring-your-own-cloud, or fully managed$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Bento Cloud pricing for Scale and Enterprise tiers is custom/invoice-based and not fully public$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Managed cloud GPU usage costs can add up for sustained workloads$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$24/7 support and priority SLAs require the paid Enterprise tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Is BentoML free?$q$, $q$Yes, the open-source BentoML framework is free to use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$What is Bento Cloud?$q$, $q$Bento Cloud is BentoML's managed inference platform, billed on a usage basis with a free signup credit.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Does BentoML support GPUs?$q$, $q$Yes, Bento Cloud offers GPUs including NVIDIA T4, L4, A100, H100, and B200, and AMD GPUs like MI300X on higher tiers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Can BentoML be self-hosted?$q$, $q$Yes, it can be deployed self-hosted, via bring-your-own-cloud, or on-premises, in addition to the managed Bento Cloud.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Deploying models to production$q$, $q$Package and deploy custom or open-source models as production inference APIs.$q$, $q$ML engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Serving LLMs at scale$q$, $q$Auto-scale LLM inference workloads with cold-start acceleration and scale-to-zero.$q$, $q$AI infrastructure teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Multi-model inference pipelines$q$, $q$Build complex, multi-step inference workflows combining several models.$q$, $q$Applied AI teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Starter$q$, $q$Usage-based (pay-as-you-go)$q$, $q$monthly$q$, $q$["Email support","Community Slack access","$10 signup credit"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Scale$q$, $q$Custom$q$, NULL, $q$["Dedicated Slack channel","Faster response times"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["24/7 support","Zoom office hours","Priority SLAs","Dedicated engineering resources"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$overview$q$, $q$What is BentoML?$q$, 2, ARRAY[$q$BentoML is an inference platform for deploying ML and AI models in production, offering both an open-source Python framework and a commercial managed platform called Bento Cloud. It includes a catalog of pre-optimized models (Llama, DeepSeek, Flux, Qwen) and supports custom model serving across frameworks like vLLM, PyTorch, JAX, and Transformers.$q$, $q$The open-source core is free and community-driven, while Bento Cloud offers usage-based pricing on its Starter tier and custom invoicing on Scale and Enterprise tiers, with deployment options spanning self-hosted, bring-your-own-cloud, on-premises, and fully managed cloud.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', $q$who-its-for$q$, $q$Who BentoML is for$q$, 2, ARRAY[$q$BentoML is aimed at ML engineers and AI infrastructure teams who need to deploy custom or open-source models to production, whether serving real-time requests, asynchronous jobs, batch inference, or multi-model pipelines.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a4996b9-281e-4443-a143-16669b9aebee', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Weights & Biases ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI developer platform for ML experiment tracking, LLM/agent evaluation and tracing, fine-tuning, and a model registry, now owned by CoreWeave.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$60/month$q$,
  founded_year = 2017,
  company_size = NULL,
  headquarters = $q$San Francisco, California, US$q$,
  languages = '{}',
  seo_meta_description = $q$Weights & Biases is an AI developer platform for experiment tracking, LLM/agent evaluation, fine-tuning, and a model registry, with a free plan.$q$,
  og_description = $q$Weights & Biases is an AI developer platform for experiment tracking, LLM/agent evaluation, fine-tuning, and a model registry, with a free plan.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7c66ab08-e955-4517-83cb-ca812af3c38d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7c66ab08-e955-4517-83cb-ca812af3c38d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Experiment tracking (Models)$q$, $q$Tracks ML experiments with hyperparameter sweeps, data visualization via Tables, and report generation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Agentic AI tracing and evaluation (Weave)$q$, $q$Provides traces, evaluations, playgrounds, and production monitors for building agentic AI applications.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Fine-tuning and RL (Training)$q$, $q$Offers serverless reinforcement learning and supervised fine-tuning for LLMs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Hosted inference (Inference)$q$, $q$Provides hosted access to open-source and commercial models such as Llama, Qwen, DeepSeek, and Phi.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Model/prompt registry (Registry)$q$, $q$Centralizes publishing and sharing of models, datasets, and prompts across teams.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Automations and alerting$q$, $q$Supports automations, Slack and email alerts, and coding-agent skills.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Free plan available with 5 model seats and 5GB/month of storage$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Free Academic License for qualified researchers, including 200GB storage and up to 100 seats$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Used by large enterprise AI teams including Microsoft, Meta, NVIDIA, Toyota, and Canva per the site$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Covers the full AI lifecycle: experiment tracking, evaluation, fine-tuning, inference, and a model registry$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Free plan's storage (5GB/month) and seats (5) are limited for larger teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Enterprise plan pricing is custom/quote-based and not publicly listed$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Now owned by CoreWeave (acquired March 2025), which could affect long-term product direction$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Is Weights & Biases free?$q$, $q$Yes, a Free plan is available with up to 5 model seats and 5GB/month of storage.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$How much does the Pro plan cost?$q$, $q$The Pro plan starts at $60 per month, billed monthly, for teams under 50 employees.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Who owns Weights & Biases?$q$, $q$Weights & Biases was acquired by CoreWeave in March 2025.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$When was Weights & Biases founded?$q$, $q$Weights & Biases was founded in 2017.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Is there a free option for academic researchers?$q$, $q$Yes, qualified researchers can get an Academic License with Pro features, 200GB of storage, and up to 100 seats at no cost.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$ML experiment tracking$q$, $q$Track, visualize, and compare machine learning experiments and hyperparameter sweeps.$q$, $q$Data scientists and ML researchers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$LLM and agent evaluation$q$, $q$Trace, evaluate, and monitor agentic AI applications in development and production.$q$, $q$AI application teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Fine-tuning and RL training$q$, $q$Run serverless supervised fine-tuning and reinforcement learning for LLMs.$q$, $q$AI engineers training custom models$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Up to 5 model seats","5 GB/month storage","1 GB/month Weave data ingestion","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Pro$q$, $q$$60/month$q$, $q$monthly$q$, $q$["Unlimited teams for collaboration","Team-based access controls","Service accounts","Priority email & chat support","Up to 10 model seats","100 GB/month storage"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Single tenant option with choice of region","HIPAA compliance option","Single sign-on","Custom roles and audit logs","Dedicated support package"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$Academic License$q$, $q$Free$q$, NULL, $q$["Pro features included","200GB cloud storage","Up to 100 seats"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$overview$q$, $q$What is Weights & Biases?$q$, 2, ARRAY[$q$Weights & Biases is an AI developer platform for building AI agents, applications, and models. It combines experiment tracking and visualization (Models), agentic AI tracing and evaluation (Weave), serverless fine-tuning and reinforcement learning (Training), hosted model inference, and a registry for publishing models, datasets, and prompts.$q$, $q$Founded in 2017 and headquartered in San Francisco, California, Weights & Biases was acquired by CoreWeave in March 2025. It offers a free plan, a Pro plan starting at $60/month, a custom-priced Enterprise plan, and a free Academic License for qualified researchers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', $q$who-its-for$q$, $q$Who Weights & Biases is for$q$, 2, ARRAY[$q$Weights & Biases serves data scientists and ML researchers tracking experiments, AI application teams evaluating and monitoring agents built on LLMs, and AI engineers fine-tuning models, ranging from individual and academic users on the free tiers to large enterprise AI teams.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c66ab08-e955-4517-83cb-ca812af3c38d', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Comet ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$MLOps platform for experiment tracking, model registry, and LLM observability, including the open-source Opik evaluation toolkit.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$19/month$q$,
  founded_year = 2017,
  company_size = NULL,
  headquarters = $q$New York, NY, United States$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Comet offers ML experiment tracking, model registry, and LLM observability via Opik, with free, Pro, and Enterprise plans for teams of any size.$q$,
  og_description = $q$Comet offers ML experiment tracking, model registry, and LLM observability via Opik, with free, Pro, and Enterprise plans for teams of any size.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd1e51b23-11d5-4a32-91ce-ccf878a2484a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd1e51b23-11d5-4a32-91ce-ccf878a2484a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Experiment Tracking$q$, $q$Log, compare, and visualize machine learning experiments with custom visualizations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Model Registry & Versioning$q$, $q$Version and manage models with a central registry as they move from experimentation to production.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Opik LLM Observability$q$, $q$Trace and debug complex GenAI systems and LLM applications with Comet's open-source Opik product.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$LLM-as-a-Judge Evaluation$q$, $q$30+ built-in evaluation metrics for automated LLM output quality checks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Test Suites$q$, $q$Pass/fail testing workflows for validating AI agent behavior before release.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Ollie Coding Agent$q$, $q$A built-in coding agent that analyzes traces and writes fixes directly to codebases.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Dataset Management$q$, $q$ML Artifacts for managing and versioning datasets across experiments.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Production Monitoring$q$, $q$Monitor deployed models and LLM applications for performance in production.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Generous free tier for both the MLOps platform and Opik LLM observability, no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Open-source Opik version available on GitHub for self-hosting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Broad framework integrations spanning classic ML (PyTorch, TensorFlow, Scikit-learn) and LLM tooling (LangChain, LlamaIndex, OpenAI)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Enterprise plan offers SOC 2, ISO 27001, HIPAA, and GDPR compliance with flexible deployment$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Used by large organizations including Uber, Netflix, and Autodesk, per Comet's website$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Two separate pricing structures (Opik vs. the core MLOps platform) can make cost planning less straightforward$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Free plan usage caps (e.g., 25k spans/month for Opik, 100GB storage for MLOps) may limit larger teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Enterprise pricing is custom/quote-only and not published$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Some capabilities are gated behind Pro or Enterprise tiers$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Does Comet offer a free plan?$q$, $q$Yes. Both the Opik LLM observability product and the core MLOps platform have free tiers that don't require a credit card, though usage is capped, for example at 25k spans/month for Opik's Free Cloud plan.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Can I self-host Comet?$q$, $q$Opik is available as open source on GitHub for self-hosting, and Comet also offers enterprise custom deployment options.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$What is Opik?$q$, $q$Opik is Comet's open-source AI observability and evaluation product for tracing, testing, and debugging LLM applications and AI agents.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$What frameworks does Comet integrate with?$q$, $q$Comet integrates with frameworks including PyTorch, TensorFlow, Scikit-learn, Hugging Face, LangChain, LlamaIndex, and OpenAI.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$How much does Comet's paid plan cost?$q$, $q$The Pro tier starts at $19/month for Opik Cloud or $19/user/month for the MLOps platform; Enterprise pricing is custom.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$LLM application debugging$q$, $q$Teams building GenAI agents use Opik to trace, evaluate, and fix issues in production LLM calls.$q$, $q$AI/ML engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$ML experiment tracking$q$, $q$Data science teams log and compare model training runs, hyperparameters, and metrics.$q$, $q$Data scientists and ML researchers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Model governance and registry$q$, $q$Organizations version and track models as they move from experimentation to production.$q$, $q$MLOps and platform teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$AI agent testing$q$, $q$Teams use Test Suites and LLM-as-a-judge metrics to validate agent behavior before release.$q$, $q$QA and AI product teams$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Opik Open Source$q$, $q$$0$q$, NULL, $q$["Full AI observability & agent testing feature set","Agent tracing","Test suites","Agent playground"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Opik Free Cloud$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Up to 10 team members","25k spans/month","60-day data retention","Ollie coding agent trial"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Opik Pro Cloud$q$, $q$$19/month$q$, $q$monthly$q$, $q$["Up to 50 team members","100k spans/month","60-day data retention","Customizable span limits and retention periods"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$Opik Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited team members","Flexible deployments","SSO, SOC 2, ISO 27001, HIPAA, GDPR compliance","Dedicated support"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$MLOps Free$q$, $q$$0$q$, NULL, $q$["1 user","100GB storage","Experiment tracking, dataset management, model registry"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$MLOps Pro$q$, $q$$19/user/month$q$, $q$monthly$q$, $q$["Up to 10 users","1,500 training hours included","500GB storage","Email support"]$q$::jsonb, 5);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$MLOps Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited usage","Model production monitoring","SSO","Dedicated support"]$q$::jsonb, 6);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$overview$q$, $q$What is Comet?$q$, 2, ARRAY[$q$Comet is an end-to-end MLOps and AI evaluation platform that helps teams track machine learning experiments, manage model versions, and observe LLM-based applications. Founded in 2017 and headquartered in New York, NY, Comet combines a traditional experiment tracking and model registry product with Opik, its open-source LLM observability and evaluation tool.$q$, $q$Opik provides tracing, LLM-as-a-judge evaluation metrics, test suites, and a built-in coding agent (Ollie) that analyzes traces and proposes code fixes. The MLOps side of the platform focuses on experiment tracking, dataset management via ML Artifacts, and model production monitoring.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', $q$who-its-for$q$, $q$Who Comet is for$q$, 2, ARRAY[$q$Comet is aimed at data science and ML engineering teams that need experiment tracking and model governance, as well as AI teams building and debugging LLM applications and agents with Opik. Both products offer free tiers, with paid Pro and custom Enterprise plans for larger teams needing higher usage limits, compliance certifications, and dedicated support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1e51b23-11d5-4a32-91ce-ccf878a2484a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Evidently ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source (Apache 2.0) framework for evaluating, testing, and monitoring LLMs, RAG apps, AI agents, and ML models.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2020,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Evidently AI is an open-source (Apache 2.0) library and platform for evaluating, testing, and monitoring LLMs, RAG systems, AI agents, and ML models.$q$,
  og_description = $q$Evidently AI is an open-source (Apache 2.0) library and platform for evaluating, testing, and monitoring LLMs, RAG systems, AI agents, and ML models.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '77429280-36af-46ef-b496-25b4c65c2176';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '77429280-36af-46ef-b496-25b4c65c2176' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$Automated Evaluation$q$, $q$Measure output quality, safety, and reliability with shareable visual reports.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$100+ Built-in Metrics$q$, $q$Pre-built checks covering hallucinations, PII detection, toxicity, retrieval quality, and custom evaluations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$Synthetic Data Generation$q$, $q$Create realistic, edge-case, or adversarial test inputs for stress-testing AI systems.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$Continuous Monitoring$q$, $q$Live dashboards that track quality checks and detect drift or regressions over time.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$Tracing / Instrumentation$q$, $q$Instrument LLM and RAG applications to capture data for evaluation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$Open-Source Python Library$q$, $q$Free, self-hostable core evaluation library released under the Apache 2.0 license.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$Fully open source under the permissive Apache 2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$Large, active community with 7,500+ GitHub stars and 40M+ downloads$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$Covers both traditional ML monitoring and modern LLM/RAG/agent evaluation in a single framework$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$100+ pre-built metrics reduce the need to write custom evaluation logic$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$Used by companies including DeepL, Wise, Realtor.com, and Plaid, per Evidently's website$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$Premium features such as no-code dashboards, alerting/scheduling, and role-based access control require the paid Cloud/Enterprise platform, not the free OSS library$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$Public pricing for the Cloud/Enterprise platform is not listed on the website; requires contacting Evidently for a quote$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$Self-managing the open-source deployment requires handling your own infrastructure and support$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$Is Evidently free to use?$q$, $q$Yes, the core Evidently library is fully open source under the Apache 2.0 license and free to use and self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$Does Evidently offer a hosted or cloud option?$q$, $q$Yes, Evidently offers a commercial Platform, available as cloud-hosted or self-hosted Enterprise, with additional no-code features, dashboards, and support on top of the open-source library.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$What can Evidently evaluate?$q$, $q$Evidently can evaluate LLMs, RAG applications, AI agents, and traditional ML models, checking for issues like hallucinations, PII exposure, toxicity, and data drift.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$How is Evidently licensed?$q$, $q$The open-source library is licensed under Apache 2.0.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$Who uses Evidently?$q$, $q$Evidently states it is used by thousands of companies from startups to enterprises, including DeepL, Wise, Realtor.com, and Plaid.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$LLM/RAG evaluation$q$, $q$AI teams evaluate LLM and RAG application outputs for quality, hallucinations, and safety before and after deployment.$q$, $q$AI/ML engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$ML model monitoring$q$, $q$Data science teams track data drift and model performance degradation in production.$q$, $q$MLOps and data science teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$Synthetic test data creation$q$, $q$Teams generate edge-case and adversarial test inputs to stress-test AI systems before release.$q$, $q$QA and AI evaluation teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$Self-hosted, open-source evaluation$q$, $q$Developers who need a free, self-hosted evaluation library integrate Evidently directly into their pipelines.$q$, $q$Individual developers and engineering teams$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$Open Source$q$, $q$$0$q$, NULL, $q$["Apache 2.0 licensed","100+ evaluation metrics","Self-hosted Python library","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$Evidently Platform (Cloud / Enterprise)$q$, $q$Custom$q$, NULL, $q$["No-code dashboards and evaluations","Alerts and scheduled automation","Role-based access control","Cloud-hosted or self-hosted enterprise deployment"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$overview$q$, $q$What is Evidently?$q$, 2, ARRAY[$q$Evidently is an open-source framework, founded in 2020, for evaluating, testing, and monitoring AI systems, including LLMs, RAG applications, AI agents, and traditional ML models. The core library is released under the Apache 2.0 license and includes 100+ built-in metrics covering issues such as hallucinations, PII detection, toxicity, retrieval quality, and data drift.$q$, $q$Beyond the open-source library, Evidently also offers a commercial Platform, available as a managed cloud service or self-hosted Enterprise deployment, that adds no-code dashboards, synthetic data generation, alerting, scheduled automation, and role-based access control.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', $q$who-its-for$q$, $q$Who Evidently is for$q$, 2, ARRAY[$q$Evidently is used by individual developers and data science teams who want a free, self-hostable evaluation library, as well as larger organizations that need the managed Platform's no-code workflows, dashboards, and access controls. The company states its tools are used by thousands of companies, from startups to enterprises such as DeepL, Wise, Realtor.com, and Plaid.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('77429280-36af-46ef-b496-25b4c65c2176', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Arize Phoenix ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source AI observability platform by Arize AI for tracing, evaluating, and debugging LLM applications and agents.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2020,
  company_size = NULL,
  headquarters = $q$Berkeley, California, United States$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Arize Phoenix is an open-source LLM observability platform for tracing, evaluation, experimentation, and prompt iteration, maintained by Arize AI.$q$,
  og_description = $q$Arize Phoenix is an open-source LLM observability platform for tracing, evaluation, experimentation, and prompt iteration, maintained by Arize AI.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '43a21783-24ae-4f92-b263-4021ecd34f16';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '43a21783-24ae-4f92-b263-4021ecd34f16' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$OpenTelemetry-Based Tracing$q$, $q$Runtime monitoring and tracing of LLM application calls using OpenTelemetry instrumentation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$LLM-Based Evaluation$q$, $q$Benchmark application performance using LLM-based assessments.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Versioned Datasets$q$, $q$Manage versioned example collections for experimentation and fine-tuning.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Experiments$q$, $q$Track and evaluate changes to prompts and models over time.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Prompt Playground$q$, $q$Interactively test, optimize, and replay traced LLM calls.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Prompt Management$q$, $q$Version control and systematic iteration on prompts.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Broad Framework Support$q$, $q$Out-of-the-box instrumentation for LangChain, LlamaIndex, CrewAI, DSPy, and major LLM providers like OpenAI, Anthropic, Google, and AWS Bedrock.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Free and open source with no feature gates for self-hosting$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Local-first: runs on a laptop, in a Jupyter notebook, in a container, or in the cloud$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Backed and maintained by Arize AI, an established AI observability company$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Broad integration support across LLM frameworks and providers via OpenTelemetry-based instrumentation$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Active project with 10.6k+ GitHub stars$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Licensed under Elastic License 2.0 (ELv2), which is not an OSI-approved open-source license and prohibits offering Phoenix as a hosted or managed service to third parties$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$No dedicated Phoenix cloud/SaaS tier; teams needing a fully managed commercial product must move to Arize's separate paid product, Arize AX$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Portions of the codebase are patent-protected under U.S. patents per the project's IP notice$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Is Arize Phoenix free?$q$, $q$Yes. Phoenix is free to self-host with no feature gates, though it is licensed under Elastic License 2.0 rather than a fully permissive open-source license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Who maintains Arize Phoenix?$q$, $q$Phoenix is maintained by Arize AI, founded in 2020 and headquartered in Berkeley, California.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Can Phoenix be self-hosted?$q$, $q$Yes, Phoenix can run locally via pip or conda, in a Jupyter notebook, in a container, or deployed to platforms like Railway, Render, Google Cloud, Azure, and AWS.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$What is the difference between Phoenix and Arize AX?$q$, $q$Phoenix is Arize's open-source, local-first observability and evaluation tool; Arize AX is Arize's separate commercial, fully managed observability platform.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$What license does Phoenix use?$q$, $q$Phoenix is released under the Elastic License 2.0 (ELv2), which is free to self-host but restricts offering it as a hosted or managed service.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$LLM application tracing$q$, $q$Developers instrument LLM applications to trace and debug requests end-to-end.$q$, $q$AI/ML engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$RAG pipeline debugging$q$, $q$Teams evaluate retrieval quality and debug RAG pipelines using versioned datasets and experiments.$q$, $q$AI application developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Prompt iteration$q$, $q$Teams use the playground to test and refine prompts before deployment.$q$, $q$Prompt engineers and AI developers$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Local or offline LLM evaluation$q$, $q$Individual developers run Phoenix locally or in notebooks for quick, self-contained evaluation without a cloud account.$q$, $q$Individual developers and researchers$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$Open Source (Self-Hosted)$q$, $q$$0$q$, NULL, $q$["Full tracing, evaluation, experiments, and playground","No feature gates","Elastic License 2.0","Deployable locally, in notebooks, containers, or the cloud"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$overview$q$, $q$What is Arize Phoenix?$q$, 2, ARRAY[$q$Arize Phoenix is an open-source, local-first AI observability platform maintained by Arize AI, a company founded in 2020 and headquartered in Berkeley, California. Phoenix provides OpenTelemetry-based tracing, LLM-based evaluation, versioned datasets, experiments, a prompt playground, and prompt management for LLM applications and agents.$q$, $q$Phoenix is released under the Elastic License 2.0 (ELv2), a source-available license that lets anyone self-host it for free with no feature gates, but that restricts offering Phoenix itself as a hosted or managed service. Teams that need a fully managed, commercial version of Arize's observability tooling instead use Arize's separate paid product, Arize AX.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', $q$who-its-for$q$, $q$Who Arize Phoenix is for$q$, 2, ARRAY[$q$Phoenix is aimed at developers and AI teams who want a free, self-hosted or local-first way to trace, evaluate, and debug LLM applications, RAG pipelines, and agents, without adopting a cloud subscription. It supports popular frameworks such as LangChain, LlamaIndex, CrewAI, and DSPy, as well as providers including OpenAI, Anthropic, Google, and AWS Bedrock.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43a21783-24ae-4f92-b263-4021ecd34f16', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Langfuse ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source (MIT core) LLM engineering platform for tracing, evaluation, and prompt management, with free self-hosting and paid cloud tiers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$29/month$q$,
  founded_year = 2022,
  company_size = NULL,
  headquarters = $q$Berlin, Germany$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Langfuse is an open-source (YC W23) LLM engineering platform for tracing, evaluation, and prompt management, with free self-hosting and paid cloud plans.$q$,
  og_description = $q$Langfuse is an open-source (YC W23) LLM engineering platform for tracing, evaluation, and prompt management, with free self-hosting and paid cloud plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c392b66f-4dcb-40e6-989c-f072b529aff7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c392b66f-4dcb-40e6-989c-f072b529aff7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$LLM Tracing & Observability$q$, $q$Track LLM calls, multi-turn sessions, and visualize agents as graphs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Prompt Management$q$, $q$Version, collaboratively edit, and deploy prompts without code changes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Evaluation$q$, $q$LLM-as-a-judge, code-based evaluators, user feedback, and manual labeling for development and production.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Datasets$q$, $q$Systematic testing to validate application performance across scenarios.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$LLM Playground$q$, $q$Interactively test and iterate on prompts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Open Source & Self-Hostable$q$, $q$MIT-licensed core, deployable via Docker or Kubernetes.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Broad Integrations$q$, $q$Native Python/JS SDKs, 100+ library integrations, OpenTelemetry, and LLM gateway support such as LiteLLM.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$MIT-licensed core with no usage limits on tracing, evaluation, prompt management, and more$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Free, unlimited self-hosting via Docker or Kubernetes$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Y Combinator-backed (W23) with active, ongoing development$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Cloud plans include a free Hobby tier with no credit card required$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Broad integration ecosystem, including OpenTelemetry, LangChain, LlamaIndex, and the OpenAI SDK$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Certain enterprise features (SCIM, audit logging, data retention policies) require a commercial license even when self-hosting$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Cloud pricing scales quickly: the Enterprise plan starts at $2,499/month$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Usage-based overage charges apply beyond included units on paid cloud plans$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$SSO and fine-grained access control require an additional Teams add-on ($300/month) on the Pro plan$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Is Langfuse free to use?$q$, $q$Yes. The core of Langfuse is MIT licensed and free to self-host without usage limits, and there is also a free Hobby cloud plan with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Can Langfuse be self-hosted?$q$, $q$Yes, Langfuse is open source and self-hostable for free via Docker or Kubernetes, though some enterprise features require a commercial license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Who founded Langfuse?$q$, $q$Langfuse was founded in 2022 by Marc Klingen, Clemens Rawert, and Maximilian Deichmann, and went through Y Combinator's Winter 2023 batch.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Where is Langfuse based?$q$, $q$Langfuse has offices in Berlin, Germany for product and engineering, and San Francisco, California for go-to-market.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$What are Langfuse's cloud pricing plans?$q$, $q$Langfuse Cloud offers a free Hobby plan, Core at $29/month, Pro at $199/month, and Enterprise starting at $2,499/month, plus usage-based overage pricing.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$LLM application debugging$q$, $q$Teams trace and analyze multi-turn LLM conversations to debug production issues.$q$, $q$AI/ML engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Prompt lifecycle management$q$, $q$Teams version, test, and deploy prompts collaboratively without redeploying code.$q$, $q$AI product and engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$LLM evaluation and quality assurance$q$, $q$Teams run LLM-as-a-judge and human evaluations to score application outputs.$q$, $q$AI QA and evaluation teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Self-hosted LLM observability$q$, $q$Organizations with data residency or compliance needs self-host Langfuse for free using Docker or Kubernetes.$q$, $q$Enterprises and regulated industries$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Hobby$q$, $q$$0$q$, $q$monthly$q$, $q$["50k units/month included","30 days data access","Up to 2 users","Community support","No credit card required"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Core$q$, $q$$29/month$q$, $q$monthly$q$, $q$["100k units/month included, $8/100k additional","90 days data access","Unlimited users","In-app support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Pro$q$, $q$$199/month$q$, $q$monthly$q$, $q$["100k units/month included, $8/100k additional","3 years data access","Advanced data retention management","Optional Teams add-on ($300/month) for SSO and fine-grained access control"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$Enterprise$q$, $q$$2,499/month$q$, $q$monthly$q$, $q$["100k units/month included, $8/100k additional","3 years data access","Dedicated support engineer","Audit logs","Custom pricing available with yearly commitment"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$overview$q$, $q$What is Langfuse?$q$, 2, ARRAY[$q$Langfuse is an open-source LLM engineering platform founded in 2022 by Marc Klingen, Clemens Rawert, and Maximilian Deichmann, and part of Y Combinator's Winter 2023 batch. It helps teams debug, analyze, and iterate on LLM applications through tracing, evaluation, prompt management, and datasets. Its core is MIT licensed, with the full product feature set, including tracing, evaluations, prompt management, and the playground, available without usage limits on self-hosted deployments.$q$, $q$Langfuse also offers a managed Langfuse Cloud with a free Hobby tier plus paid Core, Pro, and Enterprise plans that add higher usage limits, longer data retention, and enterprise features such as SSO and audit logs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', $q$who-its-for$q$, $q$Who Langfuse is for$q$, 2, ARRAY[$q$Langfuse is built for AI engineering and product teams building LLM applications who need observability, evaluation, and prompt management, from individual developers self-hosting the free MIT-licensed core to enterprises using Langfuse Cloud's paid plans for compliance features like audit logging and long-term data retention.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c392b66f-4dcb-40e6-989c-f072b529aff7', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Helicone ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Helicone is an open-source AI gateway and LLM observability platform for logging, debugging, and analyzing LLM application traffic.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$79/month$q$,
  founded_year = 2023,
  company_size = NULL,
  headquarters = $q$San Francisco, United States$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Helicone is an open-source AI gateway and LLM observability platform with request logging, prompt management, and a free self-hosted option.$q$,
  og_description = $q$Helicone is an open-source AI gateway and LLM observability platform with request logging, prompt management, and a free self-hosted option.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5b558345-f62d-4c17-b8c6-88e78d8300a2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5b558345-f62d-4c17-b8c6-88e78d8300a2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$AI Gateway$q$, $q$Unified OpenAI-compatible API for accessing 100+ LLM models across OpenAI, Anthropic, Google, and other providers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Request logging and tracing$q$, $q$Automatically logs and traces requests, agents, and chatbot sessions with dashboard analytics visible within seconds.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Prompt management$q$, $q$Version, deploy, and manage prompts with a built-in playground for testing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Segments, sessions and user tracking$q$, $q$Groups requests into sessions and tracks usage by user or segment.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$HQL (Helicone Query Language)$q$, $q$A dedicated query language for analyzing logged request data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Rate limiting and alerts$q$, $q$Set rate limits on API usage and configure alerts for anomalies or thresholds.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Self-hosting$q$, $q$Fully open source under Apache 2.0, deployable via Docker Compose for local setups or a Helm chart for enterprise deployments.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Cost and latency analytics$q$, $q$Tracks cost and latency across providers with PostHog integration for further analysis.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Open source (Apache 2.0) with self-hosting available via Docker Compose or an enterprise Helm chart$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Free Hobby tier includes 10,000 requests per month with no cost$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$0% markup on LLM provider costs when used as an AI gateway$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Backed by Y Combinator (W23) with an active GitHub repository (6,000+ stars)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$SOC 2 and GDPR compliance, with HIPAA available on higher tiers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Paid Pro and Team plans include usage-based charges beyond the free allowances$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Enterprise features like on-premises deployment and SAML SSO require custom quote-only pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Data retention on lower tiers is limited (7 days on the free Hobby plan)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Is Helicone free to use?$q$, $q$Yes, Helicone has a free Hobby plan with 10,000 requests per month, 1 GB storage, and 7-day data retention. It is also fully open source and can be self-hosted at no cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Can Helicone be self-hosted?$q$, $q$Yes. Helicone is open source under the Apache 2.0 license and can be self-hosted via Docker Compose, with a production-ready Helm chart available for enterprise deployments.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$What does the Pro plan cost?$q$, $q$The Pro plan starts at $79/month and includes unlimited seats, alerts, reports, and the HQL query language, plus a 7-day free trial.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Does Helicone charge extra to route LLM requests?$q$, $q$Helicone advertises 0% markup on LLM provider costs when used as an AI gateway; billing is based on the platform's own request/storage tiers instead.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Which LLM providers does Helicone support?$q$, $q$Helicone integrates with OpenAI, Anthropic, Google (Vertex/Gemini), Azure, Groq, Together AI, OpenRouter, LiteLLM, Anyscale, Mistral, DeepSeek, and other providers.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$LLM request logging and debugging$q$, $q$Teams that need visibility into every LLM API call, including latency, cost, and full request/response payloads.$q$, $q$AI engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Unified multi-provider access$q$, $q$Companies wanting a single OpenAI-compatible API to route across 100+ models from different providers with automatic failover.$q$, $q$Developers building multi-model AI applications$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Self-hosted LLM observability$q$, $q$Organizations with data residency or compliance requirements that need to run observability infrastructure on their own servers.$q$, $q$Enterprises and regulated industries$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Hobby$q$, $q$$0/month$q$, $q$monthly$q$, $q$["10,000 requests/month","1 GB storage","1 seat, 1 organization","7-day data retention","10 logs/min ingestion limit"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Pro$q$, $q$$79/month$q$, $q$monthly$q$, $q$["Everything in Hobby","Unlimited seats","Alerts and reports","HQL query language","1-month data retention","7-day free trial"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Team$q$, $q$$799/month$q$, $q$monthly$q$, $q$["Everything in Pro","5 organizations","SOC 2 & HIPAA compliance","Dedicated Slack channel","3-month data retention","7-day free trial"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Everything in Team","Custom MSA","SAML SSO","On-premises deployment","Bulk cloud discounts"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$overview$q$, $q$What is Helicone?$q$, 2, ARRAY[$q$Helicone is an open-source AI gateway and LLM observability platform that lets developers route, log, debug, and analyze traffic from their LLM applications. It provides an OpenAI-compatible unified API for accessing 100+ models across providers such as OpenAI, Anthropic, and Google, alongside a dashboard for request tracing, cost and latency analytics, prompt management, and alerting.$q$, $q$The project is released under the Apache 2.0 license and can be self-hosted via Docker Compose or, for enterprise deployments, a Helm chart. Helicone is backed by Y Combinator (W23 batch) and is headquartered in San Francisco.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', $q$who-its-for$q$, $q$Who Helicone is for$q$, 2, ARRAY[$q$Helicone suits AI engineering teams that need visibility into LLM API usage, cost, and latency, as well as teams that want a single gateway to route requests across multiple LLM providers. Its free self-hosted option also appeals to organizations with data residency requirements, while its paid Pro and Team plans target teams that need collaboration features, longer data retention, and compliance certifications.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b558345-f62d-4c17-b8c6-88e78d8300a2', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── OpenLLMetry ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$OpenLLMetry is an open-source, OpenTelemetry-based SDK by Traceloop for instrumenting and observing LLM and GenAI applications.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$OpenLLMetry is a free, open-source OpenTelemetry SDK for instrumenting LLM applications, maintained by Traceloop under Apache 2.0.$q$,
  og_description = $q$OpenLLMetry is a free, open-source OpenTelemetry SDK for instrumenting LLM applications, maintained by Traceloop under Apache 2.0.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1c4daae7-b7fd-449c-a71e-daba739c3ca5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1c4daae7-b7fd-449c-a71e-daba739c3ca5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$OpenTelemetry-based instrumentation$q$, $q$Extends OpenTelemetry with LLM-specific instrumentation so teams can reuse existing observability infrastructure.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$Two-line setup$q$, $q$Instrument an LLM application with as little as two lines of code.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$Python and TypeScript SDKs$q$, $q$Official SDKs available for both Python and Node.js/TypeScript applications.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$Broad LLM provider support$q$, $q$Instrumentations for OpenAI, Anthropic, AWS Bedrock, Cohere, Google Gemini, Mistral AI, Ollama, Together.ai, Watsonx, and more.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$Vector database and framework support$q$, $q$Supports vector databases such as Pinecone, Qdrant, Weaviate, and Chroma, plus frameworks like LangChain, LlamaIndex, and CrewAI.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$Exports to standard observability platforms$q$, $q$Traces can be sent to Datadog, Honeycomb, New Relic, Grafana Tempo, Splunk, Dynatrace, and other OpenTelemetry-compatible backends.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$Workflow decorators$q$, $q$Provides decorators for tracking and labeling LLM workflow steps in code.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$Fully open source under the Apache 2.0 license, free to use with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$Built on the OpenTelemetry standard, so traces integrate with existing observability tooling$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$Broad ecosystem of provider, vector-database, and observability-platform integrations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$Actively maintained on GitHub (7,000+ stars) with an active Slack and GitHub Discussions community$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$As of March 2026, Traceloop (the company maintaining OpenLLMetry) was acquired by ServiceNow, which introduces uncertainty about the open-source project's long-term independent roadmap$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$The SDK itself has no built-in hosted dashboard; teams need a separate OpenTelemetry-compatible backend or the Traceloop platform to visualize traces$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$Requires OpenTelemetry familiarity to get the most out of custom configurations$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$Is OpenLLMetry free?$q$, $q$Yes. OpenLLMetry is open source under the Apache 2.0 license and free to use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$What languages does OpenLLMetry support?$q$, $q$OpenLLMetry provides official SDKs for Python and TypeScript/Node.js.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$Who maintains OpenLLMetry?$q$, $q$OpenLLMetry is built and maintained by Traceloop, which was acquired by ServiceNow in March 2026; the open-source project remains available on GitHub under Apache 2.0.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$Does OpenLLMetry require a specific observability backend?$q$, $q$No. Because it is built on OpenTelemetry, traces can be exported to any OpenTelemetry-compatible backend, including Datadog, Honeycomb, New Relic, and Traceloop's own platform.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$How do I install OpenLLMetry?$q$, $q$For Python, install the traceloop-sdk package and initialize it with Traceloop.init() in your application code.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$Instrumenting LLM applications with OpenTelemetry$q$, $q$Teams that already use OpenTelemetry and want to extend it to trace LLM calls, prompts, and completions.$q$, $q$Platform and observability engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$Multi-provider LLM tracing$q$, $q$Applications calling multiple LLM providers or vector databases that need consistent tracing across all of them.$q$, $q$AI application developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$overview$q$, $q$What is OpenLLMetry?$q$, 2, ARRAY[$q$OpenLLMetry is an open-source SDK, released under the Apache 2.0 license, that extends OpenTelemetry with instrumentation for LLM and GenAI applications. It lets developers add tracing to LLM calls, prompts, vector database queries, and framework operations (such as LangChain or LlamaIndex) with minimal code changes, then export those traces to any OpenTelemetry-compatible observability platform.$q$, $q$The project is built and maintained by Traceloop, which ships OpenLLMetry as the open-source foundation of its own LLM observability platform. In March 2026, Traceloop was acquired by ServiceNow and its technology became part of ServiceNow's AI Control Tower; the OpenLLMetry GitHub repository remains publicly available under its open-source license.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', $q$who-its-for$q$, $q$Who OpenLLMetry is for$q$, 2, ARRAY[$q$OpenLLMetry is suited to engineering teams that already rely on OpenTelemetry-based observability and want to extend the same tracing pipeline to their LLM and agent workloads, rather than adopting a separate proprietary logging tool. It is free to use for teams comfortable self-managing instrumentation and choosing their own trace backend.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1c4daae7-b7fd-449c-a71e-daba739c3ca5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── PromptLayer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$PromptLayer is a prompt management, evaluation, and LLM observability platform for AI engineering teams, founded in 2021.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$49/month$q$,
  founded_year = 2021,
  company_size = NULL,
  headquarters = $q$New York City, United States$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$PromptLayer offers prompt management, evaluations, and LLM observability, with a free plan and paid tiers starting at $49/month.$q$,
  og_description = $q$PromptLayer offers prompt management, evaluations, and LLM observability, with a free plan and paid tiers starting at $49/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '788da3e1-d1d6-401e-a948-5529f931152a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '788da3e1-d1d6-401e-a948-5529f931152a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Prompt registry (CMS)$q$, $q$Centralized, dynamically-fetched prompt registry — update prompts in the dashboard and applications pick up new versions without redeploying.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Automatic versioning$q$, $q$Every LLM call creates a version in the registry, preserving history without requiring manual saves.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Evaluation harness$q$, $q$Supports backtesting against production examples, regression testing, and CI-connected evaluation pipelines that run automatically on new prompt versions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Multiple scoring methods$q$, $q$Evaluations can use LLM-as-judge, human grading, equality comparison, cosine similarity, or custom code evaluators.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Observability and request logging$q$, $q$Captures every LLM API call with full request/response payloads, latency, and cost, tied back to the prompt version that served it.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Request replay$q$, $q$Replays logged requests to debug issues or test new prompt variations against historical data.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Release and dynamic labels$q$, $q$Promote prompt versions between environments using labels, with commit messages and diffs on each version.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Non-developer collaboration$q$, $q$Lets domain experts edit and manage prompts without modifying application code.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Free plan available with no cost for smaller usage (2,500 requests/month, 5 users)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Combines prompt versioning, evaluations, and observability in a single registry-first platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Real-time monitoring of token usage, model performance, error rates, and cost$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Enterprise plan offers flexible/self-hosted deployment options and HIPAA with BAA$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Paid plans add pay-as-you-go transaction fees on top of the base subscription ($0.003 or $0.002 per transaction)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Free plan is limited to 10 prompts and 10 playground runs per day$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Enterprise-grade features like RBAC, deployment approvals, and self-hosting require custom/quote-only Enterprise pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Is PromptLayer free?$q$, $q$Yes, PromptLayer offers a free plan for up to 5 users with 2,500 requests/month, 1 workspace, and 10 prompts.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$How much does PromptLayer cost?$q$, $q$The Pro plan starts at $49/month, and the Team plan is $500/month; both add pay-as-you-go transaction fees. Enterprise pricing is custom.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$When was PromptLayer founded?$q$, $q$PromptLayer was founded in 2021.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Does PromptLayer support self-hosting?$q$, $q$Flexible hosting options, including self-hosted deployment, are available on the Enterprise plan.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$What can PromptLayer evaluations use for scoring?$q$, $q$Evaluations can be scored using LLM-as-judge, human grading, equality comparison, cosine similarity, or custom code evaluators.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Prompt version control and collaboration$q$, $q$Teams that need a shared registry so both engineers and non-technical domain experts can edit and deploy prompts without code changes.$q$, $q$AI engineering and product teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Regression testing for prompt changes$q$, $q$Running backtests and CI-connected evaluation pipelines to catch regressions before a new prompt version ships.$q$, $q$Teams shipping frequent prompt updates$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Production LLM monitoring$q$, $q$Tracking cost, latency, token usage, and error rates for LLM calls tied back to specific prompt versions.$q$, $q$Teams operating LLM applications in production$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["5 users","2,500 requests/month","1 workspace","250 eval cell executions/month","10MB max per dataset","10 prompts","10 playground runs/day"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Pro$q$, $q$$49/month$q$, $q$monthly$q$, $q$["Unlimited playgrounds","Unlimited workspaces","150MB max per dataset","Pay-as-you-go at $0.003/transaction"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Team$q$, $q$$500/month$q$, $q$monthly$q$, $q$["25 users","100k+ requests/month","7,500+ eval cell executions/month","1GB max per dataset","Pay-as-you-go at $0.002/transaction","Webhooks","Unlimited playground runs"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom limits","Role-based access controls","Deployment approvals","HIPAA with BAA","Flexible/self-hosted deployment","Dedicated support","Data retention controls","SSO"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$overview$q$, $q$What is PromptLayer?$q$, 2, ARRAY[$q$PromptLayer is a prompt management, evaluation, and observability platform for AI engineering teams. It centers on a prompt registry (CMS) where every LLM call automatically creates a new version, so teams can update prompts in a dashboard and have applications pick up changes without redeploying code.$q$, $q$Beyond versioning, PromptLayer includes an evaluation harness for backtesting and regression testing prompt changes against production data, plus request-level observability that logs cost, latency, and full payloads tied back to specific prompt versions. PromptLayer was founded in 2021 and is based in New York City.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', $q$who-its-for$q$, $q$Who PromptLayer is for$q$, 2, ARRAY[$q$PromptLayer is built for AI engineering teams that want a shared, non-developer-friendly system for managing, testing, and monitoring prompts in production, rather than building this tooling in-house. Its free plan suits individuals and small projects, while Pro and Team plans target growing teams, and the Enterprise plan serves organizations needing SSO, RBAC, and flexible hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('788da3e1-d1d6-401e-a948-5529f931152a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── LangSmith ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$LangSmith is LangChain's platform for tracing, monitoring, evaluating, and debugging LLM applications and AI agents in production.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$39/seat/month$q$,
  founded_year = 2023,
  company_size = NULL,
  headquarters = $q$San Francisco, California, US$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$LangSmith is LangChain's observability and evaluation platform for tracing, monitoring, and debugging LLM applications and AI agents.$q$,
  og_description = $q$LangSmith is LangChain's observability and evaluation platform for tracing, monitoring, and debugging LLM applications and AI agents.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ebd27bea-946b-435d-8767-2c6ce3d3d696';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ebd27bea-946b-435d-8767-2c6ce3d3d696' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Tracing$q$, $q$Step-by-step visibility into what an agent is doing, with native support for popular LLM frameworks.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Production monitoring$q$, $q$Real-time dashboards tracking cost, latency (P50/P99), and error rates with configurable alerts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Evaluations$q$, $q$LLM-as-judge and code-based evaluations to test and score application quality.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Automatic insights$q$, $q$Trace clustering that surfaces patterns and recurring failure modes across large volumes of traces.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Framework-agnostic SDKs$q$, $q$SDKs for Python, TypeScript, Go, and Java, with integrations for LangChain, LlamaIndex, OpenAI SDK, Anthropic SDK, Vercel AI SDK, and OpenTelemetry.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Flexible deployment$q$, $q$Available as managed cloud, bring-your-own-cloud (BYOC) on AWS/GCP/Azure, or self-hosted on Kubernetes.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Framework-agnostic — works with LangChain, LlamaIndex, raw OpenAI/Anthropic SDKs, and OpenTelemetry$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Free Developer tier available with no credit card required to start$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$SDKs across Python, TypeScript, Go, and Java for broad language coverage$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Enterprise deployment options including self-hosted and BYOC for data residency needs$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Discounted rates and free trace allotments offered to VC-backed startups$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Usage-based pricing (compute and storage units) can make costs unpredictable at scale beyond base trace allotments$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Free Developer plan is capped at 1 seat and 5,000 base traces per month$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Self-hosted and BYOC options require Enterprise-tier custom pricing$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Extended trace retention beyond 14 days requires an upgrade$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Is LangSmith free to use?$q$, $q$Yes, LangSmith has a free Developer plan with up to 5,000 base traces per month and 1 seat, billed pay-as-you-go for additional usage.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Does LangSmith require LangChain?$q$, $q$No, LangSmith is framework-agnostic and works with LangChain, LlamaIndex, the OpenAI SDK, the Anthropic SDK, the Vercel AI SDK, and OpenTelemetry.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Can LangSmith be self-hosted?$q$, $q$Yes, LangSmith Enterprise supports self-hosted deployment on Kubernetes as well as bring-your-own-cloud (BYOC) on AWS, GCP, or Azure.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$What does LangSmith cost beyond the free plan?$q$, $q$The Plus plan starts at $39 per seat per month plus usage charges for compute (LCUs) and storage (LSUs); Enterprise pricing is custom.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Who built LangSmith?$q$, $q$LangSmith is built by LangChain, Inc., the company behind the LangChain open-source framework, headquartered in San Francisco.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Debugging LLM agents$q$, $q$Trace every step an agent takes to identify where a response went wrong.$q$, $q$AI engineers building agentic applications$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Production monitoring$q$, $q$Track cost, latency, and error rates for LLM applications running in production with configurable alerts.$q$, $q$Engineering and platform teams operating LLM apps at scale$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Systematic evaluation$q$, $q$Run LLM-as-judge or code-based evaluations to score application quality before and after changes.$q$, $q$ML and QA teams validating model or prompt changes$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Enterprise-grade deployment$q$, $q$Self-host or bring your own cloud to keep trace data within a private environment.$q$, $q$Enterprises with data residency or compliance requirements$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Developer$q$, $q$$0/seat/month$q$, $q$monthly$q$, $q$["Up to 5,000 base traces/month","1 seat maximum","Community support","Pay-as-you-go usage beyond included traces"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Plus$q$, $q$$39/seat/month$q$, $q$monthly$q$, $q$["Up to 10,000 base traces/month","Unlimited seats","Deployment/Engine access","Email support","1 free small serverless deployment"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Self-hosted or hybrid deployment","Custom SSO and RBAC","Support SLA","Custom seats and workspaces","Annual invoicing"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$overview$q$, $q$What is LangSmith?$q$, 2, ARRAY[$q$LangSmith is an observability and evaluation platform from LangChain, Inc. that gives teams visibility into how LLM applications and AI agents behave in production. It provides step-by-step tracing, real-time monitoring dashboards for cost, latency, and error rates, and automatic clustering of traces to surface recurring failure patterns.$q$, $q$The platform is framework-agnostic, with SDKs for Python, TypeScript, Go, and Java, and integrations for LangChain, LlamaIndex, the OpenAI and Anthropic SDKs, the Vercel AI SDK, and OpenTelemetry. It can be run as a managed cloud service, on a customer's own cloud (BYOC across AWS, GCP, or Azure), or fully self-hosted on Kubernetes.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', $q$who-its-for$q$, $q$Who LangSmith is for$q$, 2, ARRAY[$q$LangSmith is built for engineering and ML teams building and operating LLM-powered applications and agents, from individual developers debugging locally on the free Developer plan to enterprises that need self-hosted or BYOC deployment for data residency and compliance.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ebd27bea-946b-435d-8767-2c6ce3d3d696', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Dify ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Dify is an open-source platform for visually building, testing, and deploying AI agents, workflows, and RAG pipelines.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$590/year$q$,
  founded_year = 2023,
  company_size = NULL,
  headquarters = $q$Menlo Park, California, US$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Dify is an open-source platform for building AI agents, agentic workflows, and RAG pipelines with a visual workflow studio and self-hosting option.$q$,
  og_description = $q$Dify is an open-source platform for building AI agents, agentic workflows, and RAG pipelines with a visual workflow studio and self-hosting option.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd515660a-2710-4138-a906-19ab0c3f0a81';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd515660a-2710-4138-a906-19ab0c3f0a81' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Workflow Studio$q$, $q$Visual, node-based builder for creating agentic workflows without managing infrastructure.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Agent building$q$, $q$Configure agents with memory, tools, and defined boundaries.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Knowledge pipeline$q$, $q$Document processing and indexing to build retrieval-augmented generation (RAG) knowledge bases.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Marketplace$q$, $q$Access to model providers, tools, data sources, and MCP-compatible integrations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Multiple publishing options$q$, $q$Deploy apps as web apps, REST APIs, embeds, or MCP-compatible tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Monitoring$q$, $q$Logs, user feedback, latency, and usage tracking for deployed apps.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Plugin development$q$, $q$Framework for building custom tools, models, and integrations, plus a difyctl CLI for CI/CD workflows.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Open-source Community Edition can be self-hosted via Docker Compose at no cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$149K+ GitHub stars and an active open-source community$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Free Dify Cloud Sandbox tier available with no installation required$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Deployment flexibility: managed cloud, self-hosted, or private/VPC Enterprise deployment$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Enterprise tier offers SOC 2 Type II and ISO 27001 compliance plus SSO/SAML and RBAC$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Source code is released under a modified Apache 2.0 license that requires a commercial license for multi-tenant SaaS use$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Self-hosting the Community Edition requires Docker and technical setup$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Paid Cloud plans (Professional, Team) are billed annually, with no listed monthly option$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Enterprise pricing is custom and not publicly listed$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Is Dify free to use?$q$, $q$Yes. The Community Edition is open source and free to self-host, and Dify Cloud offers a free Sandbox tier with 200 message credits and limited usage.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Can Dify be self-hosted?$q$, $q$Yes, the open-source Community Edition can be self-hosted with Docker Compose, and an Enterprise self-hosted option with VPC deployment is also available.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$What license does Dify use?$q$, $q$Dify is released under a modified version of the Apache License 2.0 that permits commercial use but requires a commercial license for offering Dify as a multi-tenant SaaS service.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$How much does Dify Cloud cost?$q$, $q$Dify Cloud's Professional plan starts at $590/year and the Team plan is $1,590/year; a free Sandbox tier and custom Enterprise pricing are also available.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Who makes Dify?$q$, $q$Dify is developed by LangGenius, headquartered in Menlo Park, California, with additional teams in Tokyo, Suzhou, and Shanghai.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Building AI agents visually$q$, $q$Assemble agents with memory, tools, and defined behavior boundaries using a no-code workflow builder.$q$, $q$Product teams and developers building AI agents without heavy infrastructure work$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$RAG knowledge bases$q$, $q$Process and index documents into a knowledge pipeline that agents can retrieve from.$q$, $q$Teams building retrieval-augmented generation applications$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Self-hosted AI deployment$q$, $q$Run the open-source Community Edition on private infrastructure via Docker Compose.$q$, $q$Engineering teams that need full control over data and hosting$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Enterprise AI app deployment$q$, $q$Deploy with VPC isolation, SSO/SAML, RBAC, and audit logs under a commercial license.$q$, $q$Enterprises with compliance and security requirements$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Sandbox$q$, $q$Free$q$, NULL, $q$["200 message credits","1 workspace, 1 team member","5 apps, 50 knowledge documents","50MB knowledge storage","30-day log history"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Professional$q$, $q$$590/year$q$, $q$annual$q$, $q$["5,000 message credits/month","1 workspace, 3 team members","50 apps, 500 knowledge documents","5GB knowledge storage","Unlimited log history","No API rate limits"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Team$q$, $q$$1,590/year$q$, $q$annual$q$, $q$["10,000 message credits/month","1 workspace, 50 team members","200 apps, 1,000 knowledge documents","20GB knowledge storage","Unlimited trigger events","Unlimited log history"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Community$q$, $q$Free$q$, NULL, $q$["Open-source, self-hosted","All core features under the public repository","Single workspace"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Scalable self-hosted or private deployment","Commercial license","SSO/SAML and RBAC","SOC 2 Type II and ISO 27001 compliance","Advanced security and professional support"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$overview$q$, $q$What is Dify?$q$, 2, ARRAY[$q$Dify is an open-source platform for building production-ready AI agents, agentic workflows, and retrieval-augmented generation (RAG) pipelines. Its visual Workflow Studio lets teams connect nodes to build agent logic without managing underlying infrastructure, and a knowledge pipeline handles document processing for indexed knowledge bases.$q$, $q$The project's Community Edition is released under a modified Apache License 2.0 and can be self-hosted with Docker Compose, while Dify Cloud offers a managed SaaS with a free Sandbox tier plus paid Professional and Team plans. A separate Enterprise offering adds VPC/private deployment, SSO/SAML, RBAC, audit logs, and SOC 2 Type II plus ISO 27001 compliance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', $q$who-its-for$q$, $q$Who Dify is for$q$, 2, ARRAY[$q$Dify suits developers and product teams who want to build AI agents and RAG applications visually, open-source users who want to self-host on their own infrastructure, and enterprises that need compliance-grade private deployment with SSO and audit logging.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d515660a-2710-4138-a906-19ab0c3f0a81', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Flowise ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, drag-and-drop platform for building AI agents, chatbots, and RAG workflows.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$35/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Flowise is an open-source visual builder for AI agents and LLM workflows, with a free self-hosted version and paid Flowise Cloud plans.$q$,
  og_description = $q$Flowise is an open-source visual builder for AI agents and LLM workflows, with a free self-hosted version and paid Flowise Cloud plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a24c79b2-2532-4586-980b-a77abc122161';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a24c79b2-2532-4586-980b-a77abc122161' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Agentflow$q$, $q$Build multi-agent systems with visual workflow orchestration and human-in-the-loop task review.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Chatflow$q$, $q$Create single-agent chatbots with tool calling and retrieval-augmented generation (RAG).$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$100+ model integrations$q$, $q$Connect to a wide range of LLMs, embedding models, and vector databases.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Execution traces$q$, $q$Observe agent runs with tracing support for Prometheus and OpenTelemetry.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Developer APIs and SDKs$q$, $q$Embed flows into external applications using TypeScript and Python SDKs, APIs, and embeddable chat widgets.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Free, Apache-2.0-licensed open-source version that can be self-hosted$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Visual drag-and-drop builder needs little to no code$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Supports a large number of LLMs, embeddings, and vector databases$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Managed Flowise Cloud option removes the need to self-host$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Built-in observability via OpenTelemetry and Prometheus$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Free Flowise Cloud tier is limited to 2 flows and 100 predictions per month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Paid cloud tiers require a recurring monthly subscription on top of any LLM API costs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Self-hosting requires managing your own infrastructure and updates$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Is Flowise free?$q$, $q$The core Flowise software is open source under the Apache 2.0 license and can be self-hosted for free. Flowise also offers a hosted Flowise Cloud with a limited free tier and paid Starter and Pro plans.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Can Flowise be self-hosted?$q$, $q$Yes, Flowise can be installed and run on your own infrastructure via npm, in addition to using the hosted Flowise Cloud.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$What can I build with Flowise?$q$, $q$Flowise is used to build AI agents, chatbots, and RAG applications using a visual, low-code interface called Chatflow and Agentflow.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Does Flowise support multiple LLM providers?$q$, $q$Yes, Flowise supports 100+ LLMs, embedding models, and vector databases through its integration library.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Rapid AI agent prototyping$q$, $q$Developers use Flowise's visual builder to prototype and iterate on AI agents without writing extensive code.$q$, $q$Developers and AI teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Customer-facing chatbots$q$, $q$Teams embed Flowise-built chatbots into websites and products using the provided widgets and APIs.$q$, $q$Product and support teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Enterprise AI workflow orchestration$q$, $q$Organizations use Agentflow to coordinate multi-agent systems with review and observability.$q$, $q$Enterprise engineering teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["2 flows","100 predictions/month","5MB storage"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Starter$q$, $q$$35/month$q$, $q$monthly$q$, $q$["Unlimited flows","10,000 predictions/month","1GB storage"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$Pro$q$, $q$$65/month$q$, $q$monthly$q$, $q$["50,000 predictions/month","10GB storage","Unlimited workspaces","Admin roles"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$overview$q$, $q$What is Flowise?$q$, 2, ARRAY[$q$Flowise is an open-source, visual development platform for building AI agents and LLM-powered applications. It provides a drag-and-drop interface for assembling chatbots and multi-agent workflows without writing extensive code.$q$, $q$The project is licensed under Apache 2.0 and can be self-hosted, or run through the managed Flowise Cloud service, which offers a free tier plus paid Starter and Pro plans.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', $q$who-its-for$q$, $q$Who Flowise is for$q$, 2, ARRAY[$q$Flowise suits developers and AI teams who want to prototype and deploy AI agents quickly using a visual builder, as well as organizations that need to embed conversational AI or automated workflows into existing products via API.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a24c79b2-2532-4586-980b-a77abc122161', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Langflow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, low-code visual builder for creating AI agents and RAG applications.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Langflow is an MIT-licensed, open-source low-code platform for building AI agents and RAG apps, with a free self-hosted option and paid cloud hosting.$q$,
  og_description = $q$Langflow is an MIT-licensed, open-source low-code platform for building AI agents and RAG apps, with a free self-hosted option and paid cloud hosting.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '063d9724-1713-4fc5-9347-e4e03f6040a1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '063d9724-1713-4fc5-9347-e4e03f6040a1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$Visual flow builder$q$, $q$Assemble AI agent and RAG applications using a drag-and-drop canvas.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$Python customization$q$, $q$Extend or modify any component's behavior with custom Python code.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$Interactive playground$q$, $q$Test and refine flows in real time before deployment.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$Multi-agent orchestration$q$, $q$Coordinate multiple agents with conversation management and retrieval.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$API and MCP deployment$q$, $q$Deploy flows as REST APIs or as MCP servers that expose flows as callable tools.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$Open source under the MIT license and free to self-host$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$Combines a visual builder with full Python customization for advanced control$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$Supports major LLM providers and vector databases$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$Can be deployed as an API or an MCP server for use in other applications$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$Active community with Discord, GitHub, and YouTube presence$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$Paid cloud hosting and enterprise support pricing are not published and require contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$Advanced multi-agent orchestration can require Python knowledge to fully customize$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$Self-hosted deployments require managing your own infrastructure$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$Is Langflow free?$q$, $q$Yes. Langflow is open source under the MIT license and free to self-host. Langflow also offers a free cloud account plus paid, enterprise-grade cloud hosting.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$Do I need to know Python to use Langflow?$q$, $q$No, the core builder is drag-and-drop, but Python customization is available for users who want deeper control over components.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$Can Langflow flows be used as an API?$q$, $q$Yes, flows can be deployed as a REST API or exported as JSON for use in external Python applications, and can also be deployed as an MCP server.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$Is Langflow's cloud hosting paid?$q$, $q$Langflow offers both a free cloud account option and enterprise-grade paid cloud hosting with professional services and premier support.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$RAG application development$q$, $q$Teams build retrieval-augmented generation pipelines visually and connect them to vector databases.$q$, $q$AI engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$Agentic workflow prototyping$q$, $q$Developers rapidly prototype multi-agent workflows using pre-built and custom components.$q$, $q$Development teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$Exposing flows as tools$q$, $q$Organizations deploy Langflow flows as MCP servers so other AI systems can call them as tools.$q$, $q$Platform and AI infrastructure teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$overview$q$, $q$What is Langflow?$q$, 2, ARRAY[$q$Langflow is an open-source, low-code visual platform for building and deploying AI agents and RAG (retrieval-augmented generation) applications. It combines a drag-and-drop interface with Python customization for advanced users.$q$, $q$Langflow is licensed under MIT and can be self-hosted for free. A hosted cloud option is also available, ranging from a free account to enterprise-grade paid hosting with professional support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', $q$who-its-for$q$, $q$Who Langflow is for$q$, 2, ARRAY[$q$Langflow is aimed at AI development teams and engineers who want to build agentic and RAG applications quickly using a visual interface, while retaining the option to customize components in Python or deploy flows as APIs and MCP servers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('063d9724-1713-4fc5-9347-e4e03f6040a1', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── AnythingLLM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source desktop and self-hosted app for chatting with local or private LLMs over your own documents.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$50/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$AnythingLLM is an MIT-licensed, open-source AI app for private document chat, free as a desktop app or Docker install, with paid cloud plans from $50/month.$q$,
  og_description = $q$AnythingLLM is an MIT-licensed, open-source AI app for private document chat, free as a desktop app or Docker install, with paid cloud plans from $50/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b9045b0b-a0f9-495a-a06c-21acb051ac12';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b9045b0b-a0f9-495a-a06c-21acb051ac12' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Document integration$q$, $q$Chat with PDFs, Word documents, CSV files, codebases, and other online sources.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Local-first privacy$q$, $q$Runs and stores everything locally on the machine running AnythingLLM by default.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Multi-model support$q$, $q$Works with local models or enterprise LLM providers such as OpenAI, Azure, and AWS.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Developer API$q$, $q$Built-in API for custom development and integration with other systems.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Custom agents and connectors$q$, $q$Extend functionality with custom agents, data connectors, and community-built extensions.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Free, MIT-licensed desktop app with no account required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Can be self-hosted for free via Docker$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Supports both local models and major cloud LLM providers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Handles multiple document types and multimodal models$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Paid cloud plans available for teams that don't want to self-host$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Paid cloud tiers add a recurring monthly cost on top of any LLM API usage$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Enterprise plan pricing is custom and not published$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Cloud Basic plan is limited to small teams (under 5 users, fewer than 100 documents)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Is AnythingLLM free?$q$, $q$Yes, the desktop application is free and open source under the MIT license, and it can also be self-hosted for free via Docker. Paid cloud plans (Basic, Pro, Enterprise) are available for teams that want a hosted instance.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Does AnythingLLM run locally?$q$, $q$Yes, by default everything is stored and run locally on the machine running AnythingLLM, and it can also connect to your own local LLMs.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Who makes AnythingLLM?$q$, $q$AnythingLLM is developed by Mintplex Labs Inc.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$What platforms does AnythingLLM support?$q$, $q$AnythingLLM is available as a desktop app for macOS, Windows, and Linux, as a Docker deployment, and as a hosted cloud service.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Private document Q&A$q$, $q$Individuals and teams chat with their own PDFs, spreadsheets, and codebases without sending data to third parties.$q$, $q$Privacy-conscious individuals and businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Team knowledge base chat$q$, $q$Organizations deploy a private hosted or self-hosted instance so teams can query shared documents.$q$, $q$Business teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Custom AI integrations$q$, $q$Developers use the built-in API to embed AnythingLLM's document chat capabilities into other applications.$q$, $q$Developers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Basic$q$, $q$$50/month$q$, $q$monthly$q$, $q$["Private instance","Custom subdomain","RAG and agents out of the box","Bring your own LLM API key","For teams under 5 users, under 100 documents"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Pro$q$, $q$$99/month$q$, $q$monthly$q$, $q$["Private instance","RAG and agents out of the box","For larger teams","72-hour support SLA"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["On-premise installation","Custom support SLA","Custom domain","Custom integration support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$overview$q$, $q$What is AnythingLLM?$q$, 2, ARRAY[$q$AnythingLLM is an open-source application, developed by Mintplex Labs, that lets users chat with large language models over their own documents locally and privately. It supports PDFs, Word documents, CSVs, codebases, and other data sources.$q$, $q$The desktop app is free and MIT-licensed, and can also be self-hosted via Docker at no cost. AnythingLLM also offers paid, hosted cloud plans (Basic, Pro, and custom Enterprise) for teams that prefer a managed instance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$who-its-for$q$, $q$Who AnythingLLM is for$q$, 2, ARRAY[$q$AnythingLLM is suited to non-technical users who want a private, local AI assistant, as well as businesses and developers who need team collaboration, custom agents, or API integration for document-based AI workflows.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── Open WebUI ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, extensible web interface for running and managing local and remote LLMs offline.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Open WebUI is a free, self-hosted AI platform for Ollama and OpenAI-compatible models, with an optional paid Enterprise plan for SLA and custom branding.$q$,
  og_description = $q$Open WebUI is a free, self-hosted AI platform for Ollama and OpenAI-compatible models, with an optional paid Enterprise plan for SLA and custom branding.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '362996ad-6cda-41f1-8ec2-066aa387a46c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '362996ad-6cda-41f1-8ec2-066aa387a46c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Broad model support$q$, $q$Connects to Ollama, OpenAI-compatible APIs, LMStudio, GroqCloud, Mistral, and other providers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Local RAG and search$q$, $q$Retrieval-augmented generation with support for 9 vector database options plus web search integration.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Team collaboration tools$q$, $q$Built-in voice/video calling, channels, and persistent memory across conversations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Access control$q$, $q$Granular role-based access control with LDAP/Active Directory and OAuth support.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Plugin architecture$q$, $q$Extend the platform with filters, actions, pipes, tools, and Model Context Protocol (MCP) integrations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Flexible deployment$q$, $q$Runs via Docker, Kubernetes (kubectl, kustomize, helm), or Python pip, with optional GPU support.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Free and open source, designed to run entirely offline$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Supports many LLM backends and vector databases out of the box$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Extensive access-control and enterprise authentication options (LDAP, OAuth)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Highly extensible plugin architecture with MCP support$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Multiple deployment paths including Docker, Kubernetes, and native desktop apps$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Licensing is split across multiple terms, with some components requiring branding to be preserved$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Enterprise plan pricing (SLA, custom branding, LTS) is not public and requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Self-hosting requires managing your own infrastructure and updates$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Is Open WebUI free?$q$, $q$Yes, Open WebUI is free and open source and can be self-hosted. An optional paid Enterprise plan adds custom theming/branding, SLA support, and Long-Term Support (LTS) versions.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Does Open WebUI require an internet connection?$q$, $q$No, it's designed to operate entirely offline when paired with local models such as those served by Ollama.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$How is Open WebUI deployed?$q$, $q$It can be deployed via Docker, Kubernetes, or Python pip, and native desktop apps are also available for macOS, Windows, and Linux.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Can Open WebUI connect to cloud LLM providers?$q$, $q$Yes, it supports OpenAI-compatible APIs and providers such as GroqCloud and Mistral in addition to local models via Ollama.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Private, offline AI chat$q$, $q$Individuals and organizations run a fully offline chat interface against local models for data privacy.$q$, $q$Privacy-focused individuals and organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Team AI workspace$q$, $q$Companies deploy Open WebUI with LDAP/OAuth access control as a shared internal AI assistant.$q$, $q$IT and enterprise teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Custom AI tooling$q$, $q$Developers extend Open WebUI with plugins, pipes, and MCP tools for specialized workflows.$q$, $q$Developers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Open Source$q$, $q$$0$q$, NULL, $q$["Self-hosted","Full feature set","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom theming and branding","SLA support","Long-Term Support (LTS) versions"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$overview$q$, $q$What is Open WebUI?$q$, 2, ARRAY[$q$Open WebUI is an extensible, self-hosted AI platform designed to operate entirely offline. It provides a web interface for interacting with local models served through Ollama as well as OpenAI-compatible APIs and other providers.$q$, $q$The core software is free and open source, with a plugin architecture, RAG support, and enterprise authentication options. An optional paid Enterprise plan adds custom branding, SLA support, and Long-Term Support versions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', $q$who-its-for$q$, $q$Who Open WebUI is for$q$, 2, ARRAY[$q$Open WebUI suits individuals and organizations that want a private, offline-capable chat interface for local or remote LLMs, including IT teams that need access control and enterprise authentication for shared internal deployments.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('362996ad-6cda-41f1-8ec2-066aa387a46c', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── LibreChat ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted chat platform that unifies multiple AI models and providers in one interface.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$LibreChat is a free, MIT-licensed, open-source AI chat platform that unifies OpenAI, Anthropic, Azure, and other model providers in one self-hosted app.$q$,
  og_description = $q$LibreChat is a free, MIT-licensed, open-source AI chat platform that unifies OpenAI, Anthropic, Azure, and other model providers in one self-hosted app.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '465b7b09-9fa2-4ab9-9a80-e441a1effd0a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '465b7b09-9fa2-4ab9-9a80-e441a1effd0a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$Multi-provider model support$q$, $q$Connects to Anthropic (Claude), AWS Bedrock, OpenAI, Azure OpenAI, Google, Vertex AI, and compatible APIs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$Code Interpreter$q$, $q$Runs sandboxed code execution in Python, Node.js, Go, C/C++, Java, PHP, Rust, and Fortran.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$LibreChat Agents$q$, $q$No-code custom assistants with Model Context Protocol (MCP) support for tools.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$Artifacts$q$, $q$Generates React, HTML, and Mermaid diagrams directly within the chat interface.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$Enterprise authentication$q$, $q$Multi-user support with OAuth2, LDAP, email login, and a browser-based admin UI for managing users, groups, and roles.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$Search and web access$q$, $q$Built-in message, file, and code search plus live web search integration.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$Fully free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$Wide multi-provider LLM support in a single interface$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$Sandboxed code interpreter supports many programming languages$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$Enterprise-grade authentication options (OAuth2, LDAP, SAML-style SSO, 2FA)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$Large, active community with a demo instance for evaluation$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$No official managed cloud hosting plan; deployment and infrastructure are the user's responsibility$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$Self-hosting requires technical setup and ongoing maintenance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$Advanced features like code interpreter and agents depend on correctly configuring external API keys$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$Is LibreChat free?$q$, $q$Yes, LibreChat is free and open source under the MIT license. It is self-hosted, so users provide their own infrastructure and API keys for the model providers they connect.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$Which AI providers does LibreChat support?$q$, $q$LibreChat supports Anthropic, OpenAI, Azure OpenAI, AWS Bedrock, Google, Vertex AI, and other OpenAI-compatible APIs.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$Can I try LibreChat without installing it?$q$, $q$Yes, a public demo is available at chat.librechat.ai.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$Does LibreChat support multiple users?$q$, $q$Yes, it includes multi-user authentication with OAuth2, LDAP, and email login, plus an admin UI for managing users, groups, and roles.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$Unified internal AI chat$q$, $q$Organizations self-host LibreChat to give employees a single interface for multiple LLM providers.$q$, $q$IT and engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$Custom AI assistants$q$, $q$Teams build no-code agents with tool access using LibreChat Agents and MCP support.$q$, $q$Developers and technical teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$Code-assisted workflows$q$, $q$Developers use the sandboxed Code Interpreter to run and test code across multiple languages inside chat.$q$, $q$Developers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$overview$q$, $q$What is LibreChat?$q$, 2, ARRAY[$q$LibreChat is a free, open-source AI platform that brings together conversations with multiple AI models and providers, including Anthropic, OpenAI, Azure, AWS Bedrock, and Google, into a single customizable interface.$q$, $q$The project is MIT-licensed and self-hosted, with features such as a sandboxed code interpreter, no-code agents with MCP tool support, and enterprise authentication options like OAuth2 and LDAP. LibreChat has joined ClickHouse to support an open-source agentic data stack.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', $q$who-its-for$q$, $q$Who LibreChat is for$q$, 2, ARRAY[$q$LibreChat is aimed at developers, organizations, and enterprises that want a self-hosted, customizable AI chat platform supporting multiple model providers, code execution, and enterprise-grade authentication.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('465b7b09-9fa2-4ab9-9a80-e441a1effd0a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Jan ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, privacy-focused desktop app for running local and cloud AI models as a ChatGPT alternative.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Jan is a free, Apache 2.0-licensed, open-source desktop app for chatting with local or cloud AI models, available for Mac, Windows, and Linux.$q$,
  og_description = $q$Jan is a free, Apache 2.0-licensed, open-source desktop app for chatting with local or cloud AI models, available for Mac, Windows, and Linux.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9cc30e55-3b4a-4b57-88bd-393a5082ac87';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9cc30e55-3b4a-4b57-88bd-393a5082ac87' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$Local model downloads$q$, $q$Download and run LLMs such as Llama, Gemma, and Qwen directly from HuggingFace.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$Cloud provider integration$q$, $q$Connect to cloud providers including OpenAI and Anthropic alongside local models.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$Custom AI assistants$q$, $q$Create custom assistants tailored to specific tasks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$OpenAI-compatible local API$q$, $q$Exposes an OpenAI-compatible API on localhost for use with other applications.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$Model Context Protocol support$q$, $q$Supports MCP for connecting external tools to models.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$Free and open source under the Apache 2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$Runs entirely locally for privacy, with the option to connect to cloud providers when needed$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$Available on Windows, macOS, and Linux$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$Exposes a local OpenAI-compatible API for integration with other tools$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$Large, active community with over 6 million downloads$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$No paid or enterprise tier, so there is no vendor support contract available$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$Local model performance depends on the user's own hardware$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$Some features, such as persistent memory, are still in development$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$Is Jan free?$q$, $q$Yes, Jan is free and open source under the Apache 2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$Does Jan require an internet connection?$q$, $q$No, Jan can run models entirely locally, though it can also connect to cloud providers such as OpenAI and Anthropic if desired.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$What platforms does Jan support?$q$, $q$Jan is available for Windows 10+, macOS 13.6+, and Linux (deb, AppImage, and Arm64 builds).$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$Can Jan be used with other applications?$q$, $q$Yes, Jan exposes an OpenAI-compatible API on localhost that other applications can call.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$Private local AI chat$q$, $q$Users run AI models entirely on their own device without sending data to the cloud.$q$, $q$Privacy-conscious individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$Multi-model experimentation$q$, $q$Developers download and compare different open models from HuggingFace within a single app.$q$, $q$Developers and AI enthusiasts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$Local API for custom tools$q$, $q$Developers build applications against Jan's local OpenAI-compatible API endpoint.$q$, $q$Developers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$overview$q$, $q$What is Jan?$q$, 2, ARRAY[$q$Jan is a free, open-source desktop application that lets users run AI models locally as a privacy-focused alternative to cloud chat assistants. It supports downloading open models such as Llama, Gemma, and Qwen from HuggingFace, as well as connecting to cloud providers like OpenAI and Anthropic.$q$, $q$Jan is licensed under Apache 2.0 and available for Windows, macOS, and Linux. It also exposes a local, OpenAI-compatible API so other applications can use the models it runs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', $q$who-its-for$q$, $q$Who Jan is for$q$, 2, ARRAY[$q$Jan is designed for users who want a private, local-first AI chat experience without vendor lock-in, including developers who want to experiment with open models or build tools against a local API.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9cc30e55-3b4a-4b57-88bd-393a5082ac87', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── GPT4All ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source desktop app for running open-source LLMs privately on your own computer.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$GPT4All is a free, MIT-licensed, open-source desktop app by Nomic AI for running local LLMs privately on Windows, macOS, and Linux.$q$,
  og_description = $q$GPT4All is a free, MIT-licensed, open-source desktop app by Nomic AI for running local LLMs privately on Windows, macOS, and Linux.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bdd55166-9401-4b99-9213-184d1c7c5807';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bdd55166-9401-4b99-9213-184d1c7c5807' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$Local model execution$q$, $q$Runs open-source language models directly on Windows, macOS, and Linux without cloud connectivity.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$LocalDocs$q$, $q$Chat with your own local documents privately, without sending data externally.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$No API or GPU required$q$, $q$Can be downloaded and used immediately without API calls or dedicated GPU hardware.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$Vulkan GPU support$q$, $q$Accelerates inference using NVIDIA and AMD graphics cards via Vulkan.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$Python client$q$, $q$Integrates with LangChain and vector databases through an official Python client.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$Free and open source under the MIT license, including for commercial use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$Runs entirely on-device with no cloud dependency$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$Available on Windows, macOS, and Linux$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$LocalDocs feature enables private document chat$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$Backed by Nomic AI, an active maintainer$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$Performance is limited by the user's local hardware$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$No official managed cloud or enterprise support tier for GPT4All itself$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$Model selection and quality depend on which open-source models are available to load$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$Is GPT4All free?$q$, $q$Yes, GPT4All is open source under the MIT license and free to use, including for commercial purposes.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$Does GPT4All need the internet?$q$, $q$No, GPT4All runs language models locally on your device and does not require cloud connectivity or API calls.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$What platforms does GPT4All support?$q$, $q$GPT4All supports Windows (including Windows ARM), macOS, and Ubuntu/Linux.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$Who develops GPT4All?$q$, $q$GPT4All is developed by Nomic AI.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$Offline AI chat$q$, $q$Users run LLMs on their own laptop or desktop without needing an internet connection.$q$, $q$Privacy-focused individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$Private document chat$q$, $q$Users query their own local files privately using the LocalDocs feature.$q$, $q$Individuals and small teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$Local AI development$q$, $q$Developers integrate GPT4All models into Python applications via the official client and LangChain.$q$, $q$Developers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$overview$q$, $q$What is GPT4All?$q$, 2, ARRAY[$q$GPT4All is a free, open-source desktop application, developed by Nomic AI, that runs open-source language models privately on a user's own computer. It requires no cloud connectivity, API calls, or dedicated GPU.$q$, $q$The project is MIT-licensed and available for Windows, macOS, and Linux. It includes a LocalDocs feature for private, local document chat and a Python client that integrates with LangChain and vector databases.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', $q$who-its-for$q$, $q$Who GPT4All is for$q$, 2, ARRAY[$q$GPT4All is aimed at individuals, developers, and teams who want to run AI models fully on-device for privacy, security, or offline use, without relying on cloud infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bdd55166-9401-4b99-9213-184d1c7c5807', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── Ollama ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Tool for running open-source LLMs locally, with optional paid cloud plans for scaled usage.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$20/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Ollama lets you run open-source LLMs locally for free, with optional paid Pro ($20/mo) and Max ($100/mo) cloud plans for extra usage.$q$,
  og_description = $q$Ollama lets you run open-source LLMs locally for free, with optional paid Pro ($20/mo) and Max ($100/mo) cloud plans for extra usage.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c830bb2b-1cd7-47d7-b6a1-c48147945ecf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c830bb2b-1cd7-47d7-b6a1-c48147945ecf' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$Local model execution$q$, $q$Run open-source language models on your own machine via a command-line install.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$Cloud scaling$q$, $q$Scale beyond local hardware using Ollama's cloud infrastructure when needed.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$Offline capability$q$, $q$Run models fully offline for mission-critical or disconnected work.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$Data privacy$q$, $q$Ollama states that user data is never trained on.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$Ecosystem integrations$q$, $q$Integrates with applications such as Claude Code.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$Free to run models locally with no account required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$Simple command-line installation and model management$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$Available on macOS, Windows, and Linux$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$Optional cloud tiers add hosted capacity for running multiple models concurrently$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$States that user data is not used for training$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$Local performance depends entirely on the user's own hardware$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$Cloud Pro and Max plans add a recurring subscription cost for higher usage$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$Running larger models locally can require significant RAM/VRAM$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$Is Ollama free?$q$, $q$Yes, running Ollama locally is free. Paid Pro ($20/month or $200/year) and Max ($100/month) plans add expanded cloud usage for running multiple models concurrently.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$What platforms does Ollama support?$q$, $q$Ollama can be downloaded and installed on macOS (14 Sonoma or later), Windows, and Linux.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$Does Ollama require the cloud?$q$, $q$No, Ollama can run entirely offline using local models, with cloud usage as an optional add-on for extra capacity.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$What's the difference between Ollama's Pro and Max plans?$q$, $q$Pro ($20/month) allows running 3 cloud models simultaneously with increased usage, while Max ($100/month) allows 10 concurrent cloud models with even higher usage limits.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$Local LLM development$q$, $q$Developers run and test open models on their own machines for building AI-powered applications.$q$, $q$Developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$Offline / air-gapped AI work$q$, $q$Teams that need models to run without internet access rely on Ollama's fully local execution.$q$, $q$Security-sensitive teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$Scaled cloud inference$q$, $q$Users who need more concurrent model capacity than local hardware allows upgrade to a paid cloud plan.$q$, $q$Power users and small teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$Free$q$, $q$$0$q$, NULL, $q$["Local Ollama usage","Basic cloud access with an account"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$Pro$q$, $q$$20/month$q$, $q$monthly$q$, $q$["3 concurrent cloud models","50x increased cloud usage vs. free"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$Max$q$, $q$$100/month$q$, $q$monthly$q$, $q$["10 concurrent cloud models","5x more usage than Pro"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$overview$q$, $q$What is Ollama?$q$, 2, ARRAY[$q$Ollama is a tool for running open-source language models locally on macOS, Windows, and Linux via a simple command-line install. It is free to use for local execution.$q$, $q$Ollama also offers optional cloud infrastructure, with datacenters in the United States, Europe, and Singapore, and paid Pro and Max plans for users who need to run more models concurrently or need extra usage beyond the free tier.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', $q$who-its-for$q$, $q$Who Ollama is for$q$, 2, ARRAY[$q$Ollama is used by developers and organizations building applications with open models, ranging from hobbyists running models on personal hardware to teams that scale up using Ollama's paid cloud plans.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c830bb2b-1cd7-47d7-b6a1-c48147945ecf', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── LocalAI ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted runtime for running LLMs, vision, speech, and image models on your own hardware.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$LocalAI is a free, MIT-licensed, open-source runtime for self-hosting text, vision, speech, and image AI models on your own hardware.$q$,
  og_description = $q$LocalAI is a free, MIT-licensed, open-source runtime for self-hosting text, vision, speech, and image AI models on your own hardware.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c416cb1e-8524-43e0-a740-2a092903d5fe';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c416cb1e-8524-43e0-a740-2a092903d5fe' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$Modular backend architecture$q$, $q$60+ backends that load on demand to support different model types.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$Multi-modal support$q$, $q$Runs language, vision, voice, image generation, and agentic models in one runtime.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$Hardware flexibility$q$, $q$Runs on CPU, NVIDIA, AMD, Intel, Apple Silicon, and other accelerators.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$Built-in agents$q$, $q$Supports MCP tools, memory, and RAG for agentic use cases.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$Realtime voice$q$, $q$WebRTC streaming with transcription and text-to-speech.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$Privacy controls$q$, $q$Keeps data on-premise, with PII detection and redaction options.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$Completely free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$Runs many model types (text, vision, speech, image) in a single runtime$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$Broad hardware support, including CPU-only and Apple Silicon$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$Extensible via open gRPC backend contracts$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$Keeps data on-premise for privacy-sensitive deployments$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$No managed cloud or enterprise support tier; deployment and scaling are self-managed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$Running multiple model types can require substantial local hardware resources$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$Setup and backend configuration require technical familiarity$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$Is LocalAI free?$q$, $q$Yes, LocalAI is completely free and open source under the MIT license, with no paid tiers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$What kinds of models can LocalAI run?$q$, $q$LocalAI can run text, vision, speech, image generation, and agentic models through its modular backend system.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$What hardware does LocalAI support?$q$, $q$LocalAI runs on CPU as well as NVIDIA, AMD, Intel, and Apple Silicon accelerators.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$How is LocalAI deployed?$q$, $q$LocalAI can be installed via Docker or traditional installation methods for self-hosting.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$Self-hosted multi-modal AI$q$, $q$Teams run text, vision, speech, and image models on their own infrastructure without cloud dependency.$q$, $q$Developers and infrastructure teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$Privacy-sensitive AI deployment$q$, $q$Organizations that must keep data on-premise use LocalAI's PII detection and redaction features.$q$, $q$Regulated or privacy-focused organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$Custom AI agents$q$, $q$Developers build agentic workflows using LocalAI's built-in MCP tools, memory, and RAG support.$q$, $q$Developers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$overview$q$, $q$What is LocalAI?$q$, 2, ARRAY[$q$LocalAI is a free, open-source runtime that lets users deploy multiple types of AI models, including text, vision, speech, image, and agentic models, on their own hardware, from laptops to distributed GPU clusters.$q$, $q$The project is MIT-licensed and features a modular backend architecture with 60+ on-demand backends, support for a wide range of hardware accelerators, and built-in privacy controls such as on-premise data handling and PII redaction.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', $q$who-its-for$q$, $q$Who LocalAI is for$q$, 2, ARRAY[$q$LocalAI is aimed at developers and organizations that want private, self-hosted AI infrastructure independent of cloud providers, ranging from individual users to enterprise teams needing authentication and distributed scaling.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c416cb1e-8524-43e0-a740-2a092903d5fe', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── vLLM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$vLLM is an open-source, high-throughput inference and serving engine for large language models, licensed under Apache-2.0.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$vLLM: open-source, high-throughput LLM inference and serving engine with PagedAttention, broad hardware support, and an OpenAI-compatible API.$q$,
  og_description = $q$vLLM: open-source, high-throughput LLM inference and serving engine with PagedAttention, broad hardware support, and an OpenAI-compatible API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1abf3a7b-a12c-4d0b-8925-d4026402d4e5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1abf3a7b-a12c-4d0b-8925-d4026402d4e5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$PagedAttention$q$, $q$Efficient memory management for attention keys/values that enables high-throughput serving of large language models.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Continuous batching$q$, $q$Dynamically batches incoming requests together to maximize GPU utilization and throughput.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$OpenAI-compatible API server$q$, $q$Includes a server compatible with the OpenAI API format, plus an Anthropic Messages API, for drop-in integration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Broad hardware support$q$, $q$Runs on NVIDIA and AMD GPUs, Google TPUs, Intel Gaudi/XPU, AWS Neuron, Huawei Ascend NPU, Apple Silicon, and CPUs.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Quantization support$q$, $q$Supports FP8, INT8, INT4, GPTQ, AWQ, and GGUF quantization formats to reduce memory footprint.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Distributed inference$q$, $q$Supports tensor, pipeline, data, and expert parallelism for serving very large models across multiple devices.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Wide model compatibility$q$, $q$Supports 200+ Hugging Face model architectures, including decoder-only, mixture-of-experts, and multimodal models.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Multi-LoRA support$q$, $q$Serves multiple LoRA adapters simultaneously on top of a shared base model.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Free and open source under the Apache-2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$State-of-the-art serving throughput via PagedAttention and continuous batching$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Supports a wide range of hardware backends beyond just NVIDIA GPUs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Large, active community with 2,000+ contributors and 86.5k+ GitHub stars$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$OpenAI-compatible API simplifies integration with existing tooling$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Requires self-hosting; there is no managed/hosted offering from the vLLM project itself$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Requires GPU infrastructure and operational expertise to run at scale$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$No official commercial support or SLA from the project$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Is vLLM free to use?$q$, $q$Yes. vLLM is fully open source under the Apache-2.0 license, with no paid tier offered by the project itself.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$What license does vLLM use?$q$, $q$vLLM is licensed under Apache-2.0.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$What hardware does vLLM support?$q$, $q$NVIDIA and AMD GPUs, Google TPUs, Intel Gaudi and XPU, AWS Neuron Accelerators, Huawei Ascend NPU, Apple Silicon, and CPU inference.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Does vLLM provide an OpenAI-compatible API?$q$, $q$Yes, vLLM includes an OpenAI-compatible API server, along with support for tool calling and structured output.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Who maintains vLLM?$q$, $q$vLLM originated at UC Berkeley's Sky Computing Lab and is now maintained by a community of over 2,000 contributors.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Self-hosted LLM inference$q$, $q$Teams deploy vLLM on their own GPU infrastructure to serve open-source LLMs with high throughput and low latency.$q$, $q$ML engineers and infrastructure teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Production API serving$q$, $q$Organizations use vLLM's OpenAI-compatible API server to run self-hosted open-source models behind a familiar interface.$q$, $q$Backend and platform engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Research and experimentation$q$, $q$Researchers use vLLM to benchmark and serve new open-source model architectures efficiently.$q$, $q$AI researchers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$overview$q$, $q$What is vLLM?$q$, 2, ARRAY[$q$vLLM is an open-source library for large language model inference and serving, originally developed at UC Berkeley's Sky Computing Lab and now maintained by a community of more than 2,000 contributors. It is released under the Apache-2.0 license with no paid tier from the project itself.$q$, $q$The engine is built around PagedAttention and continuous batching to deliver high serving throughput, and it exposes an OpenAI-compatible API server so it can be dropped into existing tooling. It supports 200+ Hugging Face model architectures and runs across NVIDIA and AMD GPUs, Google TPUs, Intel Gaudi and XPU, AWS Neuron, Huawei Ascend NPU, Apple Silicon, and CPUs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$who-its-for$q$, $q$Who vLLM is for$q$, 2, ARRAY[$q$vLLM suits engineering and research teams that want to self-host open-source LLMs with production-grade throughput, rather than relying solely on commercial hosted APIs. It requires infrastructure and GPU operations expertise since it is a self-hosted library, not a managed service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── LiteLLM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$LiteLLM is an open-source LLM gateway providing a unified, OpenAI-compatible API to 100+ providers, with a paid Enterprise tier.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$LiteLLM offers a unified OpenAI-compatible API for 100+ LLM providers, with an open-source core and a paid Enterprise tier for SSO and support.$q$,
  og_description = $q$LiteLLM offers a unified OpenAI-compatible API for 100+ LLM providers, with an open-source core and a paid Enterprise tier for SSO and support.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '02fc0fca-7896-41fa-8356-751971c7a3eb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '02fc0fca-7896-41fa-8356-751971c7a3eb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Unified multi-provider API$q$, $q$A single OpenAI-compatible interface for calling 100+ LLM providers, including OpenAI, Anthropic, Azure, AWS Bedrock, Google Vertex AI, and vLLM.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Spend tracking$q$, $q$Tracks and attributes LLM spend by API key, user, team, or organization.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Load balancing and fallbacks$q$, $q$Automatically retries and falls back across providers or models to improve reliability.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Virtual keys and budgets$q$, $q$Issues scoped virtual API keys with configurable budgets for teams and projects.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Guardrails and logging integrations$q$, $q$Integrates with observability tools such as Langfuse and Arize Phoenix, and supports guardrails.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Admin dashboard$q$, $q$Provides a dashboard for monitoring usage and managing access across an organization.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Flexible deployment$q$, $q$Usable as a Python SDK for direct integration or as a standalone proxy/gateway server.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Open source with a genuinely free, full-featured self-hosted tier$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Supports 100+ LLM providers through one OpenAI-compatible API$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Built-in cost tracking, budgeting, and load balancing$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Active project backed by Y Combinator (W23) with 52k+ GitHub stars$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Used in production by companies such as Netflix and Lemonade, per the vendor's site$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Enterprise features (SSO, SCIM, 24/7 support, SLAs) require a paid, custom-priced plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Enterprise pricing is not publicly listed and requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Self-hosted deployment requires infrastructure management$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Is LiteLLM free?$q$, $q$Yes, the open-source version is free and includes core LLM integrations, spend tracking, logging, and guardrails. A separate Enterprise tier adds custom pricing.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$How many LLM providers does LiteLLM support?$q$, $q$LiteLLM supports 100+ providers, including OpenAI, Anthropic, Azure, AWS Bedrock, Google Vertex AI, Cohere, Mistral, and vLLM.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$What's included in LiteLLM Enterprise?$q$, $q$SSO, OIDC/JWT auth, SCIM, team/org admin controls, key rotation, secret manager integrations, 24/7 support, and SLAs.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Can I try LiteLLM Enterprise before buying?$q$, $q$Yes, LiteLLM offers a 30-day trial key for the Enterprise tier.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Who builds LiteLLM?$q$, $q$LiteLLM is built by BerriAI, a Y Combinator (W23) company.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Multi-provider LLM routing$q$, $q$Teams call 100+ LLM providers through a single OpenAI-compatible interface, avoiding vendor lock-in.$q$, $q$AI engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Cost governance for LLM usage$q$, $q$Organizations use LiteLLM's spend tracking and budgets to attribute and cap LLM costs per team or project.$q$, $q$Platform and finance teams overseeing AI spend$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Enterprise LLM gateway$q$, $q$Larger organizations deploy LiteLLM Enterprise for SSO, audit logging, and SLA-backed support around an internal LLM gateway.$q$, $q$Enterprise IT and security teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Open Source$q$, $q$Free$q$, NULL, $q$["100+ LLM provider integrations","Spend tracking and logging","Guardrails integrations (Langfuse, Arize Phoenix)","Load balancing and fallbacks"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$Enterprise$q$, $q$Custom (contact sales)$q$, NULL, $q$["SSO, OIDC/JWT auth, SCIM","Team/org admin controls","Key rotation and secret manager integration","24/7 support and SLAs","30-day trial key available"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$overview$q$, $q$What is LiteLLM?$q$, 2, ARRAY[$q$LiteLLM is an open-source LLM gateway built by BerriAI that gives developers a single, OpenAI-compatible API for calling more than 100 LLM providers, including OpenAI, Anthropic, Azure, AWS Bedrock, and Google Vertex AI. It can be used as a Python SDK or deployed as a standalone proxy/gateway server.$q$, $q$The open-source core is free and includes spend tracking, load balancing, fallbacks, virtual keys, and integrations with observability tools like Langfuse and Arize Phoenix. A separate LiteLLM Enterprise tier adds SSO, SCIM, team/org administration, key rotation, and 24/7 support with SLAs, priced on a custom, contact-sales basis.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', $q$who-its-for$q$, $q$Who LiteLLM is for$q$, 2, ARRAY[$q$LiteLLM fits engineering teams that call multiple LLM providers and want a consistent API, centralized cost tracking, and reliability features like fallback routing, without building that layer themselves. Organizations needing SSO, audit logs, or contractual support can upgrade to the Enterprise tier.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('02fc0fca-7896-41fa-8356-751971c7a3eb', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── OpenRouter ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$OpenRouter is a pay-as-you-go API platform providing unified access to 400+ AI models from 70+ providers.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = NULL,
  founded_year = 2023,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OpenRouter provides a single API for 400+ AI models across 70+ providers, with pay-as-you-go credits and some free-tier models.$q$,
  og_description = $q$OpenRouter provides a single API for 400+ AI models across 70+ providers, with pay-as-you-go credits and some free-tier models.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '54b33467-c0e1-45e4-b29f-69b5ce8ea2dd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '54b33467-c0e1-45e4-b29f-69b5ce8ea2dd' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$Unified API$q$, $q$A single OpenAI SDK-compatible endpoint provides access to 400+ models across 70+ providers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$Automatic failover$q$, $q$Routes requests to alternate providers if one experiences downtime, improving availability.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$Pay-as-you-go credits$q$, $q$No subscription required; users purchase credits that can be spent across any supported model.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$Free models$q$, $q$A subset of models is usable at no cost, subject to daily request limits.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$Bring your own key (BYOK)$q$, $q$Users can connect their own provider API keys; the first 1M requests per month are free, with a 5% fee afterward.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$Provider and price routing$q$, $q$Requests can be routed by price or performance, with custom data policies for organizations.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$Access to 400+ models from 70+ providers through one API$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$No markup on inference costs beyond the direct provider price, per the vendor's site$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$Free models are available with daily rate limits, requiring no payment$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$Automatic provider fallback improves availability$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$Reports a large user base of 10M+ users, per the vendor's site$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$No subscription/managed plan; usage is entirely pay-as-you-go via credits$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$Credit purchases via Stripe incur a 5.5% fee (minimum $0.80); crypto purchases incur 5%$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$Free models are rate-limited (50-1,000 requests/day) and unsuitable for production volume$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$Not open source$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$Is OpenRouter free to use?$q$, $q$OpenRouter has no subscription fee; you pay for model usage via prepaid credits. A limited set of free models is available with daily rate limits.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$How does OpenRouter pricing work?$q$, $q$You purchase credits (5.5% fee via Stripe, minimum $0.80, or 5% via crypto) and spend them on inference at the underlying provider's list price.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$What are OpenRouter's free model limits?$q$, $q$50 requests per day without purchased credits, or 1,000 requests per day once you've purchased at least $10 in credits.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$Can I use my own API keys with OpenRouter?$q$, $q$Yes, BYOK is supported. The first 1M requests per month are free, after which a 5% fee applies.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$How many models does OpenRouter support?$q$, $q$OpenRouter aggregates 400+ models from 70+ providers through a single API.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$Multi-model experimentation$q$, $q$Developers test and compare many LLMs through one API without separate accounts for each provider.$q$, $q$Developers and AI product builders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$Provider redundancy$q$, $q$Applications route requests through OpenRouter to automatically fail over to alternate providers during outages.$q$, $q$Engineering teams building production AI apps$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$Low-cost prototyping$q$, $q$Builders use OpenRouter's free-tier models to prototype before committing to paid usage.$q$, $q$Indie developers and hobbyists$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$Pay-as-you-go credits$q$, $q$Variable (per-model provider pricing)$q$, NULL, $q$["Credits usable across 400+ models","5.5% fee on Stripe purchases (min $0.80)","5% fee on crypto purchases","No markup over provider inference pricing"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$Free models$q$, $q$$0$q$, NULL, $q$["50 requests/day without credits","1,000 requests/day with $10+ in credits purchased"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$overview$q$, $q$What is OpenRouter?$q$, 2, ARRAY[$q$OpenRouter is a unified API platform that gives developers access to 400+ language models from 70+ providers through a single, OpenAI SDK-compatible endpoint. Rather than a subscription, it runs on prepaid credits: users buy credits (via Stripe, with a 5.5% fee and $0.80 minimum, or via crypto at 5%) and spend them across any supported model at the provider's list price.$q$, $q$The platform also offers a set of free models with daily rate limits (50 requests/day by default, rising to 1,000/day after purchasing $10 or more in credits), automatic failover between providers, and support for bringing your own provider API keys.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', $q$who-its-for$q$, $q$Who OpenRouter is for$q$, 2, ARRAY[$q$OpenRouter suits developers and teams who want to try or switch between many LLMs without managing separate provider accounts, and applications that need automatic provider fallback for reliability. Its free models and low entry cost also make it accessible for prototyping and hobby projects.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('54b33467-c0e1-45e4-b29f-69b5ce8ea2dd', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Together AI ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Together AI is a cloud platform offering serverless inference, fine-tuning, and GPU clusters for open-source AI models.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = NULL,
  founded_year = 2022,
  company_size = NULL,
  headquarters = $q$San Francisco, California$q$,
  languages = '{}',
  seo_meta_description = $q$Together AI offers pay-per-token inference, fine-tuning, and on-demand GPU clusters (H100/H200/B200) for open-source AI models.$q$,
  og_description = $q$Together AI offers pay-per-token inference, fine-tuning, and on-demand GPU clusters (H100/H200/B200) for open-source AI models.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '95e1413b-980b-4a7c-a0da-8b7353d2474d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '95e1413b-980b-4a7c-a0da-8b7353d2474d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$Serverless inference$q$, $q$On-demand, pay-per-token access to chat, vision, image, video, audio, and embedding models.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$Fine-tuning$q$, $q$Supports SFT and DPO fine-tuning of open-source models, priced per 1M tokens and scaling with model size.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$Dedicated and provisioned inference$q$, $q$Reserved throughput and dedicated model/container inference with up to 99% uptime SLA.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$GPU clusters$q$, $q$On-demand or reserved (181+ day) access to H100, H200, and B200 GPUs for training and compute.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$Batch inference$q$, $q$Asynchronous processing for large-scale inference workloads.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$Managed storage and sandboxes$q$, $q$Storage optimized for AI workloads plus code sandbox environments, each billed separately.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$Wide range of serverless models with transparent per-token pricing$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$Combines fine-tuning, dedicated inference, and raw GPU cluster access on one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$Reserved GPU pricing (181+ days) is cheaper than on-demand rates$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$Backed by significant funding, including an $800M Series C, per the vendor's site$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$Purchased credits never expire, per Together AI's billing documentation$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$No free trial; Together AI's documentation states a minimum $5 credit purchase is required to access the platform$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$Reserved/dedicated capacity pricing for some tiers requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$Fully prepaid model — API access stops if the account balance reaches zero$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$Does Together AI offer a free trial?$q$, $q$No. Together AI's documentation states it does not currently offer free trials.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$What's the minimum to start using Together AI?$q$, $q$A minimum $5 credit purchase is required to access the platform.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$What GPUs does Together AI offer?$q$, $q$On-demand and reserved access to NVIDIA H100 ($3.99/GPU-hour on-demand), H200 ($5.99/GPU-hour), and B200 ($8.19/GPU-hour).$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$Does Together AI support fine-tuning?$q$, $q$Yes, it supports SFT and DPO fine-tuning priced per 1M tokens, with pricing that scales with model size.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$When was Together AI founded?$q$, $q$Together AI was founded in 2022.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$Serverless model inference$q$, $q$Developers call open-source and proprietary models on demand via a token-priced API without managing infrastructure.$q$, $q$AI application developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$Model fine-tuning$q$, $q$Teams fine-tune open-source models using SFT or DPO on Together AI's managed infrastructure.$q$, $q$ML engineers customizing models$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$GPU cluster training$q$, $q$Organizations rent on-demand or reserved H100/H200/B200 GPU clusters for large-scale training or inference.$q$, $q$AI infrastructure and research teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$Production-grade dedicated inference$q$, $q$Companies use provisioned throughput and dedicated inference with uptime SLAs for production workloads.$q$, $q$Enterprises running AI at scale$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$Serverless Inference$q$, $q$From $0.03 per 1M input tokens (varies by model)$q$, NULL, $q$["Pay-per-token pricing","Chat, vision, image, video, audio, and embedding models","$5 minimum credit purchase to access the platform"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$Fine-Tuning$q$, $q$From $0.48 per 1M tokens (SFT, models up to 16B)$q$, NULL, $q$["SFT and DPO fine-tuning","Pricing scales with model size (16B to 100B+)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$GPU Clusters (On-Demand)$q$, $q$$3.99 per GPU-hour (H100)$q$, NULL, $q$["H100, H200, and B200 GPUs","On-demand or reserved (181+ day) pricing"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$Dedicated Inference$q$, $q$$5.49 per GPU-hour (H100, on-demand)$q$, NULL, $q$["Reserved capacity","Up to 99% uptime SLA"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$overview$q$, $q$What is Together AI?$q$, 2, ARRAY[$q$Together AI is a cloud platform, founded in 2022, for running, fine-tuning, and training AI models. It offers serverless inference priced per token, fine-tuning (SFT and DPO) for open-source models, dedicated and provisioned inference with SLAs, and on-demand or reserved GPU clusters (H100, H200, B200).$q$, $q$The platform is fully prepaid: Together AI's documentation states it does not currently offer free trials and requires a minimum $5 credit purchase to access the platform, though purchased credits never expire.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', $q$who-its-for$q$, $q$Who Together AI is for$q$, 2, ARRAY[$q$Together AI fits teams that want to run or fine-tune open-source models without managing their own GPU infrastructure, as well as organizations that need raw, on-demand or reserved GPU capacity for training and large-scale inference.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95e1413b-980b-4a7c-a0da-8b7353d2474d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Fireworks AI ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Fireworks AI is a pay-as-you-go inference platform for running, fine-tuning, and deploying open-source generative AI models at scale.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = NULL,
  founded_year = 2022,
  company_size = NULL,
  headquarters = $q$Redwood City, California, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Fireworks AI offers pay-per-token inference, fine-tuning, and dedicated GPU deployments for open-source LLM, vision, and audio models.$q$,
  og_description = $q$Fireworks AI offers pay-per-token inference, fine-tuning, and dedicated GPU deployments for open-source LLM, vision, and audio models.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'aff64b96-3f9d-4b60-acba-86586aac9085';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'aff64b96-3f9d-4b60-acba-86586aac9085' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$Serverless inference$q$, $q$Pay-per-token access to 30+ hosted open-source models across LLM, vision, image, and audio categories.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$On-demand GPU deployments$q$, $q$Dedicated deployments on H100, H200, B200, and B300 GPUs, billed hourly from $7.00/hour, with multi-region and custom model support.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$Reserved capacity$q$, $q$Guaranteed capacity and higher quotas for predictable, high-volume workloads.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$Fine-tuning and LoRA$q$, $q$Supervised and preference fine-tuning (SFT, DPO), priced per million training tokens, with LoRA and full-parameter options.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$Reinforcement fine-tuning$q$, $q$RL-based fine-tuning billed per GPU hour at on-demand deployment rates.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$OpenAI- and Anthropic-compatible APIs$q$, $q$Drop-in API compatibility to ease migration from other model providers.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$Cached and batch token discounts$q$, $q$Cached input tokens and batch inference are billed at 50% of standard rates.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$Pay-per-token serverless pricing with no infrastructure to manage$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$Wide model catalog spanning LLM, vision, image, and audio$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$OpenAI- and Anthropic-compatible APIs simplify migration$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$50% discounts on cached and batch inference tokens$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$Dedicated on-demand GPU deployments for high-throughput workloads$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$No ongoing free plan, only an initial $1 credit for new accounts$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$Usage-based billing across many models and GPU tiers makes cost estimation complex$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$Reserved and enterprise pricing require contacting sales$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$Requires API/code integration; no no-code interface$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$Does Fireworks AI offer a free trial?$q$, $q$New accounts receive $1 in free credits to test the serverless API before paying.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$What pricing model does Fireworks AI use?$q$, $q$Pay-per-token serverless pricing, plus on-demand and reserved GPU deployments billed hourly, starting at $7.00/hour for an H100 80GB.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$Can I fine-tune models on Fireworks AI?$q$, $q$Yes, it supports LoRA and full-parameter supervised (SFT) and preference (DPO) fine-tuning, priced per million training tokens.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$Is Fireworks AI compatible with OpenAI's API?$q$, $q$Yes, Fireworks provides OpenAI- and Anthropic-compatible API endpoints.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$What GPUs are available for on-demand deployments?$q$, $q$H100 80GB, H200 141GB, B200 180GB, and B300 288GB, billed hourly from $7.00 up to $12.00.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$Serving open-source LLMs in production$q$, $q$Teams deploy chat, code, and reasoning models like DeepSeek, GLM, and Qwen behind an OpenAI-compatible API without managing GPU infrastructure.$q$, $q$Engineering teams building AI products$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$Fine-tuning models on proprietary data$q$, $q$ML engineers run LoRA or full-parameter SFT/DPO fine-tuning jobs priced per million training tokens.$q$, $q$ML engineers customizing models$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$High-throughput dedicated inference$q$, $q$Companies with steady traffic reserve on-demand GPU capacity (H100/H200/B200/B300) instead of paying per token.$q$, $q$Scale-stage AI companies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$Serverless$q$, $q$Pay-per-token (varies by model)$q$, NULL, $q$["Postpaid, usage-based billing","High rate limits","50% discount on cached input tokens","50% discount on batch inference"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$On-Demand$q$, $q$From $7.00/hour (H100 80GB / H200 141GB)$q$, NULL, $q$["Dedicated GPU deployments","Multi-region support","Custom model hosting","B200 at $10/hr, B300 at $12/hr"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$Reserved$q$, $q$Custom$q$, NULL, $q$["Guaranteed capacity","Higher quotas","Contact sales for pricing"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom contracts","Contact sales"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$overview$q$, $q$What is Fireworks AI?$q$, 2, ARRAY[$q$Fireworks AI is an inference platform for running, fine-tuning, and serving open-source generative AI models, including LLM, vision, image, and audio models such as DeepSeek, GLM, Kimi, Qwen, Gemma, and FLUX.$q$, $q$Pricing is pay-per-token on the serverless tier, with on-demand dedicated GPU deployments (H100, H200, B200, B300) and reserved capacity for high-volume or latency-sensitive workloads.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', $q$who-its-for$q$, $q$Who Fireworks AI is for$q$, 2, ARRAY[$q$Fireworks AI suits engineering and ML teams that want to serve or fine-tune open-source models via an OpenAI-compatible API without managing their own GPU infrastructure, from early-stage prototypes on the serverless tier to scale-stage companies needing reserved or dedicated capacity.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aff64b96-3f9d-4b60-acba-86586aac9085', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Replicate ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Replicate lets developers run, fine-tune, and deploy open-source machine learning models through a pay-per-second API.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$From $0.000100/second (CPU compute)$q$,
  founded_year = 2019,
  company_size = NULL,
  headquarters = $q$San Francisco, California, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Replicate is a pay-per-use API for running thousands of open-source ML models and deploying custom models with Cog.$q$,
  og_description = $q$Replicate is a pay-per-use API for running thousands of open-source ML models and deploying custom models with Cog.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '60180cba-c779-4a42-9314-22aade49a3a1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '60180cba-c779-4a42-9314-22aade49a3a1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$Run community-published models$q$, $q$Access thousands of open-source models covering image, video, speech, and language tasks with a few lines of code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$Fine-tune image models$q$, $q$Customize image models such as SDXL with your own training data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$Custom model deployment with Cog$q$, $q$Cog is Replicate's open-source packaging tool for deploying proprietary models to Replicate's infrastructure.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$Autoscaling infrastructure$q$, $q$Deployments scale up and down automatically, including to zero, with no charges while idle.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$Built-in monitoring$q$, $q$Logging and performance metrics are included for deployed models.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$Hardware-based billing$q$, $q$Per-second pricing across CPU and GPU types, from small CPU instances up to 8x A100 80GB.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$Pay-per-second billing with no charges when scaled to zero$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$Large catalog of community and major-lab models, including from OpenAI, Google, and Anthropic$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$Cog packaging tool is open source, easing custom model deployment$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$Enterprise plans include dedicated account managers and volume discounts$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$No published free tier or trial credits$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$Costs can be hard to predict across many differently priced hardware and model combinations$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$Requires code/API integration; no no-code interface$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$Now part of Cloudflare following its 2025 acquisition, which could shift its long-term roadmap$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$Does Replicate offer a free plan?$q$, $q$No published free tier or trial credits were found; billing is pay-per-second or pay-per-output from the first request.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$What is Cog?$q$, $q$Cog is Replicate's open-source tool for packaging machine learning models so they can be deployed on Replicate's infrastructure.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$Is Replicate still an independent product?$q$, $q$Yes. Following its acquisition by Cloudflare (announced November 2025), Replicate continues operating under its own brand with the same API.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$How is Replicate priced?$q$, $q$Most models are billed per second of hardware usage (CPU or GPU); some hosted models are billed per token, image, or video second instead.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$What hardware is available for private model deployments?$q$, $q$CPU and GPU options including Nvidia T4, L40S, and A100 80GB, with multi-GPU configurations up to 8x.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$Running pre-built AI models via API$q$, $q$Developers call thousands of open-source models (image, video, speech, LLM) with a few lines of code without hosting infrastructure themselves.$q$, $q$Application developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$Fine-tuning image generation models$q$, $q$Teams fine-tune models like SDXL on their own images for branded or custom outputs.$q$, $q$Product and design teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$Deploying proprietary models at scale$q$, $q$Organizations package custom models with Cog and deploy them behind an autoscaling API.$q$, $q$ML teams shipping custom models$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$Pay-as-you-go$q$, $q$From $0.000100/second (CPU)$q$, NULL, $q$["Billed per second of compute","No charge when scaled to zero","GPU options from T4 to 8x A100 80GB"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Dedicated account manager","Priority support","Higher GPU limits","Volume discounts"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$overview$q$, $q$What is Replicate?$q$, 2, ARRAY[$q$Replicate is a cloud API platform for running open-source machine learning models, including image, video, speech, and language models from organizations like OpenAI, Google, and Black Forest Labs.$q$, $q$Developers can also package and deploy their own models using Cog, Replicate's open-source model-packaging tool, with infrastructure that autoscales to zero when idle.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', $q$who-its-for$q$, $q$Who Replicate is for$q$, 2, ARRAY[$q$Replicate suits developers who want to call open-source AI models via API without hosting GPUs themselves, as well as ML teams deploying proprietary models on autoscaling infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('60180cba-c779-4a42-9314-22aade49a3a1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Modal ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Modal is a serverless cloud platform for running Python code, AI inference, and training workloads with usage-based GPU pricing.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (Starter plan includes $30/month in compute credits)$q$,
  founded_year = 2021,
  company_size = NULL,
  headquarters = $q$New York, New York, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Modal is a serverless Python cloud for AI inference and training, with a free tier of $30/month in compute credits.$q$,
  og_description = $q$Modal is a serverless Python cloud for AI inference and training, with a free tier of $30/month in compute credits.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c5f50ff9-292d-461f-9877-3ee54d35032f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c5f50ff9-292d-461f-9877-3ee54d35032f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Python-native SDK$q$, $q$Deploy code to the cloud directly from Python without separate infrastructure configuration.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Sub-second cold starts$q$, $q$Instant autoscaling across GPUs with sub-second cold-start times.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Multi-GPU support$q$, $q$Jobs scale up to 128 B200 GPUs with high-speed networking.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Global GPU infrastructure$q$, $q$Compute runs across multiple clouds and regions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Production observability$q$, $q$Integrated logging and monitoring for deployed functions.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Broad workload support$q$, $q$Runs LLM inference, multi-modal inference, fine-tuning, reinforcement learning, and coding agent workloads.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Granular usage-based billing$q$, $q$Per-second billing for GPU, CPU, and memory, e.g. Nvidia H100 at $0.001097/second.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Genuine free tier: $30/month in compute credits on the Starter plan$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Per-second billing for GPU, CPU, and memory keeps costs granular$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Sub-second cold starts for GPU-backed functions$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Python-native workflow with no separate infrastructure config$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Academic grants up to $10,000 for researchers and graduate students$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Team plan adds a $250/month base fee on top of compute usage$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Enterprise features like HIPAA compliance and SSO require contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Starter plan is capped at 3 seats and 100 containers$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Usage-based GPU/CPU/memory pricing requires active cost monitoring$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Does Modal have a free plan?$q$, $q$Yes, the Starter plan is free and includes $30/month in compute credits, up to 3 seats, and 100 containers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$How is Modal priced?$q$, $q$Per-second billing for GPU, CPU, and memory (e.g., Nvidia H100 at $0.001097/second), plus a $250/month base fee on the Team plan.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$What GPUs does Modal support?$q$, $q$GPUs including Nvidia B300, H100, A100 80GB, L4, and T4, with multi-GPU jobs scaling up to 128 B200s.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Does Modal offer academic pricing?$q$, $q$Yes, academic grants of up to $10,000 are available for graduate students and researchers.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$What compliance features does Modal offer?$q$, $q$The Enterprise plan includes HIPAA compliance, Okta SSO, and audit logs.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Serving AI inference in production$q$, $q$Teams deploy LLM and multi-modal inference endpoints with sub-second cold starts on autoscaling GPUs.$q$, $q$ML platform teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Running Python batch and training jobs$q$, $q$Data scientists run large-scale batch processing, fine-tuning, and RL rollouts using Modal's Python SDK without managing servers.$q$, $q$Data scientists and ML engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Academic and research compute$q$, $q$Graduate students and researchers access GPU compute through Modal's academic grant program.$q$, $q$Academic researchers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Starter$q$, $q$Free ($30/month in compute credits)$q$, $q$monthly$q$, $q$["3 workspace seats","100 containers, 10 GPU concurrency","Limited scheduled/web functions"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Team$q$, $q$$250/month + compute$q$, $q$monthly$q$, $q$["$100/month in free credits","Unlimited seats","1,000 containers, 50 GPU concurrency","Unlimited scheduled functions","Custom domains, static IP proxy, deployment rollbacks"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Volume-based discounts","Unlimited seats and higher GPU concurrency","Embedded ML engineering services","Private Slack support","Audit logs, Okta SSO, HIPAA compliance"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$overview$q$, $q$What is Modal?$q$, 2, ARRAY[$q$Modal is a serverless cloud compute platform for running Python code, AI inference, training, batch processing, and sandboxes, with sub-second cold starts and instant autoscaling across GPUs.$q$, $q$The Starter plan is free and includes $30/month in compute credits; paid plans add per-second GPU, CPU, and memory billing, with the Team plan starting at $250/month plus usage.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', $q$who-its-for$q$, $q$Who Modal is for$q$, 2, ARRAY[$q$Modal suits Python developers and ML teams that need on-demand GPU or CPU compute for inference, training, or batch jobs, from individuals using the free Starter tier to enterprises needing HIPAA compliance and SSO.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5f50ff9-292d-461f-9877-3ee54d35032f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── RunPod ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$RunPod is a cloud GPU platform for training, fine-tuning, and deploying AI models with pay-per-second, no-contract pricing.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$From $0.27/hour (RTX A5000 Pod)$q$,
  founded_year = 2022,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$RunPod offers on-demand and serverless GPU cloud compute for AI training and inference, billed per second with no contracts.$q$,
  og_description = $q$RunPod offers on-demand and serverless GPU cloud compute for AI training and inference, billed per second with no contracts.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '33a2e54d-ea2a-4eac-b6c4-dbd80828337e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '33a2e54d-ea2a-4eac-b6c4-dbd80828337e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$GPU Pods$q$, $q$Reserved or Spot GPU instances for development and long-running jobs, billed hourly or per second.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Serverless autoscaling$q$, $q$Endpoints autoscale from 0 to thousands of workers with sub-200ms cold starts via FlashBoot.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Instant Clusters$q$, $q$Multi-GPU distributed compute for large-scale training.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Wide GPU selection$q$, $q$30+ GPU SKUs, from RTX 3090 to B300, available across 31 global regions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Persistent network storage$q$, $q$Network storage with no egress fees.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Zero idle cost$q$, $q$Serverless endpoints incur no charges while inactive.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Compliance and reliability$q$, $q$SOC 2 Type II compliance, network isolation options, and 99.9%-99.99% uptime SLA.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Per-second billing with no contracts or minimum commitments$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Wide GPU selection (30+ SKUs) from RTX 3090 to B300$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Serverless endpoints cost nothing when idle$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$No egress fees on persistent network storage$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$SOC 2 Type II compliance available$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$No published free tier or trial credits$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Spot instances are interruptible, unsuitable for uninterrupted workloads$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Pricing varies widely across 30+ GPU SKUs, complicating cost planning$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Reserved capacity discounts require contacting sales for enterprise-scale deployments$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Does RunPod offer a free tier?$q$, $q$No free tier or trial credits are published on RunPod's pricing page.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$How is RunPod priced?$q$, $q$Pods are billed hourly or per second by GPU type, from $0.27/hour for an RTX A5000 up to $7.39/hour for a B300, and Serverless is billed based on actual usage.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$What is FlashBoot?$q$, $q$FlashBoot is RunPod's technology for sub-200ms cold starts on Serverless endpoints.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Does RunPod charge for idle Serverless endpoints?$q$, $q$No, Serverless endpoints cost nothing when idle and autoscale from zero.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$When was RunPod founded?$q$, $q$RunPod was founded on October 31, 2022.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Training and fine-tuning models on dedicated GPUs$q$, $q$ML engineers rent Reserved or Spot GPU Pods by the hour to train or fine-tune models without buying hardware.$q$, $q$ML engineers and researchers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Serving AI inference at scale$q$, $q$Developers deploy Serverless endpoints that autoscale to zero and back, paying only for active usage.$q$, $q$AI product teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Multi-GPU distributed training$q$, $q$Organizations use Instant Clusters for multi-node, multi-GPU training jobs.$q$, $q$AI research teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Pods (Reserved/Spot)$q$, $q$From $0.27/hour (RTX A5000)$q$, NULL, $q$["Hourly or per-second billing","30+ GPU SKUs","31 global regions","Spot pricing for interruptible workloads"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Serverless$q$, $q$From $1.75/hour equivalent usage (L40/L40S workers)$q$, NULL, $q$["Autoscale 0 to thousands of workers","Sub-200ms cold starts (FlashBoot)","Zero idle cost"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$Instant Clusters$q$, $q$Custom$q$, NULL, $q$["Multi-GPU distributed compute","Reserved capacity for large-scale training"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$overview$q$, $q$What is RunPod?$q$, 2, ARRAY[$q$RunPod is a cloud GPU platform offering on-demand Pods, autoscaling Serverless endpoints, and Instant Clusters for AI training, fine-tuning, and inference.$q$, $q$Pricing is per-second or hourly across 30+ GPU SKUs, from $0.27/hour for an RTX A5000 up to $7.39/hour for a B300, with no contracts or minimum commitments.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', $q$who-its-for$q$, $q$Who RunPod is for$q$, 2, ARRAY[$q$RunPod suits ML engineers and AI teams that need on-demand GPU capacity for training or inference without long-term contracts, from single-GPU experimentation to multi-node distributed training via Instant Clusters.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('33a2e54d-ea2a-4eac-b6c4-dbd80828337e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Baseten ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Baseten is a managed inference platform for deploying and scaling AI/ML models in production, with cloud, self-hosted, and hybrid deployment options.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$0/month (usage-based billing applies)$q$,
  founded_year = 2019,
  company_size = NULL,
  headquarters = $q$San Francisco, CA, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Explore Baseten, an AI model inference platform offering dedicated deployments, optimized model APIs, and self-hosted or hybrid production infrastructure.$q$,
  og_description = $q$Explore Baseten, an AI model inference platform offering dedicated deployments, optimized model APIs, and self-hosted or hybrid production infrastructure.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5ad76bbb-468c-4854-b144-baf5844135c5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5ad76bbb-468c-4854-b144-baf5844135c5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Dedicated Inference$q$, $q$Deploy custom, open-source, and fine-tuned models at scale on dedicated compute.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Pre-optimized Model APIs$q$, $q$Call pre-optimized foundation and open-source models (LLMs, embeddings, transcription, image generation) with per-token pricing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Model Training$q$, $q$Train models and deploy them from the same platform using on-demand compute.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Baseten Chains$q$, $q$Orchestrate compound AI pipelines with granular hardware control for each step of the workflow.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Global Infrastructure$q$, $q$Cross-cloud deployment infrastructure with fast cold starts and a claimed 99.99% uptime.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Self-hosted and hybrid deployment$q$, $q$Run models inside a customer's own VPC, or combine self-hosted capacity with Baseten Cloud.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Compliance$q$, $q$Platform infrastructure is SOC 2 Type II and HIPAA compliant.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Supports fully managed cloud, self-hosted, and hybrid deployment models$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Usage-based pricing on the Basic tier avoids a fixed monthly minimum$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$SOC 2 Type II and HIPAA compliance built into the platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Published customer list includes Notion, HubSpot, Cursor, ClickUp, and Harvey$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Free credits available for new accounts to explore the platform$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Pro and Enterprise plan pricing is quote-only and not published$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Priority GPU access, custom SLAs, and self-host deployments require contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Usage-based compute costs (per-token, per-minute) can be harder to predict than flat-rate plans$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Does Baseten offer a free plan?$q$, $q$Baseten's Basic tier is $0/month with pay-as-you-go usage billing, and new accounts receive free credits to explore the platform.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Can Baseten be self-hosted?$q$, $q$Yes. Baseten supports self-hosted deployment in a customer's own VPC, as well as hybrid setups combining self-hosted capacity with Baseten Cloud.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$What compliance certifications does Baseten have?$q$, $q$Baseten states its platform is SOC 2 Type II and HIPAA compliant.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$How is Baseten priced?$q$, $q$Baseten uses usage-based pricing: per-token rates for Model APIs and per-minute/hour billing for dedicated GPU/CPU deployments. Pro and Enterprise tiers add volume discounts available on request.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Deploying custom and fine-tuned models$q$, $q$Teams deploy custom, open-source, or fine-tuned ML models to dedicated infrastructure with autoscaling.$q$, $q$ML engineers and AI product teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Serving pre-optimized foundation models$q$, $q$Developers call pre-optimized model APIs (LLMs, embeddings, transcription, image generation) with per-token pricing instead of managing their own inference infrastructure.$q$, $q$Application developers building AI features$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Compound AI pipelines$q$, $q$Baseten Chains lets teams orchestrate multi-step AI pipelines with independent hardware control for each step.$q$, $q$AI infrastructure teams building multi-model workflows$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Regulated or high-security workloads$q$, $q$SOC 2 Type II and HIPAA compliance, plus self-hosted/hybrid deployment options, support teams with strict data residency or compliance requirements.$q$, $q$Enterprises in healthcare, finance, or other regulated industries$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Basic$q$, $q$$0/month base + usage$q$, $q$monthly$q$, $q$["Dedicated deployments","Model APIs","Training","Fast cold starts","SOC 2 Type II and HIPAA compliance","Email and in-app chat support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Pro$q$, $q$Custom (volume discounts, contact sales)$q$, NULL, $q$["Priority GPU access","Dedicated compute","Higher API rate limits","Hands-on engineering support","Dedicated Slack/Zoom support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$Enterprise$q$, $q$Custom (contact sales)$q$, NULL, $q$["Custom SLAs","Self-host deployments","On-demand flex compute","Cloud commitment support","Full data residency control","Advanced security and compliance","Custom global regions","Advanced RBAC with Teams"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$overview$q$, $q$What is Baseten?$q$, 2, ARRAY[$q$Baseten is an inference platform for deploying and scaling AI and ML models in production. It offers dedicated deployments for custom, open-source, and fine-tuned models, along with pre-optimized model APIs for common workloads like LLMs, embeddings, transcription, and image generation.$q$, $q$The platform can be used as a fully managed cloud service (Baseten Cloud), self-hosted inside a customer's own VPC, or in a hybrid configuration that combines both. Its infrastructure is SOC 2 Type II and HIPAA compliant.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', $q$who-its-for$q$, $q$Who Baseten is for$q$, 2, ARRAY[$q$Baseten is aimed at ML engineers and AI product teams that need to move models from experimentation to production without building and maintaining their own inference infrastructure, as well as regulated organizations that need self-hosted or hybrid deployment for data residency reasons.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5ad76bbb-468c-4854-b144-baf5844135c5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Anyscale ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Anyscale is a managed AI platform built on the open-source Ray framework for scaling distributed Python, ML training, and LLM workloads.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$0.0135/hr (pay-as-you-go compute)$q$,
  founded_year = 2019,
  company_size = NULL,
  headquarters = $q$San Francisco, CA, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Anyscale offers a managed, pay-as-you-go platform built on Ray for scaling AI training, batch inference, and distributed Python workloads.$q$,
  og_description = $q$Anyscale offers a managed, pay-as-you-go platform built on Ray for scaling AI training, batch inference, and distributed Python workloads.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'be678c6c-acd6-4ec2-a468-efd166188d17';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'be678c6c-acd6-4ec2-a468-efd166188d17' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Managed Ray platform$q$, $q$Fully managed infrastructure for Ray, the open-source distributed computing framework originally built at UC Berkeley's RISELab.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Distributed model training$q$, $q$Scale model training jobs across pooled GPU clusters using simple Python decorator-based APIs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Multimodal data processing$q$, $q$Curate and process large-scale video, image, text, and audio datasets.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Batch embeddings and inference$q$, $q$Generate batch embeddings and run large-scale batch inference workloads.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Multi-cloud orchestration$q$, $q$Deploy across AWS, GCP, Azure, Nebius, and CoreWeave.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Fine-grained hardware allocation$q$, $q$Allocate CPU, GPU, and TPU resources at the workload level.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Enterprise access controls$q$, $q$SSO, SAML, SCIM, and audit logs are available for BYOC and enterprise deployments.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Native framework support$q$, $q$Built-in support for PyTorch, vLLM, and XGBoost through Ray libraries.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Built and maintained by the original creators of the open-source Ray framework$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Offers both fully hosted and Bring-Your-Own-Cloud (BYOC) deployment models$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Multi-cloud support across AWS, GCP, Azure, Nebius, and CoreWeave$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$$100 in free credits available for new users to try the platform$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Enterprise-grade access controls (SSO, SAML, SCIM, audit logs) on BYOC/enterprise tiers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Pricing for higher-end GPU families (H/B/GB series) is quote-only$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Hosted tier is limited to VM deployments in a limited set of regions$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Getting full value requires familiarity with Ray's distributed Python programming model$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$What is Anyscale built on?$q$, $q$Anyscale is a managed platform built on Ray, the open-source distributed computing framework originally created at UC Berkeley's RISELab.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Does Anyscale have a free tier?$q$, $q$New users receive $100 in Anyscale credits at signup, plus low-cost template projects, though there is no permanent free plan.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Can Anyscale run in my own cloud?$q$, $q$Yes. Anyscale offers a Bring Your Own Cloud (BYOC) option that runs on any cloud, region, or on-premises environment inside the customer's own VPC.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$What clouds does Anyscale support?$q$, $q$Anyscale supports multi-cloud orchestration across AWS, GCP, Azure, Nebius, and CoreWeave.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$How is Anyscale priced?$q$, $q$Anyscale uses pay-as-you-go compute pricing, from $0.0135/hr for CPU-only instances up to about $4.96/hr for NVIDIA A100 GPUs, with contact-for-pricing on higher-end GPU families and committed-use contracts for volume discounts.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Distributed model training$q$, $q$Teams scale model training jobs across pooled GPU clusters using Ray's Python APIs without hand-managing cluster infrastructure.$q$, $q$ML engineers training large models$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Batch inference and embeddings$q$, $q$Organizations generate embeddings and run large-scale batch inference jobs across multimodal data (video, image, text, audio).$q$, $q$Data and AI platform teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Post-training LLM workloads$q$, $q$Teams run post-training workloads using frameworks like SkyRL and veRL on Anyscale's managed Ray infrastructure.$q$, $q$LLM research and post-training teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Enterprise BYOC deployments$q$, $q$Enterprises with data residency or compliance needs run Anyscale inside their own cloud VPC or on-premises with SSO/SAML/SCIM access controls.$q$, $q$Enterprise platform and security teams$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Hosted$q$, $q$Pay-as-you-go compute, from $0.0135/hr$q$, NULL, $q$["Limited regions, VM-only deployment","Anyscale-managed infrastructure","Business-hours support","5 support case submissions"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Bring Your Own Cloud (BYOC)$q$, $q$Custom (contact sales)$q$, NULL, $q$["Deploy on any cloud, region, or on-premises","VM or Kubernetes deployment","Runs inside the customer's own VPC","Use existing GPU reservations","24/7 enterprise support with unlimited case submissions"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$overview$q$, $q$What is Anyscale?$q$, 2, ARRAY[$q$Anyscale is a managed AI infrastructure platform built around Ray, the open-source distributed computing framework. It lets teams scale distributed model training, multimodal data processing, batch embeddings, and post-training LLM workloads across pooled GPU clusters using simple Python APIs.$q$, $q$Anyscale can run as a hosted service on Anyscale-managed infrastructure or as Bring Your Own Cloud (BYOC), deploying into a customer's own VPC across AWS, GCP, Azure, Nebius, or CoreWeave, with enterprise access controls such as SSO, SAML, SCIM, and audit logs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$who-its-for$q$, $q$Who Anyscale is for$q$, 2, ARRAY[$q$Anyscale is aimed at ML engineers and AI platform teams already using or considering Ray for distributed Python workloads, as well as enterprises that need BYOC deployment with strong access controls for data residency or compliance reasons.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Ray ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Ray is an open-source distributed computing framework for scaling Python and AI/ML workloads from a laptop to thousands of GPUs.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Ray: open-source distributed computing framework for scaling Python, model training, batch inference, and LLM workloads.$q$,
  og_description = $q$Ray: open-source distributed computing framework for scaling Python, model training, batch inference, and LLM workloads.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2cf05821-b645-4a5c-9cb3-a492d371211f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2cf05821-b645-4a5c-9cb3-a492d371211f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$Distributed Python execution$q$, $q$Scale native Python code across a cluster without rewriting it for distributed systems.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$Ray Train$q$, $q$Run distributed training for deep learning, time series, and traditional ML models across GPU clusters.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$Ray Serve$q$, $q$Deploy models for online serving with independent scaling and fractional GPU/CPU resource allocation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$Ray Data$q$, $q$Process structured and unstructured data, including images, video, and audio, for batch and offline inference.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$Ray RLlib$q$, $q$Build and run reinforcement learning workloads with a library designed for production use.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$LLM workflow support$q$, $q$Dedicated capabilities for large language model inference, fine-tuning, and generative AI pipelines.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$Free and open source with an active community (34.8k+ GitHub stars, 1,000+ contributors)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$Scales the same Python code from a laptop to thousands of GPUs without a major rewrite$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$Covers most of the ML lifecycle (data processing, training, tuning, serving) in one framework$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$Framework-agnostic and compatible with multiple ML libraries$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$Steep learning curve for teams new to distributed systems concepts$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$A fully managed hosted platform (Anyscale) is a separate commercial product, not part of core Ray$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$Debugging distributed workloads can be more complex than debugging single-machine scripts$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$Is Ray free to use?$q$, $q$Yes, Ray is open source and free to use. Anyscale, built by Ray's creators, offers a separate commercial managed platform for teams that want a hosted service.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$Who maintains Ray?$q$, $q$Ray is developed and maintained primarily by Anyscale, Inc., alongside open-source contributors.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$What can Ray be used for?$q$, $q$Ray supports distributed Python execution, model training, batch inference, model serving, and reinforcement learning, including workflows for large language models.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$Does Ray require a GPU cluster to run?$q$, $q$No, Ray can run on a single laptop, but it is designed to scale across heterogeneous CPU/GPU clusters when needed.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$Distributed model training$q$, $q$Teams train foundation models, time series models, and traditional ML models across GPU clusters using Ray Train.$q$, $q$ML engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$LLM inference and fine-tuning$q$, $q$Ray provides dedicated capabilities for large language model inference, fine-tuning, and generative AI workflows.$q$, $q$AI/LLM engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$Batch and online inference at scale$q$, $q$Ray Data and Ray Serve let teams run offline batch inference and deploy models with independent, fractional resource scaling.$q$, $q$MLOps teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$Reinforcement learning research$q$, $q$Ray RLlib provides a library for building and running production reinforcement learning workloads.$q$, $q$RL researchers$q$, 3);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$overview$q$, $q$What is Ray?$q$, 2, ARRAY[$q$Ray is an open-source distributed computing framework, described by its maintainers as "the AI compute engine," that lets teams scale Python-based machine learning and AI workloads from a single laptop to clusters of thousands of GPUs.$q$, $q$The framework includes libraries for distributed training (Ray Train), model serving (Ray Serve), batch data processing (Ray Data), hyperparameter tuning, and reinforcement learning (Ray RLlib), covering much of the ML lifecycle within a single ecosystem. It is developed and maintained primarily by Anyscale, Inc., which also offers a separate commercial managed platform for Ray.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', $q$who-its-for$q$, $q$Who Ray is for$q$, 2, ARRAY[$q$Ray is built for ML engineers, data scientists, and infrastructure teams who need to scale Python code, train or serve models across GPU clusters, or run large-scale batch inference and reinforcement learning workloads without re-architecting for distributed systems.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2cf05821-b645-4a5c-9cb3-a492d371211f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Label Studio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Label Studio is an open-source data labeling and AI evaluation platform for computer vision, NLP, audio, and LLM workflows.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$99/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Label Studio: open-source data labeling platform for computer vision, NLP, audio, and LLM/RLHF evaluation workflows.$q$,
  og_description = $q$Label Studio: open-source data labeling platform for computer vision, NLP, audio, and LLM/RLHF evaluation workflows.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b86f2d2c-9242-4ac1-8381-48bac80db6dd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b86f2d2c-9242-4ac1-8381-48bac80db6dd' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$Multi-modal labeling$q$, $q$Annotate images, video, audio, text, documents, and time-series data in one configurable interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$AI evaluation tools$q$, $q$Review and score LLM outputs, RAG responses, and agentic traces for AI evaluation workflows.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$ML-assisted labeling$q$, $q$Speed up annotation using model predictions and active learning.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$API and Python SDK$q$, $q$Automate labeling workflows and integrate with external ML pipelines programmatically.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$Webhook integrations$q$, $q$Connect labeling events to downstream systems and ML pipelines.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$Role-based access and quality workflows$q$, $q$Enterprise plan adds RBAC, quality controls, and analytics for larger annotation teams.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$Free, open-source Community Edition installable via pip, Docker, or Homebrew$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$Supports a wide range of data types and task types in one tool$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$Used by companies including Cloudflare, NVIDIA, Meta, IBM, and Intel, per the company$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$Extensible with an API, Python SDK, and webhooks$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$Enterprise-only features (SSO, advanced quality workflows, LLM-as-a-judge) require the paid Enterprise plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$Starter Cloud plan is capped at 12 users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$Enterprise pricing is only available by contacting sales$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$Is Label Studio free?$q$, $q$Yes, the Community Edition is free and open source. Paid Starter Cloud and Enterprise plans add hosting and additional enterprise features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$What is the difference between Community and Enterprise editions?$q$, $q$Enterprise adds features such as SSO, advanced quality workflows, LLM-as-a-judge evaluation, and dedicated support on top of the open-source core.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$Can I self-host Label Studio?$q$, $q$Yes, the Community Edition can be self-hosted via Docker, pip, or by building from source.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$Who develops Label Studio?$q$, $q$Label Studio is developed by HumanSignal, Inc.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$Computer vision annotation$q$, $q$Teams label images and video for classification, object detection, and segmentation.$q$, $q$Computer vision teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$LLM and RAG evaluation$q$, $q$Teams review and score LLM outputs, RAG responses, and agent traces as part of AI evaluation workflows.$q$, $q$AI/ML evaluation teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$NLP and document labeling$q$, $q$Teams perform OCR, named entity recognition, and sentiment annotation on text and documents.$q$, $q$NLP engineers$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$RLHF fine-tuning$q$, $q$Teams collect human feedback to fine-tune models through reinforcement learning from human feedback.$q$, $q$ML researchers$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Open source","Self-hosted via Docker or pip","Core multi-modal labeling toolkit"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$Starter Cloud$q$, $q$$99/user/month$q$, $q$monthly$q$, $q$["Fully hosted service","Up to 12 users","Multi-modal labeling platform","Role-based access control","Quality workflows"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["SSO (SAML/LDAP)","SOC2 and HIPAA compliant cloud or on-prem","LLM-as-a-judge","Auto-labeling and bulk labeling","Dedicated customer success manager"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$overview$q$, $q$What is Label Studio?$q$, 2, ARRAY[$q$Label Studio is an open-source platform for data labeling, AI evaluation, and human-in-the-loop workflows, built and maintained by HumanSignal, Inc.$q$, $q$It supports computer vision, NLP, audio, time-series, and multi-modal annotation tasks, plus newer AI evaluation capabilities such as LLM evaluation, RAG assessment, agentic trace review, and RLHF fine-tuning. The Community Edition is free and self-hostable, while Starter Cloud and Enterprise plans add hosting, collaboration, and compliance features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', $q$who-its-for$q$, $q$Who Label Studio is for$q$, 2, ARRAY[$q$Label Studio is built for data teams, ML engineers, and AI researchers who need to build labeled training datasets or evaluate model and agent outputs, whether they prefer a self-hosted open-source deployment or a hosted cloud plan.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b86f2d2c-9242-4ac1-8381-48bac80db6dd', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── CVAT ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$CVAT is an open-source (MIT) and cloud computer vision annotation tool for building image, video, and 3D training datasets.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$33/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$CVAT: open-source MIT-licensed computer vision annotation tool for images, video, and 3D data, with a paid CVAT Online cloud option.$q$,
  og_description = $q$CVAT: open-source MIT-licensed computer vision annotation tool for images, video, and 3D data, with a paid CVAT Online cloud option.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0d4608fd-3411-46e9-b7bd-86e6765d726c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0d4608fd-3411-46e9-b7bd-86e6765d726c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Image annotation$q$, $q$Draw bounding boxes, pixel-level masks, polygons, keypoints, and skeletons on images.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Video annotation$q$, $q$Track objects and skeleton graphs across video frames.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$3D point cloud annotation$q$, $q$Detect, classify, and track objects in 3D point cloud sequences.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Broad format support$q$, $q$Import and export to 20+ formats, including COCO, YOLO, Pascal VOC, KITTI, and Cityscapes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Cloud storage integration$q$, $q$Connect directly to S3, Azure Blob Storage, and Google Cloud Storage for data import.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Project management and QA$q$, $q$Manage projects with role-based access, validation stages, and progress monitoring.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Free, MIT-licensed, self-hostable Community Edition$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Supports images, video, and 3D point cloud annotation in one tool$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Broad export format support (20+ formats) for common computer vision frameworks$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Optional managed annotation service with human annotators for larger projects$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Free CVAT Online cloud tier is capped at 1 project and 3 tasks$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Enterprise self-hosted plan starts at $12,000 per year$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Higher usage limits and AI-assisted annotation features require paid Solo, Team, or Enterprise tiers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Is CVAT free?$q$, $q$Yes, CVAT Community Edition is free, open source (MIT license), and self-hostable. CVAT Online adds paid Free, Solo, Team, and Enterprise cloud tiers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$What license does CVAT use?$q$, $q$The CVAT Community Edition is released under the MIT License.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Can CVAT handle video and 3D data?$q$, $q$Yes, CVAT supports image, video (with object tracking), and 3D point cloud annotation.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Does CVAT offer managed annotation services?$q$, $q$Yes, CVAT offers managed annotation services with a network of annotators for larger labeling projects.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Self-hosted annotation$q$, $q$Teams that need full data control deploy the open-source CVAT Community Edition on their own infrastructure.$q$, $q$Privacy-sensitive engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Cloud-based team labeling$q$, $q$Small teams use CVAT Online's Solo or Team plans for hosted annotation without managing infrastructure.$q$, $q$Small computer vision teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Enterprise annotation programs$q$, $q$Larger organizations use CVAT Enterprise for self-hosted deployment with SSO, RBAC, and dedicated support.$q$, $q$Enterprise ML teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Outsourced labeling$q$, $q$Teams needing extra annotation capacity use CVAT's managed annotation service with a large annotator network.$q$, $q$Teams needing extra annotation capacity$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Free (CVAT Online)$q$, $q$$0$q$, NULL, $q$["1 project, 3 tasks","1 GB internal storage","1 cloud storage connection","API access","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Solo$q$, $q$$33/month ($23/month billed annually)$q$, $q$monthly$q$, $q$["Up to 10 projects","250 tasks","25 GB storage","3 cloud storage connections","10,000 AI agent calls/month"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Team$q$, $q$$33/user/month ($23/user/month billed annually, min. 2 users)$q$, $q$monthly$q$, $q$["SSO","Role-based access","Audit logs","50,000 AI agent calls/month","Scales up to 50 users"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$Enterprise$q$, $q$Starting at $12,000/year$q$, $q$annual$q$, $q$["Self-hosted infrastructure","Customizable for organizations of any size","Enhanced security and compliance"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$overview$q$, $q$What is CVAT?$q$, 2, ARRAY[$q$CVAT (Computer Vision Annotation Tool) is a platform for building image, video, and 3D point cloud datasets for computer vision AI. The Community Edition is open source under the MIT License and can be self-hosted, with copyright held by Intel Corporation and CVAT.ai Corporation.$q$, $q$Alongside the free self-hosted edition, CVAT.ai offers CVAT Online, a hosted cloud product with Free, Solo, and Team pricing tiers, plus a self-hosted CVAT Enterprise plan with SSO, RBAC, and dedicated support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', $q$who-its-for$q$, $q$Who CVAT is for$q$, 2, ARRAY[$q$CVAT is built for computer vision engineers and data teams that need to annotate images, video, or 3D point clouds, ranging from individual developers self-hosting the free Community Edition to enterprises using CVAT Online or CVAT Enterprise with compliance and support requirements.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0d4608fd-3411-46e9-b7bd-86e6765d726c', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Labelbox ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Labelbox provides data annotation, RL environments, and human feedback infrastructure for training and evaluating AI models.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Labelbox: data annotation, RL environments, and human feedback platform for training and evaluating AI models and agents.$q$,
  og_description = $q$Labelbox: data annotation, RL environments, and human feedback platform for training and evaluating AI models and agents.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5ff2b0e8-8acc-497e-9c48-da9f2af462a8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5ff2b0e8-8acc-497e-9c48-da9f2af462a8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Horizon$q$, $q$Generate RL environments and preference signals for post-training and evaluation across reasoning, tool use, and computer use.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Terra$q$, $q$Collect full-stack robotics data, including video, trajectories, and multimodal annotations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Alignerr$q$, $q$Access a network of subject-matter experts for human grounding and feedback signals.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Recursion$q$, $q$An RL platform for enterprises to build, evaluate, and deploy specialist AI agents.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Free tier$q$, $q$Includes 500 free Labelbox Units (LBU) per month to get started without a sales conversation.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Free tier available to start without a sales conversation$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Used by a large share of leading frontier AI labs, per the company$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Broad expert network for human feedback and grounding via Alignerr$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Covers data annotation, RL environments, and agent evaluation on one platform$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Usage-based billing (Labelbox Units) makes total cost harder to predict upfront$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Enterprise pricing and advanced features require contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Official pricing tiers beyond the free plan are not fully published on the public site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Is Labelbox free?$q$, $q$Labelbox offers a free tier that includes 500 free Labelbox Units (LBU) per month; usage beyond that and Enterprise features require a paid plan.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$What is a Labelbox Unit (LBU)?$q$, $q$An LBU is Labelbox's normalized billing unit; how quickly it is consumed varies by product (Catalog, Annotate, Model).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$What is Labelbox used for?$q$, $q$Labelbox provides data annotation, RL environments (Horizon), robotics data (Terra), human feedback (Alignerr), and an RL platform for AI agents (Recursion).$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Who uses Labelbox?$q$, $q$Labelbox states it partners with frontier AI research labs and enterprises building production AI agents.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$RL post-training and evaluation$q$, $q$Teams use Horizon to generate RL environments and preference signals for model post-training.$q$, $q$Frontier AI research teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Robotics data collection$q$, $q$Teams collect video, trajectory, and multimodal annotations for robotics models via Terra.$q$, $q$Robotics ML teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Human feedback and grounding$q$, $q$Teams access Labelbox's expert network (Alignerr) for human grounding signals.$q$, $q$AI training teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Specialist agent development$q$, $q$Enterprises use Recursion to build, evaluate, and deploy specialist AI agents on internal workflows.$q$, $q$Enterprise AI teams$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["500 free Labelbox Units (LBU) included each month"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Starter$q$, $q$Usage-based (billed per Labelbox Unit)$q$, $q$monthly$q$, $q$["Pay based on LBU consumption across Catalog, Annotate, and Model"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom contract via account team","Enterprise support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$overview$q$, $q$What is Labelbox?$q$, 2, ARRAY[$q$Labelbox describes itself as an RL data engine for AI teams, providing data, environments, and evaluation infrastructure for AI development. It includes Horizon for RL environments and preference signals, Terra for robotics data, Alignerr for access to human experts, and Recursion, an RL platform for building specialist AI agents.$q$, $q$The platform offers a free tier with 500 Labelbox Units (LBU) per month, usage-based billing on paid tiers, and custom Enterprise pricing for larger organizations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', $q$who-its-for$q$, $q$Who Labelbox is for$q$, 2, ARRAY[$q$Labelbox targets frontier AI research labs and enterprises building production-grade AI agents, offering both self-serve tooling for smaller teams and enterprise contracts for larger data, RL, and evaluation programs.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5ff2b0e8-8acc-497e-9c48-da9f2af462a8', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── SuperAnnotate ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SuperAnnotate is an enterprise data annotation and AI evaluation platform combining human expert labeling with AI training workflows.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2018,
  company_size = NULL,
  headquarters = $q$Silicon Valley, California, USA$q$,
  languages = '{}',
  seo_meta_description = $q$SuperAnnotate: enterprise data annotation and AI evaluation platform with custom UI, multimodal support, and expert annotation teams.$q$,
  og_description = $q$SuperAnnotate: enterprise data annotation and AI evaluation platform with custom UI, multimodal support, and expert annotation teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '53a0cb41-3c1b-499b-a369-31d2bb36357e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '53a0cb41-3c1b-499b-a369-31d2bb36357e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Custom annotation UI$q$, $q$Build tailored annotation interfaces for specific labeling needs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Multimodal support$q$, $q$Handle image, video, audio, text, and combined data types.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$AI workflow support$q$, $q$Supports RLHF, supervised fine-tuning (SFT), RAG, agent evaluation, and LLM assessment workflows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Multi-layer QA$q$, $q$Run multi-layer annotation workflows with expert review cycles.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Expert talent network$q$, $q$Access professionally managed annotation teams for larger labeling programs.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Enterprise integrations$q$, $q$Connects with Databricks, NVIDIA, GCP, Snowflake, AWS, and IBM.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Founded in 2018 with an established enterprise customer base$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$SOC 2 Type II and ISO/IEC 27001:2022 compliant infrastructure$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Supports a wide range of AI training and evaluation workflows (RLHF, SFT, RAG, agent evaluation)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Managed annotation talent network available alongside self-serve tooling$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$No public pricing; requires booking a demo or signing in to view plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Positioned toward enterprise customers rather than individual or small-team self-serve use$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Company size not publicly disclosed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Is SuperAnnotate pricing public?$q$, $q$No, SuperAnnotate does not publish pricing on its site; you need to book a demo or sign in for pricing details.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$When was SuperAnnotate founded?$q$, $q$SuperAnnotate was founded in 2018.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Where is SuperAnnotate headquartered?$q$, $q$SuperAnnotate is headquartered in Silicon Valley, California, USA.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$What compliance certifications does SuperAnnotate have?$q$, $q$SuperAnnotate states it maintains SOC 2 Type II and ISO/IEC 27001:2022 compliance.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Enterprise dataset creation$q$, $q$Enterprises build custom-labeled datasets for training and fine-tuning AI models.$q$, $q$Enterprise ML teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$LLM and agent evaluation$q$, $q$Teams use SuperAnnotate for RLHF, SFT, RAG, and agent evaluation workflows.$q$, $q$AI/LLM teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Multimodal annotation$q$, $q$Teams annotate image, video, audio, and text data through a custom-built UI.$q$, $q$Computer vision and NLP teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$Regulated-industry annotation$q$, $q$Organizations in healthcare, insurance, and autonomous driving use SuperAnnotate under SOC 2/ISO compliance.$q$, $q$Regulated industry teams$q$, 3);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$overview$q$, $q$What is SuperAnnotate?$q$, 2, ARRAY[$q$SuperAnnotate is a data annotation and AI evaluation platform, founded in 2018 and headquartered in Silicon Valley, California, that combines human expertise with AI development workflows.$q$, $q$The platform offers a custom annotation UI builder, multimodal data support, multi-layer QA workflows, and an expert annotation talent network, alongside integrations with enterprise data platforms such as Databricks, AWS, GCP, and Snowflake.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', $q$who-its-for$q$, $q$Who SuperAnnotate is for$q$, 2, ARRAY[$q$SuperAnnotate is built for enterprise organizations and foundation model developers building and evaluating LLMs, agents, and multimodal AI systems, including regulated industries such as healthcare, insurance, and autonomous driving.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53a0cb41-3c1b-499b-a369-31d2bb36357e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Roboflow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Roboflow is a computer vision platform for annotating, training, and deploying visual AI models used by over 1 million engineers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$79/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Roboflow: computer vision platform for annotating, training, and deploying object detection and image classification models.$q$,
  og_description = $q$Roboflow: computer vision platform for annotating, training, and deploying object detection and image classification models.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ee1d5a2e-e303-4d50-b144-230cf5daeaf1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ee1d5a2e-e303-4d50-b144-230cf5daeaf1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$AI-assisted annotation$q$, $q$Label images faster with AI-assisted annotation tools.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Hosted training$q$, $q$Train computer vision models using hosted GPU infrastructure.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Workflows$q$, $q$Build computer vision pipelines and applications using a low-code interface.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Flexible deployment$q$, $q$Run models on-device, at the edge, in a VPC, or via a hosted API.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Roboflow Universe$q$, $q$Browse open-source datasets and pre-trained models shared by the community.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Open-source libraries$q$, $q$Maintains open-source libraries including Supervision, Inference, and Autodistill.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Free Public plan includes $60/month in credits with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Used by more than 1 million engineers and over 16,000 organizations, per the company$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Covers the full workflow from annotation to training to deployment in one platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$SOC 2 Type 2 compliant with HIPAA-supporting infrastructure and BAAs available$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Core plan is limited to 3 users, with extra seats billed at $29/user/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Enterprise features (RBAC, priority GPU access, model monitoring) require custom Enterprise pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Credit-based billing on paid plans can complicate cost forecasting$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Is Roboflow free?$q$, $q$Yes, Roboflow has a free Public plan with $60/month in credits and no credit card required. Paid Core and Enterprise plans add private data, more credits, and enterprise features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$How much does Roboflow Core cost?$q$, $q$The Core plan costs $79/month billed annually or $99/month billed monthly.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Can I add more users to the Core plan?$q$, $q$Yes, up to 10 additional seats can be added at $29/user/month.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Does Roboflow offer open-source tools?$q$, $q$Yes, Roboflow maintains open-source libraries including Supervision, Inference, and Autodistill.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Model annotation and training$q$, $q$Teams label images and train computer vision models using Roboflow's hosted GPU infrastructure.$q$, $q$Computer vision engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Edge and API deployment$q$, $q$Teams deploy trained models to edge devices, VPCs, or via a hosted API.$q$, $q$MLOps and deployment teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Low-code CV pipelines$q$, $q$Teams build computer vision pipelines without extensive coding using the Workflows builder.$q$, $q$Developers and non-ML engineers$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Open dataset discovery$q$, $q$Developers use Roboflow Universe to find open-source datasets and pre-trained models.$q$, $q$ML researchers and hobbyists$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Public (Free)$q$, $q$$0/month$q$, $q$monthly$q$, $q$["$60/month in credits","2 users","Community support","Cloud deployment"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Core$q$, $q$$79/month (annual) / $99/month (monthly)$q$, $q$monthly$q$, $q$["3 users","Private data and models","Training analytics","Model evaluation","Concurrent training"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Edge deployment licensing","Priority GPU access","RBAC","Model monitoring","Advanced governance"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$overview$q$, $q$What is Roboflow?$q$, 2, ARRAY[$q$Roboflow is a computer vision platform that helps developers and enterprises annotate, train, and deploy visual AI applications, spanning video, images, and real-time streams.$q$, $q$The platform includes Annotate for AI-assisted labeling, Train for hosted GPU model training, Workflows for low-code pipeline building, and Deploy for running models on-device, at the edge, in a VPC, or via API, alongside the open-source Roboflow Universe dataset hub.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', $q$who-its-for$q$, $q$Who Roboflow is for$q$, 2, ARRAY[$q$Roboflow serves developers, machine learning engineers, and enterprises building computer vision applications across industries such as aerospace, automotive, healthcare, manufacturing, logistics, retail, and robotics.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee1d5a2e-e303-4d50-b144-230cf5daeaf1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Ultralytics ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Ultralytics develops YOLO, an open-source computer vision library, plus a cloud platform for annotation, training, and deployment.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$29/seat/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Ultralytics: open-source YOLO computer vision library plus a cloud platform for annotation, training, and model deployment.$q$,
  og_description = $q$Ultralytics: open-source YOLO computer vision library plus a cloud platform for annotation, training, and model deployment.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3ae68e89-7cc4-46ca-b15d-3b10568de023';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3ae68e89-7cc4-46ca-b15d-3b10568de023' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$YOLO model family$q$, $q$Native support for YOLOv5, YOLOv8, YOLO11, and YOLO26 for detection, segmentation, classification, and pose estimation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$Smart annotation$q$, $q$Annotation tools including SAM-powered mask generation, plus bounding boxes, polygons, and keypoints.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$Cloud training$q$, $q$Cloud-accelerated model training with access to 22+ GPU configurations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$Broad export support$q$, $q$Export trained models to 19+ formats, including ONNX, TensorRT, and CoreML.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$Global deployment$q$, $q$Deploy models across 43 global regions with auto-scaling.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$Dual licensing$q$, $q$AGPL-3.0 open-source license, with a separate Enterprise License for proprietary commercial use.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$Widely adopted open-source library (131.6k+ GitHub stars, 301M+ downloads, per the company)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$Free plan includes annotation, cloud training, and deployment capabilities$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$Broad export format support for many deployment targets$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$Enterprise License available for proprietary/commercial use without AGPL obligations$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$AGPL-3.0 license requires open-sourcing derivative works unless an Enterprise License is purchased$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$Free plan team size is limited to 1 member$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$Enterprise pricing is custom and quote-only$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$Is Ultralytics YOLO free?$q$, $q$Yes, the YOLO library is open source under the AGPL-3.0 license. An Enterprise License is available for proprietary commercial use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$What does the Ultralytics platform Free plan include?$q$, $q$The Free plan includes annotation, cloud training, and deployment, with 100 GB storage, up to 100 models, and $25 in one-time credits.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$How much does the Pro plan cost?$q$, $q$The Pro plan costs $29/seat/month and supports up to 5 team members with more storage and GPU options.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$What YOLO model versions does Ultralytics support?$q$, $q$Ultralytics natively supports YOLOv5, YOLOv8, YOLO11, and YOLO26.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$Open-source model development$q$, $q$Developers train and deploy YOLO models locally under the AGPL-3.0 license.$q$, $q$Open-source computer vision developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$Cloud-based annotation and training$q$, $q$Teams use the Ultralytics platform for smart, SAM-powered annotation and GPU-accelerated cloud training.$q$, $q$ML teams without local GPU infrastructure$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$Enterprise commercial deployment$q$, $q$Companies use the Enterprise License to embed YOLO in proprietary products without AGPL obligations.$q$, $q$Commercial product teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$Multi-format model deployment$q$, $q$Teams export trained models to formats like ONNX, TensorRT, and CoreML for varied deployment targets.$q$, $q$MLOps and deployment engineers$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["$25 one-time credits","100 GB storage","100 models","3 concurrent cloud trainings","1 team member","AGPL-3.0 license"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$Pro$q$, $q$$29/seat/month$q$, $q$monthly$q$, $q$["$30/seat/month in credits","500 GB storage","500 models","10 concurrent cloud trainings","Up to 5 team members","Cloud storage integrations (GCS, S3, Azure)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited storage, models, and deployments","On-premise deployment","SSO/SAML","Custom RBAC roles","ISO 27001 and SOC 2 compliance"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$overview$q$, $q$What is Ultralytics?$q$, 2, ARRAY[$q$Ultralytics develops YOLO (You Only Look Once), an open-source computer vision library, and an end-to-end platform unifying annotation, model training, and deployment.$q$, $q$The YOLO library is released under the AGPL-3.0 license, with an Enterprise License available for organizations that want to use YOLO in proprietary products without AGPL's open-source obligations. The Ultralytics platform adds a Free plan and a paid Pro plan for cloud-based annotation, training, and deployment.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', $q$who-its-for$q$, $q$Who Ultralytics is for$q$, 2, ARRAY[$q$Ultralytics serves developers who want a free, open-source YOLO library for local use, as well as teams and enterprises across manufacturing, healthcare, automotive, agriculture, retail, and logistics that need cloud-based training, deployment, or a commercial license.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ae68e89-7cc4-46ca-b15d-3b10568de023', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;


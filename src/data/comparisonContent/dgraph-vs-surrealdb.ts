import type { ToolComparisonContent } from './types';

const dgraphVsSurrealdbContent: ToolComparisonContent = {
  "verdict": "Dgraph is a focused, fully open-source graph database with a native GraphQL API and no commercial pricing to evaluate, while SurrealDB is a multi-model database (document, graph, vector, time-series, relational) with a published freemium/hourly pricing structure and an actively maintained managed cloud. The right pick depends on whether you need one data model done well and self-hosted, or several data models under one engine with a vendor-backed cloud option.",
  "bestForToolA": "Teams that specifically need a graph database with native GraphQL access, are comfortable self-hosting under Apache 2.0, and don't require a vendor-managed cloud or published SLA.",
  "bestForToolB": "Teams that want to consolidate document, graph, vector, and relational workloads into one engine, need AI/RAG-oriented features like agent memory and knowledge graphs, and want the option of an hourly-billed managed cloud or a custom Enterprise plan with SSO and audit logging.",
  "whoNeedsBoth": "Organizations already running a graph-only workload on Dgraph that are separately evaluating SurrealDB for a new AI/RAG or multi-model project may end up operating both rather than migrating existing graph data.",
  "keyDifferences": [
    {
      "title": "Data model scope",
      "toolA": "Purpose-built graph database with a native GraphQL API, property-graph queries, full-text search, regex matching, and geo search.",
      "toolB": "Multi-model engine unifying document, graph, vector, time-series, and relational data through a single query language, SurrealQL.",
      "whyItMatters": "Teams with a single, well-defined graph workload get a lean fit from Dgraph, while teams juggling several data shapes can avoid standing up multiple specialized databases with SurrealDB.",
      "benefitsWho": "Backend teams deciding whether to standardize infrastructure around one database engine or keep workloads separated by data type."
    },
    {
      "title": "Commercial backing and managed hosting",
      "toolA": "No published pricing and no confirmed active managed cloud offering; project ownership has moved from Dgraph Labs to Hypermode to Istari Digital.",
      "toolB": "Publishes an hourly-priced Start (free forever, 1 instance/1GB) and Scale plan, plus a custom Enterprise tier with SSO, audit logging, and FIPS-compliant cryptography.",
      "whyItMatters": "Organizations that need a vendor support contract, SLA, or managed hosting option can't currently rely on Dgraph's commercial status, whereas SurrealDB offers a documented path from free to enterprise.",
      "benefitsWho": "Teams that need vendor accountability or managed infrastructure rather than pure self-hosted operation."
    },
    {
      "title": "AI and agent-memory tooling",
      "toolA": "No AI or agent-memory features are documented.",
      "toolB": "Includes Spectron, a built-in agent memory system with entity extraction and knowledge graph construction, plus hybrid RAG and vector search.",
      "whyItMatters": "Teams building AI agents or RAG pipelines get purpose-built primitives from SurrealDB that Dgraph does not offer.",
      "benefitsWho": "AI/ML engineering teams building retrieval-augmented or agent-memory applications."
    },
    {
      "title": "Licensing and deployment model",
      "toolA": "Apache 2.0 open source, self-hosted only, with no company or pricing page to evaluate.",
      "toolB": "Freemium model combining a free self-hosted-capable Start tier with paid hourly cloud plans and a custom self-hosted Enterprise option.",
      "whyItMatters": "Dgraph is a pure self-hosting decision; SurrealDB lets teams start free, move to paid cloud, or self-host at the Enterprise tier as needs grow.",
      "benefitsWho": "Teams that want flexibility to move between self-hosted and managed deployment as a project scales."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Data Model",
      "rows": [
        {
          "feature": "Native graph queries",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Native GraphQL API",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-model (document/vector/time-series/relational)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "ACID transactions",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Live/real-time queries",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Commercial Support",
      "rows": [
        {
          "feature": "Free/open-source self-hosting",
          "toolA": "available",
          "toolB": "available",
          "note": "Dgraph is Apache 2.0; SurrealDB's Start plan is free forever with self-hosted Enterprise available."
        },
        {
          "feature": "Managed cloud offering",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Published commercial pricing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Enterprise SSO/audit logging",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Agent Features",
      "rows": [
        {
          "feature": "Built-in agent memory system",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "SurrealDB's Spectron system."
        },
        {
          "feature": "Vector search",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Hybrid RAG tooling",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Dgraph free to use?",
      "answer": "Yes, Dgraph is released under the Apache 2.0 open-source license and can be self-hosted at no cost, though no commercial pricing or managed cloud is currently documented."
    },
    {
      "question": "Does SurrealDB have a free tier?",
      "answer": "Yes, the Start plan includes one free instance and 1GB of storage forever, plus a no-signup sandbox."
    },
    {
      "question": "Does Dgraph support GraphQL?",
      "answer": "Yes, it offers a native GraphQL API in addition to direct property-graph database access."
    },
    {
      "question": "What data models does SurrealDB support?",
      "answer": "It unifies document, graph, vector, time-series, and relational data models in one engine with ACID transactions."
    },
    {
      "question": "Who owns Dgraph now?",
      "answer": "Dgraph originated at Dgraph Labs, which was acquired by Hypermode, later acquired by Istari Digital; the open-source project continues under this lineage."
    },
    {
      "question": "Is there a SurrealDB Enterprise plan?",
      "answer": "Yes, it offers self-hosted deployment, audit logging, SSO, and SLA-backed uptime, with custom pricing."
    }
  ]
};

export default dgraphVsSurrealdbContent;

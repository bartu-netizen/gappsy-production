import type { ToolComparisonContent } from './types';

const tursoVsUpstashContent: ToolComparisonContent = {
  "verdict": "Turso and Upstash are both serverless, edge-friendly data platforms, but they store different kinds of data — Turso is a distributed SQLite database with copy-on-write branching for per-user or per-agent provisioning, while Upstash is a serverless Redis, vector, and messaging platform (via QStash) billed per request. Choosing between them depends on whether the workload needs a relational SQLite database or a key-value/cache/queue layer.",
  "bestForToolA": "Teams that need a relational, SQLite-compatible database per user or per AI agent, with built-in vector search and branching, and want flat tiered pricing starting at $4.99/month.",
  "bestForToolB": "Teams that need a serverless Redis cache/store, a vector database, and asynchronous message queuing (QStash) from edge runtimes like Vercel Edge, Cloudflare Workers, or Fastly Edge, with pay-per-request pricing that scales to zero.",
  "whoNeedsBoth": "An edge application that needs both a per-tenant relational database (Turso) and a serverless cache/queue layer for session data and background jobs (Upstash) would reasonably run both rather than substituting one for the other, since they serve different data-storage roles.",
  "keyDifferences": [
    {
      "title": "Data model",
      "toolA": "Relational, SQLite-compatible database with concurrent writes and copy-on-write branching.",
      "toolB": "Key-value Redis store plus a separate vector database and QStash messaging/queueing product.",
      "whyItMatters": "Determines whether the workload needs relational queries and branching, or key-value/cache/queue semantics.",
      "benefitsWho": "Backend teams choosing the right data layer for their access patterns."
    },
    {
      "title": "Messaging and async job processing",
      "toolA": "Not documented as a feature.",
      "toolB": "Includes QStash for message queuing and asynchronous job processing.",
      "whyItMatters": "Removes the need for a separate queueing service for background jobs.",
      "benefitsWho": "Teams building serverless functions that need reliable async task execution."
    },
    {
      "title": "Database branching",
      "toolA": "Offers copy-on-write database branching for fast environment creation and per-tenant/per-agent provisioning.",
      "toolB": "Not documented as a feature.",
      "whyItMatters": "Branching simplifies spinning up isolated environments for previews, tenants, or AI agents.",
      "benefitsWho": "Teams building multi-tenant SaaS or per-agent AI provisioning."
    },
    {
      "title": "Entry-level pricing",
      "toolA": "Developer plan starts at $4.99/month with unlimited databases, 9GB storage, 2.5B rows read/month.",
      "toolB": "Fixed 250MB plan starts at $10/month, or pay-as-you-go at $0.2 per 100K commands; production features like uptime SLA and multi-zone HA require a +$200/month Prod Pack add-on.",
      "whyItMatters": "Affects entry cost and where production-grade reliability features sit in the pricing structure.",
      "benefitsWho": "Cost-sensitive teams scoping their initial budget."
    },
    {
      "title": "Headquarters transparency",
      "toolA": "Headquarters not documented.",
      "toolB": "Headquartered in California, United States.",
      "whyItMatters": "Some procurement processes require documented company location for vendor risk assessment.",
      "benefitsWho": "Enterprise procurement and security reviewers."
    }
  ],
  "featureMatrix": [
    {
      "group": "Data & Storage Model",
      "rows": [
        {
          "feature": "Relational/SQLite database",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Key-value/Redis store",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Vector database",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Message queue / async jobs",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Upstash's QStash"
        },
        {
          "feature": "Database branching",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Turso: 100 databases, 5GB storage, no credit card; Upstash: 256MB, 10GB bandwidth, 500K commands/month"
        },
        {
          "feature": "Entry paid plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "Turso $4.99/month; Upstash $10/month fixed or pay-as-you-go"
        },
        {
          "feature": "Production HA/SLA",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Requires Upstash's +$200/month Prod Pack add-on"
        },
        {
          "feature": "Enterprise/custom tier",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Platform & Reach",
      "rows": [
        {
          "feature": "Edge runtime support",
          "toolA": "available",
          "toolB": "available",
          "note": "Turso via browser WASM/OPFS; Upstash via Vercel Edge, Cloudflare Workers, Fastly Edge"
        },
        {
          "feature": "Multi-region replication",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Headquarters documented",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Upstash: California, US"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Turso or Upstash offer a free tier?",
      "answer": "Both do — Turso's free tier includes 100 databases and 5GB storage with no credit card required; Upstash's free tier includes 256MB storage and 500K commands/month at $0."
    },
    {
      "question": "What kind of database is Turso?",
      "answer": "Turso is a SQLite-based distributed database with native vector search and copy-on-write branching."
    },
    {
      "question": "What products does Upstash offer?",
      "answer": "Redis, Vector, QStash, Workflow, and Search."
    },
    {
      "question": "Where is Upstash based?",
      "answer": "Upstash is founded and based in California."
    },
    {
      "question": "Does Turso support database branching?",
      "answer": "Yes, Turso offers copy-on-write branching for fast environment creation; this isn't documented for Upstash."
    },
    {
      "question": "Do production features cost extra on Upstash?",
      "answer": "Yes, production features like uptime SLA and multi-zone high availability require the +$200/month Prod Pack add-on."
    }
  ]
};

export default tursoVsUpstashContent;

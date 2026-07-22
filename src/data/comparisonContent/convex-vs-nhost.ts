import type { ToolComparisonContent } from './types';

const convexVsNhostContent: ToolComparisonContent = {
  "verdict": "Convex is a reactive TypeScript-native backend built around end-to-end type safety and automatic scaling, priced per developer seat and already SOC 2/HIPAA-certified. Nhost is a managed Postgres-plus-GraphQL backend with multi-region infrastructure and its own AI toolkit, priced around project/compute usage with compliance gated behind its $599/month Team plan. The choice largely comes down to whether a team wants a reactive TypeScript-first data layer or a traditional Postgres/GraphQL stack with broader geographic distribution.",
  "bestForToolA": "Teams building with TypeScript end-to-end who want automatic real-time sync, ACID transactions, and built-in vector/text search without managing infrastructure, and who need SOC 2/HIPAA compliance without waiting for a higher-priced tier.",
  "bestForToolB": "Teams that want a familiar Postgres database with an auto-generated GraphQL API, multi-region deployment across 6 regions and 80+ CDN locations, and a bundled AI toolkit (embeddings, assistants) as part of the same platform.",
  "whoNeedsBoth": "Agencies or platform teams that maintain both a Postgres-based product on Nhost and a newer reactive TypeScript service on Convex may run both rather than migrate an existing Postgres schema.",
  "keyDifferences": [
    {
      "title": "Database engine and query model",
      "toolA": "Reactive, proprietary TypeScript backend with automatic real-time sync and end-to-end type safety from database to client.",
      "toolB": "Managed PostgreSQL with an instantly generated GraphQL API layer on top.",
      "whyItMatters": "Teams already invested in relational/Postgres tooling and GraphQL clients fit Nhost's model; teams wanting reactive queries with compile-time type safety across the stack fit Convex's model.",
      "benefitsWho": "Full-stack engineering teams choosing their core data-layer paradigm at project start."
    },
    {
      "title": "Compliance certification and pricing tier it's gated behind",
      "toolA": "SOC 2 Type II certified and HIPAA compliant, with HIPAA/SOC 2 reports available starting on the $25/developer/month Professional plan.",
      "toolB": "SOC 2 Type II compliance and SLA support require the $599/month Team plan.",
      "whyItMatters": "Regulated or enterprise buyers reach compliance-grade infrastructure far cheaper on Convex than on Nhost.",
      "benefitsWho": "Startups in healthcare, fintech, or other regulated spaces needing compliance early without enterprise-level spend."
    },
    {
      "title": "Pricing structure",
      "toolA": "Professional plan bills per developer seat ($25/developer/month, 1-20 seats); Business/Enterprise has a $2,500/month minimum for 50+ seats.",
      "toolB": "Pro plan starts from $25/month with included compute credits and storage/egress allotments rather than per-seat billing; Team jumps to $599/month.",
      "whyItMatters": "Team size and growth trajectory affect total cost very differently: Convex scales with headcount, Nhost scales with usage until the steep Team-tier jump.",
      "benefitsWho": "Finance/engineering leads budgeting backend costs as a team or usage grows."
    },
    {
      "title": "Built-in AI features",
      "toolA": "Text and vector search included in the free tier, plus built-in integrations for AI coding agents like Claude Code and Codex.",
      "toolB": "A dedicated AI toolkit including embeddings, assistants, and file storage functionality for AI features.",
      "whyItMatters": "Convex focuses AI support on the developer's coding workflow and search primitives; Nhost bundles AI-application-building blocks (embeddings/assistants) directly into the platform.",
      "benefitsWho": "Teams deciding whether they need AI-assisted development tooling versus AI-application infrastructure."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Backend Capabilities",
      "rows": [
        {
          "feature": "Database",
          "toolA": "available",
          "toolB": "available",
          "note": "Convex: proprietary reactive document/relational store. Nhost: managed PostgreSQL."
        },
        {
          "feature": "GraphQL API",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Serverless functions",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "File storage",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Built-in authentication",
          "toolA": "available",
          "toolB": "available",
          "note": "Convex includes authentication in its Free & Starter tier feature list; Nhost lists authentication as a core feature."
        },
        {
          "feature": "Real-time sync / reactivity",
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
          "note": "Convex Free & Starter ($0, 1-6 seats); Nhost Starter ($0, 1 project, pauses after inactivity)."
        },
        {
          "feature": "Per-developer/seat billing",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Self-hosted VPC deployment",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Convex lists self-hosted VPC as in development, not yet generally available."
        },
        {
          "feature": "External database connections",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Available starting on Nhost's Team plan."
        }
      ]
    },
    {
      "group": "Compliance & AI",
      "rows": [
        {
          "feature": "SOC 2 Type II",
          "toolA": "available",
          "toolB": "available",
          "note": "Convex includes it standard; Nhost requires the $599/month Team plan."
        },
        {
          "feature": "HIPAA compliance",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Vector/text search",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Bundled AI toolkit (embeddings/assistants)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Convex have a free plan?",
      "answer": "Yes, the Free & Starter tier is available at $0/month with pay-as-you-go overage charges, supporting 1-6 developer seats."
    },
    {
      "question": "Does Nhost have a free plan?",
      "answer": "Yes, the Starter plan is $0/month with 1 GB database, 1 GB storage, and unlimited users, limited to 1 project."
    },
    {
      "question": "How is Convex's Professional plan priced?",
      "answer": "The Professional plan costs $25 per developer per month, supporting 1-20 developer seats."
    },
    {
      "question": "How much does Nhost's Pro plan cost?",
      "answer": "The Pro plan starts from $25/month and includes $15 of compute credits, 10 GB database, and 50 GB storage."
    },
    {
      "question": "Is Convex compliant with security standards?",
      "answer": "Yes, Convex is SOC 2 Type II certified and HIPAA compliant."
    },
    {
      "question": "Does Nhost support external database connections?",
      "answer": "Yes, external database connections are available starting on the Team plan."
    }
  ]
};

export default convexVsNhostContent;

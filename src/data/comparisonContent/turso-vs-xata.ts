import type { ToolComparisonContent } from './types';

const tursoVsXataContent: ToolComparisonContent = {
  "verdict": "Turso and Xata both offer database branching, but on different engines and pricing models — Turso is a SQLite-based distributed database with flat tiered pricing starting at $4.99/month, built for provisioning per-user or per-agent databases with native vector search, while Xata is vanilla PostgreSQL with copy-on-write branching, priced via hourly pay-as-you-go compute and storage or a free, self-managed Open Source tier.",
  "bestForToolA": "Teams that want to provision many small SQLite databases per user or per AI agent, need built-in vector search, or want predictable flat-tier pricing starting under $5/month.",
  "bestForToolB": "Teams already standardized on PostgreSQL who want to clone production-scale databases in seconds for PR previews or AI agent isolation without duplicating storage, and are comfortable with hourly consumption-based billing.",
  "whoNeedsBoth": "A team running a Postgres-based production application that also builds per-agent SQLite databases for an AI product feature would reasonably use Xata for its Postgres branching and Turso for lightweight per-agent database provisioning, rather than picking one for both use cases.",
  "keyDifferences": [
    {
      "title": "Underlying database engine",
      "toolA": "Built on SQLite, specifically a Rust-based, cloud-native rewrite.",
      "toolB": "Runs unmodified upstream PostgreSQL rather than a forked engine.",
      "whyItMatters": "Determines SQL dialect compatibility and which existing tooling and drivers a team can reuse.",
      "benefitsWho": "Teams with an existing PostgreSQL or SQLite investment."
    },
    {
      "title": "Pricing structure",
      "toolA": "Flat, published tiers: Free ($0), Developer ($4.99/month), Scaler ($24.92/month), Pro ($416.58/month), Enterprise (custom).",
      "toolB": "Pay-as-you-go hourly compute ($0.012/hr) plus storage ($0.28/GB/month), with instance tiers from $9/month to $1,121/month, or a free self-managed Open Source tier forever.",
      "whyItMatters": "Flat tiers are easier to budget for; consumption-based pricing can scale more precisely with actual usage but is harder to predict.",
      "benefitsWho": "Budgeting-conscious teams versus teams with highly variable workloads."
    },
    {
      "title": "Branch wake-up speed",
      "toolA": "Uses copy-on-write branching but doesn't document specific wake-up latency figures.",
      "toolB": "Documents ~1 second wake-up on the managed Cloud tier (~10 seconds on the free Open Source tier) thanks to instant wake-up design.",
      "whyItMatters": "Wake-up latency affects developer experience when spinning up ephemeral branches for previews or agents.",
      "benefitsWho": "Teams relying heavily on ephemeral preview or branch environments."
    },
    {
      "title": "Native vector search",
      "toolA": "Includes native vector/similarity search built in for RAG and AI workflows.",
      "toolB": "Not documented as a built-in feature in the facts provided.",
      "whyItMatters": "Affects whether AI/RAG workloads can be handled without a separate vector database.",
      "benefitsWho": "Teams building AI features that need embeddings storage alongside primary data."
    },
    {
      "title": "Browser/edge runtime support",
      "toolA": "Runs via WebAssembly and OPFS for in-browser use.",
      "toolB": "Not documented as supporting in-browser execution.",
      "whyItMatters": "Enables client-side or offline-first application architectures.",
      "benefitsWho": "Teams building local-first or offline-capable apps."
    }
  ],
  "featureMatrix": [
    {
      "group": "Database Engine & Branching",
      "rows": [
        {
          "feature": "Base engine",
          "toolA": "available",
          "toolB": "available",
          "note": "Turso: SQLite (Rust rewrite); Xata: vanilla PostgreSQL"
        },
        {
          "feature": "Copy-on-write branching",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Scale-to-zero",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Native vector search",
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
          "note": "Turso: 100 databases, 5GB storage, no credit card; Xata: Open Source tier free forever, self-managed"
        },
        {
          "feature": "Published flat-rate paid tier",
          "toolA": "available",
          "toolB": "limited",
          "note": "Xata Cloud is priced hourly plus instance-tier storage, not a simple flat rate"
        },
        {
          "feature": "Enterprise/custom tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Xata's is called BYOC"
        }
      ]
    },
    {
      "group": "Platform Capabilities",
      "rows": [
        {
          "feature": "Browser/WASM support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-region replication/sync",
          "toolA": "available",
          "toolB": "available",
          "note": "Xata's is on Xata Cloud, AWS/GCP"
        },
        {
          "feature": "Read replicas / point-in-time recovery",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Turso based on SQLite or PostgreSQL?",
      "answer": "Turso is based on SQLite — specifically a Rust-based, cloud-native rewrite of SQLite."
    },
    {
      "question": "Does Xata run standard PostgreSQL?",
      "answer": "Yes, Xata runs 100% upstream PostgreSQL without significant modifications."
    },
    {
      "question": "What's the cheapest paid plan for each?",
      "answer": "Turso's cheapest paid plan is the Developer plan at $4.99/month; Xata Cloud instance tiers start around $9/month plus hourly compute and storage charges."
    },
    {
      "question": "Does Turso have a free plan?",
      "answer": "Yes, including 100 databases and 5GB storage with no credit card required."
    },
    {
      "question": "Is Xata free to use?",
      "answer": "Yes, the Open Source tier is free forever for self-managed deployments."
    },
    {
      "question": "Does Turso support vector search?",
      "answer": "Yes, native vector/similarity search is built in for AI and RAG workflows; this isn't documented for Xata."
    }
  ]
};

export default tursoVsXataContent;

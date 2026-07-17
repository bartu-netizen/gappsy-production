import type { ToolComparisonContent } from './types';

const mariadbVsTursoContent: ToolComparisonContent = {
  "verdict": "MariaDB is a free, open-source relational database created as a drop-in MySQL replacement, built for traditional server-side deployments with features like Galera Cluster 4 and Oracle compatibility. Turso is a freemium, SQLite-based distributed database designed to provision many small per-user or per-agent databases with built-in vector search, database branching, and a $4.99/month Developer entry tier. MariaDB targets classic centralized relational workloads; Turso targets edge/embedded and AI-native, high-database-count architectures.",
  "bestForToolA": "Organizations running traditional, centralized relational workloads that need MySQL compatibility, high-availability clustering (Galera Cluster 4), and enterprise support — MariaDB is used in production by Wikipedia, WordPress.com, and Google per its documented pros.",
  "bestForToolB": "Developers building AI/RAG applications or multi-tenant products that need per-user or per-agent SQLite databases with native vector search, database branching for fast environment creation, and a free tier of 100 databases and 5GB storage with no credit card required.",
  "whoNeedsBoth": "A team could run MariaDB as its core relational application database while using Turso to provision lightweight, isolated per-user or per-agent databases for an AI feature, such as giving each customer or AI agent its own SQLite-backed database with vector search — a realistic architecture where the two serve different data-locality needs within the same product.",
  "keyDifferences": [
    {
      "title": "Database Architecture",
      "toolA": "MariaDB is a traditional server-based relational database with pluggable storage engines and synchronous multi-master clustering via Galera Cluster 4.",
      "toolB": "Turso is a Rust-based, cloud-native rewrite of SQLite designed to provision many individual databases (up to 100 free) with copy-on-write branching and cross-device/region replication.",
      "whyItMatters": "The architectural model determines whether you're running one large shared database or many small distributed ones.",
      "benefitsWho": "Centralized enterprise apps benefit from MariaDB's clustering; multi-tenant or per-agent AI apps benefit from Turso's per-database provisioning model."
    },
    {
      "title": "Pricing",
      "toolA": "MariaDB Server (Community) is entirely free; MariaDB Corporation separately sells a custom-priced Enterprise Server with hardened builds and support contracts.",
      "toolB": "Turso has a $0 Free plan (100 databases, 5GB storage, 500M rows read/month) and a paid Developer plan starting at $4.99/month (unlimited databases, 9GB storage, 2.5B rows read/month).",
      "whyItMatters": "MariaDB's cost model is always free unless you need enterprise support, while Turso's is a graduated freemium ladder with usage caps at each tier.",
      "benefitsWho": "Cost-sensitive teams running unlimited-scale MariaDB benefit from its free core; teams wanting a low $4.99/month entry point with generous allowances benefit from Turso."
    },
    {
      "title": "AI/Vector Search Support",
      "toolA": "MariaDB's documented features don't include native vector search.",
      "toolB": "Turso includes native vector search built in for RAG and AI workflows, positioned as a core feature.",
      "whyItMatters": "Native vector search removes the need for a separate vector database when building AI features.",
      "benefitsWho": "AI/RAG application developers who want embeddings and relational data in the same database benefit from Turso."
    },
    {
      "title": "Historical Track Record",
      "toolA": "MariaDB was founded in 2009 (headquartered in Delaware, USA) by MySQL's original developers and is the default database in most major Linux distributions.",
      "toolB": "Turso's founding year is not documented, and its embedded database engine is still noted as in beta per its documented cons.",
      "whyItMatters": "MariaDB's 15+ years of production maturity versus Turso's newer, still-beta embedded engine affects risk tolerance for critical workloads.",
      "benefitsWho": "Risk-averse teams needing a mature, widely-deployed database benefit from MariaDB; teams comfortable adopting newer distributed-SQLite technology benefit from Turso."
    },
    {
      "title": "Higher-Tier Cost Predictability",
      "toolA": "MariaDB Enterprise Server pricing is custom and quote-based via MariaDB Corporation.",
      "toolB": "Turso's higher tiers (Scaler at $24.92/month, Pro at $416.58/month) charge overage fees on top of the base price for storage, reads, writes, and syncs, per its documented cons.",
      "whyItMatters": "Both have some cost unpredictability at scale, but through different mechanisms: quote-based enterprise contracts versus metered overages.",
      "benefitsWho": "Finance teams budgeting for growth need to understand Turso's overage structure or negotiate a MariaDB Enterprise quote in advance."
    }
  ],
  "featureMatrix": [
    {
      "group": "Database Model",
      "rows": [
        {
          "feature": "Traditional relational (SQL) database",
          "toolA": "available",
          "toolB": "available",
          "note": "Turso is SQLite-compatible"
        },
        {
          "feature": "MySQL compatibility",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "MariaDB is a drop-in MySQL replacement"
        },
        {
          "feature": "Native vector search",
          "toolA": "unavailable",
          "toolB": "available",
          "note": null
        },
        {
          "feature": "Database branching",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "copy-on-write branching"
        },
        {
          "feature": "Multi-master clustering",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Galera Cluster 4"
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
          "note": "MariaDB Community Server fully free; Turso 100 databases/5GB storage"
        },
        {
          "feature": "Low-cost entry paid plan",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Turso Developer $4.99/month"
        },
        {
          "feature": "Enterprise/custom tier",
          "toolA": "available",
          "toolB": "available",
          "note": "MariaDB Enterprise Server via MariaDB Corporation; Turso Enterprise custom"
        }
      ]
    },
    {
      "group": "Deployment & SDKs",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Turso is a cloud-native platform"
        },
        {
          "feature": "Browser/edge runtime support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "WebAssembly + OPFS"
        },
        {
          "feature": "Broad SDK language coverage",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Rust, JS, Python, Go, Java, Ruby, PHP, Swift, Kotlin, Flutter, .NET"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Turso compatible with existing SQLite tooling?",
      "answer": "Yes — Turso is a Rust-based, cloud-native rewrite of SQLite with full SQLite compatibility, adding distributed features like replication and branching on top."
    },
    {
      "question": "Is MariaDB really free at any scale?",
      "answer": "Yes, MariaDB Server (Community) is free and open source under GPLv2 with no scale-based pricing; MariaDB Corporation separately sells custom-priced Enterprise Server, clustering, and support contracts for organizations that want them."
    },
    {
      "question": "Does MariaDB support vector search like Turso?",
      "answer": "MariaDB's documented feature set does not include native vector search; Turso includes it as a built-in feature specifically for RAG and AI workflows."
    },
    {
      "question": "What's the cheapest paid way to use each?",
      "answer": "Turso's cheapest paid plan is the Developer tier at $4.99/month. MariaDB Server itself has no paid consumer tier — its Enterprise Server is custom/quote-priced through MariaDB Corporation."
    },
    {
      "question": "Which is more production-proven?",
      "answer": "MariaDB was founded in 2009 and is used in production by Wikipedia, WordPress.com, and Google, and is the default database in most major Linux distributions. Turso's founding year isn't documented, and its embedded database engine is still noted as in beta."
    },
    {
      "question": "Can I use Turso in a browser?",
      "answer": "Yes — Turso documents browser support via WebAssembly and OPFS for in-browser use. MariaDB does not document browser-runtime support; it's a traditional server-based database."
    }
  ]
};

export default mariadbVsTursoContent;

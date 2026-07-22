import type { ToolComparisonContent } from './types';

const tidbCloudVsYugabytedbContent: ToolComparisonContent = {
  "verdict": "TiDB Cloud and YugabyteDB are both distributed SQL databases with free entry points and vector search support for AI workloads, but they differ in SQL compatibility and pricing model — TiDB Cloud is MySQL-compatible with a genuinely free Starter allowance and pay-as-you-go Request Unit pricing, while YugabyteDB is PostgreSQL-compatible with a free open-source download plus a managed Aeon service starting at $125/vCPU/month.",
  "bestForToolA": "Teams on a MySQL-compatible stack who want unified transactional, analytical, and vector search (HTAP) in one engine, with a genuinely free Starter tier (25GiB row + 25GiB column storage, 250M Request Units/month) before pay-as-you-go charges apply.",
  "bestForToolB": "Teams migrating existing PostgreSQL applications who need multi-region high availability and disaster recovery built in, and are comfortable with vCPU-based managed pricing starting at $125/vCPU/month, or running the open-source version themselves for free.",
  "whoNeedsBoth": "An organization running separate MySQL-based and PostgreSQL-based application teams evaluating a move to distributed SQL would likely pilot both — TiDB Cloud for MySQL-compatible workloads and YugabyteDB for PostgreSQL-compatible ones — rather than force one engine's dialect onto the other team.",
  "keyDifferences": [
    {
      "title": "SQL dialect compatibility",
      "toolA": "MySQL-compatible SQL, with integrations for LangChain, LlamaIndex, and MCP.",
      "toolB": "Full PostgreSQL compatibility, including stored procedures, triggers, and extensions from the PostgreSQL ecosystem.",
      "whyItMatters": "Determines migration effort for teams with an existing MySQL versus PostgreSQL codebase.",
      "benefitsWho": "Teams migrating an existing relational application to a distributed database."
    },
    {
      "title": "Entry-level pricing model",
      "toolA": "Starter plan includes a genuine free monthly allowance (25GiB row storage, 25GiB column storage, 250M Request Units) before usage-based charges.",
      "toolB": "Aeon Standard plan starts at $125/vCPU/month; a free-tier Aeon account is available to get started, and the open-source version can be self-hosted for free.",
      "whyItMatters": "Affects how much a team can build and test before incurring meaningful cost.",
      "benefitsWho": "Early-stage teams and prototypes evaluating distributed databases."
    },
    {
      "title": "Founding year",
      "toolA": "Founded 2015.",
      "toolB": "Founded 2016.",
      "whyItMatters": "Company maturity and track record can factor into vendor risk assessment, though both are close in age.",
      "benefitsWho": "Procurement teams assessing vendor stability."
    },
    {
      "title": "Workload unification",
      "toolA": "Unified HTAP engine combining transactional, analytical, and native vector query capabilities in one system, with dedicated Request Unit-based workload isolation.",
      "toolB": "Emphasizes multi-region high availability, automatic sharding/scaling, and multi-model support across relational, document, and graph-style workloads.",
      "whyItMatters": "Determines whether the priority is combining transactional and analytical workloads in one engine, or geographic resilience and data-model flexibility.",
      "benefitsWho": "Teams choosing based on whether their primary need is analytics-alongside-transactions or multi-region resilience."
    },
    {
      "title": "Add-on pricing for enterprise security/DR",
      "toolA": "Essential and Premium tiers are labeled \"(Preview)\" and may still change; Premium starts at $1,800/month.",
      "toolB": "Enterprise Security and Business Continuity/DR are separate Aeon add-ons at $25/vCPU/month each on top of base compute pricing.",
      "whyItMatters": "Affects total cost once enterprise security or DR features are added.",
      "benefitsWho": "Teams budgeting for production-grade security and DR requirements."
    }
  ],
  "featureMatrix": [
    {
      "group": "SQL Compatibility & Workloads",
      "rows": [
        {
          "feature": "SQL dialect",
          "toolA": "available",
          "toolB": "available",
          "note": "TiDB: MySQL-compatible; YugabyteDB: PostgreSQL-compatible"
        },
        {
          "feature": "Native vector search",
          "toolA": "available",
          "toolB": "available",
          "note": "YugabyteDB's is described as vector indexing for RAG/GenAI"
        },
        {
          "feature": "HTAP (unified transactional + analytical)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-model (document/graph)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free tier/allowance",
          "toolA": "available",
          "toolB": "available",
          "note": "TiDB: Starter with 25GiB+25GiB storage and 250M RU/month free; YugabyteDB: free-tier Aeon account plus free open-source download"
        },
        {
          "feature": "Published managed starting price",
          "toolA": "available",
          "toolB": "available",
          "note": "TiDB: $0/month + pay-as-you-go; YugabyteDB: $125/vCPU/month Standard"
        },
        {
          "feature": "Enterprise custom tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "TiDB's highest documented named tier is Dedicated, not a separate Enterprise tier"
        }
      ]
    },
    {
      "group": "Availability & Scaling",
      "rows": [
        {
          "feature": "Multi-cloud support (AWS/GCP/Azure)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Multi-region high availability/DR",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Elastic/scale-to-zero autoscaling",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is TiDB Cloud free to start?",
      "answer": "Yes, the Starter plan includes a free monthly allowance of storage and Request Units before pay-as-you-go charges apply."
    },
    {
      "question": "Is YugabyteDB open source?",
      "answer": "Yes, the open-source version is free to download and self-host."
    },
    {
      "question": "Which is MySQL-compatible and which is PostgreSQL-compatible?",
      "answer": "TiDB Cloud uses MySQL-compatible SQL; YugabyteDB is PostgreSQL-compatible."
    },
    {
      "question": "Does either support vector search?",
      "answer": "Yes — TiDB Cloud has native vector search integrated into its HTAP engine, and YugabyteDB offers vector indexing for RAG and GenAI applications."
    },
    {
      "question": "How much does YugabyteDB Aeon cost?",
      "answer": "The Standard plan starts at $125/vCPU/month and Professional at $167/vCPU/month; Enterprise pricing is custom."
    },
    {
      "question": "When were these companies founded?",
      "answer": "TiDB Cloud's underlying database was founded in 2015; YugabyteDB was founded in 2016."
    }
  ]
};

export default tidbCloudVsYugabytedbContent;

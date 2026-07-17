import type { ToolComparisonContent } from './types';

const airflowVsBackstageContent: ToolComparisonContent = {
  "verdict": "Airflow orchestrates data/workflow pipelines; Backstage is a developer portal framework for cataloging software, services, and documentation across an engineering organization. They address different platform-engineering concerns — pipeline execution versus internal developer experience and cataloging.",
  "bestForToolA": "Data/platform teams that need to programmatically schedule, retry, and monitor multi-step pipelines defined as Python DAGs.",
  "bestForToolB": "Engineering organizations that want a centralized software catalog, self-service templates, and docs-as-code (TechDocs) to organize microservices, libraries, and internal tools.",
  "whoNeedsBoth": "A platform engineering team could register its Airflow pipelines and DAGs as entities in a Backstage Software Catalog, giving engineers a single portal to discover which workflows exist and how they're documented.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "A workflow orchestration engine for scheduling and monitoring pipelines.",
      "toolB": "A developer portal and software catalog framework.",
      "whyItMatters": "They solve different platform-engineering problems — running pipelines versus organizing services and docs.",
      "benefitsWho": "Platform teams scoping which tool addresses their actual gap."
    },
    {
      "title": "Origin & Governance",
      "toolA": "Backed by the Apache Software Foundation's dedicated security team and sponsorship program.",
      "toolB": "Created at Spotify before being open-sourced; a CNCF Incubation project that graduated from Sandbox status in March 2022.",
      "whyItMatters": "Both signal serious foundation backing, but under different foundations (ASF vs. CNCF) with different governance models.",
      "benefitsWho": "Enterprises evaluating foundation-level project maturity."
    },
    {
      "title": "Core Feature Set",
      "toolA": "Centers on DAG-based pipeline definition with automatic retries and failure alerting.",
      "toolB": "Centers on a Software Catalog (tracking microservices, libraries, data pipelines, ML models), Software Templates for self-service project creation, and TechDocs for docs-as-code.",
      "whyItMatters": "Backstage's catalog is documented as tracking \"data pipelines\" as an entity type, showing the two tools can be complementary rather than substitutable.",
      "benefitsWho": "Teams wanting visibility across all their services, including their Airflow pipelines."
    },
    {
      "title": "Extensibility",
      "toolA": "Extends through Python-native integrations, letting it connect to virtually any data source reachable from a Python library.",
      "toolB": "Documents a large, extensible plugin ecosystem for customization.",
      "whyItMatters": "The two extend differently — Backstage via UI/portal plugins, Airflow via Python code integrations.",
      "benefitsWho": "Developers customizing their internal portal benefit from Backstage; data engineers integrating new data sources benefit from Airflow."
    },
    {
      "title": "Hosting",
      "toolA": "Facts don't describe an official managed/hosted offering.",
      "toolB": "No managed/hosted offering was found on the official site content reviewed; self-hosted only.",
      "whyItMatters": "Teams adopting either tool should plan for self-managed infrastructure regardless of choice.",
      "benefitsWho": "Infra/ops teams planning hosting resources for either or both tools."
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing & Hosting",
      "rows": [
        {
          "feature": "Open source",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Managed/hosted offering",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "None found on Backstage's official site"
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Workflow Orchestration",
      "rows": [
        {
          "feature": "DAG-based pipeline authoring",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Automatic retries & failure alerting",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Python-native integrations",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Developer Portal & Cataloging",
      "rows": [
        {
          "feature": "Software/service catalog",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Self-service project templates",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Docs-as-code (TechDocs)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Extensible plugin ecosystem",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can Backstage replace Airflow?",
      "answer": "No — Backstage is a developer portal for cataloging software and documentation; it doesn't run or schedule workflows the way Airflow's DAG engine does."
    },
    {
      "question": "Are both projects backed by a foundation?",
      "answer": "Yes, but different ones — Airflow is backed by the Apache Software Foundation; Backstage is a CNCF Incubation project that graduated from Sandbox status in March 2022, after being created at Spotify."
    },
    {
      "question": "Does Backstage support tracking Airflow pipelines?",
      "answer": "Backstage's Software Catalog is documented as tracking microservices, libraries, data pipelines, websites, and ML models, so data pipelines broadly fit its catalog model, though the facts don't confirm a specific out-of-the-box Airflow integration."
    },
    {
      "question": "Which tool has a steeper learning curve?",
      "answer": "Airflow does, per its documented cons, since pipelines are authored in Python code rather than through templates or a UI."
    },
    {
      "question": "Do either offer managed hosting?",
      "answer": "No — neither Airflow nor Backstage documents an official managed/hosted version; both require self-hosting."
    },
    {
      "question": "What is TechDocs?",
      "answer": "A Backstage feature for producing technical documentation using a docs-as-code workflow."
    }
  ]
};

export default airflowVsBackstageContent;

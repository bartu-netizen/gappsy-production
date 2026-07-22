import type { GroupComparisonContent } from './types';

const cubeVsEvidenceVsGrafanaContent: GroupComparisonContent = {
  "verdict": "Cube, Evidence, and Grafana are all open-source, API-driven, self-hostable data platforms, but they solve different problems. Cube is a headless semantic layer that centralizes metric definitions for consumption by BI tools, applications, and AI agents. Evidence is a code-first, 'BI-as-code' framework for building Git-versioned reports from SQL and Markdown. Grafana is built primarily for observability, unifying metrics, logs, and traces from more than 150 data sources into real-time dashboards and alerting. Teams should weigh whether they need governed business metrics, code-first reporting, or operational monitoring before choosing between them.",
  "bestFor": {
    "cube": "Data teams that want a single governed semantic layer exposing consistent metrics via SQL, REST, and GraphQL to multiple BI tools and AI agents.",
    "evidence": "Data teams comfortable with SQL and Markdown who want reports and dashboards version-controlled in Git rather than built in a drag-and-drop tool.",
    "grafana": "Engineering and DevOps teams that need to unify metrics, logs, and traces from many operational data sources into real-time dashboards and alerting."
  },
  "highlights": [
    {
      "title": "Headless Semantic Layer for BI and AI Agents",
      "description": "Cube defines metrics, dimensions, and access rules once and exposes them via REST, GraphQL, and a Postgres-compatible SQL API, letting AI copilots query governed numbers instead of raw tables.",
      "toolSlugs": [
        "cube"
      ]
    },
    {
      "title": "Reports as Code, Versioned in Git",
      "description": "Evidence reports are written as Markdown files with embedded SQL, so they can be committed, diffed, and reviewed through pull requests like any other codebase.",
      "toolSlugs": [
        "evidence"
      ]
    },
    {
      "title": "150-Plus Connectors for Observability",
      "description": "Grafana natively connects to Prometheus, Loki, Tempo, Elasticsearch, CloudWatch, and more than 150 other data sources, unifying metrics, logs, and traces in one dashboard.",
      "toolSlugs": [
        "grafana"
      ]
    },
    {
      "title": "All Three Have a Free Open-Source Core",
      "description": "Cube, Evidence, and Grafana are each free to self-host, with usage-based or per-user pricing reserved for their managed cloud tiers.",
      "toolSlugs": [
        "cube",
        "evidence",
        "grafana"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Pricing",
      "rows": [
        {
          "feature": "Free open-source self-hosted core",
          "statuses": {
            "cube": "available",
            "evidence": "available",
            "grafana": "available"
          }
        },
        {
          "feature": "Managed cloud free tier",
          "statuses": {
            "cube": "available",
            "evidence": "unavailable",
            "grafana": "available"
          },
          "note": "Evidence's paid Cloud tiers start at $15 per user per month, though its self-hosted core remains free."
        }
      ]
    },
    {
      "group": "Data Modeling and Access",
      "rows": [
        {
          "feature": "Multi-protocol API access (REST, GraphQL, or SQL)",
          "statuses": {
            "cube": "available",
            "evidence": "not-documented",
            "grafana": "available"
          }
        },
        {
          "feature": "Row- or page-level access control",
          "statuses": {
            "cube": "available",
            "evidence": "available",
            "grafana": "limited"
          },
          "note": "Grafana's fine-grained role-based access control requires Enterprise licensing."
        },
        {
          "feature": "Connects to existing BI tools as a data source",
          "statuses": {
            "cube": "available",
            "evidence": "not-documented",
            "grafana": "not-documented"
          },
          "note": "Cube is designed to be queried by tools like Tableau, Power BI, and Looker Studio as though it were a native database."
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI-assisted features",
          "statuses": {
            "cube": "available",
            "evidence": "available",
            "grafana": "available"
          },
          "note": "Cube supports agentic analytics queries, Evidence offers monthly AI credits for report building, and Grafana includes machine learning and an AI assistant for dashboards and queries."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Cube, Evidence, and Grafana interchangeable tools?",
      "answer": "Not really. Cube is a headless semantic layer for governed business metrics, Evidence is a code-first framework for Git-versioned reports, and Grafana is primarily built for observability dashboards across metrics, logs, and traces. Teams sometimes use more than one together."
    },
    {
      "question": "Can Grafana connect to a data warehouse the way Cube or Evidence can?",
      "answer": "Yes, Grafana has more than 150 data source connectors and can query many databases directly, but it is designed and optimized for observability and operational monitoring rather than business-metric governance."
    },
    {
      "question": "Do all three have a free, self-hosted option?",
      "answer": "Yes. Cube Core, Evidence's open-source framework, and Grafana's open-source edition are all free to self-host."
    },
    {
      "question": "Which of these is best for letting AI agents query governed business metrics?",
      "answer": "Cube is explicitly positioned for this use case, with a governed semantic layer that AI copilots and LLM-based agents can query directly to reduce the risk of hallucinated numbers."
    },
    {
      "question": "Can Evidence reports be embedded in a customer-facing product?",
      "answer": "Yes. Evidence supports embeddable reports, so they can be used inside customer-facing products rather than only for internal dashboards."
    }
  ]
};

export default cubeVsEvidenceVsGrafanaContent;

import type { ToolComparisonContent } from './types';

const airflowVsFlagsmithContent: ToolComparisonContent = {
  "verdict": "Airflow is a free, Apache Software Foundation-backed platform for programmatically authoring, scheduling, and monitoring data/workflow pipelines as Python-defined DAGs. Flagsmith is an open-source feature flag and remote configuration platform for toggling application behavior across web, mobile, and server apps without redeploying code, with plans starting at $40/month (Start-Up). Airflow orchestrates when and how tasks run; Flagsmith controls what code paths are active for which users — different layers of the software stack entirely.",
  "bestForToolA": "Data engineering teams that need to author, schedule, and monitor complex multi-step pipelines as Python code, benefiting from automatic retries, failure alerting, and Python-native integration with virtually any data source.",
  "bestForToolB": "Product and engineering teams that need to toggle features, run A/B or multivariate tests, or change app behavior in real time across web, mobile, and server apps using 13+ official SDKs, without a redeploy.",
  "whoNeedsBoth": "A data platform team could use Airflow to orchestrate ETL or ML pipelines while a product team in the same engineering org uses Flagsmith to gate a new feature rollout to a percentage of users — both plausibly run in the same company's stack for unrelated purposes.",
  "keyDifferences": [
    {
      "title": "Purpose",
      "toolA": "Airflow programmatically authors, schedules, and monitors workflows as Directed Acyclic Graphs (DAGs) written in Python.",
      "toolB": "Flagsmith toggles features and remote-configures application behavior in real time via feature flags, targeting rollouts by environment, user traits, or percentage.",
      "whyItMatters": "These tools sit at completely different layers: pipeline orchestration versus runtime feature control.",
      "benefitsWho": "Data engineers need Airflow's orchestration; product and growth engineers need Flagsmith's flag targeting."
    },
    {
      "title": "Pricing",
      "toolA": "Airflow is entirely free and open source with no paid tier documented.",
      "toolB": "Flagsmith has a free plan (unlimited flags/environments/segments, 1 team member, up to 50,000 requests/month) and paid plans starting at $40/month annual (Start-Up, up to 1M requests/month, 3 team members).",
      "whyItMatters": "Airflow has zero licensing cost regardless of scale, while Flagsmith's cost scales with team size and request volume.",
      "benefitsWho": "Budget-constrained data teams benefit from Airflow being free; teams needing collaborative flag management benefit from knowing Flagsmith's per-tier limits."
    },
    {
      "title": "Governance & Compliance",
      "toolA": "Airflow is backed by the Apache Software Foundation's dedicated security team and sponsorship program.",
      "toolB": "Flagsmith's core is open source under the BSD-3-Clause license with 6.5k+ GitHub stars, and is SOC 2 compliant with SSO/RBAC/audit logs on higher tiers.",
      "whyItMatters": "Governance and compliance backing matter for security-sensitive infrastructure decisions.",
      "benefitsWho": "Enterprises requiring ASF-level open governance benefit from Airflow; those requiring SOC 2 compliance with SSO/RBAC benefit from Flagsmith's higher tiers."
    },
    {
      "title": "Deployment Options",
      "toolA": "Airflow's deployment specifics beyond being an open-source ASF project are not detailed in available facts.",
      "toolB": "Flagsmith offers SaaS cloud across 8 regions, private cloud, or fully self-hosted deployment via Docker, Kubernetes (Helm), or OpenShift.",
      "whyItMatters": "Flagsmith documents explicit multi-region and self-hosting flexibility that buyers evaluating data residency should know about.",
      "benefitsWho": "Teams with data residency or compliance needs benefit from Flagsmith's documented regional and self-hosted options."
    },
    {
      "title": "Learning Curve",
      "toolA": "Airflow has a steeper learning curve than drag-and-drop workflow builders since pipelines are defined entirely in Python code, per its documented cons.",
      "toolB": "Flagsmith's cons focus on plan limits (free plan capped at 1 team member and 50,000 requests/month) rather than a technical learning curve.",
      "whyItMatters": "Airflow requires engineering/Python skill to operate, while Flagsmith is designed for broader team accessibility within its request/seat limits.",
      "benefitsWho": "Technical data engineering teams are well-suited to Airflow's code-first approach; smaller cross-functional teams may find Flagsmith's flag UI more approachable."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Pipeline/workflow orchestration (DAGs)",
          "toolA": "available",
          "toolB": "unavailable",
          "note": null
        },
        {
          "feature": "Feature flags & remote config",
          "toolA": "unavailable",
          "toolB": "available",
          "note": null
        },
        {
          "feature": "A/B / multivariate testing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "percentage-split experiments"
        },
        {
          "feature": "Automatic retries & failure alerting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": null
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
          "note": "Airflow fully free/open source; Flagsmith free up to 50K requests/month, 1 member"
        },
        {
          "feature": "Entry paid price",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Flagsmith Start-Up $40/month annual; Airflow has no paid tier"
        },
        {
          "feature": "Enterprise/custom tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "custom pricing, SSO/RBAC/audit logs"
        }
      ]
    },
    {
      "group": "Deployment & SDKs",
      "rows": [
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "available",
          "note": "Flagsmith via Docker, Kubernetes (Helm), OpenShift"
        },
        {
          "feature": "Official SDK count",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "13+ official SDKs"
        },
        {
          "feature": "Multi-region cloud hosting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "8 regions"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Airflow and Flagsmith solving the same problem?",
      "answer": "No — Airflow orchestrates and schedules data/workflow pipelines as Python-defined DAGs, while Flagsmith manages feature flags and remote configuration for controlling app behavior at runtime. They operate at different layers of the stack."
    },
    {
      "question": "Is Airflow free, and is Flagsmith?",
      "answer": "Airflow is entirely free and open source with no paid tier documented. Flagsmith has a free plan (up to 50,000 requests/month, 1 team member) plus paid plans starting at $40/month billed annually (Start-Up)."
    },
    {
      "question": "Which tool is easier for non-engineers to use?",
      "answer": "Flagsmith's flag-toggling UI is generally more accessible to product and growth teams. Airflow requires writing pipelines in Python code, which its own documented cons describe as a steeper learning curve than drag-and-drop builders."
    },
    {
      "question": "Does Flagsmith support self-hosting like Airflow?",
      "answer": "Yes — Flagsmith can be self-hosted via Docker, Kubernetes (Helm), or OpenShift, in addition to its SaaS cloud (8 regions) and private cloud options. Airflow, as an Apache Software Foundation project, is inherently open source and self-hostable."
    },
    {
      "question": "What SDKs or integrations does each support?",
      "answer": "Flagsmith documents 13+ official SDKs across languages like React, Next.js, Node, Python, Ruby, .NET, PHP, Go, and Rust. Airflow's integrations come from being Python-native, letting it connect to virtually any data source reachable from a Python library."
    },
    {
      "question": "Does either tool offer enterprise governance features like SSO or audit logs?",
      "answer": "Flagsmith offers SAML/SSO, roles, permissions, change requests, and audit logs starting on its Scale-Up tier ($250/month annual). Airflow's governance is centered on Apache Software Foundation backing and its dedicated security team rather than in-app SSO/audit features."
    }
  ]
};

export default airflowVsFlagsmithContent;

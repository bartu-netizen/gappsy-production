import type { ToolComparisonContent } from './types';

const dagsterVsPrefectContent: ToolComparisonContent = {
  "verdict": "Dagster and Prefect are both open-source-rooted workflow orchestration platforms, and per both companies' own FAQs, Prefect acquired Dagster Labs in July 2026 — so they're no longer fully independent competitors. As distinct products today, Prefect's Hobby plan gives a genuinely free entry point built around a Python @flow decorator, while Dagster+ requires payment after a 30-day trial and centers on asset-based pipeline modeling with native dbt/Snowflake/Fivetran integrations.",
  "bestForToolA": "Teams that want asset-lineage-first orchestration with native dbt, Snowflake, and Fivetran hooks, branch deployments for testing pipeline changes, and AI-assisted pipeline diagnostics, and who are prepared to pay from day one (Dagster+ has no permanent free tier).",
  "bestForToolB": "Teams that want to start free on the Hobby plan and add orchestration to existing Python code via a decorator rather than restructuring pipelines around assets, and who value a large open-source community (40,000+ GitHub stars).",
  "whoNeedsBoth": "Given the acquisition, most teams won't need both going forward, but organizations mid-migration between the two frameworks — or evaluating consolidation in the wake of Prefect's acquisition of Dagster Labs — may run both temporarily.",
  "keyDifferences": [
    {
      "title": "Corporate relationship",
      "toolA": "Dagster's own FAQ confirms Prefect acquired Dagster Labs in July 2026.",
      "toolB": "Prefect's FAQ states the same acquisition — Prefect acquired Dagster Labs in July 2026.",
      "whyItMatters": "Common ownership can affect long-term product direction, support priorities, and potential convergence of the two platforms.",
      "benefitsWho": "Prospective buyers evaluating either platform for a multi-year commitment should factor in this ownership change."
    },
    {
      "title": "Free tier for the hosted product",
      "toolA": "Dagster+ has no permanent free tier — only a 30-day free trial on the Solo ($120/month) and Starter ($1,200/month) plans.",
      "toolB": "Prefect Cloud offers a free Hobby plan ($0) with 2 users, 1 workspace, 5 deployments, and 500 serverless credits/month.",
      "whyItMatters": "A genuinely free hosted tier lets small teams run production workloads indefinitely without payment, not just evaluate for a limited window.",
      "benefitsWho": "Solo developers and small teams on tight budgets benefit from Prefect's free Hobby tier."
    },
    {
      "title": "Programming model",
      "toolA": "Pipelines are modeled as assets across the technology stack rather than via a specific language decorator pattern documented here.",
      "toolB": "Existing Python functions are turned into orchestrated workflows via an @flow decorator, without a new framework or DSL.",
      "whyItMatters": "A decorator-based approach lets teams add orchestration to code they already have with minimal rewriting.",
      "benefitsWho": "Python-heavy engineering teams benefit from Prefect's low-friction @flow decorator adoption path."
    },
    {
      "title": "Pricing transparency beyond the entry tier",
      "toolA": "Publishes pricing for Solo ($120/month) and Starter ($1,200/month) tiers, with Enterprise as custom.",
      "toolB": "Only the free Hobby tier's pricing is published; Starter, Team, and Pro Cloud tier pricing is not disclosed.",
      "whyItMatters": "Published mid-tier pricing lets buyers budget and compare costs before a sales conversation.",
      "benefitsWho": "Buyers who want to budget without contacting sales benefit from Dagster's more complete published pricing."
    },
    {
      "title": "AI-assisted operations",
      "toolA": "Dagster+ AI provides AI-assisted diagnostics and automated remediation for pipeline issues.",
      "toolB": "No AI-assisted diagnostics feature is documented for Prefect.",
      "whyItMatters": "Built-in AI diagnostics can reduce manual triage time when pipelines fail.",
      "benefitsWho": "Teams managing many production pipelines benefit from Dagster+ AI's remediation assistance."
    }
  ],
  "featureMatrix": [
    {
      "group": "Programming Model & Deployment",
      "rows": [
        {
          "feature": "Python decorator-based workflow definition (@flow)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Asset-based pipeline modeling",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Deployment on Kubernetes, ECS, or serverless",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Dagster documents hybrid cloud/on-prem/mix deployment, but doesn't name Kubernetes/ECS specifically."
        },
        {
          "feature": "AI-assisted diagnostics",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Branch/test deployments",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Free Tier",
      "rows": [
        {
          "feature": "Permanent free hosted tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Prefect's Hobby plan is $0."
        },
        {
          "feature": "Published pricing beyond entry tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Prefect's Starter, Team, and Pro tier pricing isn't published."
        },
        {
          "feature": "Free trial on hosted product",
          "toolA": "available",
          "toolB": "available",
          "note": "Dagster: 30-day trial on Solo/Starter. Prefect: free trial mentioned in FAQ."
        }
      ]
    },
    {
      "group": "Data Stack Integrations & Community",
      "rows": [
        {
          "feature": "Native dbt/Snowflake/Fivetran integration",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Documented open-source GitHub star count",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Prefect: 40,000+ GitHub stars."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Dagster related to Prefect?",
      "answer": "Yes — both companies' FAQs state that Prefect acquired Dagster Labs, the company behind Dagster, in July 2026."
    },
    {
      "question": "Do Dagster and Prefect have free plans?",
      "answer": "Prefect offers a free Hobby plan ($0) on Prefect Cloud, plus a free open-source core. Dagster's open-source framework is free to self-host, but Dagster+ has no permanent free tier — only a 30-day trial before paid plans begin at $120/month."
    },
    {
      "question": "What language does Prefect use?",
      "answer": "Prefect workflows are written in Python, turned into orchestrated flows via the @flow decorator."
    },
    {
      "question": "How large is Prefect's open-source community?",
      "answer": "The Prefect framework is open source (Apache 2.0) with 40,000+ GitHub stars."
    },
    {
      "question": "Does Dagster+ offer a free trial?",
      "answer": "Yes, a 30-day free trial is available for the Solo and Starter plans."
    },
    {
      "question": "What data tools does Dagster integrate with?",
      "answer": "Dagster lists first-class integrations with dbt, Snowflake, and Fivetran."
    }
  ]
};

export default dagsterVsPrefectContent;

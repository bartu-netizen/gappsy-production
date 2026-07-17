import type { ToolComparisonContent } from './types';

const dagsterVsTemporalContent: ToolComparisonContent = {
  "verdict": "Dagster and Temporal are both durable-execution orchestration platforms with free open-source cores, but they target different shapes of work: Dagster models data pipelines as assets with native dbt/Snowflake/Fivetran integrations and AI-assisted diagnostics, while Temporal provides general-purpose, durable workflow-as-code with automatic retries across seven programming languages. Neither has a permanent free tier for its hosted product, and Dagster's own FAQ notes that Prefect acquired Dagster Labs in July 2026, adding roadmap uncertainty Temporal doesn't share.",
  "bestForToolA": "Data engineering teams building ETL/ELT pipelines who want asset-based lineage, built-in observability, branch deployments for testing pipeline changes, and native integrations with dbt, Snowflake, and Fivetran.",
  "bestForToolB": "Engineering teams building durable business-logic workflows or microservices who need multi-language SDK support (Python, Go, TypeScript, Ruby, C#, Java, PHP) and automatic retry/state-recovery logic, and who don't need a data-pipeline-specific framework.",
  "whoNeedsBoth": "Organizations with both a data engineering function orchestrating dbt/Snowflake pipelines and a backend engineering function running durable service workflows may run Dagster and Temporal side by side, each for its own domain.",
  "keyDifferences": [
    {
      "title": "Orchestration model",
      "toolA": "Models data pipelines as assets across the technology stack, with lineage, dependency tracking, and data health monitoring built in.",
      "toolB": "Business logic is written as code and executed as a Temporal Workflow with automatic state persistence, independent of any asset concept.",
      "whyItMatters": "Asset-based modeling suits data pipeline lineage tracking; workflow-as-code suits general application logic that doesn't map naturally to data assets.",
      "benefitsWho": "Data engineers tracking pipeline lineage benefit from Dagster's asset model; application engineers building durable services benefit from Temporal's code-first model."
    },
    {
      "title": "Language support",
      "toolA": "Language/SDK support is not documented beyond its integrations with dbt, Snowflake, and Fivetran.",
      "toolB": "Provides SDKs for seven languages: Python, Go, TypeScript, Ruby, C#, Java, and PHP.",
      "whyItMatters": "Broad multi-language SDK support lets teams write durable workflows in whatever language their existing services already use.",
      "benefitsWho": "Polyglot engineering organizations benefit from Temporal's multi-language SDK coverage."
    },
    {
      "title": "AI-assisted operations",
      "toolA": "Dagster+ AI provides AI-assisted diagnostics and automated remediation for pipeline issues.",
      "toolB": "No AI-assisted diagnostics or remediation feature is documented.",
      "whyItMatters": "Built-in AI diagnostics can reduce time spent manually triaging pipeline failures.",
      "benefitsWho": "Data teams managing many pipelines benefit from Dagster+ AI's automated remediation."
    },
    {
      "title": "Native data-stack integrations",
      "toolA": "First-class integrations with dbt, Snowflake, and Fivetran are a named feature.",
      "toolB": "No specific data-tool integrations are documented; Temporal is positioned as general-purpose.",
      "whyItMatters": "Native connectors reduce the glue code needed to orchestrate common modern data stack tools.",
      "benefitsWho": "Teams already using dbt, Snowflake, or Fivetran benefit from Dagster's native connectors."
    },
    {
      "title": "Free tier and entry pricing",
      "toolA": "Dagster+ has no permanent free tier — only a 30-day free trial before Solo plan pricing of $120/month begins.",
      "toolB": "Also has no permanent free hosted tier, but new Temporal Cloud signups can get $1,000 in free credits, and the open-source core can be self-hosted for free with community support.",
      "whyItMatters": "The size and structure of free usage affects how long a team can evaluate the hosted product before paying.",
      "benefitsWho": "Teams wanting to self-host indefinitely at no cost can do so with either open-source core; teams wanting hosted-cloud credit benefit from Temporal's $1,000 signup credit."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Orchestration Model",
      "rows": [
        {
          "feature": "Asset-based data pipeline modeling",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Workflow-as-code for general business logic",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Branch/test deployments before production",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI-assisted diagnostics and remediation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Workflow replay and recovery",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Language & Integration Support",
      "rows": [
        {
          "feature": "Multi-language SDKs",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Temporal supports Python, Go, TypeScript, Ruby, C#, Java, PHP."
        },
        {
          "feature": "Native dbt/Snowflake/Fivetran integrations",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Open-source, self-hostable core",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Permanent free tier for hosted product",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "SLA on entry-level hosted plan",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Temporal Essentials includes a 99.9% SLA."
        },
        {
          "feature": "SSO/SAML support",
          "toolA": "available",
          "toolB": "available",
          "note": "Dagster: Enterprise plan. Temporal: SAML SSO and SCIM add-on on the Business plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Dagster free?",
      "answer": "The open-source Dagster orchestration framework is free and self-hostable; the hosted Dagster+ product starts at $120/month after a 30-day free trial."
    },
    {
      "question": "Is Temporal free?",
      "answer": "Yes, Temporal is MIT-licensed and open source and can be self-hosted for free with community support. The managed Temporal Cloud starts at $100/month for the Essentials plan."
    },
    {
      "question": "What languages does Temporal support?",
      "answer": "Temporal provides SDKs for Python, Go, TypeScript, Ruby, C#, Java, and PHP."
    },
    {
      "question": "What data tools does Dagster integrate with?",
      "answer": "Dagster lists first-class integrations with dbt, Snowflake, and Fivetran."
    },
    {
      "question": "Are Dagster and Temporal related companies?",
      "answer": "Dagster's own FAQ states that Prefect announced it acquired Dagster Labs in July 2026, which could affect Dagster's product roadmap. Temporal isn't part of that acquisition."
    },
    {
      "question": "Does either platform offer free credits for new signups?",
      "answer": "New Temporal Cloud signups can get $1,000 in free credits. This isn't documented for Dagster+."
    }
  ]
};

export default dagsterVsTemporalContent;

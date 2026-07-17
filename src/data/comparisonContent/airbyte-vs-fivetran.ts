import type { ToolComparisonContent } from './types';

const airbyteVsFivetranContent: ToolComparisonContent = {
  "verdict": "Airbyte and Fivetran solve the same ELT problem from opposite starting points. Airbyte is an open-source platform you can self-host for free, giving engineering teams full control over infrastructure and cost, with a managed Cloud option and a paid Self-Managed Enterprise tier for teams that need SSO, RBAC, and audit logging without giving up self-hosting. Fivetran is a fully managed service with no self-hosting path at all: every tier runs on Fivetran's infrastructure, connectors are centrally maintained rather than community-contributed, and pricing is usage-based across monthly active rows (MAR) from the free tier upward. The practical trade-off is operational effort versus control and predictable cost. Teams with data engineering capacity who want to avoid per-row billing, or who need connectors for internal or unusual systems, tend to prefer Airbyte's open-source core and Connector Development Kit. Teams that want zero infrastructure management, consistent connector support, built-in column-level masking, and faster sync frequencies at higher tiers tend to prefer Fivetran, accepting MAR-based costs as the price of that convenience. Neither tool is a strict upgrade over the other; the right choice depends on whether a team is optimizing for infrastructure control and cost ceiling, or for operational simplicity and vendor-managed reliability.",
  "bestForToolA": "Airbyte is the better fit for engineering teams that want to self-host for free, need connectors for internal or long-tail systems via the CDK, or want to avoid usage-based row pricing entirely.",
  "bestForToolB": "Fivetran is the better fit for teams that want a fully managed pipeline with no infrastructure to maintain, consistent vendor-supported connectors, and built-in column-level data masking for compliance needs.",
  "whoNeedsBoth": "Organizations with multiple data teams sometimes run Airbyte self-hosted for cost-sensitive or custom internal sources while using Fivetran for standard SaaS and database connectors where managed reliability matters more than cost control.",
  "keyDifferences": [
    {
      "title": "Deployment model",
      "toolA": "Airbyte can be self-hosted via Docker or Kubernetes, or run as the managed Airbyte Cloud",
      "toolB": "Fivetran runs entirely on Fivetran-managed infrastructure with no self-hosting option",
      "whyItMatters": "Self-hosting shifts operational work to the team but removes vendor lock-in and licensing cost, while a fully managed service removes that work but ties the team to the vendor's infrastructure",
      "benefitsWho": "Teams with data engineering resources benefit from Airbyte's self-hosting flexibility; teams without ops capacity benefit from Fivetran's fully managed model"
    },
    {
      "title": "Pricing structure",
      "toolA": "Airbyte Open Source is free to self-host, with Cloud priced usage-based and Self-Managed Enterprise sold as custom pricing",
      "toolB": "Fivetran prices every paid tier by monthly active rows (MAR) plus a base fee per connection, with a capped free plan",
      "whyItMatters": "A free self-hosted core versus row-based billing on every paid tier changes how costs scale with data volume and churn",
      "benefitsWho": "Cost-sensitive teams with steady or high row-change volume benefit from Airbyte self-hosted; teams with moderate, predictable volumes may find Fivetran's MAR pricing acceptable"
    },
    {
      "title": "Connector maintenance model",
      "toolA": "Airbyte's catalog includes many community-maintained connectors alongside officially supported ones",
      "toolB": "Fivetran's connector catalog is centrally built and maintained by Fivetran",
      "whyItMatters": "Community-maintained connectors can vary in quality and support responsiveness compared to a single vendor-maintained catalog",
      "benefitsWho": "Teams needing guaranteed connector support benefit from Fivetran; teams needing broad long-tail coverage and willing to accept variable quality benefit from Airbyte"
    },
    {
      "title": "Custom connector extensibility",
      "toolA": "Airbyte offers a Connector Development Kit (CDK) for low-code or Python-based custom connectors",
      "toolB": "Fivetran offers a Connector SDK for building custom connectors in code",
      "whyItMatters": "Both support extending beyond the standard catalog, but the tooling and coding requirements differ",
      "benefitsWho": "Teams wanting a lower-code path may prefer Airbyte's CDK; teams already comfortable writing custom connector code can use either"
    },
    {
      "title": "Governance and access controls",
      "toolA": "Airbyte's SSO, RBAC, and audit logging are only available on the paid Self-Managed Enterprise tier",
      "toolB": "Fivetran includes role-based access control and audit logging as part of its standard product, with column-level hashing or blocking available",
      "whyItMatters": "Governance features being gated behind a paid enterprise tier versus included in the core product affects total cost for compliance-focused teams",
      "benefitsWho": "Regulated or security-conscious teams on tighter budgets may find Fivetran's built-in RBAC, audit logging, and column masking more accessible; larger teams already budgeting for enterprise licensing get equivalent controls from Airbyte Self-Managed Enterprise"
    },
    {
      "title": "Data masking controls",
      "toolA": "Not documented for Airbyte",
      "toolB": "Fivetran supports hashing or blocking specific columns to exclude or obscure sensitive fields before they reach the warehouse",
      "whyItMatters": "Column-level masking matters for teams handling sensitive data like PII that must be obscured before landing in a warehouse",
      "benefitsWho": "Teams with sensitive-data compliance requirements benefit from Fivetran's documented masking controls"
    },
    {
      "title": "Sync frequency and real-time behavior",
      "toolA": "Airbyte supports full refresh, incremental sync, and change data capture, without a documented minimum sync interval",
      "toolB": "Fivetran offers a 15-minute minimum sync frequency on Standard and a 1-minute minimum on Enterprise and above",
      "whyItMatters": "Explicit sync-frequency guarantees help teams plan around freshness SLAs for downstream reporting",
      "benefitsWho": "Teams needing near-real-time freshness guarantees benefit from Fivetran's documented Enterprise-tier sync intervals"
    },
    {
      "title": "Orchestration ecosystem integration",
      "toolA": "Airbyte integrates with Airflow, Dagster, and Prefect in addition to dbt",
      "toolB": "Not documented beyond dbt-based transformations for Fivetran",
      "whyItMatters": "Native orchestrator integrations matter for teams building syncs into a broader scheduled pipeline rather than relying on the tool's own scheduler",
      "benefitsWho": "Data engineering teams already standardized on Airflow, Dagster, or Prefect benefit from Airbyte's documented orchestrator support"
    },
    {
      "title": "Company origin and maturity",
      "toolA": "Airbyte was founded in 2020 in San Francisco as an open-source project",
      "toolB": "Fivetran was founded in 2012 in Oakland as a commercial managed service",
      "whyItMatters": "A longer operating history as a commercial product versus a newer open-source-first company can influence risk tolerance and expectations around long-term support",
      "benefitsWho": "Teams prioritizing a longer commercial track record may lean toward Fivetran; teams aligned with open-source-first vendors may lean toward Airbyte"
    }
  ],
  "featureMatrix": [
    {
      "group": "Connectivity and sources",
      "rows": [
        {
          "feature": "Connector catalog size",
          "toolA": "available",
          "toolB": "available",
          "note": "Both document hundreds of pre-built connectors"
        },
        {
          "feature": "Custom connector development kit",
          "toolA": "available",
          "toolB": "available",
          "note": "Airbyte CDK is low-code or Python; Fivetran Connector SDK is code-based"
        },
        {
          "feature": "Change data capture or log-based replication",
          "toolA": "available",
          "toolB": "available",
          "note": "Documented for supported database sources on both platforms"
        }
      ]
    },
    {
      "group": "Deployment and hosting",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Airbyte supports Docker or Kubernetes self-hosting; Fivetran runs only on its own infrastructure"
        },
        {
          "feature": "Managed cloud offering",
          "toolA": "available",
          "toolB": "available",
          "note": "Airbyte Cloud is the managed option alongside self-hosting"
        },
        {
          "feature": "Open-source core",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Airbyte's Open Source tier is free and self-hosted"
        }
      ]
    },
    {
      "group": "Governance and security",
      "rows": [
        {
          "feature": "Role-based access control",
          "toolA": "available",
          "toolB": "available",
          "note": "Airbyte RBAC is limited to the Self-Managed Enterprise tier; Fivetran includes it starting at Standard"
        },
        {
          "feature": "Single sign-on",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Airbyte SSO is part of Self-Managed Enterprise; not documented for Fivetran"
        },
        {
          "feature": "Audit logging",
          "toolA": "available",
          "toolB": "available",
          "note": "Airbyte audit logging is Self-Managed Enterprise only; Fivetran includes it as a core feature"
        },
        {
          "feature": "Column-level data masking",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Fivetran supports hashing or blocking sensitive columns"
        }
      ]
    },
    {
      "group": "Transformation and orchestration",
      "rows": [
        {
          "feature": "dbt integration",
          "toolA": "available",
          "toolB": "available",
          "note": "Both trigger or integrate with dbt-based transformations after sync"
        },
        {
          "feature": "Native orchestrator integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Airbyte documents Airflow, Dagster, and Prefect integrations"
        }
      ]
    },
    {
      "group": "Monitoring and support",
      "rows": [
        {
          "feature": "Sync monitoring and alerting dashboard",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Community support channels",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Airbyte documents Slack and GitHub community support on the Open Source tier"
        },
        {
          "feature": "Priority or enterprise support",
          "toolA": "available",
          "toolB": "available",
          "note": "Airbyte via Self-Managed Enterprise; Fivetran via Enterprise and Business Critical tiers"
        }
      ]
    },
    {
      "group": "Pricing and plans",
      "rows": [
        {
          "feature": "Free tier or free self-hosting",
          "toolA": "available",
          "toolB": "available",
          "note": "Airbyte Open Source is free indefinitely when self-hosted; Fivetran's free plan is capped at 500,000 monthly active rows"
        },
        {
          "feature": "Usage-based pricing option",
          "toolA": "available",
          "toolB": "available",
          "note": "Airbyte Cloud is usage-based; all Fivetran paid tiers are priced per million MAR"
        },
        {
          "feature": "Flat, licensing-free self-hosted cost",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Only Airbyte offers a no-licensing-cost self-hosted path"
        }
      ]
    },
    {
      "group": "Destinations",
      "rows": [
        {
          "feature": "Cloud data warehouse and lake destinations",
          "toolA": "available",
          "toolB": "available",
          "note": "Fivetran explicitly names Snowflake, BigQuery, Redshift, Databricks, and Azure Synapse; Airbyte documents warehouses, lakes, and databases generally"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Airbyte or Fivetran?",
      "answer": "Airbyte can be free to run if self-hosted since the Open Source tier has no licensing cost, while Fivetran always charges based on monthly active rows even on its capped free plan, so Airbyte tends to be cheaper for teams able to self-host, while Fivetran's free plan up to 500,000 monthly active rows may suit smaller managed-only use cases."
    },
    {
      "question": "Is Airbyte good for beginners without data engineering experience?",
      "answer": "Airbyte's documentation notes a steeper learning curve for teams without data engineering experience compared to fully abstracted SaaS tools, so beginners may find Fivetran's fully managed, guided setup easier to start with."
    },
    {
      "question": "Can Fivetran be self-hosted like Airbyte?",
      "answer": "No, Fivetran runs entirely on its own managed infrastructure with no self-hosting option, while Airbyte can be self-hosted via Docker or Kubernetes or run through the managed Airbyte Cloud."
    },
    {
      "question": "Which tool supports faster or near-real-time syncs?",
      "answer": "Fivetran documents specific sync frequency minimums, down to 1 minute on its Enterprise and above tiers, while Airbyte supports CDC and incremental sync modes but does not document a specific minimum sync interval."
    },
    {
      "question": "Which has stronger governance and security controls, Airbyte or Fivetran?",
      "answer": "Fivetran includes role-based access control, audit logging, and column-level data masking as part of its core product, while Airbyte offers equivalent SSO, RBAC, and audit logging only through the paid Self-Managed Enterprise tier."
    },
    {
      "question": "Can I use both Airbyte and Fivetran together?",
      "answer": "Yes, some teams self-host Airbyte for custom or internal data sources to avoid per-row costs while using Fivetran for standard SaaS and database connectors where fully managed reliability is the priority."
    }
  ]
};

export default airbyteVsFivetranContent;

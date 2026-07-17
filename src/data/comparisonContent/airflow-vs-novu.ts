import type { ToolComparisonContent } from './types';

const airflowVsNovuContent: ToolComparisonContent = {
  "verdict": "Airflow orchestrates data/pipeline workflows as Python DAGs; Novu orchestrates multi-channel notification workflows (email, SMS, push, chat) through a unified API. Both use the term \"workflow orchestration,\" but for entirely different domains — data pipelines versus end-user notifications.",
  "bestForToolA": "Data/engineering teams scheduling and monitoring pipeline DAGs with automatic retries across data sources reachable from Python.",
  "bestForToolB": "Product/engineering teams sending multi-channel notifications (email, SMS, push, in-app inbox, Slack/Teams) who want a free tier of 10,000 workflow runs/month and a prebuilt inbox UI component.",
  "whoNeedsBoth": "A team could use Airflow to run a scheduled data pipeline that detects an event, such as a report becoming ready, and then calls Novu's API to trigger the multi-channel notification workflow that alerts the relevant users.",
  "keyDifferences": [
    {
      "title": "Workflow Domain",
      "toolA": "\"Workflows\" are data/task pipelines defined as Python DAGs.",
      "toolB": "\"Workflow Orchestration\" coordinates multi-step, multi-channel notification delivery (email, SMS, push, chat) through a unified API.",
      "whyItMatters": "Despite both using the term \"workflow,\" they orchestrate fundamentally different things.",
      "benefitsWho": "Teams should map the term to the right domain (data vs. notifications) before comparing the two."
    },
    {
      "title": "Pricing",
      "toolA": "Entirely free and open source, with no vendor pricing plans.",
      "toolB": "Freemium — Free plan includes 10,000 workflow runs/month forever, Pro is $30/month (30,000+ runs, branding removal, advanced email editor), Team is $250/month (250,000+ runs), Enterprise is custom.",
      "whyItMatters": "Novu's cost scales with notification volume, while Airflow has no vendor licensing cost regardless of pipeline volume.",
      "benefitsWho": "Budget owners forecasting spend as notification volume grows benefit from understanding Novu's tiers; teams wanting zero vendor cost benefit from Airflow."
    },
    {
      "title": "Channel Coverage",
      "toolA": "Does not document any notification-channel delivery capability; its integrations are Python-based connections to data sources.",
      "toolB": "Documents delivery across 9+ channels including email, in-app inbox, SMS, push, and chat apps like Slack and Microsoft Teams, plus a prebuilt inbox UI component.",
      "whyItMatters": "Only Novu is purpose-built for reaching end users across communication channels.",
      "benefitsWho": "Product teams needing to notify users — a need Airflow doesn't address."
    },
    {
      "title": "Self-Hosting",
      "toolA": "Open source and self-hostable without a paid tier gate.",
      "toolB": "Self-hosted deployment is available only on the custom-priced Enterprise plan.",
      "whyItMatters": "Teams wanting self-hosted notification infrastructure must budget for Novu's Enterprise plan, unlike Airflow's fully open self-hosting.",
      "benefitsWho": "Cost-sensitive teams that want to self-host notifications without a custom sales contract may find Novu's gate a blocker."
    },
    {
      "title": "Community Scale & Governance",
      "toolA": "Backed by the Apache Software Foundation's dedicated security team and sponsorship program.",
      "toolB": "Open source with an MIT-licensed core (open-core model), roughly 39,000 GitHub stars, and US/EU data residency options.",
      "whyItMatters": "Both signal healthy open-source communities, but under different governance structures — an ASF foundation versus an open-core commercial company.",
      "benefitsWho": "Enterprises with foundation-governance or data-residency requirements evaluating each project's model."
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing & Deployment",
      "rows": [
        {
          "feature": "Open source",
          "toolA": "available",
          "toolB": "available",
          "note": "Novu: MIT-licensed core"
        },
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Novu: 10,000 workflow runs/month forever"
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "limited",
          "note": "Novu self-hosting is Enterprise plan only"
        },
        {
          "feature": "Data residency options (US/EU)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Workflow Orchestration",
      "rows": [
        {
          "feature": "DAG/pipeline-based workflow authoring",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Multi-step multi-channel notification orchestration",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Automatic retries & failure alerting",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Digest/consolidation engine",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Notification Delivery",
      "rows": [
        {
          "feature": "Email/SMS/push delivery channels",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "9+ channels"
        },
        {
          "feature": "Prebuilt inbox UI component",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Chat app integrations (Slack, Microsoft Teams)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "End-user notification preference management",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Airflow and Novu both do \"workflow orchestration\"?",
      "answer": "Both use that term, but for different things — Airflow orchestrates data/task pipelines as Python DAGs, while Novu orchestrates multi-step, multi-channel notification delivery through a unified API."
    },
    {
      "question": "Which is cheaper?",
      "answer": "Airflow has no vendor cost at all since it's a free Apache Software Foundation project. Novu's Free plan is also free (10,000 workflow runs/month forever), but scaling past that requires the $30/month Pro plan or higher."
    },
    {
      "question": "Can Novu be self-hosted for free like Airflow?",
      "answer": "No — Novu's self-hosted deployment is only available on its custom-priced Enterprise plan, whereas Airflow can be self-hosted without any paid tier."
    },
    {
      "question": "What channels does Novu support?",
      "answer": "Email, in-app inbox, SMS, push notifications, and chat channels including Slack and Microsoft Teams — 9+ channels total from one API."
    },
    {
      "question": "Could Airflow trigger a Novu notification?",
      "answer": "The facts don't document a specific built-in integration between the two, but Airflow's Python-native task execution could call any HTTP API, and Novu exposes a unified API for triggering notification workflows, so this pairing is architecturally plausible even though it isn't documented as an official integration."
    },
    {
      "question": "Does Novu remove its branding on the free plan?",
      "answer": "No — removing Novu branding requires the paid Pro plan ($30/month) or higher."
    }
  ]
};

export default airflowVsNovuContent;

import type { ToolComparisonContent } from './types';

const makeVsRudderstackContent: ToolComparisonContent = {
  "verdict": "Make is a general-purpose visual automation platform for connecting apps, moving data between them, and building branching business workflows, while RudderStack is a purpose-built customer data platform (CDP) for collecting, unifying, and activating first-party customer event data across a warehouse and 200+ destinations. They solve adjacent but different problems: Make wires arbitrary apps and APIs together with routers and error handling, while RudderStack focuses specifically on event tracking, identity resolution, and warehouse-native customer data governance. Teams choosing between them are usually really choosing between \"automate a business process\" and \"stand up a customer data pipeline.\"",
  "bestForToolA": "Make fits teams that need to automate multi-step business processes across CRMs, spreadsheets, and SaaS tools using a visual, flowchart-style canvas with routers, iterators, and custom API/webhook modules, starting free with paid plans from around $9/month.",
  "bestForToolB": "RudderStack fits product and data teams that need to collect events from 16 SDKs, build customer 360 profiles with LTV and propensity scoring, and sync directly into Snowflake, BigQuery, Redshift, or Databricks, starting with a free plan covering 250K events/month.",
  "whoNeedsBoth": "A product-led SaaS company could use RudderStack to collect and warehouse product usage events and customer profiles, then use Make to automate downstream business actions (like updating a CRM record or sending a Slack alert) whenever RudderStack activates data to one of its 200+ destinations.",
  "keyDifferences": [
    {
      "title": "Core Category",
      "toolA": "Make is a no-code visual automation/iPaaS tool built around a scenario canvas with routers, iterators, and error-handling modules.",
      "toolB": "RudderStack is a customer data platform focused on event collection (16 SDKs), identity resolution, and warehouse-native activation to 200+ destinations.",
      "whyItMatters": "Choosing the wrong category means solving a data-infrastructure problem with a workflow tool, or vice versa.",
      "benefitsWho": "Operations teams automating processes benefit from Make; product and data teams building customer data infrastructure benefit from RudderStack."
    },
    {
      "title": "Free Plan Depth",
      "toolA": "Make's Free plan gives a limited monthly operations/credits allowance and full access to the visual scenario builder and integrations library.",
      "toolB": "RudderStack's Free plan includes 250,000 events/month, all 16 SDK sources, 200+ destinations, and up to 10 team members with community Slack support.",
      "whyItMatters": "The free tier defines how far a team can validate the tool before paying, and the two are scoped around completely different usage units (operations vs. events).",
      "benefitsWho": "Small teams and prototypers testing either platform before committing budget."
    },
    {
      "title": "Pricing Entry Point",
      "toolA": "Make's paid plans start from around $9/month (Core) billed annually, scaling to Pro (~$16/month) and Teams (~$29/month) or custom Enterprise.",
      "toolB": "RudderStack's Growth plan starts at $265/month (with a 15% annual discount) and covers up to 1 million events/month with a 30-day free trial.",
      "whyItMatters": "The price gap reflects the difference between a lightweight automation tool and enterprise-grade data infrastructure, and affects which budget line each purchase falls under.",
      "benefitsWho": "Budget-conscious teams needing simple automations save with Make; data teams needing warehouse-grade event pipelines get more infrastructure value from RudderStack's higher price point."
    },
    {
      "title": "AI Capabilities",
      "toolA": "Make offers AI modules and agent building blocks that can be dropped directly into automation scenarios alongside other app steps.",
      "toolB": "RudderStack ships RudderAI agentic workflows, natural-language interfaces for building audiences and exploring data, plus infrastructure-as-code for engineers.",
      "whyItMatters": "Both platforms are adding AI, but Make's AI sits inside general workflow automation while RudderStack's AI is scoped to customer data tasks like audience building.",
      "benefitsWho": "Marketers building automations benefit from Make's AI modules; data and growth teams building audiences benefit from RudderAI."
    },
    {
      "title": "Open Source & Self-Hosting",
      "toolA": "Make is a fully hosted SaaS platform with no self-hosted or open-source option documented.",
      "toolB": "RudderStack offers a self-hosted, open-source version under the Elastic 2.0 license available on all plans, including Free.",
      "whyItMatters": "Self-hosting matters for teams with strict data-residency or infrastructure-control requirements.",
      "benefitsWho": "Engineering teams that need to keep customer event data inside their own infrastructure benefit from RudderStack's self-hosted option."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Functionality",
      "rows": [
        {
          "feature": "Visual flowchart/scenario builder",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Make's drag-and-drop canvas is a core differentiator"
        },
        {
          "feature": "Event tracking SDKs",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "16 SDKs for web, mobile, and server-side"
        },
        {
          "feature": "Customer identity/profile resolution",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Customer 360 profiles with LTV and propensity scoring"
        },
        {
          "feature": "Custom API/webhook modules",
          "toolA": "available",
          "toolB": "available",
          "note": "Make via generic HTTP/webhook modules; RudderStack via 200+ destination integrations"
        },
        {
          "feature": "Warehouse-native architecture",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Connects directly to Snowflake, BigQuery, Redshift, Databricks, Azure"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Make: limited ops/credits; RudderStack: 250K events/month"
        },
        {
          "feature": "Entry paid plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "Make Core ~$9/month vs RudderStack Growth $265/month"
        },
        {
          "feature": "Self-hosted/open-source option",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "RudderStack under Elastic 2.0 license"
        },
        {
          "feature": "Custom Enterprise plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Both offer custom Enterprise pricing"
        }
      ]
    },
    {
      "group": "Governance & Reliability",
      "rows": [
        {
          "feature": "Error handling / retries",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Make: error handlers, retry logic, fallback routes"
        },
        {
          "feature": "Data governance (schema, consent, PII)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "RudderStack: schema management, event validation, consent automation"
        },
        {
          "feature": "Compliance certifications",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "RudderStack: GDPR, SOC 2 Type 2, CCPA, HIPAA"
        },
        {
          "feature": "Execution/run history logs",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Make: execution logs and history of past scenario runs"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can Make replace a customer data platform like RudderStack?",
      "answer": "Not really. Make is designed to connect apps and automate multi-step business workflows using routers, iterators, and custom API calls, while RudderStack is purpose-built to collect, unify, and govern customer event data with 16 SDKs and warehouse-native syncing. Make can move data between tools, but it doesn't offer RudderStack's identity resolution or schema governance."
    },
    {
      "question": "Which tool has a more generous free plan?",
      "answer": "They're scoped differently: Make's Free plan gives a limited monthly allowance of operations/credits, while RudderStack's Free plan includes 250,000 events/month, all 16 SDKs, and 200+ destinations for up to 10 team members. Compare based on your actual usage unit rather than assuming one is simply \"bigger.\""
    },
    {
      "question": "Does RudderStack have a visual automation builder like Make?",
      "answer": "RudderStack's documented interface centers on event collection, identity, and activation, plus natural-language RudderAI agentic workflows for building audiences — a flowchart-style scenario builder like Make's is not documented for RudderStack."
    },
    {
      "question": "Is RudderStack open source?",
      "answer": "Yes, RudderStack offers a self-hosted, open-source version under the Elastic 2.0 license available across all plans, including Free. Make does not document a self-hosted or open-source option."
    },
    {
      "question": "How much does each tool cost to start on a paid plan?",
      "answer": "Make's paid plans start from around $9/month (Core, billed annually), while RudderStack's Growth plan starts at $265/month for up to 1 million events/month, with a 15% discount for annual billing and a 30-day free trial."
    },
    {
      "question": "Can Make and RudderStack be used together?",
      "answer": "Yes, in practice. RudderStack can collect and warehouse customer event data and activate it to one of its 200+ destinations, and Make can then pick up that activation to trigger further business automations, such as CRM updates or team notifications."
    }
  ]
};

export default makeVsRudderstackContent;

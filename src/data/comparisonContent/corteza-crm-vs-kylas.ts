import type { ToolComparisonContent } from './types';

const cortezaCrmVsKylasContent: ToolComparisonContent = {
  "verdict": "Corteza CRM and Kylas both offer a free way into CRM, but through very different models. Corteza is fully open source under the Apache 2.0 license, requires self-hosting (e.g. via Docker), and bundles the CRM module with a broader low-code app builder, unified workspace, and enterprise messaging. Kylas, based in Pune, India, is a proprietary hosted SaaS CRM with a genuinely free lifetime Embark plan, unlimited users on every tier, and AI-powered features like lead scoring and call sentiment analysis. The decision comes down to whether a team wants to self-host an open platform or use a ready-made hosted CRM.",
  "bestForToolA": "Technical teams that want a fully open-source, self-hostable CRM with no vendor lock-in, especially those who also want a low-code app builder for building custom internal apps beyond CRM.",
  "bestForToolB": "Sales teams that want a hosted, ready-to-use CRM with a genuinely free lifetime tier, AI lead scoring, and unlimited users on every plan without managing infrastructure.",
  "whoNeedsBoth": "There's no realistic scenario for running both as parallel CRMs for the same sales team -- a company picks one architecture (self-hosted open source versus hosted SaaS) as its system of record rather than splitting customer data across two CRMs.",
  "keyDifferences": [
    {
      "title": "Licensing and Openness",
      "toolA": "Corteza is fully open source under the Apache 2.0 license, with code contributed to the Commons Conservancy Software Foundation so access can't be revoked by a single vendor.",
      "toolB": "Kylas is a proprietary SaaS product; no open-source licensing is documented.",
      "whyItMatters": "Open-source licensing affects vendor lock-in risk and the ability to inspect or modify the underlying code.",
      "benefitsWho": "Organizations with strict data sovereignty or vendor-independence requirements."
    },
    {
      "title": "Hosting Model",
      "toolA": "Corteza requires self-hosting (e.g. via Docker); its own cons note there's no first-party managed cloud, though third parties like Planet Crust offer hosted instances.",
      "toolB": "Kylas is a hosted SaaS product with tiered plans (Embark, Elevate, Exceed) and no self-hosting option documented.",
      "whyItMatters": "Self-hosting shifts infrastructure and maintenance responsibility onto the customer, while SaaS trades that control for convenience.",
      "benefitsWho": "IT teams comfortable managing servers (Corteza) versus sales teams that want zero infrastructure overhead (Kylas)."
    },
    {
      "title": "Scope Beyond CRM",
      "toolA": "Corteza bundles its CRM module with a unified workspace, Slack-style enterprise messaging, and a general low-code app builder for records-based apps beyond CRM.",
      "toolB": "Kylas is purpose-built as a sales CRM with a communication hub, field sales management, and quotation management, not a general app builder.",
      "whyItMatters": "Buyers looking for a single platform to build custom internal tools need different capabilities than buyers who just need a CRM.",
      "benefitsWho": "Teams wanting to consolidate multiple internal tools into one open-source platform (Corteza) versus teams that just need sales CRM functionality (Kylas)."
    },
    {
      "title": "AI Features",
      "toolA": "No AI features are documented for Corteza.",
      "toolB": "Kylas includes AI-powered tools such as call sentiment analysis, an AI chatbot, lead scoring, and automation agents.",
      "whyItMatters": "AI-assisted lead scoring and sentiment analysis can help sales teams prioritize outreach without manual review.",
      "benefitsWho": "Sales teams wanting built-in AI assistance without adding separate tools."
    },
    {
      "title": "User Pricing Model",
      "toolA": "Corteza is free as open-source software with no per-user licensing, though it requires technical setup and infrastructure costs.",
      "toolB": "Kylas offers unlimited users on every plan, including paid tiers, with a free lifetime Embark plan capped at 10,000 records and 5GB storage.",
      "whyItMatters": "Per-seat pricing caps can make growing sales teams expensive on some CRMs; unlimited users removes that constraint.",
      "benefitsWho": "Growing sales teams that don't want CRM costs to scale directly with headcount."
    }
  ],
  "featureMatrix": [
    {
      "group": "CRM Core Features",
      "rows": [
        {
          "feature": "Pipeline/deal management",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "AI lead scoring",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Multichannel communication hub (email/SMS/WhatsApp)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Corteza has internal team messaging, not customer-facing multichannel comms"
        },
        {
          "feature": "Quotation management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Field sales tracking",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Corteza via Docker"
        },
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Corteza is free/open source; Kylas's Embark plan is free for life, capped at 10,000 records/5GB"
        },
        {
          "feature": "Unlimited users on paid plans",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Marketplace/app integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Kylas: 350+ marketplace apps"
        }
      ]
    },
    {
      "group": "AI & Extensibility",
      "rows": [
        {
          "feature": "AI-powered features (scoring, chatbot, sentiment)",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Low-code custom app builder beyond CRM",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Open-source license",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Corteza: Apache 2.0"
        },
        {
          "feature": "Role-based access control",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Corteza's Flattened RBAC"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Corteza really free?",
      "answer": "Yes, Corteza is fully open source under the Apache 2.0 license and free to download and self-host."
    },
    {
      "question": "Is Kylas free?",
      "answer": "Yes -- the Embark plan is free for life, with up to 10,000 records and 5GB of storage, though it lacks email, telephony, and advanced automation features."
    },
    {
      "question": "Does Kylas charge per user?",
      "answer": "No, all Kylas plans, including paid tiers, include unlimited users with no per-seat cost."
    },
    {
      "question": "Can Corteza be used without managing a server?",
      "answer": "Corteza is designed to be self-hosted via Docker; hosted cloud instances are also offered by third parties such as Planet Crust, separate from the core open-source project."
    },
    {
      "question": "Does Kylas include AI features?",
      "answer": "Yes -- call sentiment analysis, an AI chatbot, lead scoring, and automation agents."
    },
    {
      "question": "Is Corteza only a CRM?",
      "answer": "No. Corteza is a broader low-code platform that includes a CRM module alongside a unified workspace and enterprise messaging."
    }
  ]
};

export default cortezaCrmVsKylasContent;

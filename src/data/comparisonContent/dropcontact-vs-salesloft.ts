import type { ToolComparisonContent } from './types';

const dropcontactVsSalesloftContent: ToolComparisonContent = {
  "verdict": "Dropcontact and Salesloft solve different problems in the same revenue stack. Dropcontact is a focused GDPR-compliant email finder and CRM data-cleaning tool starting at €79/month, built to keep contact records accurate. Salesloft is a much broader revenue orchestration platform combining cadence automation, conversation intelligence, deals management, and AI agents, priced only through a custom sales quote and used by 4,000+ customers including IBM and Stripe. Neither is a substitute for the other; they sit at different layers of a sales workflow.",
  "bestForToolA": "Teams that need to find, verify, deduplicate, and enrich B2B contact records in a CRM without paying for a full sales engagement suite, starting at €79/month for 500 credits.",
  "bestForToolB": "Larger go-to-market organizations that need cadence automation, conversation intelligence, forecasting, and AI outreach agents in one platform, at the scale of customers like IBM, Stripe, Siemens, and 3M.",
  "whoNeedsBoth": "A sales operations team running outbound cadences in Salesloft could use Dropcontact first to find and verify B2B emails and strip duplicate records, then push the cleaned contacts into Salesloft via Pipedrive/HubSpot or Zapier before launching sequences.",
  "keyDifferences": [
    {
      "title": "Core Product Category",
      "toolA": "Dropcontact is a B2B email finder and data enrichment tool focused on finding verified emails, deduplicating records, and updating contact data automatically.",
      "toolB": "Salesloft is a revenue orchestration platform built around cadence automation, deals management, conversation intelligence, and sales forecasting.",
      "whyItMatters": "Buyers evaluating these as competitors would be comparing a data-hygiene point solution against a full sales execution platform.",
      "benefitsWho": "RevOps teams trying to scope whether they need a data tool, an engagement tool, or both."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Dropcontact publishes tiered pricing: Starter at €79/month and Growth at €120/month, both for 500 credits, with a 20% discount for yearly billing.",
      "toolB": "Salesloft publishes no pricing at all; every plan requires contacting sales for a quote.",
      "whyItMatters": "Published pricing lets smaller teams self-serve a purchase decision, while custom pricing usually signals an enterprise sales process.",
      "benefitsWho": "Budget-conscious buyers and smaller teams who want to compare costs without a sales call."
    },
    {
      "title": "AI Capabilities",
      "toolA": "Dropcontact's Growth plan adds AI-powered job classification alongside company change detection and LinkedIn URL enrichment.",
      "toolB": "Salesloft includes AI chat agents that convert website visitors into pipeline and AI agents that automate email outreach workflows, plus the Rhythm engine that recommends what reps should do next.",
      "whyItMatters": "The AI in each tool serves a different job: Dropcontact's AI classifies and cleans data, while Salesloft's AI acts on prospects directly.",
      "benefitsWho": "Sales development teams that want AI to take outbound actions, versus operations teams that want AI to improve data quality."
    },
    {
      "title": "GDPR and Compliance Positioning",
      "toolA": "Dropcontact states it is 100% GDPR compliant, using proprietary algorithms instead of reselling personal data, and holds G2 Winter and High Performer EMEA recognition.",
      "toolB": "Salesloft's GDPR compliance approach is not documented in its public materials.",
      "whyItMatters": "Companies operating under EU data protection rules need explicit compliance claims from any tool that touches personal contact data.",
      "benefitsWho": "EU-based or EU-facing sales and marketing teams handling personal data at the enrichment layer."
    },
    {
      "title": "Integration Model",
      "toolA": "Dropcontact has native integrations with Pipedrive and HubSpot, plus 1,200+ tools reachable through Zapier, Make, and n8n, along with direct API and MCP access.",
      "toolB": "Salesloft offers an integrations marketplace at marketplace.salesloft.com, though the number and depth of listed integrations are not detailed in its public materials.",
      "whyItMatters": "The breadth and directness of integrations determines how much manual glue work is needed to fit either tool into an existing CRM stack.",
      "benefitsWho": "Teams already standardized on Pipedrive or HubSpot who want enrichment to plug in with minimal setup."
    }
  ],
  "featureMatrix": [
    {
      "group": "Data Enrichment & Cleaning",
      "rows": [
        {
          "feature": "B2B email finding",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Dropcontact states a 98% valid email rate"
        },
        {
          "feature": "Duplicate detection & merging",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Company change detection",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Growth plan (€120/mo)"
        },
        {
          "feature": "LinkedIn/company data enrichment",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Growth plan only"
        }
      ]
    },
    {
      "group": "Sales Engagement & AI",
      "rows": [
        {
          "feature": "Multi-step cadence automation",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Conversation intelligence (call analysis)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "AI outreach/chat agents",
          "toolA": "limited",
          "toolB": "available",
          "note": "Dropcontact's AI is limited to job classification, not outreach"
        },
        {
          "feature": "Revenue forecasting",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Published self-serve pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Dropcontact from €79/mo; Salesloft is quote-only"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Dropcontact offers 50 free emails"
        },
        {
          "feature": "Native CRM integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Dropcontact: Pipedrive/HubSpot; Salesloft: marketplace"
        },
        {
          "feature": "API/MCP access",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Dropcontact Starter plan includes API and MCP access"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Dropcontact a competitor to Salesloft?",
      "answer": "Not directly. Dropcontact focuses on finding, verifying, and cleaning B2B contact data, while Salesloft is a full revenue orchestration platform for cadences, deals, forecasting, and conversation intelligence. They address different stages of the sales workflow."
    },
    {
      "question": "How much does Dropcontact cost compared to Salesloft?",
      "answer": "Dropcontact publishes pricing starting at €79/month for the Starter plan (500 credits) and €120/month for Growth. Salesloft does not publish pricing and requires contacting sales for a quote."
    },
    {
      "question": "Does either tool offer a free trial?",
      "answer": "Dropcontact offers 50 free emails to test before subscribing. A free trial is not documented for Salesloft."
    },
    {
      "question": "Can Dropcontact and Salesloft be used together?",
      "answer": "Yes. Dropcontact can enrich and clean contact records via its native Pipedrive/HubSpot integrations or Zapier/Make/n8n, and those clean records can then be worked through Salesloft's cadences and deals management."
    },
    {
      "question": "Which tool is better for GDPR compliance needs?",
      "answer": "Dropcontact explicitly states it is 100% GDPR compliant using proprietary algorithms rather than reselling personal data. Salesloft does not document a specific GDPR compliance stance in its public materials."
    },
    {
      "question": "Does Salesloft include AI features like Dropcontact does?",
      "answer": "Both include AI, but for different purposes. Dropcontact uses AI for job classification during enrichment, while Salesloft uses AI agents for website chat conversion and automated email outreach, plus its Rhythm recommendation engine."
    }
  ]
};

export default dropcontactVsSalesloftContent;

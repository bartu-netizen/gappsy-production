import type { ToolComparisonContent } from './types';

const nueVsQuotapathContent: ToolComparisonContent = {
  "verdict": "Nue and QuotaPath both touch the deal-to-revenue process but solve different problems: Nue is a quote-to-cash platform for CPQ, billing, and usage monetization built natively on Salesforce, while QuotaPath is a sales commission tracking and compensation management platform for calculating what reps get paid on the deals Nue or other systems help close. One prices and bills the deal; the other pays the person who sold it.",
  "bestForToolA": "Nue fits Salesforce-centric SaaS companies needing native CPQ, lifecycle management for amendments/renewals, and omnichannel usage monetization, with named customers including OpenAI, Jasper, and Superhuman.",
  "bestForToolB": "QuotaPath fits RevOps, sales, and finance teams needing AI-assisted commission plan building and automated payout calculations, with a free trial and published entry pricing of $35/user/month plus a $525/month platform fee.",
  "whoNeedsBoth": "A sales organization would commonly run both together: Nue handles the CPQ, billing, and revenue lifecycle for the deals themselves, while QuotaPath calculates and automates the sales commissions owed to reps based on those closed deals, since QuotaPath integrates with CRMs like Salesforce that Nue is also built on.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Nue handles CPQ, contract lifecycle management, usage monetization, and billing/collections for the deal itself.",
      "toolB": "QuotaPath handles sales commission tracking: quota management, commission automation, payout eligibility rules, and dispute resolution for the rep who closed the deal.",
      "whyItMatters": "These are non-competing functions in the revenue stack — pricing/billing the deal versus paying the salesperson.",
      "benefitsWho": "Finance/billing teams need Nue; sales compensation and RevOps teams need QuotaPath."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Nue publishes no pricing information on its website, per its facts.",
      "toolB": "QuotaPath publishes its Growth plan at $35/user/month plus a $525/month platform fee (billed annually), and Premium at $50/user/month plus an $800/month platform fee.",
      "whyItMatters": "Published per-user and platform-fee pricing lets sales ops teams budget precisely by headcount.",
      "benefitsWho": "Teams needing predictable, headcount-based budgeting benefit from QuotaPath's transparent pricing structure."
    },
    {
      "title": "AI Feature Scope",
      "toolA": "Nue's Agentic CPQ uses AI-driven product and pricing configuration with guided selling built natively for Salesforce.",
      "toolB": "QuotaPath's AI-powered Plan Builder lets users upload compensation documents or use a guided builder for quotas and commission rates, with an optional Atlas AI Revenue Strategist add-on starting at $5k for deeper strategy analysis.",
      "whyItMatters": "AI is applied to different jobs: configuring price quotes versus building and analyzing commission plans.",
      "benefitsWho": "Sales ops teams building commission plans benefit from QuotaPath's AI Plan Builder; sales teams configuring deals benefit from Nue's Agentic CPQ."
    },
    {
      "title": "Free Trial Availability",
      "toolA": "Nue's facts state no free trial or free plan is advertised.",
      "toolB": "QuotaPath offers a free trial ('Try for Free') before requiring a paid subscription.",
      "whyItMatters": "A free trial lowers the barrier for smaller RevOps teams to evaluate the tool before committing budget.",
      "benefitsWho": "Smaller teams wanting to test before buying benefit from QuotaPath's free trial."
    },
    {
      "title": "CRM Integration Breadth",
      "toolA": "Nue is built natively for Salesforce specifically, plus self-serve APIs for non-Salesforce purchase flows.",
      "toolB": "QuotaPath integrates with a broader range of CRMs: Salesforce, HubSpot, Close, Pipedrive, Zoho, and Copper, plus accounting, ERP/BI, and payroll tools like Rippling.",
      "whyItMatters": "Teams not standardized on Salesforce need commission tooling that works with their actual CRM.",
      "benefitsWho": "Non-Salesforce sales teams (using HubSpot, Pipedrive, etc.) benefit from QuotaPath's broader CRM support."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deal & Billing Management",
      "rows": [
        {
          "feature": "CPQ (quoting)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Contract lifecycle / renewals management",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Usage-based billing and invoicing",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Commission & Compensation",
      "rows": [
        {
          "feature": "Quota and commission plan management",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Automated payout calculation",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Compensation benchmarking",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "AI-powered plan builder",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access, Integrations & Compliance",
      "rows": [
        {
          "feature": "Published starting price",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "QuotaPath: $35/user/mo + $525/mo platform fee"
        },
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Native Salesforce integration",
          "toolA": "available",
          "toolB": "available",
          "note": "Nue: native build; QuotaPath: CRM integration"
        },
        {
          "feature": "SOC 2 Type II certification",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Nue and QuotaPath do the same thing?",
      "answer": "No. Nue is a quote-to-cash platform for CPQ, billing, and usage monetization. QuotaPath is a sales commission tracking and compensation management platform. They address different jobs in the revenue process and can be used together."
    },
    {
      "question": "Is QuotaPath cheaper than Nue?",
      "answer": "QuotaPath publishes pricing starting at $35/user/month plus a $525/month platform fee. Nue publishes no pricing at all, so a direct cost comparison isn't possible without contacting Nue's sales team."
    },
    {
      "question": "Does QuotaPath offer a free trial?",
      "answer": "Yes, QuotaPath offers a free trial before requiring a paid subscription. Nue's facts state no free trial or free plan is advertised."
    },
    {
      "question": "Which CRMs does each tool support?",
      "answer": "Nue is built natively for Salesforce, with self-serve APIs for purchase flows outside Salesforce. QuotaPath integrates with a broader set of CRMs, including Salesforce, HubSpot, Close, Pipedrive, Zoho, and Copper."
    },
    {
      "question": "Does Nue calculate sales commissions?",
      "answer": "Nue's facts don't list commission calculation or payout automation as a feature; its focus is CPQ, billing, and usage monetization. QuotaPath is purpose-built for commission automation and payout eligibility rules."
    },
    {
      "question": "Is there an AI add-on for deeper compensation strategy analysis?",
      "answer": "Yes, QuotaPath offers Atlas, an AI Revenue Strategist add-on starting at $5k, that analyzes attainment distribution and payout efficiency. This is separate from QuotaPath's included AI-powered Plan Builder."
    }
  ]
};

export default nueVsQuotapathContent;

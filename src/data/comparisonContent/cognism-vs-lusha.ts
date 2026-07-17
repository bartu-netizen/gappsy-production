import type { ToolComparisonContent } from './types';

const cognismVsLushaContent: ToolComparisonContent = {
  "verdict": "Cognism and Lusha both sell verified B2B contact data, but they target different buying processes: Cognism is a quote-only enterprise platform built around phone-verified data and compliance screening for larger outbound teams, while Lusha publishes self-serve pricing, a free 40-credit plan, and native AI-assistant connections that suit smaller teams who want to start without a sales call.",
  "bestForToolA": "Teams of 5+ salespeople doing regulated, compliance-heavy cold-calling (DNC/TPS screening, ISO 27001/27701, SOC 2 Type II) who need multilingual coverage (English, German, French) and are prepared to go through a sales quote rather than self-serve signup.",
  "bestForToolB": "Individuals or small teams who want to start immediately on a free 40-credit plan, use a Chrome extension for in-browser prospecting, and plug contact data directly into AI assistants (Claude, ChatGPT, Gemini, Perplexity) or automation tools like Clay, Make, n8n, and Zapier via MCP.",
  "whoNeedsBoth": "Organizations running both high-touch enterprise outbound, where Cognism's phone-verified data and compliance screening reduce cold-calling risk, and lighter-weight, credit-based prospecting for reps who need fast self-serve access, may end up licensing both rather than standardizing on one.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "Cognism's Standard and Pro plans both require contacting sales for a custom quote; no self-serve pricing is published.",
      "toolB": "Lusha publishes self-serve tiers: Free ($0), Starter ($49.90/month), Professional ($69.90/month), and Premium ($399.90/month), only its top Scale tier is custom.",
      "whyItMatters": "Buyers who want to compare cost before a sales call can do so with Lusha but not Cognism.",
      "benefitsWho": "Smaller teams and self-serve buyers without a procurement process."
    },
    {
      "title": "Data verification approach",
      "toolA": "Cognism relies on phone-verified data plus an AI-driven 'data fusion engine' that stitches together data points before running them through verification layers.",
      "toolB": "Lusha cites 98% email accuracy drawn from 1.2B+ data points refreshed daily, with phone reveals costing 10 credits versus 1 for an email.",
      "whyItMatters": "Teams relying heavily on cold-calling may weight phone-data verification differently than teams focused mainly on email outreach.",
      "benefitsWho": "Cold-calling-heavy sales orgs (Cognism) versus email-first prospecting teams (Lusha)."
    },
    {
      "title": "AI-assistant integration",
      "toolA": "Cognism's facts do not mention AI-assistant integrations.",
      "toolB": "Lusha explicitly connects via MCP to Claude, ChatGPT, Gemini, and Perplexity, plus automation tools like Clay, Make, n8n, and Zapier.",
      "whyItMatters": "Teams building AI-agent-driven prospecting workflows have documented support only with Lusha.",
      "benefitsWho": "Teams experimenting with AI-assistant or automation-driven prospecting."
    },
    {
      "title": "Compliance and language coverage",
      "toolA": "Cognism is ISO 27001 and 27701 certified, SOC 2 Type II audited, with built-in DNC/TPS compliance screening, and supports English, German, and French.",
      "toolB": "Lusha is SOC 2 Type II and ISO 31700 certified; its facts do not mention DNC/TPS screening or specific language support.",
      "whyItMatters": "Regulated outbound calling programs need documented DNC/TPS screening, which only Cognism confirms.",
      "benefitsWho": "Multinational or compliance-sensitive outbound calling teams."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Data & Prospecting",
      "rows": [
        {
          "feature": "Verified phone/email contact data",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Buying/intent signals",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Browser extension for prospecting",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI assistant integration (MCP)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Lusha: 40 credits/month"
        },
        {
          "feature": "Published self-serve pricing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "API / data export access",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Self-serve trial",
          "toolA": "unavailable",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Compliance & Enterprise",
      "rows": [
        {
          "feature": "Security/data certifications",
          "toolA": "available",
          "toolB": "available",
          "note": "Cognism: ISO 27001/27701, SOC 2; Lusha: SOC 2, ISO 31700"
        },
        {
          "feature": "DNC/TPS compliance screening",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Native CRM integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Cognism: Salesforce, HubSpot, Pipedrive; Lusha: Salesforce, HubSpot, Zoho, Monday"
        },
        {
          "feature": "Multi-language support",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Cognism offer a free plan like Lusha?",
      "answer": "No. Cognism's Standard and Pro plans both require contacting sales for a custom quote, with no free plan or self-serve trial mentioned. Lusha offers a Free plan with 40 credits per month."
    },
    {
      "question": "How do the two platforms verify contact data?",
      "answer": "Cognism relies on phone-verified data combined with an AI-driven 'data fusion engine' that stitches together data points before verification layers. Lusha cites 98% email accuracy drawn from 1.2B+ data points refreshed daily."
    },
    {
      "question": "Which CRMs does each tool integrate with?",
      "answer": "Cognism connects to Salesforce, HubSpot, and Pipedrive. Lusha has native integrations with Salesforce, HubSpot, Zoho, and Monday."
    },
    {
      "question": "Can either tool be used with AI assistants like ChatGPT or Claude?",
      "answer": "Lusha explicitly supports this via MCP with Claude, ChatGPT, Gemini, and Perplexity, plus automation tools like Clay, Make, n8n, and Zapier. Cognism's facts do not mention AI-assistant integrations."
    },
    {
      "question": "Does Lusha charge more to reveal phone numbers than emails?",
      "answer": "Yes, a phone number reveal costs 10 credits versus 1 credit for an email. Cognism does not publish a comparable credit-based pricing structure since it is quote-only."
    },
    {
      "question": "What compliance certifications does each hold?",
      "answer": "Cognism holds ISO 27001 and 27701 certification and is SOC 2 Type II audited. Lusha is SOC 2 Type II and ISO 31700 certified."
    }
  ]
};

export default cognismVsLushaContent;

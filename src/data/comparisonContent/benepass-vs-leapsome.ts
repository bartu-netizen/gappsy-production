import type { ToolComparisonContent } from './types';

const benepassVsLeapsomeContent: ToolComparisonContent = {
  "verdict": "Benepass is a benefits administration platform centered on a card for spending Lifestyle Spending Accounts and pre-tax benefits (HSA, FSA, HRA, commuter) across 90+ countries, while Leapsome is a broader HRIS and talent management platform covering performance reviews, engagement surveys, goals, and payroll prep. They address different parts of the HR stack — Benepass handles how employees receive and spend benefit dollars, Leapsome handles performance, engagement, and core HR records.",
  "bestForToolA": "Benepass fits companies wanting a single card for administering Lifestyle Spending Accounts and pre-tax benefits across a global, distributed workforce in 90+ countries, backed by a $40M Series B raised in March 2026.",
  "bestForToolB": "Leapsome fits HR teams wanting to unify HRIS records, performance reviews, engagement surveys, and goals/OKRs in one platform, used by 2,000+ organizations including Spotify and Notion.",
  "whoNeedsBoth": "An HR team could reasonably run both together — using Leapsome as the core HRIS and performance/engagement system while using Benepass as the dedicated card-based platform for administering lifestyle spending accounts and pre-tax benefits, since Leapsome's HRIS module doesn't document benefits-card administration as a feature.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Benefits administration via a spending card for LSAs and pre-tax accounts (HSA, FSA, HRA, commuter).",
      "toolB": "HRIS plus talent management: reviews, surveys, goals, learning, and compensation.",
      "whyItMatters": "These solve different HR problems — how benefit dollars are spent vs. how performance and engagement are managed.",
      "benefitsWho": "Benefits benefits/total rewards teams (Benepass) vs. people ops/performance teams (Leapsome)."
    },
    {
      "title": "Global Reach",
      "toolA": "Operates in 90+ countries with $1B+ in global benefits funded, per the company.",
      "toolB": "Headquartered in New York and Berlin with European (German) hosting for GDPR compliance; global country coverage for its HRIS/talent modules isn't specifically quantified.",
      "whyItMatters": "Multinational employers need to verify each vendor's actual country coverage for their specific use case.",
      "benefitsWho": "Benefits globally distributed companies administering benefits across many countries."
    },
    {
      "title": "AI Features",
      "toolA": "Benefits Compliance GPT, an AI assistant for compliance questions.",
      "toolB": "AI agents that generate automations, dashboards, team insights, and personalized employee coaching.",
      "whyItMatters": "The AI use cases are entirely different — compliance Q&A vs. performance/engagement insights and coaching.",
      "benefitsWho": "Benefits benefits administrators needing compliance guidance (Benepass) vs. managers wanting AI-assisted coaching and insights (Leapsome)."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "No published pricing; the site offers a savings calculator instead.",
      "toolB": "Modular pricing with a published starting point around €199/month per user.",
      "whyItMatters": "Buyers comparing budget impact get a documented starting price from Leapsome but must request a quote from Benepass.",
      "benefitsWho": "Benefits finance and procurement teams wanting upfront pricing visibility."
    },
    {
      "title": "Company Transparency",
      "toolA": "Headquarters and founding year not disclosed, though it recently raised a $40M Series B (announced March 2026).",
      "toolB": "Headquartered in New York and Berlin; founding year not disclosed.",
      "whyItMatters": "Recent funding signals financial runway, which matters for vendor risk assessment.",
      "benefitsWho": "Benefits buyers doing vendor stability due diligence."
    }
  ],
  "featureMatrix": [
    {
      "group": "Benefits Administration",
      "rows": [
        {
          "feature": "Lifestyle Spending Accounts (LSAs)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Pre-tax benefits (HSA/FSA/HRA/commuter)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Card-based spending/tap-to-pay",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "HRIS/payroll integration for benefits enrollment",
          "toolA": "available",
          "toolB": "available",
          "note": "Leapsome's HRIS handles payroll prep, not card-based benefits"
        }
      ]
    },
    {
      "group": "Core HR & Talent",
      "rows": [
        {
          "feature": "Performance reviews",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Engagement surveys",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Goals/OKRs",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Employee records/HRIS",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Commercial",
      "rows": [
        {
          "feature": "AI compliance assistant",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Benepass's Benefits Compliance GPT"
        },
        {
          "feature": "AI coaching/insights",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Published starting price",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Leapsome: €199/month per user"
        },
        {
          "feature": "Mobile apps (iOS/Android)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Benepass and Leapsome compete directly?",
      "answer": "No — Benepass administers benefit spending (LSAs, pre-tax accounts) via a card, while Leapsome manages HRIS records, performance reviews, and engagement; they cover different parts of the HR stack."
    },
    {
      "question": "Which has published pricing?",
      "answer": "Leapsome publishes a starting price around €199/month per user; Benepass does not publish pricing, offering a savings calculator instead."
    },
    {
      "question": "How many countries does Benepass operate in?",
      "answer": "90+ countries, with $1B+ in global benefits funded, per the company."
    },
    {
      "question": "Does either have mobile apps?",
      "answer": "Benepass offers iOS and Android apps for managing benefits; this isn't documented for Leapsome."
    },
    {
      "question": "What AI features does each offer?",
      "answer": "Benepass has Benefits Compliance GPT for compliance Q&A; Leapsome has AI agents for automations, dashboards, insights, and employee coaching."
    },
    {
      "question": "Has either raised recent funding?",
      "answer": "Benepass announced a $40M Series B round in March 2026; no funding details are documented for Leapsome."
    }
  ]
};

export default benepassVsLeapsomeContent;

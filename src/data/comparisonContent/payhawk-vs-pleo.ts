import type { ToolComparisonContent } from './types';

const payhawkVsPleoContent: ToolComparisonContent = {
  "verdict": "Payhawk and Pleo both manage corporate cards, expenses, and approvals, but Payhawk bundles a wider set of modules (business travel, procurement, accounts payable) under mostly quote-based, modular pricing with one public UK/EEA small-business plan requiring a 24-month contract, while Pleo publishes four tiered self-serve plans from €4 to €249+/month with explicit per-user add-on costs and deep accounting integrations including Twinfield and Exact Online. The right fit depends on whether a company needs Payhawk's broader travel/procurement scope or Pleo's transparent, tiered self-serve pricing.",
  "bestForToolA": "Mid-market or larger companies needing travel booking, procurement, and accounts payable alongside cards, and comfortable with quote-based modular pricing.",
  "bestForToolB": "Smaller or growing businesses that want clear published pricing tiers, monthly billing options, and explicit per-user costs as they scale headcount.",
  "whoNeedsBoth": "The facts don't describe a scenario where one company would run both simultaneously — they compete for the same corporate card and expense management budget, so most buyers would choose one.",
  "keyDifferences": [
    {
      "title": "Pricing Structure",
      "toolA": "Payhawk uses modular pricing where companies pay per module (Travel, Cards & Expenses, Bill Pay, Procure to Pay), with only one publicly listed plan (Growth Program, £149/month, requiring a fixed 24-month contract).",
      "toolB": "Pleo publishes four tiered plans from €4/month (Starter) up to €249+/month (Business) with monthly or annual billing options.",
      "whyItMatters": "Pleo gives small businesses a clear, low-cost published entry point, while Payhawk's pricing mostly requires a sales conversation outside one narrow regional program.",
      "benefitsWho": "Small businesses wanting transparent self-serve pricing (Pleo) versus larger or mid-market companies comfortable with a quote-based modular contract (Payhawk)."
    },
    {
      "title": "Scope of Spend Management",
      "toolA": "Payhawk bundles corporate cards, multi-currency business accounts, accounts payable, business travel booking, and procurement into one platform.",
      "toolB": "Pleo's documented scope centers on cards, expense tracking, subscription management, and approval workflows, with multi-entity management added at the Business tier, and doesn't document travel booking or a procurement module.",
      "whyItMatters": "Companies needing to manage travel booking or full procure-to-pay processes may need Payhawk's broader module set instead of adding separate tools.",
      "benefitsWho": "Finance teams consolidating travel and procurement spend alongside cards."
    },
    {
      "title": "AI Capabilities",
      "toolA": "Payhawk's AI Workflow Orchestration handles receipt chasing, approval routing, and policy enforcement across the whole platform.",
      "toolB": "Pleo documents AI-driven policies at the Essential tier and AI expense assessment at the Business tier.",
      "whyItMatters": "The depth and tier-gating of AI features affects which plan level a company needs to access AI-driven automation.",
      "benefitsWho": "Finance teams wanting AI-assisted policy enforcement."
    },
    {
      "title": "Contract Terms",
      "toolA": "Payhawk's only publicly listed plan (Growth Program) requires a fixed 24-month contract term.",
      "toolB": "Pleo's Starter and Business plans are billed annually while Essential and Advanced are billed monthly, without a multi-year lock-in documented.",
      "whyItMatters": "Long contract commitments affect flexibility for smaller businesses uncertain about future needs.",
      "benefitsWho": "Small businesses wary of multi-year commitments."
    },
    {
      "title": "Per-User Cost Model",
      "toolA": "Payhawk's Growth Program includes a fixed 10 user seats within its £149/month price, and its facts don't document a per-user add-on cost for its custom/quoted plans.",
      "toolB": "Pleo's facts explicitly state additional users cost extra on every plan (€5 to €15 per user/month depending on tier).",
      "whyItMatters": "Teams with headcount growth need to understand the true cost of scaling seats rather than just the base plan price.",
      "benefitsWho": "Growing teams estimating total spend-management cost as they add employees."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Spend Management",
      "rows": [
        {
          "feature": "Corporate / virtual cards",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Expense management (automated receipt capture)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Pre-spend approval workflows",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Multi-entity management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pleo documents this explicitly at the Business tier; Payhawk's facts describe multi-currency accounts but not multi-entity management."
        }
      ]
    },
    {
      "group": "Extended Modules",
      "rows": [
        {
          "feature": "Business travel booking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Dedicated procurement module",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Accounts payable / invoice automation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Subscription / vendor card management",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Integrations",
      "rows": [
        {
          "feature": "ERP integrations (NetSuite, Dynamics 365, Sage)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Additional named accounting tools (Twinfield, Exact Online)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Zapier integration",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Published tiered self-serve pricing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Only Payhawk's Growth Program (one regional plan) is publicly listed; Pleo publishes 4 tiers."
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Payhawk: 7-day trial on Growth Program. Pleo: every plan includes a free trial."
        },
        {
          "feature": "Per-user add-on cost documented",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pleo: €5-15/user/month depending on tier."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How is pricing structured for each?",
      "answer": "Payhawk uses modular, mostly quote-based pricing with only its Growth Program (£149/month, UK/EEA small businesses) publicly listed; Pleo publishes four tiers from €4/month (Starter) to €249+/month (Business)."
    },
    {
      "question": "Does either include business travel booking?",
      "answer": "Payhawk includes a dedicated Business Travel feature for booking and managing corporate travel; Pleo's facts don't document a travel booking module."
    },
    {
      "question": "Do additional users cost extra?",
      "answer": "Pleo's facts state additional users cost €5 to €15 per user/month depending on tier; Payhawk's Growth Program includes 10 user seats in its base price, and its custom/quoted plans don't document a per-user add-on structure."
    },
    {
      "question": "Does either use AI?",
      "answer": "Yes — Payhawk's AI Workflow Orchestration handles receipt chasing, approval routing, and policy enforcement across the platform; Pleo includes AI-driven policies at the Essential tier and AI expense assessment at the Business tier."
    },
    {
      "question": "Which accounting systems does each integrate with?",
      "answer": "Payhawk integrates with NetSuite, Microsoft Dynamics 365, Sage Intacct, and Workday; Pleo integrates with NetSuite, Microsoft Dynamics 365, Sage, Twinfield, and Exact Online."
    },
    {
      "question": "Is there a long-term contract requirement?",
      "answer": "Payhawk's Growth Program requires a fixed 24-month contract term; Pleo's facts don't document a multi-year lock-in, though its Starter and Business plans are billed annually."
    }
  ]
};

export default payhawkVsPleoContent;

import type { ToolComparisonContent } from './types';

const airwallexVsMercuryContent: ToolComparisonContent = {
  "verdict": "Airwallex is built for multi-currency, cross-border money movement — 20+ currencies, transfers to 200+ countries, and local payment methods on invoices — but it charges card processing fees (2.80%-4.30% + $0.30) on every plan. Mercury is a US-focused free bank account with no fees on core checking, USD wires, and AI-assisted bill pay, but treasury yield above 3% requires a $250K+ balance and it doesn't advertise multi-currency accounts. The choice comes down to whether the business's money moves across borders or stays in USD.",
  "bestForToolA": "Businesses receiving or paying in multiple currencies, running international transfers to 200+ countries, or needing local payment methods on invoices — Airwallex's Explore plan is free and includes global accounts in 20+ currencies plus interbank FX rates.",
  "bestForToolB": "US startups that want simple, fee-free checking and savings with no minimum balance, free USD wires, and accounting syncs to QuickBooks, Xero, or NetSuite without paying per-user platform fees.",
  "whoNeedsBoth": "Companies banking primarily in USD but transacting internationally may keep Mercury as their core US operating account while using Airwallex for foreign-currency collections, FX conversion, and paying overseas vendors or contractors.",
  "keyDifferences": [
    {
      "title": "Multi-currency vs. USD-first banking",
      "toolA": "Global Accounts support 20+ currencies with transfers to 200+ countries at interbank FX rates.",
      "toolB": "Free USD wires with no stated multi-currency account support in the facts provided.",
      "whyItMatters": "A business collecting revenue or paying suppliers in foreign currencies avoids repeated conversion costs and delays with a true multi-currency account.",
      "benefitsWho": "Companies with international customers, suppliers, or remote teams paid in local currencies."
    },
    {
      "title": "Transaction fees on cards vs. free core banking",
      "toolA": "Card processing fees apply on all plans: 2.80% + $0.30 domestic, 4.30% + $0.30 international.",
      "toolB": "No minimum balances, no monthly fees, and free ACH, wire, and check payments on the core plan.",
      "whyItMatters": "Airwallex's fee structure reflects a payments/FX business model, while Mercury's core banking is genuinely free — the right pick depends on whether the primary need is payment acceptance or basic deposit banking.",
      "benefitsWho": "Cost-sensitive startups comparing all-in banking costs versus businesses that need to accept card payments globally."
    },
    {
      "title": "AI automation scope",
      "toolA": "AI Expense Policy Agent enforces spend policy across entities and currencies, but it's gated to the paid Grow plan ($12/user/month + platform fee).",
      "toolB": "AI Bill Pay reads and populates bill details and categorizes transactions, described as part of the free bill pay feature set.",
      "whyItMatters": "Teams wanting AI-driven automation without an added per-user fee may find Mercury's approach more accessible out of the gate.",
      "benefitsWho": "Finance teams evaluating how much AI automation costs to unlock."
    },
    {
      "title": "Treasury / yield access",
      "toolA": "Yield on USD balances scales with plan tier: 3.15% (Explore), 3.30% (Grow), 3.42% (Accelerate) — available without a balance minimum stated in the facts.",
      "toolB": "Treasury yield up to 3.64% is offered via Mercury Advisory, but requires a $250K+ balance.",
      "whyItMatters": "Airwallex's yield tiers are tied to plan level, while Mercury's higher yield is gated by account size rather than plan.",
      "benefitsWho": "Startups with smaller balances who still want yield versus larger, well-capitalized companies that can meet Mercury's $250K threshold."
    },
    {
      "title": "Pricing structure: per-user vs. flat monthly fee",
      "toolA": "Grow plan costs $12/user/month plus a platform fee, so cost scales with headcount using Spend cards.",
      "toolB": "Mercury Plus is a flat $29.90/month regardless of user count.",
      "whyItMatters": "Growing teams should model whether per-user or flat pricing is cheaper at their headcount.",
      "benefitsWho": "Finance leads budgeting for scaling teams."
    }
  ],
  "featureMatrix": [
    {
      "group": "Global Accounts & Payments",
      "rows": [
        {
          "feature": "Multi-currency accounts",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Airwallex supports 20+ currencies"
        },
        {
          "feature": "International transfers",
          "toolA": "available",
          "toolB": "limited",
          "note": "Mercury offers free USD wires; broader international transfer support isn't documented"
        },
        {
          "feature": "Corporate / virtual cards",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Local payment methods on invoices",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Airwallex invoicing supports 160+ local payment methods"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI expense/bill automation",
          "toolA": "available",
          "toolB": "available",
          "note": "Airwallex's AI agent requires the Grow plan; Mercury's AI bill pay is part of core banking"
        },
        {
          "feature": "Accounting integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Both sync with Xero, QuickBooks, and NetSuite"
        }
      ]
    },
    {
      "group": "Pricing & Yield",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Treasury / yield",
          "toolA": "available",
          "toolB": "limited",
          "note": "Mercury's higher yield requires a $250K+ balance via Mercury Advisory"
        },
        {
          "feature": "Per-user pricing on paid tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Mercury Plus/Pro are flat monthly fees, not per-user"
        },
        {
          "feature": "Card processing fees",
          "toolA": "limited",
          "toolB": "available",
          "note": "Airwallex charges 2.80%-4.30% + $0.30 per transaction; Mercury's core banking is fee-free"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Airwallex charge transaction fees?",
      "answer": "Yes — 2.80% + $0.30 for domestic cards and 4.30% + $0.30 for international cards, per Airwallex's pricing page."
    },
    {
      "question": "Is Mercury free to use?",
      "answer": "Yes, Mercury's core business banking plan is $0/month with no minimum balance or overdraft fees."
    },
    {
      "question": "How many currencies does Airwallex support?",
      "answer": "Airwallex offers global accounts in 20+ currencies and transfers to 200+ countries."
    },
    {
      "question": "What AI features does Mercury offer?",
      "answer": "Mercury uses AI to read and populate bill details and to categorize transactions automatically."
    },
    {
      "question": "What does Airwallex's Grow plan add?",
      "answer": "Grow adds advanced approval workflows, an AI expense policy agent, bill payment automation, and NetSuite/Dynamics 365 integration for $12/user/month plus a platform fee."
    },
    {
      "question": "How many businesses use each platform?",
      "answer": "Airwallex states it's used by 200,000+ businesses including Shein and Canva; Mercury states it's trusted by 300,000+ entrepreneurs processing $20B+ in monthly transaction volume."
    }
  ]
};

export default airwallexVsMercuryContent;

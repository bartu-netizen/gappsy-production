import type { ToolComparisonContent } from './types';

const novoVsRelayFinancialContent: ToolComparisonContent = {
  "verdict": "Novo is entirely free with a single checking account plan, AI-assisted onboarding and categorization, and an option for business loans. Relay is freemium: its free Starter plan already includes up to 20 checking sub-accounts, but higher savings APY (up to 3.00%) and automation like recurring invoices only unlock on the paid Grow ($30/month) or Scale ($90/month) tiers. The decision hinges on whether a business needs one simple account or several segregated sub-accounts with tiered yield.",
  "bestForToolA": "Solo founders and small businesses who want one free checking account, AI-assisted expense categorization, and access to business loan options without any monthly fees.",
  "bestForToolB": "Businesses that want to split funds across multiple checking sub-accounts (e.g., taxes, payroll, operating) with auto-transfer rules and are willing to pay for Grow or Scale to unlock higher savings APY and bookkeeping automation.",
  "whoNeedsBoth": "A business could use Novo as a simple free operating account for day-to-day transactions while running Relay's multi-account structure for allocating and reserving funds — though most businesses evaluating these will pick one primary banking relationship.",
  "keyDifferences": [
    {
      "title": "Number of checking accounts",
      "toolA": "No sub-account structure is documented — Novo is presented as a single business checking account.",
      "toolB": "Up to 20 checking accounts on the free Starter plan (50 on Scale) with auto-transfer rules between them.",
      "whyItMatters": "Businesses that need to separate funds for taxes, payroll, or specific projects benefit from Relay's built-in multi-account structure.",
      "benefitsWho": "Businesses managing multiple budget categories or entities from one banking relationship."
    },
    {
      "title": "High-yield savings",
      "toolA": "Not documented — no APY or savings yield is mentioned for Novo.",
      "toolB": "APY ranges from 1.11% on the free Starter plan up to 3.00% on the Scale plan.",
      "whyItMatters": "Businesses holding cash reserves may prefer a bank that pays yield on savings balances.",
      "benefitsWho": "Businesses with idle cash reserves looking to earn yield without moving to a separate treasury product."
    },
    {
      "title": "AI-assisted banking",
      "toolA": "AI-assisted onboarding and expense categorization, powered by Claude, OpenAI, and Gemini.",
      "toolB": "No AI capability is mentioned in the facts.",
      "whyItMatters": "Businesses wanting automated bookkeeping help out of the box may lean toward Novo's AI features.",
      "benefitsWho": "Small business owners without dedicated bookkeeping staff."
    },
    {
      "title": "Business loans",
      "toolA": "Offers business loan options, though rates and terms aren't published publicly.",
      "toolB": "Not documented — no lending product is mentioned.",
      "whyItMatters": "A business seeking financing alongside banking has one fewer vendor relationship to manage with Novo.",
      "benefitsWho": "Small businesses that may need working capital financing."
    },
    {
      "title": "Cashback rewards",
      "toolA": "Not documented in the facts.",
      "toolB": "Tiered cashback on credit cards: 1% (Starter), 1.25% (Grow), 1.5% (Scale).",
      "whyItMatters": "Businesses with significant card spend can factor cashback into total cost of banking.",
      "benefitsWho": "Businesses that put substantial recurring spend on a company card."
    }
  ],
  "featureMatrix": [
    {
      "group": "Banking & Accounts",
      "rows": [
        {
          "feature": "Multiple checking accounts",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Relay: up to 20 free, 50 on Scale"
        },
        {
          "feature": "High-yield savings",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "1.11%-3.00% APY depending on plan"
        },
        {
          "feature": "Free core banking",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Cards & Payments",
      "rows": [
        {
          "feature": "Debit / credit cards",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Cashback rewards",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "1%-1.5% tiered by plan"
        },
        {
          "feature": "Invoicing",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Automation & Integrations",
      "rows": [
        {
          "feature": "AI-assisted categorization",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Novo's AI is powered by Claude, OpenAI, and Gemini"
        },
        {
          "feature": "Accounting integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Relay names Xero, QuickBooks Online, Gusto; Novo doesn't name specific integrations"
        },
        {
          "feature": "Business loans",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "Free trial on paid tiers",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Relay offers a 14-day free trial on Grow and Scale"
        },
        {
          "feature": "Paid tier for advanced features",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Novo has a single free plan; Relay has Grow ($30/mo) and Scale ($90/mo)"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Novo really free?",
      "answer": "Yes, Novo advertises free business checking with no monthly fees for the core account."
    },
    {
      "question": "Is Relay free?",
      "answer": "Yes, Relay's Starter plan is free and includes up to 20 checking accounts and 1.11% APY on savings."
    },
    {
      "question": "Does Novo use AI?",
      "answer": "Novo states it uses AI powered by Claude, OpenAI, and Gemini for onboarding and expense categorization."
    },
    {
      "question": "How many checking accounts does Relay support?",
      "answer": "Up to 20 on the free Starter plan and up to 50 on the Scale plan."
    },
    {
      "question": "What APY does Relay offer?",
      "answer": "1.11% APY on the free Starter plan, rising to 1.75% on Grow and 3.00% on Scale."
    },
    {
      "question": "Who holds Novo deposits?",
      "answer": "Novo banking services are provided by Middlesex Federal Savings, F.A., a Member FDIC bank."
    }
  ]
};

export default novoVsRelayFinancialContent;

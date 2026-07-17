import type { ToolComparisonContent } from './types';

const arcVsBraintreeContent: ToolComparisonContent = {
  "verdict": "Arc and Braintree solve different financial problems for a company rather than competing head-to-head. Arc manages a company's own idle cash — offering brokerage yield, a cashback card, and a debt-raising marketplace — while Braintree, a PayPal company, processes payments a company receives from its own customers across cards, PayPal, Venmo, and digital wallets. They sit on opposite sides of the same balance sheet.",
  "bestForToolA": "Arc fits a venture-backed tech company that wants to park idle operating cash for yield (up to roughly 4.57% on the Enterprise tier), issue a cashback corporate card, or raise venture debt through its marketplace, starting from a free Essentials tier.",
  "bestForToolB": "Braintree fits businesses that need to accept customer payments across cards, PayPal, Venmo, and digital wallets in 200+ markets and 50+ currencies, especially those wanting PayPal's infrastructure, mobile SDKs, or a discounted nonprofit rate.",
  "whoNeedsBoth": "A SaaS company could use Braintree to process customer subscription payments while using Arc to earn yield on the resulting cash reserves, issue a company card, and raise venture debt for growth — the tools address incoming revenue and already-banked capital respectively.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Arc is a cash management and capital markets platform: treasury dashboard, yield on cash, a business card, debt capital raising, and an AI CFO Agent — it manages a company's own money.",
      "toolB": "Braintree is a payment processing platform for accepting customer payments across cards, PayPal, Venmo, and digital wallets, with fraud protection and payment orchestration.",
      "whyItMatters": "Choosing the wrong tool means solving the wrong problem — one banks and grows money, the other collects it from customers.",
      "benefitsWho": "Finance/treasury teams need Arc; billing and checkout engineering teams need Braintree."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Arc is Freemium, starting at $0/month with a free Essentials tier; Premium and Enterprise are custom annual memberships that unlock higher yield and cashback.",
      "toolB": "Braintree charges a standard commercial rate of 2.89% + $0.29 per transaction with no monthly or setup fee, plus a discounted 2.19% + $0.29 rate for verified charities.",
      "whyItMatters": "Arc's cost is tied to opting into a higher membership tier, while Braintree's scales directly with transaction volume.",
      "benefitsWho": "High-volume nonprofits benefit from Braintree's charity rate; companies with large cash reserves benefit from Arc's tiered yield."
    },
    {
      "title": "Yield vs. Payment Acceptance",
      "toolA": "Arc pays brokerage net yield up to roughly 4.6% depending on membership tier, plus card cashback from 1.0% to 2.0% by tier.",
      "toolB": "Braintree does not document yield on held funds; its focus is fraud/risk management (PCI DSS Level 1 compliant) and orchestrating payments across methods.",
      "whyItMatters": "Arc actively grows idle cash, while Braintree is a pass-through processor for incoming revenue.",
      "benefitsWho": "Finance teams optimizing treasury returns need Arc specifically."
    },
    {
      "title": "Capital Raising",
      "toolA": "Arc includes a marketplace and tools for raising venture debt directly through the platform.",
      "toolB": "Braintree has no financing or capital-raising feature documented.",
      "whyItMatters": "Founders looking for non-dilutive debt get that capability natively inside Arc, not Braintree.",
      "benefitsWho": "Growth-stage tech companies seeking venture debt benefit from Arc's built-in marketplace."
    },
    {
      "title": "Ownership & Stability",
      "toolA": "Arc, founded in 2021 and headquartered in San Francisco, CA and New York, NY, is the subject of a definitive acquisition agreement announced by Axos Financial in July 2026, which may bring platform changes.",
      "toolB": "Braintree operates as an established PayPal company with no acquisition or ownership change documented in these facts.",
      "whyItMatters": "Buyers evaluating platform stability should factor in Arc's pending ownership transition.",
      "benefitsWho": "Risk-averse finance teams weighing long-term platform stability should note Arc's pending Axos acquisition."
    }
  ],
  "featureMatrix": [
    {
      "group": "Treasury & Cash Management",
      "rows": [
        {
          "feature": "Yield on idle cash",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Arc: up to ~4.6% depending on tier"
        },
        {
          "feature": "Business card with cashback",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Arc: 1.0%-2.0% by tier"
        },
        {
          "feature": "Debt capital raising marketplace",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "AI financial assistant",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Arc's CFO Agent, unlimited on Premium"
        }
      ]
    },
    {
      "group": "Payment Processing",
      "rows": [
        {
          "feature": "Customer payment acceptance",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Cards, PayPal, Venmo, Apple Pay, Google Pay"
        },
        {
          "feature": "Fraud and risk management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "PCI DSS Level 1 compliant"
        },
        {
          "feature": "Mobile SDKs for in-app payments",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Global market/currency coverage",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "200+ markets, 50+ currencies"
        },
        {
          "feature": "Developer sandbox environment",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Free sandbox for testing"
        }
      ]
    },
    {
      "group": "Pricing & Fees",
      "rows": [
        {
          "feature": "Free entry tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Arc's Essentials tier is $0/month"
        },
        {
          "feature": "Nonprofit/charity discount",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Braintree: 2.19% + $0.29 for verified 501(c)(3)s"
        },
        {
          "feature": "Custom/enterprise pricing",
          "toolA": "available",
          "toolB": "available",
          "note": "Arc: Premium/Enterprise annual membership; Braintree: custom rate for $80,000+/month volume"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Arc and Braintree direct competitors?",
      "answer": "No. Arc is a cash management and capital markets platform for a company's own funds, while Braintree is a payment processor for accepting customer payments. They serve different functions and are commonly used together."
    },
    {
      "question": "Does Arc process customer payments like Braintree?",
      "answer": "Not based on the documented feature set. Arc's features center on cash management, yield, cards, and debt raising, with no payment-processing feature listed."
    },
    {
      "question": "What does each tool cost?",
      "answer": "Arc has a free Essentials tier ($0/month), with Premium and Enterprise tiers priced as custom annual memberships. Braintree charges 2.89% + $0.29 per transaction on its standard commercial plan, with no monthly fee."
    },
    {
      "question": "Is Arc's ownership changing?",
      "answer": "Yes. Axos Financial announced a definitive agreement in July 2026 to acquire Arc Technologies, Inc., which may bring platform changes."
    },
    {
      "question": "Does Braintree offer a discount for nonprofits?",
      "answer": "Yes, verified 501(c)(3) organizations get a reduced rate of 2.19% + $0.29 on cards and digital wallets."
    },
    {
      "question": "Which tool includes an AI assistant?",
      "answer": "Arc includes CFO Agent, an AI-powered financial assistant with unlimited access on the Premium tier. Braintree's facts don't document an AI assistant feature."
    }
  ]
};

export default arcVsBraintreeContent;

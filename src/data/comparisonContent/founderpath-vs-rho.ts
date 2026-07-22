import type { ToolComparisonContent } from './types';

const founderpathVsRhoContent: ToolComparisonContent = {
  "verdict": "Founderpath and Rho aren't substitutes for each other. Founderpath provides non-dilutive capital — revenue financing, term loans, and merchant cash advances — while Rho is a banking and treasury platform with no subscription fees for holding, spending, and reconciling the money a company already has. A founder is more likely to use both than to choose between them.",
  "bestForToolA": "Founderpath fits software, brick-and-mortar, or CPG founders with at least $500K in last-year revenue who want non-dilutive capital — revenue financing from a 7% discount rate, term loans from 15% interest, or merchant cash advances — without giving up equity, board seats, or personal guarantees.",
  "bestForToolB": "Rho fits companies wanting a no-subscription-fee banking stack: checking/savings with up to $75M FDIC insurance, corporate cards earning up to 1.5% cashback, zero-fee bill pay, and automated accounting close (Rho Close).",
  "whoNeedsBoth": "A SaaS company could draw revenue financing from Founderpath to fund a growth push, then deposit and manage that capital through Rho's fee-free banking, cards, and automated close tools.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Founderpath is a financing provider offering revenue financing, term loans, and merchant cash advances.",
      "toolB": "Rho is a banking and treasury platform for holding, spending, and reconciling cash, with no subscription or per-user fees.",
      "whyItMatters": "One supplies capital, the other manages capital a company already holds.",
      "benefitsWho": "Founders raising growth capital need Founderpath; finance teams managing day-to-day cash need Rho."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Founderpath is Custom/Enterprise and underwriting-based: revenue financing discount rates from 7%, term loan interest from 15%, and cash advance repayment from 5% of monthly revenue — not published as fixed plans.",
      "toolB": "Rho is Free, with $0 subscription or per-user fees for the core platform; an optional 1% foreign currency fee and a separate treasury management fee (0.15%-0.6% annually) apply to specific services.",
      "whyItMatters": "Founderpath's cost is the price of capital itself, while Rho's cost is $0 for banking with narrow fees only on specific services.",
      "benefitsWho": "Cost-sensitive teams wanting free banking tools benefit from Rho; growth-stage founders needing capital accept Founderpath's underwriting-based rates."
    },
    {
      "title": "Eligibility Requirements",
      "toolA": "Founderpath requires a minimum of $500K in last-year revenue to qualify, along with healthy retention and recurring or repeat revenue.",
      "toolB": "Rho's banking, card, and expense tools don't carry a documented revenue-eligibility threshold.",
      "whyItMatters": "Founderpath is gated to more established, revenue-generating companies, while Rho's banking tools are documented as broadly accessible.",
      "benefitsWho": "Earlier-stage companies can access Rho's banking tools even before they qualify for Founderpath financing."
    },
    {
      "title": "FDIC Insurance & Yield",
      "toolA": "Founderpath does not document deposit insurance or yield features — it is a lender, not a bank.",
      "toolB": "Rho documents up to $75M in FDIC insurance across banking partners and a Treasury service earning yield on idle cash reserves, managed as a registered investment advisor.",
      "whyItMatters": "Companies parking large cash balances need FDIC coverage and yield, which only Rho documents.",
      "benefitsWho": "Finance teams managing large operating cash balances benefit from Rho's FDIC coverage and treasury yield."
    },
    {
      "title": "Speed & Structure of Capital",
      "toolA": "Founderpath disburses revenue financing in as little as 24 hours after underwriting, with no personal guarantees, board seats, or warrants required, and no early-repayment penalty.",
      "toolB": "Rho does not offer capital or financing products — its documented features are banking, cards, expense management, bill pay, treasury, invoicing, and accounting close.",
      "whyItMatters": "Only Founderpath actually extends capital; Rho's value is operational efficiency on capital already held.",
      "benefitsWho": "Founders needing fast, non-dilutive funding decisions rely on Founderpath specifically."
    }
  ],
  "featureMatrix": [
    {
      "group": "Financing & Capital",
      "rows": [
        {
          "feature": "Revenue financing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Founderpath: from 7% discount rate, $1M-$3M ARR"
        },
        {
          "feature": "Term loans",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Founderpath: from 15% interest, up to 4 years"
        },
        {
          "feature": "Merchant cash advance",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Repayment from 5% of monthly revenue"
        },
        {
          "feature": "Funding speed disclosed",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Founderpath: as little as 24 hours"
        }
      ]
    },
    {
      "group": "Banking & Treasury",
      "rows": [
        {
          "feature": "Business checking/savings accounts",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Rho: $0 ACH fees"
        },
        {
          "feature": "FDIC insurance coverage",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Up to $75M"
        },
        {
          "feature": "Corporate cards with cashback",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Rho: up to 1.5% cashback"
        },
        {
          "feature": "Yield on idle cash",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Rho Treasury, 0.15%-0.6% annual fee"
        },
        {
          "feature": "Zero-fee bill pay",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Accounting & Operations",
      "rows": [
        {
          "feature": "Automated accounting close",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Rho Close"
        },
        {
          "feature": "Expense management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Automated receipt capture"
        },
        {
          "feature": "Invoicing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Subscription or per-seat fees",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "Rho explicitly charges none; Founderpath pricing is underwriting-based, not subscription-based"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Founderpath and Rho competitors?",
      "answer": "No. Founderpath provides non-dilutive financing (revenue financing, term loans, cash advances), while Rho is a fee-free banking and treasury platform; they address different needs and can be used together."
    },
    {
      "question": "What revenue do I need to qualify for Founderpath?",
      "answer": "At least $500K in last-year revenue, along with healthy retention and recurring or repeat revenue."
    },
    {
      "question": "Does Rho charge subscription fees?",
      "answer": "No, Rho states there are no per-seat fees or subscription costs for its core banking, card, and expense tools. A separate fee applies only to Treasury management (0.15%-0.6% annually) and foreign currency transfers (1%)."
    },
    {
      "question": "How fast can I get funded through Founderpath?",
      "answer": "Revenue financing can be funded in as little as 24 hours after underwriting is complete."
    },
    {
      "question": "Does Founderpath require giving up equity?",
      "answer": "No. Founderpath uses data-driven underwriting instead of a pitch deck and provides non-dilutive capital that doesn't require giving up equity, personal guarantees, board seats, or warrants."
    },
    {
      "question": "How much FDIC insurance does Rho provide?",
      "answer": "Rho states accounts can receive up to $75M in FDIC insurance across its banking partners. Founderpath, as a lender rather than a bank, doesn't document deposit insurance."
    }
  ]
};

export default founderpathVsRhoContent;

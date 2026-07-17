import type { ToolComparisonContent } from './types';

const founderpathVsPayhawkContent: ToolComparisonContent = {
  "verdict": "Founderpath and Payhawk sit on opposite sides of a company's finances rather than competing directly. Founderpath supplies non-dilutive capital — revenue financing, term loans, and merchant cash advances — to fund growth, while Payhawk is a spend management platform for controlling and automating how that capital gets spent across cards, expenses, accounts payable, travel, and procurement.",
  "bestForToolA": "Founderpath suits software, brick-and-mortar, or CPG founders with $500K+ in last-year revenue seeking non-dilutive capital without equity, board seats, or personal guarantees.",
  "bestForToolB": "Payhawk suits companies — especially UK/EEA small businesses (its £149/month Growth Program covers up to 20 employees) or larger enterprises needing ERP-integrated spend control — that want corporate cards, expense automation, accounts payable, travel, and procurement combined with AI-driven receipt chasing and policy enforcement.",
  "whoNeedsBoth": "A funded startup could draw growth capital from Founderpath and then run all resulting spend — cards, expenses, vendor payments, travel — through Payhawk's spend management and ERP-integrated controls.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Founderpath is non-dilutive financing: revenue financing, term loans, and merchant cash advances.",
      "toolB": "Payhawk is spend management: corporate cards, expenses, accounts payable, travel, and procurement, with AI workflow orchestration.",
      "whyItMatters": "Founderpath adds capital to the business; Payhawk controls how capital already in the business gets spent.",
      "benefitsWho": "Founders raising capital need Founderpath; finance/ops teams controlling spend need Payhawk."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Founderpath's pricing is underwriting-based (discount rates from 7%, term loan interest from 15%), not published as fixed plans.",
      "toolB": "Payhawk is mostly quote-based too, but publishes one concrete plan: the Growth Program at £149/month for UK/EEA small businesses (up to 20 employees, 10 cards, 10 seats, up to 15 invoices/reimbursements monthly, 7-day free trial, fixed 24-month term).",
      "whyItMatters": "Payhawk gives smaller UK/EEA buyers at least one self-serve price point to evaluate, while Founderpath's pricing depends entirely on underwriting.",
      "benefitsWho": "Small UK/EEA businesses wanting a fixed, known monthly cost benefit from Payhawk's Growth Program."
    },
    {
      "title": "AI Capabilities",
      "toolA": "Founderpath's documented process is underwriting-focused: data-driven underwriting completed in 24-48 hours, rather than an AI-labeled feature.",
      "toolB": "Payhawk has an explicit AI Workflow Orchestration feature for receipt chasing, approval routing, and policy enforcement.",
      "whyItMatters": "Buyers looking specifically for AI-automated expense workflows will find that capability named directly in Payhawk's feature set.",
      "benefitsWho": "Finance teams wanting automated policy enforcement and receipt chasing benefit from Payhawk's AI orchestration."
    },
    {
      "title": "ERP Integration",
      "toolA": "Founderpath's facts don't document any ERP or accounting-system integrations.",
      "toolB": "Payhawk documents native integrations with NetSuite, Microsoft Dynamics 365, Sage Intacct, and Workday.",
      "whyItMatters": "Companies running spend through an existing ERP need Payhawk's native connectors; Founderpath is purely a capital source with no operational software integration documented.",
      "benefitsWho": "Mid-market and enterprise finance teams on NetSuite, Dynamics 365, Sage Intacct, or Workday benefit from Payhawk's ERP integrations."
    },
    {
      "title": "Speed vs. Contract Commitment",
      "toolA": "Founderpath can fund revenue financing in as little as 24 hours with no personal guarantees and no early-repayment penalty.",
      "toolB": "Payhawk's only publicly priced plan (Growth Program) requires a fixed 24-month contract term.",
      "whyItMatters": "Founderpath optimizes for fast, flexible access to capital, while Payhawk's documented small-business plan locks in a multi-year commitment.",
      "benefitsWho": "Founders needing quick, flexible capital favor Founderpath; businesses comfortable with a longer commitment for predictable spend-management pricing favor Payhawk's Growth Program."
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
          "note": "Founderpath: from 7% discount rate"
        },
        {
          "feature": "Term loans",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Founderpath: from 15% interest"
        },
        {
          "feature": "Merchant cash advance",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Non-dilutive, no board seats/equity",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Not applicable — Payhawk isn't a financing product"
        }
      ]
    },
    {
      "group": "Spend Management",
      "rows": [
        {
          "feature": "Corporate cards with spend controls",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Expense management/receipt capture",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Automated"
        },
        {
          "feature": "Accounts payable/invoice automation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Business travel booking",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Procurement/pre-spend approval",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "AI-driven policy enforcement",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Payhawk's AI Workflow Orchestration"
        }
      ]
    },
    {
      "group": "Access & Integrations",
      "rows": [
        {
          "feature": "Published self-serve pricing",
          "toolA": "unavailable",
          "toolB": "limited",
          "note": "Payhawk: only the Growth Program is publicly priced"
        },
        {
          "feature": "ERP integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "NetSuite, Dynamics 365, Sage Intacct, Workday"
        },
        {
          "feature": "Mobile app",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "iOS and Android"
        },
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "7-day, Growth Program only"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Founderpath and Payhawk competitors?",
      "answer": "No. Founderpath provides non-dilutive financing while Payhawk manages how a company spends money via cards, expenses, and accounts payable; they solve different problems."
    },
    {
      "question": "Does Payhawk have published pricing?",
      "answer": "Only for the Growth Program, aimed at UK/EEA small businesses with up to 20 employees, priced at £149/month with a 7-day free trial and a fixed 24-month contract. Other plans require contacting sales."
    },
    {
      "question": "What financing types does Founderpath offer?",
      "answer": "Revenue financing, term loans, and merchant cash advances, each structured differently depending on company revenue and business type."
    },
    {
      "question": "Does either platform use AI?",
      "answer": "Payhawk documents AI Workflow Orchestration for receipt chasing, approval routing, and policy enforcement. Founderpath's documented process instead relies on data-driven underwriting completed in 24-48 hours."
    },
    {
      "question": "Which integrates with ERP systems?",
      "answer": "Payhawk documents native integrations with NetSuite, Microsoft Dynamics 365, Sage Intacct, and Workday. No ERP integrations are documented for Founderpath."
    },
    {
      "question": "How fast can each platform be set up or funded?",
      "answer": "Founderpath can fund revenue financing in as little as 24 hours after underwriting. Payhawk's Growth Program includes a 7-day free trial before committing to its fixed 24-month term."
    }
  ]
};

export default founderpathVsPayhawkContent;

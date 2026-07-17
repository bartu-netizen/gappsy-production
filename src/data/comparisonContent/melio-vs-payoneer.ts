import type { ToolComparisonContent } from './types';

const melioVsPayoneerContent: ToolComparisonContent = {
  "verdict": "Melio and Payoneer both handle business payments, but they're built around different flows. Melio is focused on domestic vendor bill-pay and customer invoicing, with an AI assistant (Agent Mel) and installment financing up to 12 months, and offers a free 30-day trial. Payoneer, founded in 2005 and headquartered in New York City, is built for cross-border collection, mass payouts, workforce payments across 160+ countries, and multi-currency accounts in 70 currencies, including a beta stablecoin feature. Neither publishes detailed transaction fees on its main site.",
  "bestForToolA": "Businesses that need to pay vendor bills by card, ACH, or international transfer and invoice customers from one platform, that want an AI assistant (Agent Mel) for quick answers about bills and payments, and that want installment payments spread over up to 12 months.",
  "bestForToolB": "Businesses, freelancers, or marketplaces that collect cross-border payments and need multi-currency accounts (70 currencies, 190+ countries), that pay a distributed workforce across 160+ countries, or that integrate directly with marketplaces like eBay, Fiverr, and Upwork.",
  "whoNeedsBoth": "A business that pays domestic vendor bills through Melio's AP/AR workflow while also collecting cross-border marketplace revenue and paying international contractors through Payoneer's multi-currency accounts and mass-payout platform would be using each tool for the distinct, documented workflow it's built for, rather than picking one over the other.",
  "keyDifferences": [
    {
      "title": "Core workflow: bill-pay vs. cross-border money movement",
      "toolA": "Melio's documented core features are accounts payable (paying vendors) and accounts receivable (invoicing customers).",
      "toolB": "Payoneer's documented core features are multi-currency accounts, payment collection from clients/marketplaces, workforce management, and a mass payout platform.",
      "whyItMatters": "These represent fundamentally different money-movement patterns — domestic bill settlement versus cross-border collection and payout at scale.",
      "benefitsWho": "SMBs managing vendor/customer invoicing (Melio) versus businesses or freelancers operating across multiple countries and currencies (Payoneer)."
    },
    {
      "title": "AI assistant",
      "toolA": "Melio has Agent Mel, an AI tool that provides instant answers about bills and payments.",
      "toolB": "Payoneer's facts do not document an AI assistant feature.",
      "whyItMatters": "A named AI assistant for bill/payment questions can reduce time spent searching for payment status or history.",
      "benefitsWho": "Small business owners or bookkeepers who want quick answers without navigating reports manually."
    },
    {
      "title": "Company history disclosure",
      "toolA": "Melio's founding year and headquarters are not documented in the facts available.",
      "toolB": "Payoneer was founded in 2005 and is headquartered in New York City, NY, USA.",
      "whyItMatters": "A documented, longer operating history can be a trust signal for businesses evaluating a payments vendor.",
      "benefitsWho": "Procurement or finance teams doing vendor due diligence before adopting a payments platform."
    },
    {
      "title": "Marketplace integration",
      "toolA": "Melio integrates with accounting software: QuickBooks Online, QuickBooks Desktop, Xero, and NetSuite.",
      "toolB": "Payoneer integrates directly with marketplaces including eBay, Fiverr, and Upwork.",
      "whyItMatters": "Marketplace integration matters for sellers/freelancers collecting payments from those specific platforms, while accounting-software integration matters for bookkeeping workflows.",
      "benefitsWho": "Freelancers and marketplace sellers (Payoneer) versus businesses reconciling bill payments in their accounting system (Melio)."
    },
    {
      "title": "Financing model",
      "toolA": "Melio offers pay-over-time installment payments spread over up to 12 months.",
      "toolB": "Payoneer offers a working capital advance for eligible customers.",
      "whyItMatters": "An installment payment feature spreads a specific bill's cost over time, while a working capital advance provides broader access to funds.",
      "benefitsWho": "Businesses managing cash flow on individual large bills (Melio) versus businesses needing broader access to working capital (Payoneer)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Payment Workflows",
      "rows": [
        {
          "feature": "Accounts payable / vendor bill pay",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Invoicing / accounts receivable",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-currency account holding",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Payoneer: 70 currencies."
        },
        {
          "feature": "Marketplace payment collection",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Payoneer: eBay, Fiverr, Upwork."
        },
        {
          "feature": "Mass payouts / workforce payments",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI assistant for bills/payments",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Melio: Agent Mel."
        },
        {
          "feature": "Automated bill capture (camera/email/manual)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Batch payments with team approval workflows",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Financing & Cards",
      "rows": [
        {
          "feature": "Pay-over-time installment payments",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Working capital advance",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Commercial / business cards",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Payoneer: Mastercard-based."
        }
      ]
    },
    {
      "group": "Company & Trust Info",
      "rows": [
        {
          "feature": "Founding year disclosed",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Payoneer: 2005."
        },
        {
          "feature": "Headquarters disclosed",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Payoneer: New York City, NY, USA."
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Melio: 30-day free trial."
        },
        {
          "feature": "Stablecoin payments",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Payoneer: beta, via partnership with Bridge."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Melio offer a free trial?",
      "answer": "Yes. Melio offers a free 30-day trial."
    },
    {
      "question": "When was Payoneer founded?",
      "answer": "Payoneer was founded in 2005 and is headquartered in New York City."
    },
    {
      "question": "Does Melio have an AI assistant?",
      "answer": "Yes. \"Agent Mel\" provides instant answers about bills and payments."
    },
    {
      "question": "What marketplaces integrate with Payoneer?",
      "answer": "Payoneer integrates with marketplaces including eBay, Fiverr, and Upwork."
    },
    {
      "question": "What accounting software does Melio integrate with?",
      "answer": "QuickBooks Online, QuickBooks Desktop, Xero, and NetSuite."
    },
    {
      "question": "Does Payoneer support stablecoin payments?",
      "answer": "Yes, as a beta feature through a partnership with Bridge."
    }
  ]
};

export default melioVsPayoneerContent;

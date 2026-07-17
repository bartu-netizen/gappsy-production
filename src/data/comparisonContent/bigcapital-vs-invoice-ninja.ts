import type { ToolComparisonContent } from './types';

const bigcapitalVsInvoiceNinjaContent: ToolComparisonContent = {
  "verdict": "Bigcapital is open-source accounting and inventory software (AGPL-3.0) focused on financial reporting, multi-currency, and stock management, free to self-host or available as hosted cloud plans from $20/month. Invoice Ninja is invoicing-and-business-management software with a perpetual free plan, native payment gateway integrations, and time tracking, but its documented features don't cover formal accounting reports or inventory. The right pick depends on whether you need accounting/inventory depth or invoicing plus payment collection and project tracking.",
  "bestForToolA": "Bigcapital fits a business that needs real accounting output (financial reporting, inventory tracking, multi-currency support) and either wants to self-host for free under AGPL-3.0 or pay from $20/month for a hosted version with a 14-day trial.",
  "bestForToolB": "Invoice Ninja fits a freelancer or service business that wants to start invoicing for free (5 clients, unlimited invoices), collect payments through gateways like Stripe or PayPal, and track time and projects on Kanban boards.",
  "whoNeedsBoth": "A small business could plausibly self-host Bigcapital for its core bookkeeping, inventory, and financial reporting while using Invoice Ninja separately for client-facing invoicing workflows like e-signed quotes and time-tracked billing, though this would mean maintaining two overlapping billing surfaces rather than a clean split.",
  "keyDifferences": [
    {
      "title": "Accounting Depth",
      "toolA": "Bigcapital documents real-time financial reporting, inventory tracking, and multi-currency accounting with live exchange rates as core features.",
      "toolB": "Invoice Ninja's documented features center on invoicing, payments, time tracking, and expense/vendor tracking, without formal financial reporting, inventory, or multi-currency support listed.",
      "whyItMatters": "Businesses that need P&L, balance sheet, or inventory valuation reports need software that documents those capabilities.",
      "benefitsWho": "Businesses that sell physical goods or operate in multiple currencies benefit from Bigcapital's accounting and inventory features."
    },
    {
      "title": "Open-Source License Terms",
      "toolA": "Bigcapital is released under AGPL-3.0, which requires releasing your modifications if you deploy a modified version over a network, with a commercial license available as an exemption.",
      "toolB": "Invoice Ninja's open-source self-hosted version is available via GitHub, but the facts don't specify which license governs it.",
      "whyItMatters": "Businesses planning to modify and redeploy the source code need to understand the licensing obligations before doing so.",
      "benefitsWho": "Developers and businesses evaluating compliance risk around self-hosted modifications benefit from knowing Bigcapital's AGPL-3.0 terms upfront."
    },
    {
      "title": "Entry Cloud Pricing",
      "toolA": "Bigcapital's cheapest hosted cloud plan, Capital Basic, is $20/month.",
      "toolB": "Invoice Ninja's cheapest paid hosted plan, Ninja Pro, is $14/month ($140/year).",
      "whyItMatters": "Budget-conscious buyers comparing entry-level paid pricing will find Invoice Ninja's hosted tier cheaper to start.",
      "benefitsWho": "Small businesses on a tight budget wanting a paid hosted plan benefit from Invoice Ninja's lower entry price."
    },
    {
      "title": "Free Plan vs. Free Trial",
      "toolA": "Bigcapital's hosted cloud version offers only a 14-day free trial, not a perpetual free hosted tier; free use requires self-hosting instead.",
      "toolB": "Invoice Ninja offers a perpetually free hosted plan with 5 clients and unlimited invoicing, with no time limit.",
      "whyItMatters": "A business wanting ongoing free hosted access without managing a server gets that from Invoice Ninja but not from Bigcapital's cloud offering.",
      "benefitsWho": "Freelancers who don't want to self-host but also don't want to pay benefit from Invoice Ninja's perpetual free plan."
    },
    {
      "title": "Payment Collection and Client Portal",
      "toolA": "Bigcapital's documented features do not mention online payment gateway integrations or a client-facing payment portal.",
      "toolB": "Invoice Ninja documents native integrations with Stripe, PayPal, Square, and GoCardless plus a client portal for viewing invoices and paying online.",
      "whyItMatters": "Businesses that want clients to pay invoices online directly need documented payment gateway support.",
      "benefitsWho": "Service businesses that get paid online by clients benefit from Invoice Ninja's payment gateway breadth."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Accounting",
      "rows": [
        {
          "feature": "Multi-currency accounting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Bigcapital Capital Essential, $40/month"
        },
        {
          "feature": "Inventory tracking",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Bigcapital Capital Essential, $40/month"
        },
        {
          "feature": "Real-time financial reporting",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Budgeting and cost-center analysis",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Bigcapital Capital Plus, $55/month"
        }
      ]
    },
    {
      "group": "Invoicing & Payments",
      "rows": [
        {
          "feature": "Recurring invoicing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Online payment gateways",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Stripe, PayPal, Square, GoCardless"
        },
        {
          "feature": "Client portal",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Time tracking with Kanban boards",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Free self-hosted option",
          "toolA": "available",
          "toolB": "available",
          "note": "Bigcapital: AGPL-3.0; Invoice Ninja: license unspecified"
        },
        {
          "feature": "Perpetual free hosted plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Bigcapital cloud offers only a 14-day trial"
        },
        {
          "feature": "Entry paid cloud price",
          "toolA": "available",
          "toolB": "available",
          "note": "Bigcapital $20/mo vs. Invoice Ninja $14/mo"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Bigcapital's cloud version free?",
      "answer": "No, the hosted cloud version offers only a 14-day free trial; ongoing free use requires self-hosting the open-source version under AGPL-3.0."
    },
    {
      "question": "Which is better for inventory-heavy businesses?",
      "answer": "Bigcapital documents dedicated inventory tracking (from its Capital Essential plan, $40/month), a feature Invoice Ninja does not document."
    },
    {
      "question": "What license governs self-hosting each tool?",
      "answer": "Bigcapital is licensed under AGPL-3.0 with a commercial license option; Invoice Ninja's self-hosted version is open source via GitHub but its specific license isn't specified in the available facts."
    },
    {
      "question": "Does either offer time tracking?",
      "answer": "Invoice Ninja documents time tracking and Kanban-style project boards; Bigcapital does not document a time-tracking feature."
    },
    {
      "question": "Which is cheaper to start with a paid hosted plan?",
      "answer": "Invoice Ninja's Ninja Pro starts at $14/month, while Bigcapital's Capital Basic cloud plan starts at $20/month."
    },
    {
      "question": "Do both support multi-currency?",
      "answer": "Bigcapital documents multi-currency support with live exchange rates on its Capital Essential plan; Invoice Ninja's facts do not mention multi-currency support."
    }
  ]
};

export default bigcapitalVsInvoiceNinjaContent;

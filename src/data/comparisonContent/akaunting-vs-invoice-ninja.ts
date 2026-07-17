import type { ToolComparisonContent } from './types';

const akauntingVsInvoiceNinjaContent: ToolComparisonContent = {
  "verdict": "Akaunting is a full double-entry accounting platform (Chart of Accounts, Balance Sheet, General Ledger) with optional payroll, CRM, and inventory apps on higher cloud tiers. Invoice Ninja is invoicing- and business-management-centric, with strong native payment gateway coverage, time tracking, and Kanban project boards, plus both a perpetual free plan and a separate open-source self-hosted version. Which is the better fit depends on whether you need formal accounting reports or invoicing plus lightweight project/time tracking.",
  "bestForToolA": "Akaunting suits a small business that wants formal double-entry bookkeeping (Chart of Accounts, Balance Sheet, General Ledger) with the option to add payroll or CRM apps as it grows, on cloud plans from $8/month or a free self-hosted On-Premise version.",
  "bestForToolB": "Invoice Ninja suits a freelancer or service business that wants to start invoicing for free (5 clients, unlimited invoices) with built-in time tracking, Kanban project boards, and broad payment gateway support (Stripe, PayPal, Square, GoCardless).",
  "whoNeedsBoth": "There's no realistic scenario for running both simultaneously since they overlap directly on invoicing and business management; a team would choose one as its primary billing/bookkeeping system rather than maintain two.",
  "keyDifferences": [
    {
      "title": "Free Plan Depth",
      "toolA": "Akaunting has no perpetually free cloud plan; its cheapest hosted tier is Standard Cloud at $8/month, though the On-Premise version is free to self-host.",
      "toolB": "Invoice Ninja offers a perpetually free hosted plan with 5 clients and unlimited invoicing, plus a separate free open-source self-hosted version.",
      "whyItMatters": "A business wanting a truly free hosted tool with no self-hosting effort gets that from Invoice Ninja but not from Akaunting's cloud plans.",
      "benefitsWho": "Freelancers on a zero budget who don't want to manage a server benefit from Invoice Ninja's free hosted plan."
    },
    {
      "title": "Client and User Scaling",
      "toolA": "Akaunting's Standard Cloud plan covers 1 company, 1 user plus 1 accountant, and 1,000 invoices; Ultimate Cloud ($145/month) removes these caps entirely.",
      "toolB": "Invoice Ninja's free plan is capped at 5 clients; its Enterprise plan ($18/month) supports up to 100 users.",
      "whyItMatters": "Businesses with more than a handful of clients need to know which caps apply and at what price they're removed.",
      "benefitsWho": "Larger teams needing many users benefit from Akaunting's unlimited Ultimate tier or Invoice Ninja's 100-user Enterprise plan."
    },
    {
      "title": "Time Tracking and Project Management",
      "toolA": "Akaunting bundles generic 'project tracking' inside its inventory/project tools, gated to higher-priced cloud tiers, with no Kanban board documented.",
      "toolB": "Invoice Ninja explicitly documents time tracking and Kanban-style project boards as core features.",
      "whyItMatters": "Service businesses billing by the hour need dedicated time-tracking tools, which Invoice Ninja documents more explicitly.",
      "benefitsWho": "Freelancers and agencies that bill hourly and manage projects visually benefit from Invoice Ninja's Kanban boards."
    },
    {
      "title": "Quotes with E-Signature",
      "toolA": "Akaunting's documented feature set does not mention e-signature support for quotes or proposals.",
      "toolB": "Invoice Ninja explicitly supports quotes and proposal generation with e-signature.",
      "whyItMatters": "Businesses that need clients to formally sign off on quotes before work begins need e-signature support.",
      "benefitsWho": "Contractors and consultants who send signed proposals benefit from Invoice Ninja's e-signature feature."
    },
    {
      "title": "Payroll/CRM Apps vs. Payment Gateway Breadth",
      "toolA": "Akaunting offers optional payroll and CRM apps on its Elite ($56/month) and Ultimate ($145/month) cloud tiers.",
      "toolB": "Invoice Ninja documents a wider named set of payment gateways (Stripe, PayPal, Square, GoCardless) plus Zapier/Make/Pabbly automation integrations, but no payroll or CRM app.",
      "whyItMatters": "A business choosing based on which non-invoicing capability it needs most (payroll vs. payment gateway variety) should weigh this trade-off.",
      "benefitsWho": "Businesses wanting payroll bundled in benefit from Akaunting; businesses wanting more payment gateway choices benefit from Invoice Ninja."
    }
  ],
  "featureMatrix": [
    {
      "group": "Invoicing & Billing",
      "rows": [
        {
          "feature": "Recurring invoices",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Invoice template count",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Invoice Ninja: 4 templates free, 11 on paid plans"
        },
        {
          "feature": "Quotes with e-signature",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Plans & Access",
      "rows": [
        {
          "feature": "Perpetually free hosted plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Invoice Ninja free plan: 5 clients"
        },
        {
          "feature": "Free self-hosted open-source version",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Max users on paid tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Akaunting: unlimited (Ultimate, $145/mo); Invoice Ninja: up to 100 (Enterprise, $18/mo)"
        }
      ]
    },
    {
      "group": "Operations & Integrations",
      "rows": [
        {
          "feature": "Time tracking with Kanban boards",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Payroll app",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Akaunting Elite/Ultimate Cloud"
        },
        {
          "feature": "Named payment gateway integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Stripe, PayPal, Square, GoCardless"
        },
        {
          "feature": "Zapier/Make/Pabbly automation",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Akaunting have a free plan like Invoice Ninja?",
      "answer": "Not on the cloud side; Akaunting's cheapest hosted plan is $8/month. Its On-Premise version is free to self-host, similar in spirit to Invoice Ninja's free hosted plan (5 clients) and its own free self-hosted version."
    },
    {
      "question": "Can both be self-hosted for free?",
      "answer": "Yes, Akaunting offers a free On-Premise Standard plan and Invoice Ninja offers a free open-source version via GitHub."
    },
    {
      "question": "Which has more payment gateway options?",
      "answer": "Invoice Ninja documents more named gateways, including Stripe, PayPal, Square, and GoCardless; Akaunting's facts don't list specific payment gateway integrations."
    },
    {
      "question": "Does either include time tracking?",
      "answer": "Invoice Ninja documents time tracking with Kanban project boards. Akaunting only mentions generic project tracking bundled with its inventory tools."
    },
    {
      "question": "What happens if I need more than 5 clients on Invoice Ninja's free plan?",
      "answer": "You'd need to upgrade to Ninja Pro ($14/month) or Enterprise ($18/month, up to 100 users), both of which also unlock more invoice templates."
    },
    {
      "question": "Which has payroll?",
      "answer": "Akaunting offers an optional payroll app on its Elite Cloud plan ($56/month); Invoice Ninja does not document a payroll feature."
    }
  ]
};

export default akauntingVsInvoiceNinjaContent;

import type { GroupComparisonContent } from './types';

const bigcapitalVsFrappeBooksVsInvoiceNinjaContent: GroupComparisonContent = {
  "verdict": "Bigcapital, Frappe Books, and Invoice Ninja all give small businesses a free, open-source path to managing money without a SaaS subscription, but they diverge in scope and deployment model. Bigcapital is the most complete double-entry accounting suite of the three, with inventory and multi-currency support built for self-hosting or affordable cloud plans; Frappe Books is a genuinely free, offline-first desktop app with no cloud tier at all, best for a single user who wants total data ownership; and Invoice Ninja is the strongest choice when client invoicing, quotes, and online payment collection matter more than full bookkeeping. The right pick largely comes down to whether you need a server-based multi-user ledger, an offline solo tool, or a payments-focused invoicing workflow.",
  "bestFor": {
    "bigcapital": "Small and medium businesses wanting a complete self-hosted double-entry accounting and inventory system, or an affordable cloud alternative to QuickBooks",
    "frappe-books": "Solo freelancers and micro-businesses who want a completely free, offline desktop bookkeeping app with no account or subscription",
    "invoice-ninja": "Freelancers and agencies who prioritize client invoicing, quotes, and online payments across 40-plus gateways"
  },
  "highlights": [
    {
      "title": "Frappe Books is the only fully offline option",
      "description": "Frappe Books stores all data locally in SQLite with no login and no internet connection required, a distinct privacy-first approach that Bigcapital and Invoice Ninja do not offer since both are built around online accounts and syncing.",
      "toolSlugs": [
        "frappe-books"
      ]
    },
    {
      "title": "Bigcapital covers the deepest accounting workflow",
      "description": "Bigcapital's report suite spans balance sheet, profit and loss, cash flow, general ledger, and AR/AP aging, going beyond what Frappe Books or Invoice Ninja document.",
      "toolSlugs": [
        "bigcapital"
      ]
    },
    {
      "title": "Invoice Ninja wins on payment collection breadth",
      "description": "With 40-plus supported payment gateways and a client portal for online payments, Invoice Ninja is built specifically to get invoices paid faster than the other two.",
      "toolSlugs": [
        "invoice-ninja"
      ]
    },
    {
      "title": "All three are free to self-host with no artificial caps",
      "description": "Bigcapital, Frappe Books, and Invoice Ninja can each be run at no licensing cost with unlimited users or transactions, appealing to budget-conscious teams comfortable managing their own infrastructure.",
      "toolSlugs": [
        "bigcapital",
        "frappe-books",
        "invoice-ninja"
      ]
    },
    {
      "title": "Only Bigcapital and Invoice Ninja offer a hosted cloud option",
      "description": "Businesses that don't want to run their own server can pick Bigcapital Cloud or Invoice Ninja's hosted plans; Frappe Books has no official hosted edition of its own.",
      "toolSlugs": [
        "bigcapital",
        "invoice-ninja"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Accounting",
      "rows": [
        {
          "feature": "Double-entry bookkeeping and general ledger",
          "statuses": {
            "bigcapital": "available",
            "frappe-books": "available",
            "invoice-ninja": "unavailable"
          }
        },
        {
          "feature": "Financial reporting suite (profit and loss, balance sheet, cash flow)",
          "statuses": {
            "bigcapital": "available",
            "frappe-books": "available",
            "invoice-ninja": "not-documented"
          }
        },
        {
          "feature": "Inventory management",
          "statuses": {
            "bigcapital": "available",
            "frappe-books": "not-documented",
            "invoice-ninja": "limited"
          },
          "note": "Invoice Ninja offers basic inventory tracking for product-based businesses rather than full stock management."
        },
        {
          "feature": "Client invoicing and online payments",
          "statuses": {
            "bigcapital": "available",
            "frappe-books": "limited",
            "invoice-ninja": "available"
          },
          "note": "Frappe Books supports customizable invoices but has no client portal or built-in online payment collection."
        }
      ]
    },
    {
      "group": "Deployment and Access",
      "rows": [
        {
          "feature": "Free self-hosting with unlimited use",
          "statuses": {
            "bigcapital": "available",
            "frappe-books": "available",
            "invoice-ninja": "available"
          }
        },
        {
          "feature": "Official hosted cloud plans",
          "statuses": {
            "bigcapital": "available",
            "frappe-books": "unavailable",
            "invoice-ninja": "available"
          }
        },
        {
          "feature": "Offline-first operation with no account required",
          "statuses": {
            "bigcapital": "unavailable",
            "frappe-books": "available",
            "invoice-ninja": "unavailable"
          }
        },
        {
          "feature": "Multi-currency support",
          "statuses": {
            "bigcapital": "available",
            "frappe-books": "available",
            "invoice-ninja": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of the three is best for a business that needs multiple users?",
      "answer": "Bigcapital is the strongest fit for multi-user teams since its cloud plans include unlimited seats and self-hosting has no user cap. Frappe Books is designed as a single-user desktop app with no built-in team collaboration."
    },
    {
      "question": "Is Frappe Books really free with no hidden costs?",
      "answer": "Yes. Frappe Books is fully open source with no subscription, seat limits, or feature paywalls. There is no official paid cloud edition of Frappe Books itself, unlike its sibling products ERPNext and Frappe HR."
    },
    {
      "question": "Can Invoice Ninja replace a full accounting system like Bigcapital?",
      "answer": "Not fully. Invoice Ninja focuses on invoicing, quotes, payments, and basic expense and time tracking, but it does not document a full double-entry ledger or financial reporting suite the way Bigcapital does."
    },
    {
      "question": "Which tool works best without an internet connection?",
      "answer": "Frappe Books is the only one of the three built to run entirely offline, storing data locally in SQLite with no account or internet connection required. Bigcapital and Invoice Ninja both assume an online, server-based setup even when self-hosted."
    },
    {
      "question": "Which is cheaper for a business that wants cloud hosting instead of self-hosting?",
      "answer": "Bigcapital's cloud plans start at roughly 20 US dollars per month with unlimited seats, while Invoice Ninja's hosted Pro plan starts at 14 US dollars per month but is limited to invoicing rather than full accounting. Frappe Books has no official hosted plan to compare."
    }
  ]
};

export default bigcapitalVsFrappeBooksVsInvoiceNinjaContent;

import type { GroupComparisonContent } from './types';

const akauntingVsFrappeBooksVsInvoiceNinjaContent: GroupComparisonContent = {
  "verdict": "Akaunting, Frappe Books, and Invoice Ninja all give freelancers and small businesses a self-hosted or open-source alternative to subscription accounting software, but they cover different amounts of ground. Frappe Books is the purest free option, a completely free, offline-first desktop app with no cloud tier at all, while Akaunting and Invoice Ninja both pair a free self-hosted edition with an optional paid, hosted SaaS version for teams that don't want to run their own server. Akaunting leans toward full double-entry accounting with an app marketplace, and Invoice Ninja leans toward client-facing invoicing with the widest payment gateway support, so the right choice depends on whether a business needs full bookkeeping, a spreadsheet-free offline tool, or client billing at scale.",
  "bestFor": {
    "akaunting": "Small businesses that want full double-entry accounting plus an app marketplace (payroll, CRM, POS) they can add on as they grow.",
    "frappe-books": "Freelancers and solo consultants who want a completely free, offline-first desktop app with zero subscription or cloud dependency.",
    "invoice-ninja": "Freelancers and agencies that need client-facing invoicing with 40-plus payment gateways and an option to scale into multi-user hosted plans."
  },
  "highlights": [
    {
      "title": "Frappe Books is the only one with no cloud option at all",
      "description": "Frappe Books is free and offline-only by design, with no official paid hosted edition, distinguishing it from Akaunting and Invoice Ninja, which both sell an optional hosted SaaS version.",
      "toolSlugs": [
        "frappe-books"
      ]
    },
    {
      "title": "Akaunting and Invoice Ninja both offer a paid hosted path if self-hosting isn't wanted",
      "description": "Both platforms let users skip server management entirely by paying for a cloud-hosted plan, ranging from roughly $8/month (Akaunting Standard) to $14/month (Invoice Ninja Pro) and up.",
      "toolSlugs": [
        "akaunting",
        "invoice-ninja"
      ]
    },
    {
      "title": "Invoice Ninja supports the widest range of payment gateways",
      "description": "Invoice Ninja connects to more than 40 payment gateways including Stripe, PayPal, Square, and Braintree, a broader out-of-the-box payment footprint than Akaunting or Frappe Books document.",
      "toolSlugs": [
        "invoice-ninja"
      ]
    },
    {
      "title": "Akaunting's app marketplace extends beyond accounting",
      "description": "Akaunting's 50-plus add-on apps cover payroll, projects, CRM, and point of sale, letting a business grow its toolset inside one platform rather than adopting separate software.",
      "toolSlugs": [
        "akaunting"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Licensing",
      "rows": [
        {
          "feature": "Free self-hosted option",
          "statuses": {
            "akaunting": "available",
            "frappe-books": "available",
            "invoice-ninja": "available"
          },
          "note": "Frappe Books is a local desktop app rather than a server you self-host, but it is free either way."
        },
        {
          "feature": "Official paid hosted or cloud SaaS version",
          "statuses": {
            "akaunting": "available",
            "frappe-books": "unavailable",
            "invoice-ninja": "available"
          }
        },
        {
          "feature": "Multi-user or team collaboration",
          "statuses": {
            "akaunting": "available",
            "frappe-books": "unavailable",
            "invoice-ninja": "available"
          },
          "note": "Invoice Ninja's multi-user permissions are part of its Enterprise tier."
        }
      ]
    },
    {
      "group": "Core Accounting and Invoicing",
      "rows": [
        {
          "feature": "Double-entry accounting and general ledger",
          "statuses": {
            "akaunting": "available",
            "frappe-books": "available",
            "invoice-ninja": "not-documented"
          }
        },
        {
          "feature": "Online payment gateway integrations",
          "statuses": {
            "akaunting": "available",
            "frappe-books": "unavailable",
            "invoice-ninja": "available"
          }
        },
        {
          "feature": "Native mobile app",
          "statuses": {
            "akaunting": "limited",
            "frappe-books": "unavailable",
            "invoice-ninja": "available"
          },
          "note": "Akaunting's Android app functions mainly as a wrapper around its mobile web interface, with no dedicated iOS app."
        }
      ]
    },
    {
      "group": "Extensibility",
      "rows": [
        {
          "feature": "REST API",
          "statuses": {
            "akaunting": "available",
            "frappe-books": "not-documented",
            "invoice-ninja": "available"
          }
        },
        {
          "feature": "App marketplace or add-ons",
          "statuses": {
            "akaunting": "available",
            "frappe-books": "unavailable",
            "invoice-ninja": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is completely free with no paid tier at all?",
      "answer": "Frappe Books is the only one with no paid tier whatsoever. It's a free, open-source, offline-first desktop app with no official hosted or cloud edition to upgrade into."
    },
    {
      "question": "Can I self-host all three?",
      "answer": "Akaunting and Invoice Ninja can both be self-hosted for free on your own server. Frappe Books runs locally as a desktop application rather than a server you host, but it is also free."
    },
    {
      "question": "Do any of them support multiple users?",
      "answer": "Akaunting and Invoice Ninja both support multiple users, with Invoice Ninja's multi-user permissions gated to its Enterprise tier. Frappe Books is single-user only."
    },
    {
      "question": "Which has the most payment gateway options?",
      "answer": "Invoice Ninja supports more than 40 payment gateways, including Stripe, PayPal, Square, and Braintree, more than what's documented for Akaunting or Frappe Books."
    },
    {
      "question": "Is Invoice Ninja fully open source?",
      "answer": "Its version 5 codebase is source-available on GitHub under the Elastic License v2, which lets anyone view, self-host, and modify it for their own business, but reselling it or offering it as a hosted service to others requires a separate commercial agreement."
    },
    {
      "question": "Which is best for a solo freelancer who wants to work offline?",
      "answer": "Frappe Books is built specifically for this case: it's an offline-first desktop app with no login, no internet requirement, and all data stored locally, at no cost."
    }
  ]
};

export default akauntingVsFrappeBooksVsInvoiceNinjaContent;

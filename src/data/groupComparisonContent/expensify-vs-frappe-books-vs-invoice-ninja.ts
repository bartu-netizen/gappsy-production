import type { GroupComparisonContent } from './types';

const expensifyVsFrappeBooksVsInvoiceNinjaContent: GroupComparisonContent = {
  "verdict": "Expensify, Frappe Books, and Invoice Ninja tackle different pieces of small business finance: Expensify automates employee expense reports and reimbursement, Frappe Books is a free offline desktop app for double-entry bookkeeping, and Invoice Ninja focuses on client invoicing and online payment collection. Businesses that need to reimburse staff for receipts will get the most from Expensify, solo operators who want a private, no-subscription ledger will prefer Frappe Books, and freelancers or agencies chasing client payments will lean toward Invoice Ninja. Because the three solve genuinely different jobs, many small businesses end up combining rather than choosing only one.",
  "bestFor": {
    "expensify": "Teams and individuals who need automated receipt scanning and structured expense report reimbursement",
    "frappe-books": "Solo freelancers and micro-businesses who want a completely free, offline desktop bookkeeping app with no account required",
    "invoice-ninja": "Freelancers and agencies who prioritize client invoicing, quotes, and online payments across 40-plus gateways"
  },
  "highlights": [
    {
      "title": "Expensify is the only one built for expense reimbursement",
      "description": "SmartScan receipt capture, multi-level approval workflows, and the Expensify Card give it purpose-built expense management that neither Frappe Books nor Invoice Ninja documents.",
      "toolSlugs": [
        "expensify"
      ]
    },
    {
      "title": "Frappe Books is the only fully offline, account-free option",
      "description": "All Frappe Books data lives locally in SQLite with no login and no internet connection needed, a privacy-first design that Expensify's cloud platform and Invoice Ninja's hosted plans don't match.",
      "toolSlugs": [
        "frappe-books"
      ]
    },
    {
      "title": "Invoice Ninja leads on client payment collection",
      "description": "Support for more than 40 payment gateways and a client portal make Invoice Ninja the strongest of the three for getting client invoices paid online.",
      "toolSlugs": [
        "invoice-ninja"
      ]
    },
    {
      "title": "Only Frappe Books and Invoice Ninja handle double-entry bookkeeping",
      "description": "Frappe Books and Invoice Ninja both work from a ledger-style or invoicing data model, while Expensify is explicitly an expense and reimbursement workflow layered on top of, not a replacement for, an accounting system.",
      "toolSlugs": [
        "frappe-books",
        "invoice-ninja"
      ]
    },
    {
      "title": "Expensify and Invoice Ninja both offer a genuinely free tier",
      "description": "Expensify's free plan covers individuals with 25 SmartScans per month, and Invoice Ninja's free plan covers self-hosting or up to 5 hosted clients, while Frappe Books is free in its entirety with no tiers at all.",
      "toolSlugs": [
        "expensify",
        "invoice-ninja",
        "frappe-books"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Workflow",
      "rows": [
        {
          "feature": "Double-entry bookkeeping and general ledger",
          "statuses": {
            "expensify": "unavailable",
            "frappe-books": "available",
            "invoice-ninja": "unavailable"
          }
        },
        {
          "feature": "Receipt scanning and OCR expense capture",
          "statuses": {
            "expensify": "available",
            "frappe-books": "unavailable",
            "invoice-ninja": "limited"
          },
          "note": "Invoice Ninja tracks expenses tied to projects and tasks but does not document OCR-based receipt scanning like Expensify's SmartScan."
        },
        {
          "feature": "Client invoicing and online payments",
          "statuses": {
            "expensify": "unavailable",
            "frappe-books": "limited",
            "invoice-ninja": "available"
          },
          "note": "Frappe Books supports customizable invoices but has no client portal or built-in payment gateway integration."
        },
        {
          "feature": "Multi-level approval workflows",
          "statuses": {
            "expensify": "available",
            "frappe-books": "unavailable",
            "invoice-ninja": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Deployment and Extras",
      "rows": [
        {
          "feature": "Offline, account-free operation",
          "statuses": {
            "expensify": "unavailable",
            "frappe-books": "available",
            "invoice-ninja": "unavailable"
          }
        },
        {
          "feature": "Self-hosting option",
          "statuses": {
            "expensify": "unavailable",
            "frappe-books": "available",
            "invoice-ninja": "available"
          }
        },
        {
          "feature": "Corporate card and reimbursement",
          "statuses": {
            "expensify": "available",
            "frappe-books": "unavailable",
            "invoice-ninja": "unavailable"
          }
        },
        {
          "feature": "Free tier available",
          "statuses": {
            "expensify": "available",
            "frappe-books": "available",
            "invoice-ninja": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do these three tools actually compete with each other?",
      "answer": "Only partially. Expensify focuses on expense reports and reimbursement, Frappe Books on offline bookkeeping, and Invoice Ninja on client invoicing. Many small businesses use more than one together rather than picking a single winner."
    },
    {
      "question": "Which tool is best for a freelancer who just wants to get paid?",
      "answer": "Invoice Ninja is the strongest fit, with support for more than 40 payment gateways and a client portal for online payments, features Expensify and Frappe Books do not offer."
    },
    {
      "question": "Can Frappe Books track and reimburse employee expenses like Expensify?",
      "answer": "No. Frappe Books is a single-user, offline desktop bookkeeping app with no documented approval workflow, receipt OCR, or reimbursement rails, which are Expensify's specialty."
    },
    {
      "question": "Is Frappe Books really free with no subscription at all?",
      "answer": "Yes. The entire application, including accounting and reporting features, is available at no cost with no tiers, seats, or upsells, since it runs entirely offline with no hosted backend to fund."
    },
    {
      "question": "Which tool works without an internet connection?",
      "answer": "Frappe Books is the only one of the three designed to run fully offline, storing data locally in SQLite. Expensify and Invoice Ninja's hosted features both require an internet connection."
    }
  ]
};

export default expensifyVsFrappeBooksVsInvoiceNinjaContent;

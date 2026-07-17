import type { ToolComparisonContent } from './types';

const frappeBooksVsQuickbooksOnlineContent: ToolComparisonContent = {
  "verdict": "Frappe Books and QuickBooks Online are both double-entry accounting tools, but they sit at opposite ends of cost and scale. Frappe Books is a free, open-source, offline desktop app storing data locally in SQLite, with no subscription fee at all. QuickBooks Online is a cloud subscription product from Intuit, founded in 1983, with four plan tiers ranging from roughly $35/month (Simple Start) to roughly $235/month (Advanced), plus an add-on payroll subscription.",
  "bestForToolA": "Frappe Books fits freelancers and small businesses that want free, offline, single-user bookkeeping with full data ownership and no ongoing subscription cost, and that don't need multi-user access or third-party app integrations.",
  "bestForToolB": "QuickBooks Online fits small businesses that need cloud access, multi-user roles with accountant access, payroll, bank feed automation, inventory tracking, and a large ecosystem of third-party integrations, and that are willing to pay a monthly subscription starting around $35/month.",
  "whoNeedsBoth": "There is no realistic scenario for running both as primary ledgers simultaneously, since each is a complete standalone accounting system; a business might trial Frappe Books at zero cost before deciding whether its needs (multi-user access, payroll, bank feeds) justify migrating to QuickBooks Online.",
  "keyDifferences": [
    {
      "title": "Pricing",
      "toolA": "Frappe Books is entirely free with a single Free plan and no paid tiers.",
      "toolB": "QuickBooks Online charges monthly subscriptions across four tiers: Simple Start (~$35/month), Essentials (~$65/month), Plus (~$99/month), and Advanced (~$235/month), all before promotions, plus a separate payroll add-on.",
      "whyItMatters": "Subscription costs compound over time and scale with plan tier, so the total cost of ownership differs dramatically between a free tool and an ongoing SaaS subscription.",
      "benefitsWho": "Cost-sensitive freelancers and micro-businesses benefit from Frappe Books's zero price; businesses that need the features gated behind higher QuickBooks tiers may find the subscription cost justified."
    },
    {
      "title": "Deployment and Data Storage",
      "toolA": "Frappe Books is an offline-first Electron desktop app (Windows, macOS, Linux) that stores all data in a local SQLite file, with no official managed cloud version.",
      "toolB": "QuickBooks Online is a cloud-based, browser-accessible product with continuous updates and mobile apps for iOS and Android.",
      "whyItMatters": "Cloud access enables working from any device and location, while local-only storage maximizes offline reliability and direct data ownership.",
      "benefitsWho": "Users who want full control of their data file and offline access benefit from Frappe Books; teams that need to access books from multiple locations or devices benefit from QuickBooks Online's cloud model."
    },
    {
      "title": "Multi-User and Accountant Access",
      "toolA": "Frappe Books's documented feature set does not include multi-user roles or dedicated accountant access; it is oriented around a single desktop instance.",
      "toolB": "QuickBooks Online supports multi-user roles and dedicated accountant access, with user limits that expand across tiers (roughly up to 3 users on Essentials, 5 on Plus, and 25 on Advanced).",
      "whyItMatters": "Businesses that need a bookkeeper or CPA to log in remotely, or need multiple employees entering transactions, require multi-user support.",
      "benefitsWho": "Small businesses working with an external accountant or bookkeeper benefit from QuickBooks Online's dedicated accountant access, which Frappe Books does not document."
    },
    {
      "title": "Payroll, Bank Feeds, and Inventory",
      "toolA": "Frappe Books does not document payroll, automated bank feed reconciliation, or inventory management features.",
      "toolB": "QuickBooks Online offers bank feed reconciliation on all tiers, an integrated Payroll add-on, and inventory management with cost-of-goods-sold tracking on Plus and Advanced plans.",
      "whyItMatters": "Automated bank matching and payroll integration save significant manual bookkeeping time as a business grows.",
      "benefitsWho": "Growing product-based businesses with employees benefit from QuickBooks Online's payroll and inventory features, which have no Frappe Books equivalent."
    },
    {
      "title": "Third-Party Ecosystem and API",
      "toolA": "Frappe Books has fewer built-in integrations as a smaller open-source project, with no documented API marketplace.",
      "toolB": "QuickBooks Online has a large app marketplace plus a developer API for connecting e-commerce, point-of-sale, and CRM tools.",
      "whyItMatters": "A wide app ecosystem lets a business connect its accounting data to the other software it already uses without custom development.",
      "benefitsWho": "Businesses running e-commerce or CRM platforms alongside their books benefit from QuickBooks Online's marketplace and API access."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Accounting",
      "rows": [
        {
          "feature": "Double-entry accounting",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Standard financial reports",
          "toolA": "available",
          "toolB": "available",
          "note": "Frappe Books: P&L, Trial Balance, Balance Sheet"
        },
        {
          "feature": "Invoicing and estimates",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Point of Sale",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Collaboration & Automation",
      "rows": [
        {
          "feature": "Multi-user roles",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "QuickBooks scales from 1 user (Simple Start) to 25 (Advanced)"
        },
        {
          "feature": "Accountant access",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Bank feed reconciliation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Payroll",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "QuickBooks Payroll is a separate add-on"
        },
        {
          "feature": "Inventory management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "QuickBooks: Plus and Advanced plans"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Frappe Books is entirely free; QuickBooks offers a free trial, not a free plan"
        },
        {
          "feature": "Cloud/browser access",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Mobile app",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "QuickBooks Online has iOS and Android apps"
        },
        {
          "feature": "Third-party app marketplace / API",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Frappe Books completely free forever?",
      "answer": "Yes, Frappe Books has a single Free plan with no subscription cost, unlike QuickBooks Online, which charges monthly fees starting at approximately $35/month for its Simple Start plan."
    },
    {
      "question": "Can multiple people use Frappe Books at once?",
      "answer": "Frappe Books's documented features do not include multi-user roles; it's built around a single local desktop instance, while QuickBooks Online supports multiple users and dedicated accountant access, scaling from roughly 1 user on Simple Start up to 25 on Advanced."
    },
    {
      "question": "Does Frappe Books support payroll?",
      "answer": "No, payroll is not a documented Frappe Books feature; QuickBooks Online offers payroll as a separate add-on subscription that integrates with its core accounting data."
    },
    {
      "question": "Can I migrate data from Frappe Books to QuickBooks Online?",
      "answer": "The available facts don't document a direct migration path between the two; QuickBooks Online does provide a built-in data conversion tool for migrating from QuickBooks Desktop specifically."
    },
    {
      "question": "Does Frappe Books work without the internet?",
      "answer": "Yes, Frappe Books is designed to run fully offline with all data stored locally in SQLite, while QuickBooks Online is a cloud product that requires an internet connection to access."
    },
    {
      "question": "Which tool has bank feed automation?",
      "answer": "QuickBooks Online documents bank feed reconciliation that automatically imports and matches transactions from connected accounts; this is not a documented Frappe Books feature."
    }
  ]
};

export default frappeBooksVsQuickbooksOnlineContent;

import type { ToolComparisonContent } from './types';

const expensifyVsFrappeBooksContent: ToolComparisonContent = {
  "verdict": "Expensify and Frappe Books both touch business finances, but they solve different problems: Expensify is a hosted expense-management platform with SmartScan receipt OCR, a corporate card, travel booking, and Bill Pay, priced from free for individuals to roughly $9/user/month on Control. Frappe Books is a free, open-source, offline desktop accounting app that does double-entry bookkeeping and invoicing locally via SQLite, with no subscription cost and no built-in expense-report workflow.",
  "bestForToolA": "Expensify fits individuals, freelancers, and teams that need receipt scanning, multi-level expense approval workflows, a corporate card, and travel booking, especially those who already use QuickBooks, Xero, NetSuite, or Sage Intacct for accounting.",
  "bestForToolB": "Frappe Books fits freelancers and small businesses that want free, offline, double-entry bookkeeping with full data ownership in a local SQLite file, without any recurring subscription fee.",
  "whoNeedsBoth": "A freelancer could use Expensify's free individual plan to scan and organize client-billable receipts on the go, then import that expense data into Frappe Books to maintain their core double-entry books, since Frappe Books has no documented receipt-scanning or expense-approval feature of its own.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Expensify centers on expense reports: SmartScan receipt capture, the Expensify Card, mileage tracking, and configurable approval workflows.",
      "toolB": "Frappe Books centers on bookkeeping: double-entry accounting, a financial dashboard, Point of Sale, and standard reports (P&L, Trial Balance, Balance Sheet).",
      "whyItMatters": "Expense tracking and core bookkeeping are related but distinct workflows; picking the tool built for your primary need avoids working around missing functionality.",
      "benefitsWho": "Teams that need to control and approve employee spending benefit from Expensify; freelancers and small businesses that need a general ledger benefit from Frappe Books."
    },
    {
      "title": "Pricing Model",
      "toolA": "Expensify is free for individuals with a capped number of SmartScans per month, and business plans (Collect, Control) start around $5-$9/user/month with the Expensify Card discount applied.",
      "toolB": "Frappe Books is entirely free and open source with no paid tier at all.",
      "whyItMatters": "A zero-cost tool with no upsell path is a materially different commitment than a freemium tool with recurring per-user business pricing.",
      "benefitsWho": "Budget-constrained solo operators benefit from Frappe Books's no-cost model; growing teams needing approval chains and card controls may accept Expensify's per-user fees."
    },
    {
      "title": "Deployment: Cloud vs. Offline Desktop",
      "toolA": "Expensify is a hosted web app with iOS and Android mobile apps for on-the-go receipt capture.",
      "toolB": "Frappe Books runs offline as a cross-platform Electron desktop app (Windows, macOS, Linux) storing all data in a local SQLite file, with no official managed cloud version.",
      "whyItMatters": "Cloud access enables mobile receipt capture and multi-device collaboration, while offline-first local storage maximizes data privacy and ownership.",
      "benefitsWho": "Mobile employees submitting receipts from the field benefit from Expensify's cloud and mobile apps; privacy-focused solo bookkeepers benefit from Frappe Books's local-only storage."
    },
    {
      "title": "Receipt Scanning and Approval Workflows",
      "toolA": "Expensify's SmartScan uses OCR to auto-fill merchant, date, amount, and category from a photographed receipt, and supports multi-level approval chains and spending policies.",
      "toolB": "Frappe Books has no documented receipt-scanning or multi-user approval workflow feature.",
      "whyItMatters": "Approval routing and automated receipt capture are essential for organizations that need spend oversight across multiple employees.",
      "benefitsWho": "Finance teams managing employee reimbursements benefit from Expensify's SmartScan and approval chains, which Frappe Books does not offer."
    },
    {
      "title": "Accounting Integrations vs. Standalone Ledger",
      "toolA": "Expensify offers two-way sync with QuickBooks, Xero, NetSuite, Sage Intacct, and other accounting systems.",
      "toolB": "Frappe Books is a standalone general ledger itself rather than a tool that syncs into a separate accounting system, and has fewer built-in integrations as a smaller project.",
      "whyItMatters": "Whether you need a feeder tool that syncs into existing books or a self-contained ledger changes which product actually fits your accounting stack.",
      "benefitsWho": "Businesses with an established accounting system elsewhere benefit from Expensify's sync integrations; businesses without any existing ledger benefit from Frappe Books serving as the ledger itself."
    }
  ],
  "featureMatrix": [
    {
      "group": "Expense & Receipt Management",
      "rows": [
        {
          "feature": "OCR receipt scanning",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Expensify SmartScan"
        },
        {
          "feature": "Mileage tracking",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Multi-level approval workflows",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Corporate card program",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Expensify Card"
        },
        {
          "feature": "Travel booking",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Expensify Travel"
        }
      ]
    },
    {
      "group": "Core Accounting",
      "rows": [
        {
          "feature": "Double-entry accounting",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Standard financial reports (P&L, Balance Sheet)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Point of Sale",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Invoicing",
          "toolA": "available",
          "toolB": "available",
          "note": "Frappe Books via invoice template builder; Expensify as a listed feature"
        }
      ]
    },
    {
      "group": "Pricing & Deployment",
      "rows": [
        {
          "feature": "Free plan/edition",
          "toolA": "available",
          "toolB": "available",
          "note": "Expensify free for individuals; Frappe Books entirely free"
        },
        {
          "feature": "Paid business tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Expensify Collect ~$5/user/mo, Control ~$9/user/mo"
        },
        {
          "feature": "Offline / local-only storage",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Frappe Books uses local SQLite"
        },
        {
          "feature": "Accounting software integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Expensify syncs with QuickBooks, Xero, NetSuite, Sage Intacct"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Frappe Books really free with no paid tier?",
      "answer": "Yes, Frappe Books is completely free and open source with no subscription cost, unlike Expensify, which is free only for individuals and charges per-user fees (roughly $5-$9/user/month) for business plans."
    },
    {
      "question": "Can Frappe Books scan receipts like Expensify's SmartScan?",
      "answer": "No, Frappe Books has no documented OCR or receipt-scanning feature; SmartScan is specific to Expensify and automatically reads merchant, date, amount, and category from a photographed receipt."
    },
    {
      "question": "Does Frappe Books work without an internet connection?",
      "answer": "Yes, Frappe Books runs entirely offline as a desktop app storing data in a local SQLite file, while Expensify is a hosted web and mobile app that requires connectivity to sync data."
    },
    {
      "question": "Does Expensify replace the need for a general ledger like Frappe Books?",
      "answer": "Not fully on its own; Expensify focuses on expense capture, approvals, and card spend, then syncs that data into accounting systems like QuickBooks, Xero, NetSuite, or Sage Intacct rather than acting as a standalone general ledger the way Frappe Books does."
    },
    {
      "question": "Which tool is better for a business with multiple employees submitting expenses?",
      "answer": "Expensify is built for that scenario with configurable multi-level approval workflows and a corporate card; Frappe Books has no documented multi-user approval or expense-report feature."
    }
  ]
};

export default expensifyVsFrappeBooksContent;

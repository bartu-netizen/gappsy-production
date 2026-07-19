import type { GroupComparisonContent } from './types';

const dextVsExpensifyVsZohoBooksContent: GroupComparisonContent = {
  "verdict": "Dext, Expensify, and Zoho Books all touch receipts and expenses, but they cover different parts of the financial stack. Dext is a document-capture automation tool built for accountants and bookkeepers processing high volumes of client receipts and invoices. Expensify centers on individual and team expense reporting, approvals, and reimbursement, bundled with a corporate card and travel booking. Zoho Books is the only one of the three that is a full double-entry accounting system, covering invoicing, inventory, banking, and financial reporting in addition to expense tracking.",
  "bestFor": {
    "dext": "Accountants and bookkeeping firms that need fast, high-accuracy automated data extraction from client receipts, invoices, and bank statements.",
    "expensify": "Companies focused on individual and team expense reporting, approvals, and reimbursement, especially those wanting a bundled corporate card and travel booking.",
    "zoho-books": "Small and growing businesses that want one accounting system covering invoicing, expenses, inventory, and financial reporting, especially if already using other Zoho apps."
  },
  "highlights": [
    {
      "title": "Purpose-Built for Accounting Firms",
      "description": "Dext's mobile capture, email inbox, and client portal are designed around the workflow of an accountant or bookkeeper processing many clients' documents.",
      "toolSlugs": [
        "dext"
      ]
    },
    {
      "title": "Free Access for Individuals",
      "description": "Expensify offers a genuinely free tier with 25 SmartScans per month, and Zoho Books offers a $0 plan, while Dext has no permanent free tier.",
      "toolSlugs": [
        "expensify",
        "zoho-books"
      ]
    },
    {
      "title": "Only One Full Accounting Suite",
      "description": "Zoho Books is the only tool of the three that functions as complete accounting software with invoicing, inventory, and financial reporting rather than a point solution.",
      "toolSlugs": [
        "zoho-books"
      ]
    },
    {
      "title": "Bundled Corporate Card and Travel",
      "description": "Expensify goes beyond expense reports by bundling the Expensify Card, travel booking, and bill pay into the same platform.",
      "toolSlugs": [
        "expensify"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Data Capture and Automation",
      "rows": [
        {
          "feature": "Automated receipt/invoice data extraction",
          "statuses": {
            "dext": "available",
            "expensify": "available",
            "zoho-books": "not-documented"
          },
          "note": "Dext and Expensify (SmartScan) are built around automated OCR capture; this is not documented as a core Zoho Books capability."
        },
        {
          "feature": "Accounting software integrations",
          "statuses": {
            "dext": "available",
            "expensify": "available",
            "zoho-books": "available"
          },
          "note": "Zoho Books integrates with other apps in the Zoho suite such as CRM and Inventory."
        }
      ]
    },
    {
      "group": "Financial Management Scope",
      "rows": [
        {
          "feature": "Full double-entry accounting and financial statements",
          "statuses": {
            "dext": "unavailable",
            "expensify": "unavailable",
            "zoho-books": "available"
          }
        },
        {
          "feature": "Inventory management",
          "statuses": {
            "dext": "unavailable",
            "expensify": "unavailable",
            "zoho-books": "available"
          }
        },
        {
          "feature": "Multi-level approval workflows",
          "statuses": {
            "dext": "not-documented",
            "expensify": "available",
            "zoho-books": "not-documented"
          }
        },
        {
          "feature": "Corporate card and bill pay",
          "statuses": {
            "dext": "unavailable",
            "expensify": "available",
            "zoho-books": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "dext": "unavailable",
            "expensify": "available",
            "zoho-books": "available"
          },
          "note": "Dext offers only a time-limited free trial rather than a permanent free tier."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these tools is a full accounting system rather than a point solution?",
      "answer": "Zoho Books is the only one built as complete accounting software, covering invoicing, expenses, inventory, banking, and financial reporting. Dext and Expensify are more focused point solutions for document capture and expense reporting, respectively."
    },
    {
      "question": "Do any of these have a permanently free plan?",
      "answer": "Expensify and Zoho Books both offer a genuinely free tier for individuals or micro-businesses. Dext offers only a time-limited free trial, not a permanent free plan."
    },
    {
      "question": "Which is best suited for accounting and bookkeeping firms managing multiple clients?",
      "answer": "Dext is purpose-built for this workflow, with a client portal, mobile and email capture, and features designed around processing receipts and invoices across many client accounts."
    },
    {
      "question": "Does Expensify include a corporate card?",
      "answer": "Yes, Expensify bundles the Expensify Card along with travel booking and bill pay features alongside its core expense reporting and approval workflows."
    },
    {
      "question": "Can Dext replace full accounting software like Zoho Books?",
      "answer": "No. Dext focuses on automating data capture from receipts, invoices, and bank statements and is typically used alongside an accounting system rather than replacing one; Zoho Books provides the full invoicing, ledger, and reporting functionality Dext does not."
    },
    {
      "question": "Which tool integrates most deeply with a broader software suite?",
      "answer": "Zoho Books integrates deeply with other Zoho apps like Zoho CRM and Zoho Inventory, which can add value for businesses already using the Zoho ecosystem but may mean less benefit for those who are not."
    }
  ]
};

export default dextVsExpensifyVsZohoBooksContent;

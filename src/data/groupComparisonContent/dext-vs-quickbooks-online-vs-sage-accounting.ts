import type { GroupComparisonContent } from './types';

const dextVsQuickbooksOnlineVsSageAccountingContent: GroupComparisonContent = {
  "verdict": "Dext is a document-capture and bookkeeping-automation layer that publishes extracted data into a general ledger, not a standalone ledger itself, so most businesses will pair it with QuickBooks Online or Sage Accounting rather than pick a single winner among all three. QuickBooks Online is the most feature-complete and widely supported of the two ledgers, with a five-tier ladder running from Solopreneur to Advanced and deep integration into Intuit's payroll and payments ecosystem, but its prices have climbed 12 to 17 percent annually in recent years. Sage Accounting undercuts QuickBooks Online on list price and suits sole traders and small businesses that want dependable core invoicing and reconciliation without the bigger app ecosystem.",
  "bestFor": {
    "dext": "Accounting firms and small businesses that want automated OCR-based receipt and invoice extraction publishing directly into QuickBooks Online or Sage, cutting manual data entry.",
    "quickbooks-online": "Growing small and midsize businesses that want the most widely supported cloud accounting platform with deep payroll, payments, and third-party app integrations.",
    "sage-accounting": "Sole traders and small businesses that want straightforward invoicing and bank reconciliation at a lower list price than QuickBooks Online."
  },
  "highlights": [
    {
      "title": "Automation-first bookkeeping",
      "description": "Dext uses OCR and machine-learning extraction to read receipts, invoices, and bank statements, then publishes the data directly into QuickBooks Online or Sage rather than requiring manual entry.",
      "toolSlugs": [
        "dext"
      ]
    },
    {
      "title": "The most complete ledger of the three",
      "description": "QuickBooks Online spans five tiers from Solopreneur to Advanced, adding time tracking, inventory, project profitability, and custom reporting as businesses grow.",
      "toolSlugs": [
        "quickbooks-online"
      ]
    },
    {
      "title": "Lower list price for core bookkeeping",
      "description": "Sage Accounting's entry Start plan lists at roughly nineteen to twenty-four dollars a month, undercutting QuickBooks Online's Simple Start tier for sole traders who need basic invoicing and reconciliation.",
      "toolSlugs": [
        "sage-accounting"
      ]
    },
    {
      "title": "Dext is built to complement, not replace, either ledger",
      "description": "Dext's own feature set confirms direct publish integrations into both QuickBooks Online and Sage, so it works as an add-on to whichever ledger a business already runs.",
      "toolSlugs": [
        "dext",
        "quickbooks-online",
        "sage-accounting"
      ]
    },
    {
      "title": "Neither ledger offers a permanent free plan",
      "description": "QuickBooks Online only offers a temporary introductory discount and Sage Accounting relies on limited-time promotions, so neither has an ongoing free tier the way some competitors do.",
      "toolSlugs": [
        "quickbooks-online",
        "sage-accounting"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Bookkeeping Automation and Capture",
      "rows": [
        {
          "feature": "Automated OCR data extraction from receipts and invoices",
          "statuses": {
            "dext": "available",
            "quickbooks-online": "limited",
            "sage-accounting": "limited"
          },
          "note": "Dext is purpose-built for extraction accuracy; QuickBooks Online and Sage Accounting offer basic receipt and expense capture built into the ledger."
        },
        {
          "feature": "Mobile capture apps (iOS/Android)",
          "statuses": {
            "dext": "available",
            "quickbooks-online": "available",
            "sage-accounting": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Core Accounting Functionality",
      "rows": [
        {
          "feature": "Full general ledger and invoicing",
          "statuses": {
            "dext": "unavailable",
            "quickbooks-online": "available",
            "sage-accounting": "available"
          }
        },
        {
          "feature": "Bank feed reconciliation",
          "statuses": {
            "dext": "not-documented",
            "quickbooks-online": "available",
            "sage-accounting": "available"
          }
        },
        {
          "feature": "Inventory tracking",
          "statuses": {
            "dext": "unavailable",
            "quickbooks-online": "available",
            "sage-accounting": "available"
          },
          "note": "Available on QuickBooks Online's Plus tier and above, and on Sage Accounting's higher tiers."
        }
      ]
    },
    {
      "group": "Practice and Firm Tools",
      "rows": [
        {
          "feature": "Multi-client practice management or client portal",
          "statuses": {
            "dext": "available",
            "quickbooks-online": "not-documented",
            "sage-accounting": "not-documented"
          },
          "note": "Dext Practice and its client portal are built specifically for accounting firms managing many clients."
        }
      ]
    },
    {
      "group": "Integrations and Ecosystem",
      "rows": [
        {
          "feature": "Third-party and accounting-ecosystem integrations",
          "statuses": {
            "dext": "available",
            "quickbooks-online": "available",
            "sage-accounting": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Dext a replacement for QuickBooks Online or Sage Accounting?",
      "answer": "No. Dext is a receipt and invoice capture and extraction tool that publishes data into a general ledger; it is not a standalone accounting platform, so it is typically used alongside QuickBooks Online or Sage Accounting rather than instead of them."
    },
    {
      "question": "Which is cheaper to start with, QuickBooks Online or Sage Accounting?",
      "answer": "Sage Accounting's entry Start plan lists at roughly nineteen to twenty-four dollars a month, which is lower than QuickBooks Online's Simple Start tier at thirty-eight dollars a month, though QuickBooks Online's Solopreneur plan at twenty dollars a month is priced closer to Sage for very basic needs."
    },
    {
      "question": "Does Dext work with both QuickBooks Online and Sage Accounting?",
      "answer": "Yes. Dext's documented integrations publish extracted data directly into QuickBooks Online, Sage, Xero, and FreeAgent, so it can feed either ledger in this comparison."
    },
    {
      "question": "Which of these three is best for an accounting firm managing many clients?",
      "answer": "Dext's Practice plan and client portal are purpose-built for firms handling multiple clients' bookkeeping, and it is typically paired with QuickBooks Online or Sage Accounting as the underlying ledger for each client."
    },
    {
      "question": "Do any of these three offer a permanent free plan?",
      "answer": "No. Dext offers only a time-limited free trial, QuickBooks Online offers an introductory discount rather than a free tier, and Sage Accounting relies on limited-time promotional pricing rather than an ongoing free plan."
    }
  ]
};

export default dextVsQuickbooksOnlineVsSageAccountingContent;

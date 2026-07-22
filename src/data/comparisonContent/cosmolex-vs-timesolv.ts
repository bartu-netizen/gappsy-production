import type { ToolComparisonContent } from './types';

const cosmolexVsTimesolvContent: ToolComparisonContent = {
  "verdict": "CosmoLex and TimeSolv are both headquartered in West Palm Beach, FL and share nearly identical CRM and Website add-on pricing, suggesting a shared corporate family, but they cover different scopes: CosmoLex is a matter-centric practice-management suite with built-in trust and business accounting, while TimeSolv is a focused time-tracking and billing tool whose full feature set - including trust accounting and LEDES billing - is reserved for its higher-tier Legal plan.",
  "bestForToolA": "Firms wanting one matter-centric system that combines case management, document management, and trust accounting in a single platform with 100+ real-time financial reports.",
  "bestForToolB": "Firms and hourly professionals whose primary need is precise mobile time capture (with offline access) and billing, plus native payment processing via TimeSolvPay, without necessarily needing full matter/case management.",
  "whoNeedsBoth": "Not a typical pairing, since both cover overlapping time-tracking, invoicing, and trust-accounting ground as apparent ProfitSolv-family products - a firm would more likely pick one rather than license both from what looks like the same accounting umbrella.",
  "keyDifferences": [
    {
      "title": "Product Scope",
      "toolA": "CosmoLex offers full matter-centric practice management: case management, document management, client intake, and trust accounting in one system.",
      "toolB": "TimeSolv focuses specifically on time tracking, invoicing, and billing, with project management and a client portal as supporting features.",
      "whyItMatters": "A firm needing full case/matter management should not expect TimeSolv to replace a practice-management system, and vice versa for CosmoLex users who mainly want lightweight time capture.",
      "benefitsWho": "Benefits firms clarifying whether they need an all-in-one practice-management suite or a dedicated time/billing tool."
    },
    {
      "title": "Mobile Time Capture",
      "toolA": "No specific mobile timer feature is documented for CosmoLex.",
      "toolB": "TimeSolv has a mobile app timer with offline access and matter shortcuts as a named feature.",
      "whyItMatters": "Attorneys billing by the hour while away from a desk need reliable mobile, offline-capable time entry to avoid lost billable time.",
      "benefitsWho": "Benefits attorneys and hourly professionals who frequently work outside the office, in court or client visits."
    },
    {
      "title": "Trust Accounting Tier Placement",
      "toolA": "Trust and business accounting is a core feature across CosmoLex's plans.",
      "toolB": "Full trust accounting and LEDES billing are limited to TimeSolv's higher-tier Legal plan, not the base Pro plan.",
      "whyItMatters": "Firms that need trust accounting must confirm which tier includes it before selecting a plan, since it is not universal in TimeSolv's lineup.",
      "benefitsWho": "Benefits firms budgeting for the correct TimeSolv tier if trust accounting is a requirement."
    },
    {
      "title": "Built-in Payment Processing",
      "toolA": "CosmoLex offers an invoicing and payments feature without a named payment-processing product.",
      "toolB": "TimeSolvPay is a named built-in payment processing feature accepting credit cards and ACH transfers.",
      "whyItMatters": "A named, integrated payment product can simplify getting paid without a separate merchant-services setup.",
      "benefitsWho": "Benefits firms wanting to consolidate invoicing and payment collection into one branded workflow."
    },
    {
      "title": "Integration Ecosystem",
      "toolA": "CosmoLex integrates with QuickBooks Online, Outlook, Google Workspace, Box, Dropbox, and NetDocuments.",
      "toolB": "TimeSolv integrates with QuickBooks, NetDocuments, Dropbox, LawPay, AccountEdge, OneDrive, Outlook, and Xero.",
      "whyItMatters": "The specific set of supported integrations, such as Xero versus Google Workspace or LawPay, can determine fit with a firm's existing accounting and document stack.",
      "benefitsWho": "Benefits firms with established accounting software - Xero users lean toward TimeSolv, Google Workspace users lean toward CosmoLex."
    }
  ],
  "featureMatrix": [
    {
      "group": "Time, Billing & Payments",
      "rows": [
        {
          "feature": "Time tracking",
          "toolA": "available",
          "toolB": "available",
          "note": "TimeSolv adds mobile offline access"
        },
        {
          "feature": "Named payment processing product",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "TimeSolvPay"
        },
        {
          "feature": "Trust accounting",
          "toolA": "available",
          "toolB": "limited",
          "note": "TimeSolv: Legal plan only"
        },
        {
          "feature": "LEDES billing",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "TimeSolv: Legal plan only"
        }
      ]
    },
    {
      "group": "Case & Document Management",
      "rows": [
        {
          "feature": "Matter-centric case management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "TimeSolv offers project management instead"
        },
        {
          "feature": "Client intake automation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Document management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Client portal",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Trial & Plans",
      "rows": [
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Both offer a 10-day trial, no credit card required"
        },
        {
          "feature": "Published base pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require contacting sales"
        },
        {
          "feature": "CRM add-on",
          "toolA": "available",
          "toolB": "available",
          "note": "$147/month billed annually, $177/month month-to-month"
        },
        {
          "feature": "Website add-on",
          "toolA": "available",
          "toolB": "available",
          "note": "$149/month billed annually, $159/month month-to-month"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are CosmoLex and TimeSolv related companies?",
      "answer": "Both are headquartered in West Palm Beach, FL, and offer near-identical CRM and Website add-on pricing ($147/month annual CRM, $149/month annual website), suggesting a shared corporate family (ProfitSolv), though each is a distinct product."
    },
    {
      "question": "Which tool includes trust accounting by default?",
      "answer": "CosmoLex includes trust and business accounting across its plans; TimeSolv reserves full trust accounting for its higher-tier Legal plan."
    },
    {
      "question": "Does either tool offer a free trial?",
      "answer": "Yes, both offer a 10-day free trial with no credit card required."
    },
    {
      "question": "Which tool has a dedicated mobile time-tracking app?",
      "answer": "TimeSolv documents a mobile app timer with offline access and matter shortcuts; CosmoLex doesn't document a specific mobile timer feature."
    },
    {
      "question": "What's the difference between TimeSolv's Pro and Legal plans?",
      "answer": "The Legal plan adds conflict checking, matter budgets, custom data views, LEDES billing, split billing, trust accounting, and bulk payment collection on top of the Pro plan."
    },
    {
      "question": "Which tool is better suited as a full practice-management system versus a billing tool?",
      "answer": "CosmoLex is built around matter-centric case management with billing included; TimeSolv is centered on time tracking and billing with project management as a supporting feature."
    }
  ]
};

export default cosmolexVsTimesolvContent;

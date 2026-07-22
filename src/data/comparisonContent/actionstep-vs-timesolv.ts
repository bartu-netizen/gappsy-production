import type { ToolComparisonContent } from './types';

const actionstepVsTimesolvContent: ToolComparisonContent = {
  "verdict": "Actionstep is a broader cloud legal practice-management platform for midsize firms with AI-powered automation and 50+ integrations, sold per user plus implementation fees across five global regions. TimeSolv is a more focused time-tracking and billing tool with tiered Pro/Legal plans and native mobile offline time capture. The two overlap on billing and trust accounting but differ substantially in overall scope and evaluation path.",
  "bestForToolA": "Midsize law firms wanting an end-to-end practice-management platform with AI-assisted time capture and client intake, workflow automation, and a separate Legal Accounting module (general ledger, banking, AP/AR, revenue recognition) for North American firms.",
  "bestForToolB": "Firms and hourly professionals primarily needing precise time tracking and billing, with a 10-day no-credit-card trial, native mobile offline time entry, and integrated payment processing via TimeSolvPay.",
  "whoNeedsBoth": "Not a typical pairing - both cover matter management, billing, and trust accounting, so a firm would generally choose one system of record; a firm might consider both only during a migration or evaluation period comparing Actionstep's full practice-management suite against TimeSolv's narrower time-and-billing focus.",
  "keyDifferences": [
    {
      "title": "Trial Availability",
      "toolA": "Actionstep does not mention a free trial or free plan; a custom quote is required.",
      "toolB": "TimeSolv offers a 10-day free trial with no credit card required.",
      "whyItMatters": "The ability to try before buying lowers the barrier to evaluation, especially for smaller firms without a formal procurement process.",
      "benefitsWho": "Benefits solo and small-firm buyers who want to self-evaluate before engaging a sales team."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Actionstep is priced per user plus implementation fees, with pricing and availability varying by region (US, UK, AU, NZ, Canada).",
      "toolB": "TimeSolv's Pro and Legal plans require contacting sales but are flat-rate rather than per-user, with named add-ons (CRM, Website) priced separately at $147-149/month.",
      "whyItMatters": "Per-user-plus-implementation pricing can mean higher upfront costs for onboarding, while flat-tier pricing may be more predictable for smaller teams.",
      "benefitsWho": "Benefits firms budgeting implementation costs versus firms wanting simpler recurring billing."
    },
    {
      "title": "AI Automation Scope",
      "toolA": "Actionstep names AI features for time capture, client intake assistance, and administrative tasks.",
      "toolB": "AI features are not documented among TimeSolv's listed capabilities.",
      "whyItMatters": "AI-assisted time capture can reduce under-billing by automatically logging billable activity.",
      "benefitsWho": "Benefits firms wanting automated time capture to reduce administrative burden and revenue leakage."
    },
    {
      "title": "Accounting Depth",
      "toolA": "Actionstep offers a separate Legal Accounting plan with general ledger, banking, accounts payable/receivable, financial reporting, revenue recognition, and forecasting, for North America only.",
      "toolB": "Trust accounting and LEDES billing are included on TimeSolv's Legal plan, but general-ledger or AP/AR functionality is not documented.",
      "whyItMatters": "Firms needing full-featured accounting (GL, AP/AR, forecasting) rather than just trust accounting need a platform with that depth.",
      "benefitsWho": "Benefits North American firms wanting integrated full-service accounting rather than a separate accounting product."
    },
    {
      "title": "Scale & Integration Ecosystem",
      "toolA": "Actionstep reports 5,000+ law firms worldwide and 50+ integrations including Microsoft 365, Xero, Zapier, and DocuSign, plus native iOS/Android apps.",
      "toolB": "TimeSolv integrates with 8 named tools (QuickBooks, NetDocuments, Dropbox, LawPay, AccountEdge, OneDrive, Outlook, Xero) and also offers native iOS/Android apps.",
      "whyItMatters": "A broader integration catalog suggests wider compatibility with firms' existing software stacks.",
      "benefitsWho": "Benefits firms with diverse existing toolsets - such as Zapier and DocuSign users - that need broad connectivity."
    }
  ],
  "featureMatrix": [
    {
      "group": "Practice Management & AI",
      "rows": [
        {
          "feature": "Matter / workflow automation",
          "toolA": "available",
          "toolB": "limited",
          "note": "TimeSolv offers project management, not workflow automation"
        },
        {
          "feature": "Document automation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI-powered automation",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Actionstep: time capture, intake, admin tasks"
        },
        {
          "feature": "Client portal",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Billing & Accounting",
      "rows": [
        {
          "feature": "Trust accounting",
          "toolA": "available",
          "toolB": "limited",
          "note": "TimeSolv: Legal plan only"
        },
        {
          "feature": "General ledger / AP/AR accounting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Actionstep's Legal Accounting plan, North America only"
        },
        {
          "feature": "Automatic mobile time tracking",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "TimeSolv includes offline mobile access"
        },
        {
          "feature": "Named payment processing",
          "toolA": "available",
          "toolB": "available",
          "note": "TimeSolvPay"
        }
      ]
    },
    {
      "group": "Trial, Pricing & Mobile",
      "rows": [
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "TimeSolv: 10 days, no credit card"
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require a quote"
        },
        {
          "feature": "Native mobile apps",
          "toolA": "available",
          "toolB": "available",
          "note": "Both offer iOS and Android"
        },
        {
          "feature": "Integration count",
          "toolA": "available",
          "toolB": "available",
          "note": "Actionstep: 50+; TimeSolv: 8 named"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Actionstep offer a free trial?",
      "answer": "No, Actionstep does not mention a free trial or free plan; a custom quote is required."
    },
    {
      "question": "How is each tool priced?",
      "answer": "Actionstep is priced per user plus implementation fees, varying by region; TimeSolv's Pro and Legal plans require contacting sales, with separate named pricing for CRM ($147/month) and Website ($149/month) add-ons."
    },
    {
      "question": "Which tool includes AI automation?",
      "answer": "Actionstep documents AI features for time capture, client intake assistance, and administrative tasks; TimeSolv does not document AI capabilities."
    },
    {
      "question": "Does either tool support full accounting beyond trust accounting?",
      "answer": "Actionstep offers a separate Legal Accounting plan (general ledger, banking, AP/AR, revenue recognition, forecasting) for North America; TimeSolv's accounting centers on trust accounting and LEDES billing on its Legal plan."
    },
    {
      "question": "How many firms and integrations does each report?",
      "answer": "Actionstep reports 5,000+ law firms worldwide and 50+ integrations; TimeSolv names 8 specific integrations (QuickBooks, NetDocuments, Dropbox, LawPay, AccountEdge, OneDrive, Outlook, Xero)."
    },
    {
      "question": "Do both have mobile apps?",
      "answer": "Yes, both Actionstep and TimeSolv offer native iOS and Android apps."
    }
  ]
};

export default actionstepVsTimesolvContent;

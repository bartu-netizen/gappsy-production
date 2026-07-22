import type { ToolComparisonContent } from './types';

const m3terVsSubskribeContent: ToolComparisonContent = {
  "verdict": "m3ter is usage-based billing infrastructure focused specifically on ingesting usage data, rating complex consumption-based pricing, and preventing revenue leakage for B2B SaaS companies, designed to plug into existing CRM/ERP systems rather than replace them. Subskribe is a broader Quote-to-Revenue platform bundling CPQ, subscription billing, and automated revenue recognition (ASC 606/IFRS 15) with built-in e-signature and AI-assisted deal desk tools. Both are enterprise, custom-quoted platforms now owned by larger companies, m3ter by Salesforce and Subskribe by DealHub, and the choice depends on whether a company needs deep usage-metering and rating infrastructure (m3ter) or an end-to-end quote-to-cash suite spanning sales quoting through revenue recognition (Subskribe).",
  "bestForToolA": "m3ter fits mid-size and large B2B SaaS companies with complex, usage-based pricing models that need an advanced rating engine and revenue-leakage prevention layered on top of existing Salesforce, NetSuite, or Looker systems.",
  "bestForToolB": "Subskribe fits SaaS companies wanting an integrated quote-to-revenue suite, including CPQ with multilevel discounting, subscription billing, and ASC 606/IFRS 15 revenue recognition, that can also be purchased as individual CPQ or Billing modules.",
  "whoNeedsBoth": "A B2B SaaS company with highly complex usage-based pricing could use m3ter for usage data ingestion and rating while using Subskribe's CPQ and revenue recognition modules to handle quoting and compliance-driven revenue reporting on top of m3ter's rated bills, though this would require integrating two separately custom-quoted enterprise systems.",
  "keyDifferences": [
    {
      "title": "Core Focus",
      "toolA": "m3ter specializes in usage data ingestion and an advanced rating engine purpose-built for complex usage-based pricing models.",
      "toolB": "Subskribe bundles CPQ, billing, and revenue recognition into one Quote-to-Revenue platform, with CPQ and Billing also sellable as standalone modules.",
      "whyItMatters": "A narrowly focused rating engine versus a full quote-to-cash suite serve different points in the revenue workflow.",
      "benefitsWho": "Companies with complex consumption pricing needing precise rating benefit from m3ter's specialization; companies wanting one system from quote to revenue recognition benefit from Subskribe's breadth."
    },
    {
      "title": "Revenue Recognition Compliance",
      "toolA": "m3ter's documented features do not mention formal revenue recognition standards compliance.",
      "toolB": "Subskribe's Revenue Recognition module explicitly supports ASC 606 and IFRS 15 compliance for complex deals.",
      "whyItMatters": "Public and growth-stage SaaS companies often need audited compliance with these accounting standards.",
      "benefitsWho": "Finance teams needing ASC 606/IFRS 15 compliant revenue recognition benefit from Subskribe."
    },
    {
      "title": "AI Features",
      "toolA": "m3ter's feature list does not mention AI-specific capabilities.",
      "toolB": "Subskribe includes DealDesk AI for guided selling, smart summarization, conversational support, and intelligent sales rooms.",
      "whyItMatters": "AI-assisted deal desk tools can speed up quote creation and approvals.",
      "benefitsWho": "Sales operations teams wanting AI-assisted deal support benefit from Subskribe's DealDesk AI."
    },
    {
      "title": "Company History & Ownership",
      "toolA": "m3ter was founded in 2020 by a team with prior usage-based pricing experience from GameSparks (acquired by Amazon), and m3ter itself is now owned by Salesforce following an acquisition.",
      "toolB": "Subskribe was acquired by DealHub in November 2025 but continues operating under its own name.",
      "whyItMatters": "Recent acquisitions can affect long-term product roadmap and independence for buyers evaluating vendor stability.",
      "benefitsWho": "Buyers doing vendor-risk due diligence benefit from knowing both platforms' current ownership."
    },
    {
      "title": "Integration Cost",
      "toolA": "m3ter connects with Salesforce, NetSuite, and Looker, though integration pricing details are not documented.",
      "toolB": "Subskribe explicitly includes all integrations (Salesforce, HubSpot, NetSuite, QuickBooks, Stripe, DocuSign, Avalara, Anrok, Slack) at no extra charge.",
      "whyItMatters": "Integration costs can add significantly to total platform spend if not included.",
      "benefitsWho": "Companies wanting predictable integration costs benefit from Subskribe's stated no-extra-charge integration policy."
    }
  ],
  "featureMatrix": [
    {
      "group": "Billing & Rating",
      "rows": [
        {
          "feature": "Usage data ingestion",
          "toolA": "available",
          "toolB": "available",
          "note": "Subskribe: usage-based billing within Subskribe Billing"
        },
        {
          "feature": "Advanced rating engine",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-currency billing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Automated dunning",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Revenue leakage prevention",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "m3ter cites 4-7% of revenue at risk"
        }
      ]
    },
    {
      "group": "Quoting & Revenue",
      "rows": [
        {
          "feature": "CPQ / quote generation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Subskribe CPQ, multilevel discounting"
        },
        {
          "feature": "E-signature",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Revenue recognition (ASC 606/IFRS 15)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Standalone module purchase",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "CPQ and Billing sold separately"
        }
      ]
    },
    {
      "group": "AI, Integration & Analytics",
      "rows": [
        {
          "feature": "AI-assisted deal support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "DealDesk AI"
        },
        {
          "feature": "Real-time dashboards",
          "toolA": "available",
          "toolB": "available",
          "note": "Subskribe: Advanced Analytics"
        },
        {
          "feature": "CRM/ERP integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "m3ter: Salesforce, NetSuite, Looker; Subskribe: Salesforce, HubSpot, NetSuite, QuickBooks, Stripe, DocuSign, Avalara, Anrok, Slack - all free"
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require a custom quote"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is m3ter free to use?",
      "answer": "No public free plan or free trial is listed. Pricing is based on a custom quote after scheduling a demo."
    },
    {
      "question": "Does Subskribe offer a free trial?",
      "answer": "No free trial or free plan is listed on the pricing page; pricing is provided through a custom quote."
    },
    {
      "question": "Who owns m3ter now?",
      "answer": "m3ter is now part of Salesforce, following a definitive acquisition agreement."
    },
    {
      "question": "Who owns Subskribe now?",
      "answer": "Subskribe was acquired by DealHub in November 2025 but continues to operate and deliver its product under the Subskribe name."
    },
    {
      "question": "Does Subskribe support ASC 606/IFRS 15?",
      "answer": "Yes, Subskribe's revenue recognition module supports ASC 606 and IFRS 15 compliance."
    },
    {
      "question": "Are Subskribe's integrations included in the price?",
      "answer": "Yes, Subskribe states that all integrations, including Salesforce, NetSuite, Stripe, and Avalara, are included free of charge."
    }
  ]
};

export default m3terVsSubskribeContent;

import type { ToolComparisonContent } from './types';

const subskribeCpqVsXactlyIncentContent: ToolComparisonContent = {
  "verdict": "Subskribe CPQ and Xactly Incent both automate revenue-adjacent processes for enterprise teams, but they sit on opposite sides of the same deal. Subskribe CPQ, founded in 2020 and acquired by DealHub in 2024 as part of a $100M funding round, unifies CPQ, subscription billing, and revenue recognition -- an online calculator estimates roughly $140,000/year for a mid-market company. Xactly Incent automates sales commission design, calculation, and payout compliance, and was named a Leader in the 2026 Gartner Magic Quadrant for Sales Performance Management with reported 99.6% forecasting accuracy and 99.8% on-time payment accuracy. Subskribe generates and bills the deal; Xactly pays the rep who closed it.",
  "bestForToolA": "SaaS companies that need to unify quote generation, subscription billing, and revenue recognition in one system rather than stitching together separate tools -- Subskribe supports complex deal structures like subscription ramps and integrates with Salesforce, HubSpot, NetSuite, and QuickBooks.",
  "bestForToolB": "Enterprise revenue organizations that need to automate complex commission calculations (splits, accelerators, clawbacks) with compliance automation for ASC 606 and IFRS 15, and want native mobile apps for reps to check earnings on the go.",
  "whoNeedsBoth": "A SaaS company would plausibly run Subskribe CPQ to generate quotes, bill subscriptions, and recognize revenue on closed deals, while separately running Xactly Incent to calculate and pay the commissions the reps earned on those same deals -- the two tools cover different halves of the revenue lifecycle (selling and billing vs. paying sales reps) rather than competing for the same budget line.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Subskribe CPQ handles quote-to-revenue: CPQ for deal configuration and approval, subscription billing and invoicing, and automated revenue recognition including subscription ramps.",
      "toolB": "Xactly Incent handles commission management: a Compensation Configurator for building comp plans, automated calculations for splits/accelerators/clawbacks, and real-time earnings transparency for reps.",
      "whyItMatters": "Buyers need to be clear that these are not competing products -- one prices and bills deals, the other pays the people who sold them.",
      "benefitsWho": "Revenue operations teams building out CPQ and billing infrastructure (Subskribe) versus sales operations and finance teams managing commission payouts (Xactly)."
    },
    {
      "title": "AI Capabilities",
      "toolA": "Subskribe includes DealDesk AI for guided selling, deal summarization, and conversational support for deal desks, plus a Zeppa Business Rules Engine for custom quoting logic.",
      "toolB": "Xactly Incent uses AI-trained logic in its Compensation Configurator and includes AI anomaly detection that flags unusual payouts before they reach payroll.",
      "whyItMatters": "Each vendor applies AI to its specific domain -- Subskribe to deal configuration and quoting, Xactly to catching commission errors before money moves.",
      "benefitsWho": "Deal desk teams wanting AI assistance during quoting (Subskribe) versus finance and payroll teams wanting error prevention before payout (Xactly)."
    },
    {
      "title": "Compliance Scope",
      "toolA": "Subskribe's Revenue Recognition feature automates complex revenue recognition for deals including subscription ramps, relevant to ASC 606-style revenue standards.",
      "toolB": "Xactly Incent explicitly documents compliance automation for ASC 606 and IFRS 15 with audit trails, applied specifically to commission expense recognition.",
      "whyItMatters": "Both tools touch ASC 606, but from different angles -- Subskribe for recognizing subscription revenue, Xactly for recognizing commission expense -- and a company may need both to be fully compliant.",
      "benefitsWho": "Finance and accounting teams managing revenue and commission expense recognition under the same accounting standard."
    },
    {
      "title": "Mobile Access",
      "toolA": "Subskribe CPQ does not document native mobile apps.",
      "toolB": "Xactly Incent offers native Android and iOS apps giving reps access to commission dashboards and earnings statements on the go.",
      "whyItMatters": "Sales reps checking commission earnings benefit from dedicated mobile access, which is a documented Xactly feature not mirrored by Subskribe.",
      "benefitsWho": "Field sales reps who want to check earnings status without opening a desktop browser."
    },
    {
      "title": "Pricing Model and Company Status",
      "toolA": "Subskribe does not publish pricing but offers an online estimate calculator (roughly $140,000/year for a mid-market company); it was acquired by DealHub in 2024, which may bring product-direction changes.",
      "toolB": "Xactly Incent does not publish pricing and requires contacting sales; it is an established Sales Performance Management leader per the 2026 Gartner Magic Quadrant, with no public founding year or headquarters disclosed here.",
      "whyItMatters": "Buyers evaluating vendor stability should factor in Subskribe's recent acquisition versus Xactly's established, analyst-recognized market position.",
      "benefitsWho": "Procurement and finance teams doing vendor risk assessment as part of purchasing decisions."
    }
  ],
  "featureMatrix": [
    {
      "group": "Quote-to-Revenue vs. Compensation Focus",
      "rows": [
        {
          "feature": "CPQ / quote generation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Subscription billing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Revenue recognition automation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Commission plan configurator",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Split commissions, accelerators, clawbacks",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Compliance automation (ASC 606 / IFRS 15) with audit trails",
          "toolA": "available",
          "toolB": "available",
          "note": "Different scope: revenue (Subskribe) vs. commission expense (Xactly)"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI guided selling / deal summarization",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Subskribe: DealDesk AI"
        },
        {
          "feature": "AI anomaly detection on payouts",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-trained compensation logic",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Custom quoting/business rules engine",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Subskribe: Zeppa"
        }
      ]
    },
    {
      "group": "Access & Integrations",
      "rows": [
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Subskribe offers an online estimate calculator only"
        },
        {
          "feature": "Free trial",
          "toolA": "unavailable",
          "toolB": "not-documented"
        },
        {
          "feature": "Native mobile apps",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Xactly: iOS and Android"
        },
        {
          "feature": "Named CRM/ERP integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Subskribe: Salesforce, HubSpot, NetSuite, QuickBooks, Avalara, Anrok, DocuSign, Stripe, Slack; Xactly: Salesforce, ServiceNow, NetSuite"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Subskribe CPQ and Xactly Incent competitors?",
      "answer": "No. Subskribe CPQ handles quoting, subscription billing, and revenue recognition, while Xactly Incent handles sales commission calculation and compliance -- they typically complement rather than replace each other."
    },
    {
      "question": "How much does Subskribe CPQ cost?",
      "answer": "Subskribe does not publish pricing; it uses custom pricing based on company size, billing volume, seats, and product selection. An online calculator suggests roughly $140,000/year for a mid-market company."
    },
    {
      "question": "Does Xactly Incent publish pricing?",
      "answer": "No, pricing is not published and requires contacting sales for a quote."
    },
    {
      "question": "Which tool has native mobile apps?",
      "answer": "Xactly Incent offers native Android and iOS apps for reps to view commission dashboards and earnings statements. This is not documented for Subskribe CPQ."
    },
    {
      "question": "Is Subskribe still an independent company?",
      "answer": "No, Subskribe was acquired by DealHub in 2024 as part of a funding round in which DealHub secured $100 million in new investment."
    },
    {
      "question": "Do both tools support ASC 606 compliance?",
      "answer": "Yes, but for different purposes: Subskribe's Revenue Recognition feature automates revenue recognition for subscription deals, while Xactly Incent's compliance automation applies ASC 606 and IFRS 15 specifically to commission expense with audit trails."
    }
  ]
};

export default subskribeCpqVsXactlyIncentContent;

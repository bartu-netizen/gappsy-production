import type { ToolComparisonContent } from './types';

const hyperlineVsKillBillContent: ToolComparisonContent = {
  "verdict": "Hyperline is a fully managed, quote-to-cash revenue management SaaS platform charging a monthly base fee plus a percentage of revenue, aimed at SaaS companies wanting CPQ, billing, and usage metering without managing infrastructure. Kill Bill is a free, open-source subscription billing engine (Apache 2.0) that you self-host, with no per-transaction or revenue-percentage fees but the operational burden of running it yourself. The choice comes down to trading engineering effort for a managed service fee, or trading a revenue-percentage fee for full infrastructure control.",
  "bestForToolA": "Hyperline fits a SaaS company that wants a managed CPQ-to-billing platform with global invoicing compliance across 100+ countries and native Stripe/GoCardless/Mollie/Airwallex payment integrations, and is willing to pay $199/month plus 0.6% of revenue for it.",
  "bestForToolB": "Kill Bill fits an engineering-resourced company that wants full control and no per-transaction fees by self-hosting via Docker or Kubernetes, benefiting from its 15+ years in production and plugin support for gateways like Stripe, Adyen, PayPal, and Braintree.",
  "whoNeedsBoth": "There's no realistic scenario for running both together since they compete directly on the same job (subscription billing infrastructure); a company would pick a managed SaaS approach (Hyperline) or a self-hosted open-source approach (Kill Bill), not both.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "Hyperline charges a monthly base fee plus a percentage of revenue: $199/month + 0.6% for Quote to Cash, or $299/month + 0.7% for the usage-billing tier.",
      "toolB": "Kill Bill's core platform is fully free and open source under Apache 2.0, with no per-transaction or revenue-percentage fees since it runs in your own infrastructure.",
      "whyItMatters": "At high revenue volumes, a percentage-of-revenue fee can become far more expensive than a self-hosted platform with no such fee.",
      "benefitsWho": "High-revenue companies with engineering capacity to self-host benefit from avoiding Hyperline's revenue-percentage fee via Kill Bill."
    },
    {
      "title": "Hosting and Operations",
      "toolA": "Hyperline is a fully managed SaaS platform; customers don't need to deploy or maintain infrastructure.",
      "toolB": "Kill Bill requires self-hosting via Docker or Kubernetes and the engineering resources to deploy, operate, and maintain it, with no official low-code hosted option from the core project.",
      "whyItMatters": "Teams without dedicated infrastructure engineers need a managed option to avoid operational overhead.",
      "benefitsWho": "Lean teams without DevOps resources benefit from Hyperline's managed hosting; engineering-heavy teams benefit from Kill Bill's self-hosted control."
    },
    {
      "title": "CPQ and Quote-to-Cash",
      "toolA": "Hyperline explicitly includes CPQ (Configure, Price, Quote) functionality to streamline quote creation and contract management for sales teams.",
      "toolB": "Kill Bill's documented features center on the billing, subscription, and payment engine rather than a CPQ or quoting layer.",
      "whyItMatters": "Sales-led SaaS companies that need quoting and contract workflows tied directly to billing benefit from a built-in CPQ layer.",
      "benefitsWho": "Sales teams generating custom quotes and contracts benefit from Hyperline's CPQ functionality."
    },
    {
      "title": "Vendor Compliance Certifications",
      "toolA": "Hyperline is SOC2, ISO27001, and GDPR certified as a vendor.",
      "toolB": "Kill Bill, being self-hosted, doesn't carry vendor-level compliance certifications; the operator is responsible for achieving its own compliance posture.",
      "whyItMatters": "Enterprise buyers with vendor security review requirements often need documented third-party certifications.",
      "benefitsWho": "Enterprise procurement teams requiring pre-certified vendors benefit from Hyperline's SOC2/ISO27001/GDPR certifications."
    },
    {
      "title": "Track Record and Maturity",
      "toolA": "Hyperline's founding year isn't disclosed, though it is headquartered in Paris, France.",
      "toolB": "Kill Bill was founded in 2010 and has been in production for over 15 years.",
      "whyItMatters": "Buyers weighing platform maturity and long-term stability may value a longer public track record.",
      "benefitsWho": "Risk-averse buyers wanting a long production track record benefit from Kill Bill's 15+ year history."
    }
  ],
  "featureMatrix": [
    {
      "group": "Billing Engine",
      "rows": [
        {
          "feature": "Usage-based billing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "CPQ / quoting",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-tenant, prepaid, and postpaid subscription models",
          "toolA": "limited",
          "toolB": "available",
          "note": "Hyperline describes 'flexible pricing models' generally; Kill Bill names these models explicitly"
        }
      ]
    },
    {
      "group": "Payments & Tax",
      "rows": [
        {
          "feature": "Native payment gateway integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Hyperline: Stripe, GoCardless, Mollie, Airwallex; Kill Bill: Stripe, Adyen, PayPal, Braintree via plugins"
        },
        {
          "feature": "Tax engine integration",
          "toolA": "available",
          "toolB": "available",
          "note": "Kill Bill names Avalara and Vertex explicitly"
        },
        {
          "feature": "Global invoicing compliance (100+ countries)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Deployment & Cost",
      "rows": [
        {
          "feature": "Self-hosted / open source",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Apache 2.0"
        },
        {
          "feature": "Free trial or free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Hyperline: 10 free invoices, no credit card; Kill Bill: entire core platform is free"
        },
        {
          "feature": "Revenue-percentage fee",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Hyperline: 0.6%-0.7% of revenue on top of base fee"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How much does Hyperline cost compared to Kill Bill?",
      "answer": "Hyperline starts at $199/month plus 0.6% of revenue for Quote to Cash, rising to $299/month plus 0.7% for usage billing. Kill Bill's core platform is free and open source, though you bear the cost of hosting and operating it yourself."
    },
    {
      "question": "Do I need to host Kill Bill myself?",
      "answer": "Yes, Kill Bill is designed to be self-hosted via Docker or Kubernetes; third-party providers offer managed hosting, but there's no official low-code hosted option from the core project."
    },
    {
      "question": "Does Hyperline charge a percentage of revenue?",
      "answer": "Yes, on top of its monthly base price, Hyperline charges 0.6% of revenue on the Quote to Cash plan and 0.7% on the usage-billing tier."
    },
    {
      "question": "Which includes CPQ / quoting tools?",
      "answer": "Hyperline explicitly includes CPQ (Configure, Price, Quote) functionality. Kill Bill's documented features don't include a CPQ layer."
    },
    {
      "question": "What payment gateways does each support?",
      "answer": "Hyperline natively integrates with Stripe, GoCardless, Mollie, and Airwallex. Kill Bill supports Stripe, Adyen, PayPal, and Braintree through native plugins."
    },
    {
      "question": "How long has each platform been around?",
      "answer": "Kill Bill was founded in 2010 and has over 15 years in production. Hyperline's founding year isn't disclosed, though it's headquartered in Paris, France."
    }
  ]
};

export default hyperlineVsKillBillContent;

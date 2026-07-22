import type { ToolComparisonContent } from './types';

const taxjarVsZenskarContent: ToolComparisonContent = {
  "verdict": "TaxJar focuses narrowly on sales tax calculation, filing, and remittance for ecommerce and SaaS sellers, while Zenskar is a broader revenue automation platform covering billing, ASC 606/IFRS 15 revenue recognition, collections, and usage metering. They overlap only at the edges of financial operations and generally serve different line items in a finance stack.",
  "bestForToolA": "Ecommerce or SaaS sellers needing dedicated sales tax nexus tracking and automated filing, especially those wanting Stripe-backed infrastructure (TaxJar was acquired by Stripe in 2021) and a published flat price starting at $39/month.",
  "bestForToolB": "Subscription or usage-based B2B companies needing automated invoicing across pricing models, audit-ready ASC 606/IFRS 15 revenue recognition, and collections/dunning, particularly those wanting an AI Contracts Agent to generate invoices from contract terms.",
  "whoNeedsBoth": "A SaaS company billing customers across multiple pricing models could use Zenskar to automate invoicing, revenue recognition, and collections, while separately using TaxJar to calculate and file the sales tax owed on those same invoiced transactions — the two solve adjacent but non-overlapping parts of the revenue-to-cash process.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "TaxJar calculates, reports, and files sales tax across sales channels.",
      "toolB": "Zenskar automates billing, revenue recognition, collections, and usage metering.",
      "whyItMatters": "These typically sit under different budget owners — tax/compliance versus billing/finance operations.",
      "benefitsWho": "Finance teams need to know which system of record covers which function before evaluating either tool."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "TaxJar publishes fixed monthly prices: $39/month for Starter and $99/month for Professional.",
      "toolB": "Zenskar's three tiers (Starter, Standard, Enterprise) are all custom-quoted with no public pricing.",
      "whyItMatters": "Budgeting predictability differs sharply between a published rate card and a sales-driven quote process.",
      "benefitsWho": "Cost-conscious small teams favor TaxJar's transparency; enterprises negotiating custom deals may not mind Zenskar's quote model."
    },
    {
      "title": "Free Access",
      "toolA": "TaxJar offers a 30-day free trial with no credit card required.",
      "toolB": "Zenskar has no self-serve free plan, but offers a free pilot program of flexible duration and a sandbox environment for testing.",
      "whyItMatters": "Self-serve evaluation versus a guided, sales-driven pilot changes how quickly a buyer can start testing.",
      "benefitsWho": "Self-serve buyers prefer TaxJar's trial; larger organizations willing to go through a guided pilot can still access Zenskar for free."
    },
    {
      "title": "Revenue Recognition",
      "toolA": "TaxJar's documented features (calculation, AutoFile, nexus insights, product categorization) don't include revenue recognition.",
      "toolB": "Zenskar generates audit-ready ASC 606 and IFRS 15 revenue recognition without manual spreadsheets.",
      "whyItMatters": "Companies closing books under GAAP revenue recognition standards need a dedicated tool for that function.",
      "benefitsWho": "Finance and controller teams closing books under ASC 606 need Zenskar; TaxJar alone won't cover this."
    },
    {
      "title": "AI Application",
      "toolA": "TaxJar uses AI for product categorization, automatically classifying products for accurate tax treatment.",
      "toolB": "Zenskar's AI Contracts Agent processes contracts to automate downstream billing terms and generate invoices, alongside natural-language querying of billing data.",
      "whyItMatters": "AI is applied to different problems — tax classification versus contract-to-cash automation.",
      "benefitsWho": "Tax/compliance teams benefit from TaxJar's categorization AI; billing/RevOps teams benefit from Zenskar's contract automation AI."
    }
  ],
  "featureMatrix": [
    {
      "group": "Tax vs Billing Scope",
      "rows": [
        {
          "feature": "Sales tax calculation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Nexus monitoring",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Billing automation (subscription/usage/hybrid)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Revenue recognition (ASC 606/IFRS 15)",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Revenue Operations",
      "rows": [
        {
          "feature": "Usage metering",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Collections and dunning",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Customer portal",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-driven automation",
          "toolA": "available",
          "toolB": "available",
          "note": "TaxJar: product categorization; Zenskar: Contracts Agent"
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Published starting price",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "TaxJar $39/month"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Zenskar offers pilot/sandbox instead"
        },
        {
          "feature": "100+ integrations",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SOC 2 / ISO 27001 / GDPR compliance",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do TaxJar and Zenskar do the same job?",
      "answer": "No. TaxJar is specifically for sales tax calculation, filing, and remittance, while Zenskar is a broader revenue automation platform covering billing, revenue recognition, collections, and usage metering."
    },
    {
      "question": "Does Zenskar calculate sales tax?",
      "answer": "It's not documented among Zenskar's listed features. Zenskar does integrate with Avalara, a tax compliance platform, as one of its 100+ integrations, but that's a partner integration rather than a native TaxJar-style tax engine."
    },
    {
      "question": "Does TaxJar handle revenue recognition?",
      "answer": "No, this isn't documented among TaxJar's features, which center on tax calculation, AutoFile filing, and nexus insights."
    },
    {
      "question": "Is Zenskar's pricing public?",
      "answer": "No. All three Zenskar tiers (Starter, Standard, Enterprise) require a custom quote. TaxJar publishes $39/month and $99/month plans."
    },
    {
      "question": "Can I try either for free?",
      "answer": "TaxJar offers a 30-day free trial with no credit card required. Zenskar offers a free pilot program and sandbox environment instead of a self-serve trial."
    },
    {
      "question": "Which one connects to a dedicated tax engine?",
      "answer": "Zenskar integrates with Avalara, a tax compliance provider, among its 100+ integrations. TaxJar itself functions as the tax calculation and filing engine rather than integrating with a third-party one."
    }
  ]
};

export default taxjarVsZenskarContent;

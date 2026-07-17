import type { ToolComparisonContent } from './types';

const capchaseVsPipeContent: ToolComparisonContent = {
  "verdict": "Capchase is a vendor financing platform, founded in 2020 and headquartered in New York, that pays B2B tech vendors upfront while their buyers pay for software over time, with a Salesforce integration embedding buyer qualification and loan document generation directly into sales workflows. Pipe is an embedded financial operating system, founded in 2019 and headquartered in Miami, that lets software platforms themselves embed capital offers into their own product for their end customers, using sales-based repayment with no fixed monthly minimums. Both are enterprise fintech platforms with undisclosed pricing that require a sales relationship to implement, but they target different points in the software supply chain: Capchase serves vendors selling to buyers, while Pipe serves platforms embedding financing for their own customers.",
  "bestForToolA": "B2B tech vendors that want to get paid upfront on deals while offering buyers flexible monthly, quarterly, or extended installment terms, especially those running sales through Salesforce, fit Capchase.",
  "bestForToolB": "Software platforms such as vertical SaaS providers, payment facilitators, and marketplaces that want to embed pre-approved capital offers into their own product for their end customers, with sales-based repayment and low-code integration, fit Pipe.",
  "whoNeedsBoth": "A vertical SaaS platform could use both in different roles: Pipe embedded in its own product to offer capital to its end customers, while the platform company itself uses Capchase as a vendor to get paid upfront on its own annual contracts sold to enterprise buyers who want to pay over time.",
  "keyDifferences": [
    {
      "title": "Distribution Model",
      "toolA": "Capchase sells vendor financing directly to B2B tech vendors and embeds into the vendor's own Salesforce sales workflow for buyer qualification.",
      "toolB": "Pipe is built as an embeddable financial layer for software platforms (vertical SaaS, payment facilitators, marketplaces) to offer capital to their own end customers, not for the platform's own sales team.",
      "whyItMatters": "The two occupy different roles in a software supply chain: one finances a vendor's sales, the other lets a platform finance its own customers.",
      "benefitsWho": "Software vendors selling directly to buyers benefit from Capchase; platforms building financial products for their own customer base benefit from Pipe."
    },
    {
      "title": "Repayment Structure",
      "toolA": "Capchase offers flexible payment terms for buyers, with monthly, quarterly, or extended installment options, a structured installment model.",
      "toolB": "Pipe's capital product uses sales-based repayment that scales with a business's transaction volume, with no fixed monthly minimums.",
      "whyItMatters": "A fixed installment schedule versus revenue-linked repayment changes cash-flow risk for the end business being financed.",
      "benefitsWho": "Businesses with variable revenue may prefer Pipe's sales-linked repayment; buyers wanting predictable payment schedules may prefer Capchase's installment terms."
    },
    {
      "title": "Integration Surface",
      "toolA": "Capchase documents a specific Salesforce integration that embeds buyer qualification and loan document generation directly into Salesforce.",
      "toolB": "Pipe documents low-code embedding into a partner's own product via a small number of code snippets, aimed at platform engineering teams rather than a CRM.",
      "whyItMatters": "The integration point determines which team (sales operations vs. product engineering) implements and owns the tool.",
      "benefitsWho": "Sales teams using Salesforce benefit from Capchase's native integration; product/engineering teams building embedded finance features benefit from Pipe's low-code embedding."
    },
    {
      "title": "Underwriting Speed & Reported Metrics",
      "toolA": "Capchase states that about 97% of applications are decisioned within 30 seconds.",
      "toolB": "Pipe reports a 61% average conversion rate and an 80 Net Promoter Score across partners, rather than a stated underwriting speed.",
      "whyItMatters": "The specific metrics each company publicizes reflect what they optimize for and disclose to prospective partners.",
      "benefitsWho": "Vendors prioritizing fast buyer decisioning may value Capchase's disclosed speed; platforms evaluating partner satisfaction may value Pipe's disclosed NPS and conversion figures."
    },
    {
      "title": "Geographic & Currency Reach",
      "toolA": "Capchase documents support for financing across 9 countries in multiple currencies.",
      "toolB": "Pipe's documented features focus on industry-specific risk models for vertical SaaS, payment facilitators, and marketplaces, without a stated country/currency count.",
      "whyItMatters": "International vendors need financing partners that can operate across their buyers' currencies and jurisdictions.",
      "benefitsWho": "Vendors selling across multiple countries and currencies benefit from Capchase's documented multi-currency coverage."
    }
  ],
  "featureMatrix": [
    {
      "group": "Business Model & Target User",
      "rows": [
        {
          "feature": "Primary user of the platform",
          "toolA": "available",
          "toolB": "available",
          "note": "Capchase: B2B tech vendors and their buyers; Pipe: software platforms embedding capital for their own customers"
        },
        {
          "feature": "Named reference customers",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pipe: Uber Eats, GoCardless, Housecall Pro"
        },
        {
          "feature": "Public pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Neither discloses pricing"
        }
      ]
    },
    {
      "group": "Underwriting & Repayment",
      "rows": [
        {
          "feature": "Underwriting speed disclosed",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Capchase: ~97% decisioned within 30 seconds"
        },
        {
          "feature": "Repayment model",
          "toolA": "available",
          "toolB": "available",
          "note": "Capchase: installment terms; Pipe: sales-based repayment, no fixed minimums"
        },
        {
          "feature": "Reported performance metrics",
          "toolA": "available",
          "toolB": "available",
          "note": "Capchase: 25% increase in client deal win rates; Pipe: 61% avg conversion, 80 NPS"
        }
      ]
    },
    {
      "group": "Integration & Company Info",
      "rows": [
        {
          "feature": "Salesforce integration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Low-code embedding for platforms",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Multi-currency/country coverage",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Capchase: 9 countries"
        },
        {
          "feature": "Multi-party deal collaboration portal",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Founded / headquarters",
          "toolA": "available",
          "toolB": "available",
          "note": "Capchase: 2020, New York, NY; Pipe: 2019, Miami, FL"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the core difference between Capchase and Pipe?",
      "answer": "Capchase provides vendor financing directly to B2B tech vendors and their buyers, while Pipe is an embeddable financial layer that software platforms build into their own product to offer capital to their end customers."
    },
    {
      "question": "Which is designed for platforms to embed versus vendors to use directly?",
      "answer": "Pipe is built for platforms (vertical SaaS, payment facilitators, marketplaces) to embed into their own product. Capchase is used directly by B2B tech vendors, integrating into their Salesforce sales workflow."
    },
    {
      "question": "How does repayment differ between the two?",
      "answer": "Capchase offers structured monthly, quarterly, or extended installment terms for buyers. Pipe uses sales-based repayment that scales with a business's transaction volume, with no fixed monthly minimums."
    },
    {
      "question": "Is pricing public for either platform?",
      "answer": "No, neither Capchase nor Pipe publicly discloses pricing; both require a sales/partnership engagement to implement."
    },
    {
      "question": "Which platform discloses its underwriting speed?",
      "answer": "Capchase states that about 97% of applications receive a decision within 30 seconds. Pipe does not document a specific underwriting speed, instead reporting a 61% average conversion rate and an 80 Net Promoter Score."
    },
    {
      "question": "Which platform lists named customers?",
      "answer": "Pipe lists partners including Uber Eats, GoCardless, and Housecall Pro. Capchase does not document named customer references in the available facts."
    }
  ]
};

export default capchaseVsPipeContent;

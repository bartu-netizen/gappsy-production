import type { ToolComparisonContent } from './types';

const quickmailVsSalesbricksContent: ToolComparisonContent = {
  "verdict": "QuickMail is a top-of-funnel cold outreach platform for running multi-channel email and LinkedIn campaigns with deliverability protection, priced from $49/month with a 14-day free trial. Salesbricks is a deal-closing and billing platform combining CPQ, contracts, checkout, and automated payments for B2B SaaS deals, priced from $500/month plus transaction-based fees with no advertised free trial. They sit at opposite ends of the sales process — generating conversations versus closing and billing them.",
  "bestForToolA": "Sales and growth teams running outbound email and LinkedIn prospecting who want built-in deliverability protection (warming, sender rotation, blacklist monitoring) and a 14-day free trial before committing.",
  "bestForToolB": "B2B SaaS revenue teams that need to configure pricing, generate contracts with e-signature, run checkout, and automate billing and payments in one system, particularly those already on Salesforce, HubSpot, or QuickBooks.",
  "whoNeedsBoth": "This is a realistic combination: an SDR team could use QuickMail to source and book meetings with new prospects, then hand qualified deals to a revenue team using Salesbricks to quote, contract, and bill those same customers, covering the full funnel from first outreach to a signed, billed deal.",
  "keyDifferences": [
    {
      "title": "Funnel Stage",
      "toolA": "QuickMail operates at the top of the funnel, generating outbound conversations via multi-channel email and LinkedIn campaigns with ICP filtering.",
      "toolB": "Salesbricks operates at deal-closing and post-sale, handling CPQ, e-signature contracts, checkout, and automated billing.",
      "whyItMatters": "The two tools solve different problems, so buyers shouldn't treat them as interchangeable options.",
      "benefitsWho": "Revenue leaders mapping tools to specific funnel stages."
    },
    {
      "title": "Pricing Structure",
      "toolA": "QuickMail publishes flat monthly tiers ($49/$99/$299) based on uploaded contacts and emails sent.",
      "toolB": "Salesbricks charges a flat monthly fee ($500/$1,500/Custom) plus percentage-based fees on invoice value, tiered by transaction volume from $300k up to $2M+.",
      "whyItMatters": "Percentage-based fees on transaction volume are harder to predict than flat SaaS pricing as revenue scales.",
      "benefitsWho": "Finance teams forecasting software costs against expected deal volume."
    },
    {
      "title": "AI Use Case",
      "toolA": "QuickMail's Reword with AI rewrites outreach message copy.",
      "toolB": "Salesbricks' BrIQ AI search surfaces instant answers across contracts, invoices, and payment records.",
      "whyItMatters": "The AI in each product serves a different job: writing outbound copy versus querying financial records.",
      "benefitsWho": "Teams evaluating whether they need AI for outreach writing or for revenue-data lookup."
    },
    {
      "title": "Free Trial Availability",
      "toolA": "QuickMail offers a 14-day free trial with no automatic charge after it ends.",
      "toolB": "Salesbricks' facts state no free trial or free plan is advertised on the site.",
      "whyItMatters": "Teams that want to test a tool risk-free before buying have that option with QuickMail but not documented for Salesbricks.",
      "benefitsWho": "Smaller teams wanting to evaluate before a sales conversation."
    },
    {
      "title": "Integration Focus",
      "toolA": "QuickMail integrates natively with sales-side tools: two-way sync with HubSpot and Pipedrive, plus Zapier and API/webhook access on higher tiers.",
      "toolB": "Salesbricks integrates with CRMs (Salesforce, HubSpot, Attio) and accounting tools (QuickBooks), plus Slack, Sphere, and Lightfield, oriented toward revenue operations.",
      "whyItMatters": "Buyers should confirm integrations match their existing CRM and finance stack.",
      "benefitsWho": "RevOps teams standardizing data flow between sales and finance systems."
    }
  ],
  "featureMatrix": [
    {
      "group": "Outbound Prospecting",
      "rows": [
        {
          "feature": "Multi-channel email + LinkedIn campaigns",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Deliverability monitoring (warming, rotation, blacklist)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Unified inbox for replies",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Deal Closing, Billing & Payments",
      "rows": [
        {
          "feature": "CPQ (configure, price, quote)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Contracts and e-signature",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Checkout and order management",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Automated billing and payment collection",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing, AI & Trust",
      "rows": [
        {
          "feature": "Published starting price",
          "toolA": "available",
          "toolB": "available",
          "note": "QuickMail: $49/month. Salesbricks: $500/month billed annually."
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "QuickMail: 14 days, no auto-charge."
        },
        {
          "feature": "AI feature",
          "toolA": "available",
          "toolB": "available",
          "note": "QuickMail: Reword with AI. Salesbricks: BrIQ AI search."
        },
        {
          "feature": "SOC 2 Type II certification",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "API/webhook access",
          "toolA": "available",
          "toolB": "available",
          "note": "QuickMail: Growth/Agency tiers only."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do QuickMail and Salesbricks solve the same problem?",
      "answer": "No. QuickMail generates outbound sales conversations via email and LinkedIn, while Salesbricks handles closing and billing those deals once a prospect is ready to buy through CPQ, contracts, checkout, and billing."
    },
    {
      "question": "How does pricing compare?",
      "answer": "QuickMail's tiers are flat monthly fees from $49 to $299 based on contacts and email volume. Salesbricks charges a flat monthly fee from $500 to $1,500 (or custom) plus percentage-based fees tied to transaction volume from $300k up to $2M+."
    },
    {
      "question": "Does either offer a free trial?",
      "answer": "QuickMail offers a 14-day free trial with no automatic charge afterward. Salesbricks' facts state no free trial or free plan is advertised."
    },
    {
      "question": "How is AI used differently?",
      "answer": "QuickMail's Reword with AI rewrites outreach message copy. Salesbricks' BrIQ AI search surfaces instant answers across contracts, invoices, and payment records."
    },
    {
      "question": "Which has stronger security/compliance documentation?",
      "answer": "Salesbricks states it is SOC 2 Type II certified with 99.999% uptime claimed since launch. QuickMail's facts don't document an equivalent certification."
    },
    {
      "question": "Should a sales team use both?",
      "answer": "Potentially — QuickMail to generate and book meetings with new prospects, then Salesbricks to quote, contract, and bill those prospects once they convert into paying customers."
    }
  ]
};

export default quickmailVsSalesbricksContent;

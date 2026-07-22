import type { ToolComparisonContent } from './types';

const autumnVsHyperlineContent: ToolComparisonContent = {
  "verdict": "Autumn is an open-source billing logic layer that sits on top of Stripe, giving developers a single API for plans, usage tracking, feature gating, and AI credits that can be self-hosted under Apache 2.0. Hyperline is a fuller quote-to-cash revenue management platform with CPQ, global compliant invoicing across 100+ countries, and a percentage-of-revenue pricing model aimed at SaaS finance and sales teams. They overlap on usage-based billing but target different buyers and different levels of the stack.",
  "bestForToolA": "AI-first and dev-first startups already built around Stripe that want an open-source, self-hostable API for feature gating and usage/AI-credit metering without writing custom billing logic - Autumn is used in production by Mintlify and Firecrawl.",
  "bestForToolB": "SaaS companies that need formal sales quoting (CPQ), compliant invoicing across 100+ countries, and native connections to Stripe, GoCardless, Mollie, and Airwallex, and are comfortable with a $199/month plus 0.6% of revenue starting price.",
  "whoNeedsBoth": "Realistically unlikely - both are billing infrastructure layers competing for the same usage-metering and subscription-management need, so most teams pick one rather than run two overlapping billing systems; a company might only consider Autumn for developer-facing feature gating and AI credits while using Hyperline separately for sales-facing CPQ and multi-country invoicing.",
  "keyDifferences": [
    {
      "title": "Pricing Model & Transparency",
      "toolA": "Autumn is freemium but does not fully publish its cloud pricing tiers according to its own documented cons.",
      "toolB": "Hyperline publishes exact tiers: Quote to Cash at $199/month + 0.6% of revenue, Quote to Cash + Usage at $299/month + 0.7% of revenue, and a custom High Volume tier for companies over $5M ARR.",
      "whyItMatters": "A flat unknown SaaS fee versus a percentage-of-revenue model changes how costs scale as a company grows.",
      "benefitsWho": "Benefits finance teams that need to forecast billing-platform costs against revenue growth."
    },
    {
      "title": "Open Source & Self-Hosting",
      "toolA": "Autumn is fully open source under Apache 2.0 on GitHub and can be self-hosted.",
      "toolB": "Hyperline is delivered as hosted SaaS, certified SOC2, ISO27001, and GDPR, with no self-hosting option documented.",
      "whyItMatters": "Self-hosting removes vendor lock-in and gives engineering teams direct code-level control.",
      "benefitsWho": "Benefits engineering teams that want to own their billing infrastructure or need on-prem/self-hosted deployment."
    },
    {
      "title": "CPQ & Sales Quoting",
      "toolA": "Autumn supports self-serve and custom enterprise billing from one source of truth but does not document a dedicated CPQ feature.",
      "toolB": "Hyperline includes a named CPQ (Configure, Price, Quote) feature for streamlining quote creation and contract management.",
      "whyItMatters": "Sales-led SaaS companies need formal quoting and contract workflows that a pure billing-logic API doesn't provide.",
      "benefitsWho": "Benefits sales-led SaaS organizations with a quote-to-contract process, less relevant to self-serve, API-first products."
    },
    {
      "title": "Global Invoicing Compliance",
      "toolA": "Not documented for Autumn.",
      "toolB": "Hyperline supports compliant invoicing and e-invoicing certification across 100+ countries.",
      "whyItMatters": "Companies selling internationally must meet local e-invoicing and tax regulations that not every billing tool handles.",
      "benefitsWho": "Benefits SaaS companies with international customers who need multi-country invoicing compliance."
    },
    {
      "title": "AI Credit & Usage Metering Focus",
      "toolA": "Autumn is purpose-built for AI startups billing on usage and AI credits, with feature gating (check) and usage tracking (track) as core primitives.",
      "toolB": "Hyperline offers usage-based billing via real-time event ingestion, metered and seat-based billing, available on the Quote to Cash + Usage plan at $299/month + 0.7% of revenue.",
      "whyItMatters": "Both meter usage, but Autumn is scoped around AI token/credit billing while Hyperline treats usage as one input into a broader revenue platform.",
      "benefitsWho": "Benefits AI product teams billing by tokens or credits (Autumn) versus SaaS teams billing by consumption within a full revenue-management stack (Hyperline)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Billing Infrastructure",
      "rows": [
        {
          "feature": "Usage-based / metered billing",
          "toolA": "available",
          "toolB": "available",
          "note": "Autumn: usage tracking (track); Hyperline: Quote to Cash + Usage plan, $299/month + 0.7% revenue"
        },
        {
          "feature": "Feature gating",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Autumn's check feature verifies access before granting"
        },
        {
          "feature": "CPQ (quote/contract generation)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "AI credit billing",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Integrations & Compliance",
      "rows": [
        {
          "feature": "Stripe integration",
          "toolA": "available",
          "toolB": "available",
          "note": "Autumn is built as a layer on top of Stripe"
        },
        {
          "feature": "Multi-payment provider support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "GoCardless, Mollie, Airwallex"
        },
        {
          "feature": "CRM integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "HubSpot, Salesforce, Attio; add-on pricing applies"
        },
        {
          "feature": "SOC2 / ISO27001 / GDPR certification",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Autumn is Apache 2.0 open source"
        },
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "10 free invoices, no credit card required"
        },
        {
          "feature": "Published starting price",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "$199/month + 0.6% of revenue"
        },
        {
          "feature": "Revenue-percentage fee",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "0.6%-0.7% of revenue on top of the flat fee"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Autumn open source while Hyperline is not?",
      "answer": "Yes. Autumn is fully open source under Apache 2.0, with its source available on GitHub, and can be self-hosted. Hyperline is offered only as hosted SaaS."
    },
    {
      "question": "How does Hyperline's pricing compare to Autumn's?",
      "answer": "Hyperline publishes exact pricing: $199/month + 0.6% of revenue for Quote to Cash, up to a custom High Volume tier for companies above $5M ARR. Autumn is freemium but has not fully published its cloud pricing tiers."
    },
    {
      "question": "Does either tool replace Stripe?",
      "answer": "No. Autumn explicitly sits on top of Stripe as a billing logic layer rather than replacing it, while Hyperline natively integrates with Stripe alongside GoCardless, Mollie, and Airwallex for payment collection."
    },
    {
      "question": "Which tool is better for AI startups billing by usage credits?",
      "answer": "Autumn is purpose-built for AI startups billing on usage and AI credits and is used in production by companies including Mintlify and Firecrawl."
    },
    {
      "question": "Does Hyperline offer a free trial?",
      "answer": "Yes, the Quote to Cash plan includes 10 free invoices to start, with no credit card required."
    },
    {
      "question": "Which tool includes CPQ for sales quoting?",
      "answer": "Hyperline includes a dedicated CPQ (Configure, Price, Quote) feature; a CPQ feature is not documented for Autumn."
    }
  ]
};

export default autumnVsHyperlineContent;

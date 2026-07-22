import type { ToolComparisonContent } from './types';

const fonoaVsQuadernoContent: ToolComparisonContent = {
  "verdict": "Fonoa and Quaderno both automate indirect tax compliance but differ in architecture and audience: Fonoa is an API-first platform built for developers to embed tax validation, calculation, e-invoicing, and returns across 100-150+ countries into their own systems, with custom enterprise pricing, while Quaderno is a more turnkey SaaS tool with published plans starting at $29/month aimed at online businesses that want tax and invoicing handled with less engineering effort.",
  "bestForToolA": "Larger or technically-resourced businesses that want to embed tax validation, calculation, e-invoicing, and returns directly into their own systems via API, needing sub-200ms calculation response times and coverage across 150+ countries for e-invoicing.",
  "bestForToolB": "Online businesses wanting a ready-to-use SaaS platform with published pricing starting at $29/month, direct integrations with WooCommerce, Shopify, Stripe, GoCardless, PayPal, and Kajabi, and a 7-day free trial without needing developer resources to integrate an API.",
  "whoNeedsBoth": "There's little case for using both simultaneously since they cover the same core function of tax calculation, e-invoicing, and filing; a business might start with Quaderno's turnkey SaaS approach and later migrate to Fonoa's API-first platform if it needs the sub-200ms performance or deeper e-invoicing coverage that requires custom engineering.",
  "keyDifferences": [
    {
      "title": "Integration Model",
      "toolA": "Fonoa is API-first, explicitly designed for developers to embed into existing systems, covering validation, calculation, e-invoicing, returns, and audit.",
      "toolB": "Quaderno offers API access but is positioned as a more turnkey SaaS product with direct platform integrations such as Shopify, WooCommerce, and Stripe that require less custom development.",
      "whyItMatters": "The right integration model depends on whether a company has engineering resources to build a custom integration.",
      "benefitsWho": "Engineering-resourced companies building custom checkout or billing flows need Fonoa; online sellers wanting to connect existing ecommerce tools quickly need Quaderno."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Fonoa publishes no pricing and requires contacting sales.",
      "toolB": "Quaderno publishes tiers from $29/month to $149/month, plus custom Enterprise pricing above 2,500 transactions/month.",
      "whyItMatters": "Published pricing supports self-serve budgeting for smaller businesses.",
      "benefitsWho": "Smaller businesses wanting self-serve budgeting favor Quaderno."
    },
    {
      "title": "Tax ID Validation Coverage",
      "toolA": "Fonoa has a dedicated Validate product covering tax ID validation across 120+ countries.",
      "toolB": "No dedicated tax ID validation feature is documented for Quaderno, which focuses on rate calculation and registration/nexus tracking instead.",
      "whyItMatters": "Validating B2B customer tax IDs at scale matters for reverse-charge VAT scenarios.",
      "benefitsWho": "Businesses needing to validate B2B customer tax IDs at scale benefit from Fonoa's Validate product."
    },
    {
      "title": "E-Invoicing Coverage",
      "toolA": "Fonoa offers a unified API for compliant e-invoicing across 150+ countries.",
      "toolB": "Quaderno generates localized, tax-compliant invoices but doesn't document coverage across as many countries or a dedicated e-invoicing API product.",
      "whyItMatters": "Countries with mandatory e-invoicing regimes require broader documented coverage.",
      "benefitsWho": "Businesses operating in countries with mandatory e-invoicing regimes benefit from Fonoa's broader documented coverage."
    },
    {
      "title": "Free Trial & Entry Access",
      "toolA": "No free trial or entry-level pricing is documented for Fonoa; engagement starts with a sales conversation.",
      "toolB": "Quaderno offers a 7-day free trial with no credit card required, plus a published $29/month entry tier.",
      "whyItMatters": "The ability to test a tool before committing matters for smaller businesses.",
      "benefitsWho": "Small businesses wanting to test a tool before committing favor Quaderno."
    }
  ],
  "featureMatrix": [
    {
      "group": "Tax Calculation & Compliance",
      "rows": [
        {
          "feature": "Real-time tax calculation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Sub-200ms performance disclosed",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Jurisdiction coverage disclosed",
          "toolA": "available",
          "toolB": "available",
          "note": "Fonoa: 100+ for calculation; Quaderno: 12,000+ jurisdictions"
        },
        {
          "feature": "Tax ID / registration validation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Fonoa's Validate covers 120+ countries"
        }
      ]
    },
    {
      "group": "Invoicing & Filing",
      "rows": [
        {
          "feature": "Unified e-invoicing API",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "150+ countries"
        },
        {
          "feature": "Automated tax returns / filing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Localized invoice generation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Audit-readiness tools",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Access & Pricing",
      "rows": [
        {
          "feature": "Published starting price",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "$29/month"
        },
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "7-day, no credit card"
        },
        {
          "feature": "Developer API access",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Direct ecommerce platform integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "WooCommerce, Shopify, Stripe, GoCardless, PayPal, Kajabi"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is more developer/API-focused?",
      "answer": "Fonoa, which is explicitly API-first for validation, calculation, e-invoicing, returns, and audit."
    },
    {
      "question": "Does Quaderno offer a free trial?",
      "answer": "Yes, 7 days with no credit card required."
    },
    {
      "question": "How fast is Fonoa's tax calculation?",
      "answer": "Sub-200ms response times across 100+ jurisdictions, per the company."
    },
    {
      "question": "Which publishes its pricing?",
      "answer": "Quaderno, with tiers from $29 to $149/month; Fonoa requires contacting sales."
    },
    {
      "question": "Does Fonoa validate tax IDs?",
      "answer": "Yes, across 120+ countries via its Validate product."
    },
    {
      "question": "Is Fonoa's AI Agents product available now?",
      "answer": "No, it's listed as not yet available on Fonoa's site."
    }
  ]
};

export default fonoaVsQuadernoContent;

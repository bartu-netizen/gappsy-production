import type { ToolComparisonContent } from './types';

const fonoaVsLagoContent: ToolComparisonContent = {
  "verdict": "Fonoa and Lago sit next to each other in a billing stack rather than compete head-on: Fonoa is an API-first indirect tax platform (VAT/GST calculation, tax ID validation, e-invoicing, tax returns), while Lago is an open-source billing platform for usage metering, invoicing, and subscription pricing. Fonoa answers 'how much tax do I owe and how do I file it,' while Lago answers 'how do I meter usage and generate the invoice in the first place.' Companies often need both, not one instead of the other.",
  "bestForToolA": "Fonoa fits finance and tax teams at companies selling across many jurisdictions who need automated VAT/GST calculation (sub-200ms response times across 100+ jurisdictions per the company) and compliant e-invoicing across 150+ countries without building tax logic in-house.",
  "bestForToolB": "Lago fits engineering-led billing teams that want an open-source, self-hostable metering and invoicing engine (10,223+ GitHub stars) with hybrid subscription plus usage-based pricing, without being locked into a single vendor's infrastructure.",
  "whoNeedsBoth": "A SaaS company billing customers in multiple countries could use Lago to meter usage and generate invoices, then rely on Fonoa's tax engine and e-invoicing API to calculate VAT/GST on those invoices and file the resulting tax returns automatically.",
  "keyDifferences": [
    {
      "title": "Core Product Category",
      "toolA": "Fonoa is purpose-built for indirect tax: tax ID validation across 120+ countries, tax calculation, e-invoicing, tax returns, and audit-readiness data analysis.",
      "toolB": "Lago is purpose-built for billing: usage metering, invoice and credit note generation, entitlements, coupons, and custom contracts.",
      "whyItMatters": "Buyers searching for a tax compliance tool and buyers searching for a billing engine are solving different problems even though both touch the invoice.",
      "benefitsWho": "Finance/tax teams need Fonoa; billing/engineering teams need Lago."
    },
    {
      "title": "Open Source vs. Proprietary",
      "toolA": "Fonoa is a proprietary, closed platform with no self-hosting option and no public GitHub repository mentioned in its facts.",
      "toolB": "Lago is open source with a public GitHub repo and can be self-hosted on your own infrastructure or run via Lago Cloud.",
      "whyItMatters": "Self-hosting affects vendor lock-in, data residency, and whether a free tier is realistically usable.",
      "benefitsWho": "Engineering teams that want to inspect or modify billing code benefit from Lago's open-source model."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Fonoa publishes no pricing at all; the pricing_model is listed as Custom/Enterprise and businesses must contact sales for a quote.",
      "toolB": "Lago's self-hosted Open Source edition is free, while Lago Premium/Cloud (with entitlements, dunning, analytics, and SSO via Okta) is also quote-based.",
      "whyItMatters": "Lago at least offers a genuinely free self-hosted path, while Fonoa offers no published price point at all.",
      "benefitsWho": "Budget-constrained teams benefit from Lago's free self-hosted tier; Fonoa buyers should expect a sales conversation regardless of size."
    },
    {
      "title": "Jurisdictional Tax Coverage",
      "toolA": "Fonoa covers tax ID validation in 120+ countries, tax calculation in 100+ jurisdictions, and e-invoicing in 150+ countries, with real-time monitoring of tax legislation changes.",
      "toolB": "Lago does not calculate tax itself; instead it connects to tax software like Avalara and Anrok as integrations.",
      "whyItMatters": "Teams need to know whether tax logic is native or delegated to a connected third party.",
      "benefitsWho": "Global sellers needing native, deep tax jurisdiction coverage benefit from Fonoa; teams already using Avalara or Anrok can plug that into Lago instead."
    },
    {
      "title": "Compliance & Security Posture",
      "toolA": "Fonoa reports 100% customer retention and a 4.6/5 Gartner Peer Insights rating, and was recently backed by a $110M raise and the acquisition of PwC's Indirect Tax Edge, per its facts.",
      "toolB": "Lago is SOC 2 Type II certified with regular third-party penetration testing, and supports SSO (including Okta), RBAC, and audit logs.",
      "whyItMatters": "Enterprise buyers often require specific, named compliance certifications rather than customer satisfaction scores alone.",
      "benefitsWho": "Security-conscious billing teams can point to Lago's SOC 2 Type II status in vendor reviews; tax teams evaluating Fonoa will need to request compliance documentation directly since it isn't listed in its facts."
    }
  ],
  "featureMatrix": [
    {
      "group": "Tax Compliance",
      "rows": [
        {
          "feature": "Tax ID validation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Fonoa: 120+ countries"
        },
        {
          "feature": "Automated tax calculation (VAT/GST)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Fonoa: 100+ jurisdictions, sub-200ms"
        },
        {
          "feature": "E-invoicing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Fonoa: 150+ countries"
        },
        {
          "feature": "Automated tax return filing",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Third-party tax software integration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Lago connects to Avalara, Anrok"
        }
      ]
    },
    {
      "group": "Billing & Metering",
      "rows": [
        {
          "feature": "Usage metering",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Invoice generation & credit notes",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Subscription/entitlement management",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Dunning workflows",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Lago: paid add-on"
        }
      ]
    },
    {
      "group": "Access & Deployment",
      "rows": [
        {
          "feature": "Self-hosted option",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Lago open-source edition"
        },
        {
          "feature": "Free tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Lago self-hosted only"
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Both require contacting sales for paid tiers"
        },
        {
          "feature": "SOC 2 certification",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Lago: SOC 2 Type II"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Fonoa and Lago compete with each other?",
      "answer": "Not directly. Fonoa specializes in indirect tax (VAT/GST calculation, e-invoicing, tax returns), while Lago specializes in usage metering and invoicing. Lago integrates with tax software like Avalara and Anrok rather than calculating tax itself, so the two tools address different parts of the billing stack."
    },
    {
      "question": "Is Lago cheaper than Fonoa?",
      "answer": "Lago at least offers a free self-hosted open-source edition, giving budget-conscious teams a genuinely no-cost path. Fonoa publishes no pricing information at all and lists a Custom/Enterprise pricing model, so cost is unknown until you contact sales."
    },
    {
      "question": "Can Lago handle tax calculation on its own?",
      "answer": "Lago's own facts do not list native tax calculation as a feature; instead, it integrates with tax software such as Avalara and Anrok. Fonoa, by contrast, has a dedicated Tax Engine that calculates tax across 100+ jurisdictions."
    },
    {
      "question": "Is Fonoa open source like Lago?",
      "answer": "No. Fonoa is a proprietary, closed platform with no self-hosting option mentioned in its facts. Lago is open source, published on GitHub with 10,223+ stars, and can be self-hosted."
    },
    {
      "question": "Which tool handles e-invoicing?",
      "answer": "Fonoa offers a dedicated E-Invoicing feature described as a unified API for compliant e-invoicing across 150+ countries. Lago's facts do not list e-invoicing as a native capability."
    },
    {
      "question": "Does either tool offer a free trial?",
      "answer": "Neither tool's facts mention a traditional free trial. Lago offers a free self-hosted open-source edition instead, while Fonoa offers no free access tier at all."
    }
  ]
};

export default fonoaVsLagoContent;

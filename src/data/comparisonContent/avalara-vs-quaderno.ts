import type { ToolComparisonContent } from './types';

const avalaraVsQuadernoContent: ToolComparisonContent = {
  "verdict": "Avalara is an enterprise-grade, multi-tax-type compliance platform covering sales/use, property, VAT, communications, and occupancy tax, with custom pricing and 1,400+ integrations spanning ERPs like SAP and NetSuite, while Quaderno is a focused sales-tax, VAT, and GST automation and invoicing tool for online businesses with transparent starting pricing at $29/month. Avalara targets breadth across tax types and enterprise systems; Quaderno targets simplicity and predictable pricing for digital and ecommerce sellers.",
  "bestForToolA": "Larger or multi-tax-type businesses that need property tax, communications tax, or occupancy tax alongside sales tax/VAT, and deep ERP integrations such as SAP, NetSuite, Salesforce, or Oracle, and are prepared to go through a sales conversation for custom pricing.",
  "bestForToolB": "Online and digital businesses wanting predictable published pricing starting at $29/month for the Hobby plan (25 transactions), automatic tier upgrades instead of surprise overage fees, and direct integrations with WooCommerce, Shopify, Stripe, GoCardless, PayPal, or Kajabi.",
  "whoNeedsBoth": "There's little practical reason to run both since they solve the same core problem of tax calculation and filing; a company might trial Quaderno for its published pricing before moving to Avalara only once it needs property, communications, or occupancy tax types that Quaderno doesn't cover.",
  "keyDifferences": [
    {
      "title": "Pricing Transparency",
      "toolA": "Avalara publishes no pricing and requires contacting sales.",
      "toolB": "Quaderno publishes tiers from $29/month (Hobby) to $149/month (Growth), with custom Enterprise pricing above 2,500 transactions/month.",
      "whyItMatters": "Published pricing lets smaller businesses self-serve budgeting decisions.",
      "benefitsWho": "Smaller online sellers wanting to self-serve budgeting favor Quaderno's transparency."
    },
    {
      "title": "Tax Type Coverage",
      "toolA": "Avalara calculates sales/use, property, VAT, communications, and occupancy taxes.",
      "toolB": "Quaderno focuses on sales tax, VAT, and GST specifically, across 12,000+ jurisdictions.",
      "whyItMatters": "Businesses with property or communications tax obligations need broader coverage than a sales-tax-only tool provides.",
      "benefitsWho": "Multi-tax-type enterprises need Avalara; pure ecommerce/SaaS sellers may only need Quaderno's narrower focus."
    },
    {
      "title": "Integration Breadth",
      "toolA": "Avalara has 1,400+ partner integrations including Shopify, NetSuite, SAP, Salesforce, and Oracle.",
      "toolB": "Quaderno integrates with WooCommerce, Shopify, Stripe, GoCardless, PayPal, and Kajabi.",
      "whyItMatters": "Enterprises on large ERP systems need integrations that smaller ecommerce-focused tools don't offer.",
      "benefitsWho": "Enterprises running SAP, NetSuite, or Salesforce need Avalara; smaller stacks on Shopify, WooCommerce, or Stripe fit Quaderno."
    },
    {
      "title": "AI-Powered Classification",
      "toolA": "Avalara offers AI agents via its ALFA AI foundry, stated to incorporate 40+ models, for item and tariff code classification, trained on billions of transactions.",
      "toolB": "No AI classification feature is documented for Quaderno; API access is available instead for custom workflows.",
      "whyItMatters": "Automated tariff and item classification at scale matters for import/export-heavy operations.",
      "benefitsWho": "Businesses needing automated tariff/item classification benefit from Avalara's AI."
    },
    {
      "title": "Overage Handling",
      "toolA": "Overage handling isn't documented for Avalara, since pricing itself isn't published.",
      "toolB": "Quaderno automatically upgrades accounts to the next tier instead of charging surprise overage fees when transaction limits are exceeded.",
      "whyItMatters": "Predictable billing behavior avoids unexpected charges as usage grows.",
      "benefitsWho": "Growing online businesses wanting predictable billing favor Quaderno's documented auto-upgrade policy."
    }
  ],
  "featureMatrix": [
    {
      "group": "Tax Calculation & Filing",
      "rows": [
        {
          "feature": "Sales/use tax calculation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "VAT/GST calculation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Property, communications, occupancy tax",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Automated filing across jurisdictions",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Jurisdiction coverage disclosed",
          "toolA": "available",
          "toolB": "available",
          "note": "Avalara: 190+ countries; Quaderno: 12,000+ jurisdictions"
        }
      ]
    },
    {
      "group": "Invoicing & Checkout",
      "rows": [
        {
          "feature": "Localized, tax-compliant invoicing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Checkout-integrated tax calculation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Developer API access",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Exemption certificate management",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Access",
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
          "feature": "AI-powered classification",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "ERP-scale integrations (SAP/NetSuite/Salesforce)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which has published pricing?",
      "answer": "Quaderno, from $29/month (Hobby) to $149/month (Growth); Avalara requires contacting sales."
    },
    {
      "question": "Does Quaderno handle property tax?",
      "answer": "Not documented. Quaderno focuses on sales tax, VAT, and GST, while Avalara documents property, communications, and occupancy tax as well."
    },
    {
      "question": "Does Avalara use AI?",
      "answer": "Yes, AI agents via its ALFA AI foundry for tax calculation and item/tariff classification."
    },
    {
      "question": "What happens if I exceed Quaderno's transaction limit?",
      "answer": "Quaderno automatically upgrades the account to the next subscription tier rather than charging overage fees."
    },
    {
      "question": "Which integrates with SAP or NetSuite?",
      "answer": "Avalara, with 1,400+ partner integrations including SAP, NetSuite, Salesforce, and Oracle."
    },
    {
      "question": "Does Quaderno offer a free trial?",
      "answer": "Yes, a 7-day free trial that doesn't require a credit card."
    }
  ]
};

export default avalaraVsQuadernoContent;

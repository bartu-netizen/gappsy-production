import type { ToolComparisonContent } from './types';

const maxioVsRevenuecatContent: ToolComparisonContent = {
  "verdict": "Maxio and RevenueCat both handle subscription billing, but for very different products: Maxio is built for B2B SaaS companies invoicing business customers directly, with GAAP/IFRS revenue recognition, AR automation, and multi-entity support, while RevenueCat is a mobile and web subscription backend that sits in front of Apple, Google, and web in-app purchase systems and adds paywalls and analytics. Neither is a general substitute for the other — the right choice depends on whether you're billing companies directly or monetizing consumer app subscriptions through app-store purchase flows.",
  "bestForToolA": "B2B SaaS companies that need GAAP/IFRS-compliant revenue recognition, CPQ, accounts receivable automation, and multi-entity billing across established payment gateways and ERPs like NetSuite and Salesforce.",
  "bestForToolB": "Mobile and web app teams selling in-app purchases or subscriptions through Apple, Google Play, smart TV, or web storefronts who need a single SDK, configurable paywalls, and A/B testing without building purchase infrastructure from scratch.",
  "whoNeedsBoth": "A company that sells a B2B SaaS product with its own invoicing (handled through Maxio) while also operating a companion mobile app with in-app subscription purchases (handled through RevenueCat) would reasonably run both, since they cover different purchase paths rather than overlapping ones.",
  "keyDifferences": [
    {
      "title": "Billing model and target buyer",
      "toolA": "Maxio bills B2B customers directly with invoicing, CPQ, and dunning automation.",
      "toolB": "RevenueCat processes in-app purchases through Apple, Google Play, smart TV, and web storefronts rather than direct invoicing.",
      "whyItMatters": "The two tools solve billing for fundamentally different transaction types — direct B2B invoicing versus app-store-mediated consumer purchases.",
      "benefitsWho": "Teams need to match the tool to how their customers actually pay: enterprise buyers vs. consumers purchasing through app stores."
    },
    {
      "title": "Revenue recognition and accounting compliance",
      "toolA": "Maxio includes built-in GAAP- and IFRS-compliant revenue recognition and custom reporting.",
      "toolB": "RevenueCat's facts don't document GAAP/IFRS revenue recognition features; it focuses on subscription analytics and paywall tooling instead.",
      "whyItMatters": "Finance teams at B2B SaaS companies often need audit-ready revenue recognition baked in rather than assembled separately.",
      "benefitsWho": "Finance and accounting teams at B2B SaaS companies with recurring revenue reporting obligations."
    },
    {
      "title": "Pricing transparency",
      "toolA": "Maxio's pricing is not published and requires requesting a demo.",
      "toolB": "RevenueCat publishes a clear formula: free up to $2,500 in monthly tracked revenue, then 1% of tracked revenue above that.",
      "whyItMatters": "Teams evaluating cost early in a buying process can model RevenueCat's cost directly, while Maxio requires a sales conversation before any pricing is known.",
      "benefitsWho": "Smaller or earlier-stage teams trying to budget before committing time to a sales process."
    },
    {
      "title": "Integration depth",
      "toolA": "Maxio offers 85+ native integrations plus 6,000+ via Zapier, including NetSuite and Salesforce, and 20+ built-in payment gateways.",
      "toolB": "RevenueCat's integrations center on a single SDK spanning StoreKit, Google Play, smart TV, and web, plus a REST API and real-time webhooks.",
      "whyItMatters": "Maxio's integrations are oriented around ERP/CRM/payment gateway ecosystems used in B2B finance stacks, while RevenueCat's are oriented around purchase platforms and developer tooling.",
      "benefitsWho": "Finance ops teams needing ERP/CRM connections (Maxio) versus mobile engineering teams needing purchase-platform SDKs (RevenueCat)."
    },
    {
      "title": "Scale proof points",
      "toolA": "Maxio cites a customer result of 90% faster reporting.",
      "toolB": "RevenueCat cites usage by 117K+ apps processing $15B+ in revenue.",
      "whyItMatters": "These are different kinds of scale evidence — an internal process improvement for Maxio vs. platform-wide transaction volume for RevenueCat.",
      "benefitsWho": "Buyers assessing vendor maturity and proof of scale for their category."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Billing & Revenue",
      "rows": [
        {
          "feature": "Usage-based billing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Maxio includes metering and rating for usage-based subscriptions."
        },
        {
          "feature": "GAAP/IFRS revenue recognition",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "In-app purchase subscription backend",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Paywall management & A/B testing",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Published self-serve pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "RevenueCat publishes a free-up-to-$2,500-MTR-then-1% formula; Maxio requires a demo."
        },
        {
          "feature": "Free plan/tier",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "CPQ tools",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Integrations & Platforms",
      "rows": [
        {
          "feature": "ERP/CRM integrations (e.g. NetSuite, Salesforce)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Mobile platform SDKs (iOS/Android)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Payment gateway integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Maxio lists 20+ built-in payment gateway integrations."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Maxio or RevenueCat better for a SaaS company that invoices customers directly?",
      "answer": "Maxio, since it's built for B2B subscription billing with GAAP/IFRS revenue recognition, CPQ, and AR automation, none of which are documented for RevenueCat."
    },
    {
      "question": "Does RevenueCat handle direct B2B invoicing like Maxio?",
      "answer": "No — RevenueCat's facts describe it as a subscription backend for in-app purchases across iOS, Android, smart TV, and web, not a direct invoicing or AR system."
    },
    {
      "question": "How does pricing compare?",
      "answer": "RevenueCat publishes a specific formula (free up to $2,500 monthly tracked revenue, then 1%), while Maxio's pricing isn't published and requires requesting a demo."
    },
    {
      "question": "Can I use both tools together?",
      "answer": "Yes — since they address different purchase paths, a company running both a SaaS product and a companion app could use Maxio for direct B2B invoicing and RevenueCat for in-app purchase subscriptions."
    },
    {
      "question": "Which tool has documented revenue recognition compliance?",
      "answer": "Maxio, which lists GAAP- and IFRS-compliant revenue recognition and custom reporting among its features."
    }
  ]
};

export default maxioVsRevenuecatContent;

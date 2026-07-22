import type { ToolComparisonContent } from './types';

const spreeCommerceVsThirtyBeesContent: ToolComparisonContent = {
  "verdict": "Spree Commerce and Thirty Bees are both free, open-source ecommerce platforms, but they target very different technical audiences: Spree is a Ruby on Rails, headless, API-first platform with a production-ready Next.js storefront and TypeScript SDK, aimed at developer teams building custom or multi-tenant commerce experiences, while Thirty Bees is a PHP platform forked from PrestaShop 1.6 that ships with 500+ built-in features and a traditional server-rendered storefront, aimed at merchants wanting a more turnkey self-hosted cart. Spree's architecture supports more advanced use cases like multi-tenancy and marketplaces natively documented; Thirty Bees leans on inherited PrestaShop compatibility and built-in breadth.",
  "bestForToolA": "Spree Commerce fits Ruby on Rails development teams building headless, API-driven storefronts, B2B wholesale portals, or multi-tenant SaaS commerce products, and wanting a ready-made Next.js frontend, as used by brands like Bookshop and Bonobos.",
  "bestForToolB": "Thirty Bees fits merchants who want a PHP-based, more turnkey self-hosted cart with 500+ built-in features and compatibility with the existing PrestaShop 1.6 module and theme ecosystem, without needing to build a custom headless frontend.",
  "whoNeedsBoth": "There's no realistic scenario combining them — both are complete, alternative ecommerce platforms built on different languages (Ruby vs. PHP), so a merchant or developer team picks one as their store's foundation.",
  "keyDifferences": [
    {
      "title": "Technology Stack",
      "toolA": "Spree Commerce's backend is built on Ruby on Rails, with a Next.js storefront and TypeScript SDKs for integration.",
      "toolB": "Thirty Bees is a PHP platform, forked from PrestaShop 1.6, with storefronts built on Bootstrap.",
      "whyItMatters": "The language and rendering approach (headless API + Next.js vs. traditional server-rendered PHP) determine developer skill requirements and implementation complexity.",
      "benefitsWho": "Ruby/JavaScript development teams benefit from Spree; PHP-focused teams and merchants wanting simpler server-rendered setup benefit from Thirty Bees."
    },
    {
      "title": "Architecture Style",
      "toolA": "Spree is headless and API-first, exposing REST APIs and a TypeScript SDK, with the storefront as a separate Next.js application.",
      "toolB": "Thirty Bees uses a traditional, more tightly coupled architecture inherited from PrestaShop 1.6, with Bootstrap-based responsive storefronts.",
      "whyItMatters": "Headless architecture (Spree) enables more flexible frontend customization and omnichannel delivery, while a coupled architecture (Thirty Bees) can be faster to launch out of the box.",
      "benefitsWho": "Teams building custom or omnichannel frontends benefit from Spree's headless design; merchants wanting a faster out-of-the-box launch benefit from Thirty Bees."
    },
    {
      "title": "Multi-Tenant and Marketplace Support",
      "toolA": "Spree documents multi-tenant architecture for embedding commerce into SaaS products, plus multi-vendor marketplace and B2B wholesale portal support.",
      "toolB": "Thirty Bees documents multi-site and multi-currency support from one installation but does not explicitly document multi-tenant SaaS or marketplace capability.",
      "whyItMatters": "Multi-tenancy is a specific architectural capability needed for building a platform that serves multiple independent stores from one codebase.",
      "benefitsWho": "Agencies or SaaS builders wanting to host multiple client stores from a single Spree deployment."
    },
    {
      "title": "Transaction Fees and Licensing",
      "toolA": "Spree's Community Edition is BSD 3-Clause licensed with no GMV cuts or per-transaction platform fees, per the company.",
      "toolB": "Thirty Bees's core is free and open source, with paid modules, themes, and support available separately via its marketplace.",
      "whyItMatters": "Confirming there are no revenue-based fees on the free tier matters for merchants projecting long-term platform costs at scale.",
      "benefitsWho": "High-volume merchants wanting to avoid GMV-based platform fees benefit from Spree's explicit no-fee stance."
    },
    {
      "title": "Notable Adopters",
      "toolA": "Spree is used by Bookshop, Bonobos, GoDaddy, and KFC.",
      "toolB": "Thirty Bees's documented data does not list named notable customers.",
      "whyItMatters": "Named enterprise/consumer-brand adopters can serve as social proof of production readiness at scale.",
      "benefitsWho": "Buyers wanting evidence of adoption by recognizable brands before committing."
    }
  ],
  "featureMatrix": [
    {
      "group": "Platform Basics",
      "rows": [
        {
          "feature": "Free, open-source core",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "License",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Spree: BSD 3-Clause"
        },
        {
          "feature": "GitHub stars / downloads",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Spree: 15K+ stars, 2M+ downloads"
        }
      ]
    },
    {
      "group": "Architecture",
      "rows": [
        {
          "feature": "Headless REST API + SDK",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Included modern JS storefront",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Spree ships a Next.js storefront"
        },
        {
          "feature": "Multi-tenant SaaS architecture",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-vendor marketplace support",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Built-in Store Features",
      "rows": [
        {
          "feature": "Built-in SEO tools",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "PDF invoice generation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "B2B wholesale portals",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Payment gateway integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Spree: Stripe, Adyen, PayPal"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Spree Commerce and Thirty Bees both free?",
      "answer": "Yes, both have free, open-source cores. Spree's Community Edition is BSD 3-Clause licensed with no GMV cuts or transaction fees. Thirty Bees's core is free, with paid modules, themes, and support available via its marketplace."
    },
    {
      "question": "Which platform is headless?",
      "answer": "Spree Commerce is headless and API-first, exposing REST APIs and a TypeScript SDK, with a production-ready Next.js storefront. Thirty Bees uses a more traditional, tightly coupled architecture inherited from PrestaShop 1.6."
    },
    {
      "question": "What tech stacks do they use?",
      "answer": "Spree's backend is built on Ruby on Rails with a Next.js frontend. Thirty Bees is built on PHP, as a fork of PrestaShop 1.6, with Bootstrap-based storefronts."
    },
    {
      "question": "Which platform supports multi-tenant or marketplace commerce?",
      "answer": "Spree documents multi-tenant architecture for embedding commerce into SaaS products, plus multi-vendor marketplace support. Thirty Bees documents multi-site/multi-currency support but does not explicitly document multi-tenancy or marketplace capability."
    },
    {
      "question": "Does Spree charge transaction fees?",
      "answer": "Spree states its Community Edition has no GMV cuts or per-transaction platform fees. Thirty Bees's core is also free, though paid modules, themes, and support are available separately."
    },
    {
      "question": "Which platform has notable brand customers?",
      "answer": "Spree lists Bookshop, Bonobos, GoDaddy, and KFC as adopters. The available data for Thirty Bees does not list named customers."
    }
  ]
};

export default spreeCommerceVsThirtyBeesContent;

import type { ToolComparisonContent } from './types';

const solidusVsSpreeCommerceContent: ToolComparisonContent = {
  "verdict": "Solidus and Spree Commerce share direct lineage — Solidus was forked from Spree in 2015 — and both are free, open-source Ruby on Rails commerce frameworks aimed at developer-led implementations. The key differences that emerged since the fork: Spree emphasizes a headless, API-first architecture with a ready-made Next.js storefront and TypeScript SDK, while Solidus emphasizes deep customization for complex commerce needs, including a native subscriptions engine and both REST and GraphQL APIs. Both keep enterprise pricing (Solidus Cloud, Spree Enterprise Edition) undisclosed and gated behind a sales conversation.",
  "bestForToolA": "Solidus fits development teams needing highly customized commerce logic with native subscription/recurring-purchase support (curated boxes, recurring models) and are maintained-and-supported by Nebulab and its open-source community.",
  "bestForToolB": "Spree Commerce fits teams that want a headless commerce backend with a production-ready Next.js storefront already built, reducing frontend implementation time, and want proven adoption at brands like Bookshop, Bonobos, and GoDaddy.",
  "whoNeedsBoth": "There's no realistic scenario for running both together — as forked siblings built on the same Ruby on Rails foundation, they are direct alternatives, so a team picks one as its commerce framework rather than combining them.",
  "keyDifferences": [
    {
      "title": "Fork Relationship and History",
      "toolA": "Solidus was forked from Spree in 2015 and has since been maintained independently by Nebulab and the open-source community.",
      "toolB": "Spree Commerce is the original project that Solidus forked from, continuing its own independent development since 2015.",
      "whyItMatters": "Understanding the fork relationship helps buyers see the two projects as diverging siblings with a shared Rails foundation rather than unrelated platforms.",
      "benefitsWho": "Teams researching platform history and long-term project stability before committing engineering resources."
    },
    {
      "title": "Native Subscriptions Support",
      "toolA": "Solidus includes a native subscriptions engine for curated boxes and recurring purchase models as a documented feature.",
      "toolB": "Spree Commerce's documented feature list does not mention a native subscriptions engine.",
      "whyItMatters": "Subscription/recurring commerce (e.g., subscription boxes) needs either native support or custom-built logic; Solidus documents this out of the box.",
      "benefitsWho": "Subscription-box or recurring-order merchants benefit from Solidus's native subscriptions engine."
    },
    {
      "title": "Storefront Delivery",
      "toolA": "Solidus ships with a starter storefront theme and admin dashboard, without a specifically named modern JS framework for the frontend.",
      "toolB": "Spree ships with a production-ready Next.js storefront that connects directly to the Rails backend, plus a TypeScript SDK.",
      "whyItMatters": "A pre-built, production-ready modern frontend (Spree's Next.js storefront) can meaningfully cut implementation time versus building on a starter theme.",
      "benefitsWho": "Teams wanting to launch a modern JS-based storefront quickly benefit from Spree's included Next.js option."
    },
    {
      "title": "API Options",
      "toolA": "Solidus provides both REST and GraphQL APIs for building custom frontends and integrations.",
      "toolB": "Spree exposes REST APIs and a TypeScript SDK; GraphQL support is not documented in the available data.",
      "whyItMatters": "Offering both REST and GraphQL (Solidus) gives integration teams more flexibility in how they query and mutate commerce data.",
      "benefitsWho": "Integration engineers who prefer GraphQL for complex data-fetching needs benefit from Solidus's dual API support."
    },
    {
      "title": "Enterprise/Cloud Tier",
      "toolA": "Solidus Cloud (Enterprise) is offered as a fully hosted option with 24/7 support and unlimited usage, but pricing is not publicly listed.",
      "toolB": "Spree's Enterprise Edition offers dedicated support and mission-critical deployment assistance, also with undisclosed pricing.",
      "whyItMatters": "Both platforms gate their highest support tier behind a sales conversation, so neither offers self-serve enterprise pricing.",
      "benefitsWho": "Enterprise buyers should expect a custom sales process either way, regardless of which sibling platform they choose."
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
          "feature": "Ruby on Rails foundation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Founding/fork year",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Solidus forked from Spree in 2015"
        }
      ]
    },
    {
      "group": "Commerce Capabilities",
      "rows": [
        {
          "feature": "Native subscriptions engine",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "GraphQL API",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "REST API",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Merchandising / personalization tools",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Frontend & Enterprise",
      "rows": [
        {
          "feature": "Included production-ready Next.js storefront",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "TypeScript SDK",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Hosted Enterprise/Cloud tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Both pricing undisclosed"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Solidus related to Spree Commerce?",
      "answer": "Yes, Solidus was directly forked from Spree in 2015 and has been maintained independently since then by Nebulab and the open-source community."
    },
    {
      "question": "Which platform has native subscription support?",
      "answer": "Solidus documents a native subscriptions engine for curated boxes and recurring purchase models. Spree Commerce's documented features do not mention native subscription support."
    },
    {
      "question": "Which platform ships with a ready-made modern storefront?",
      "answer": "Spree Commerce ships with a production-ready Next.js storefront and TypeScript SDK. Solidus ships with a starter theme and admin dashboard without a specifically named modern JS frontend."
    },
    {
      "question": "Do both platforms support GraphQL?",
      "answer": "Solidus documents both REST and GraphQL APIs. Spree's documented API is REST-based with a TypeScript SDK; GraphQL support is not documented for Spree."
    },
    {
      "question": "Are Solidus and Spree Commerce both free?",
      "answer": "Yes, both are free, open-source frameworks that can be self-hosted. Each also offers an undisclosed-price hosted enterprise tier: Solidus Cloud (Enterprise) and Spree's Enterprise Edition."
    },
    {
      "question": "Who maintains each project?",
      "answer": "Solidus is maintained by Nebulab and the open-source community. Spree Commerce's maintaining organization is not specified in the available data beyond its open-source community and BSD 3-Clause licensing."
    }
  ]
};

export default solidusVsSpreeCommerceContent;

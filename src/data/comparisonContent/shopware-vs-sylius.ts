import type { ToolComparisonContent } from './types';

const shopwareVsSyliusContent: ToolComparisonContent = {
  "verdict": "Shopware and Sylius are both open-source ecommerce platforms with free community editions, but they target different buyers: Shopware is a German-built platform with commercial cloud/PaaS tiers, a built-in AI copilot, and GMV-linked enterprise pricing starting at €600/month for Rise, while Sylius is a headless, API-first framework built on Symfony/PHP aimed at developers who want to build fully custom storefronts. Shopware packages more out-of-the-box commerce tooling (CMS, SEO, Flow Builder, B2B components) into paid tiers, while Sylius keeps its commercial layer (Sylius Plus) thin and undisclosed in price, relying instead on developer customization.",
  "bestForToolA": "Shopware fits mid-market to enterprise retailers who want a vendor-managed AI-assisted commerce platform with built-in CMS, SEO, and B2B tooling and are willing to pay €600/month or more for Rise, Evolve, or Beyond tiers.",
  "bestForToolB": "Sylius fits development teams comfortable with PHP and Symfony who want a free, MIT-licensed, API-first headless commerce core they can fully customize, backed by a large open-source community of 7,400+ Slack members and 700+ contributors.",
  "whoNeedsBoth": "There is no realistic scenario where a single storefront would run both platforms together — they are alternative foundations for the same commerce backend, so a team picks one architecture (Shopware's managed suite or Sylius's headless framework) rather than combining them.",
  "keyDifferences": [
    {
      "title": "Licensing and Base Cost",
      "toolA": "Shopware offers a free, MIT-licensed Community Edition, with paid Rise (from €600/month), Evolve (from €2,400/month), and custom-priced Beyond tiers.",
      "toolB": "Sylius offers a free, MIT-licensed Community Edition, with a commercial Sylius Plus tier whose price is not publicly disclosed.",
      "whyItMatters": "Shopware's paid tiers have visible starting prices, letting buyers budget in advance, while Sylius Plus requires a sales conversation to learn cost.",
      "benefitsWho": "Budget-conscious teams that want to compare list prices before engaging sales will find Shopware's Rise/Evolve pricing easier to pre-qualify."
    },
    {
      "title": "AI Tooling",
      "toolA": "Shopware includes a Shopware Intelligence Copilot for AI-assisted commerce management, with a fuller AI feature set (Shopware Intelligence+) available for an extra €19–€29/month.",
      "toolB": "Sylius's documented feature set does not mention AI-assisted tooling.",
      "whyItMatters": "Teams wanting built-in AI assistance for merchandising or admin tasks get that natively from Shopware, whereas Sylius would require custom integration.",
      "benefitsWho": "Merchandising teams that want AI copilot features without building custom tooling."
    },
    {
      "title": "Architecture Approach",
      "toolA": "Shopware bundles CMS, SEO, analytics, Flow Builder, and Rule Builder into an integrated platform with flexible self-hosted, SaaS, or PaaS deployment.",
      "toolB": "Sylius is built as a headless, API-first framework using REST APIs via API Platform, designed to be extended and customized rather than used as an all-in-one suite.",
      "whyItMatters": "An integrated platform reduces implementation time for standard storefronts, while a headless framework gives more control for custom or omnichannel builds.",
      "benefitsWho": "Retailers wanting fast time-to-launch favor Shopware; agencies building bespoke, API-driven commerce experiences favor Sylius."
    },
    {
      "title": "B2B Capabilities",
      "toolA": "Shopware offers dedicated B2B components and digital sales rooms available on its higher (Evolve/Beyond) tiers.",
      "toolB": "Sylius supports B2B and B2C commerce natively and offers a dedicated B2B setup product called Elesto, plus a multi-vendor marketplace product called Dafre.",
      "whyItMatters": "Both platforms address B2B selling, but through different packaging — Shopware gates B2B behind paid tiers, while Sylius offers it as a separate dedicated product.",
      "benefitsWho": "B2B-focused merchants evaluating whether B2B tooling is bundled into a subscription (Shopware) or delivered as a distinct implementation (Sylius Elesto)."
    },
    {
      "title": "Ecosystem and Track Record",
      "toolA": "Shopware has a partner ecosystem of 1,200+ certified agencies and was named a Visionary in the 2025 Gartner Magic Quadrant for Digital Commerce.",
      "toolB": "Sylius is used by major brands including Mytheresa, Carrefour, and Jägermeister, and has a community of 7,400+ Slack developers and 700+ contributors.",
      "whyItMatters": "Agency availability (Shopware) versus developer community depth (Sylius) affects how easy it is to staff an implementation team.",
      "benefitsWho": "Enterprises wanting certified implementation partners lean toward Shopware; engineering-led teams wanting an active open-source contributor base lean toward Sylius."
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing & Pricing",
      "rows": [
        {
          "feature": "Free open-source edition",
          "toolA": "available",
          "toolB": "available",
          "note": "Both MIT-licensed"
        },
        {
          "feature": "Published starting price for paid tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Shopware Rise from €600/mo; Sylius Plus is custom/undisclosed"
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "SaaS/PaaS managed deployment",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Commerce Tooling",
      "rows": [
        {
          "feature": "Built-in AI copilot",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Shopware Intelligence Copilot; add-on €19-29/mo for full suite"
        },
        {
          "feature": "Integrated CMS, SEO, analytics",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Visual automation (Flow Builder/Rule Builder)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Headless REST API",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Sylius uses API Platform"
        }
      ]
    },
    {
      "group": "B2B & Marketplace",
      "rows": [
        {
          "feature": "B2B selling components",
          "toolA": "available",
          "toolB": "available",
          "note": "Shopware: higher tiers; Sylius: native + Elesto product"
        },
        {
          "feature": "Multi-vendor marketplace",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Sylius offers Dafre"
        },
        {
          "feature": "Omnichannel/multi-channel sales",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Shopware or Sylius free?",
      "answer": "Both offer free, MIT-licensed community editions. Shopware's paid tiers (Rise from €600/month, Evolve from €2,400/month, Beyond custom) add cloud hosting and features; Sylius's paid tier, Sylius Plus, has undisclosed pricing."
    },
    {
      "question": "Does Shopware or Sylius include AI features?",
      "answer": "Shopware includes a Shopware Intelligence Copilot, with an enhanced AI suite available for an extra €19–€29/month. Sylius's documented features do not mention AI tooling."
    },
    {
      "question": "Which platform is more headless/API-first?",
      "answer": "Sylius is built as an API-first headless framework using REST APIs via API Platform. Shopware also supports headless use cases but is positioned more as an integrated commerce suite with built-in CMS, SEO, and analytics."
    },
    {
      "question": "Which platform is better for B2B commerce?",
      "answer": "Both support B2B: Shopware gates B2B components and digital sales rooms behind its Evolve and Beyond tiers, while Sylius supports B2B/B2C natively and offers a dedicated B2B product called Elesto."
    },
    {
      "question": "What technology stack does each platform use?",
      "answer": "Sylius is built on PHP and the Symfony framework with API Platform for its REST APIs. Shopware's underlying stack is not detailed in the available data beyond its self-hosted/SaaS/PaaS deployment options."
    },
    {
      "question": "Which platform has a larger implementation partner ecosystem?",
      "answer": "Shopware has 1,200+ certified agencies and Gartner Visionary recognition. Sylius has a large open-source community (7,400+ Slack members, 700+ contributors) rather than a formal certified-agency program documented in the data."
    }
  ]
};

export default shopwareVsSyliusContent;

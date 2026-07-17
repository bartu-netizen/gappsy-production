import type { ToolComparisonContent } from './types';

const rankMathVsYoastSeoContent: ToolComparisonContent = {
  "verdict": "Rank Math and Yoast SEO are both WordPress SEO plugins with free versions and paid tiers, but they diverge on platform reach and AI positioning. Rank Math is WordPress-only but includes built-in rank tracking (up to 50,000 keywords on its Agency tier) and 20+ schema types at a lower entry price; Yoast SEO extends beyond core WordPress with a WooCommerce bundle, a standalone Shopify app, and a Google Docs add-on, and its AI+ tier adds brand-mention monitoring across AI platforms like ChatGPT and Claude. Sites that live entirely inside WordPress and want built-in rank tracking may prefer Rank Math; sites needing coverage across WooCommerce, Shopify, and Google Docs, or brand-mention monitoring, may prefer Yoast.",
  "bestForToolA": "Best for WordPress-only sites wanting built-in keyword rank tracking (500 keywords on PRO up to 50,000 on Agency) and extensive schema markup (20+ types) at a lower entry price (€7.99/month billed annually).",
  "bestForToolB": "Best for teams operating across multiple platforms — WordPress, WooCommerce, Shopify, and Google Docs — or that want AI-driven brand-mention monitoring across ChatGPT, Gemini, Perplexity, and Claude via the AI+ tier.",
  "whoNeedsBoth": "Agencies managing a mixed portfolio of client sites might use Rank Math for pure-WordPress clients needing rank tracking, while reaching for Yoast's Shopify app or WooCommerce bundle for clients on those specific platforms — the two aren't interchangeable once a client sits outside core WordPress.",
  "keyDifferences": [
    {
      "title": "Platform reach beyond WordPress",
      "toolA": "Rank Math's facts describe it as WordPress-only, not usable on other platforms.",
      "toolB": "Yoast SEO is offered as a WordPress plugin, a WooCommerce bundle, a standalone Shopify app, and a Google Docs add-on.",
      "whyItMatters": "Sites or agencies operating on Shopify or writing in Google Docs need Yoast's multi-platform coverage, since Rank Math has no equivalent per the facts.",
      "benefitsWho": "Agencies and merchants running e-commerce or non-WordPress platforms."
    },
    {
      "title": "Built-in keyword rank tracking limits",
      "toolA": "Rank Math tracks 500 keywords on PRO, 10,000 on Business, and 50,000 on Agency, built directly inside WordPress.",
      "toolB": "Yoast SEO's facts do not describe a built-in rank tracker; its Premium plan instead focuses on keyword optimization per page (up to 5 keywords), redirects, and internal linking.",
      "whyItMatters": "Sites wanting to track large keyword sets natively inside the plugin have an explicit, tiered allowance with Rank Math that isn't described for Yoast.",
      "benefitsWho": "SEO teams tracking rankings for large keyword sets."
    },
    {
      "title": "AI feature focus",
      "toolA": "Rank Math's facts don't describe a named AI feature beyond its general AI tag.",
      "toolB": "Yoast's AI+ tier (€358.80/year) adds AI-generated titles/meta descriptions and brand-mention monitoring across ChatGPT, Gemini, Perplexity, and Claude.",
      "whyItMatters": "Yoast's facts document a specific, premium-priced AI capability that isn't described for Rank Math.",
      "benefitsWho": "Brands wanting to track how they're mentioned across AI chat platforms."
    },
    {
      "title": "Pricing structure and entry cost",
      "toolA": "Rank Math PRO starts at €7.99/month billed annually (renewing at €8.99/month).",
      "toolB": "Yoast SEO Premium starts at €118.80/year, with WooCommerce bundle at €178.80/year and AI+ at €358.80/year.",
      "whyItMatters": "Rank Math's published entry price is lower than Yoast Premium's annual cost, though both offer free base versions.",
      "benefitsWho": "Budget-conscious site owners comparing entry-level paid tiers."
    }
  ],
  "featureMatrix": [
    {
      "group": "Platform Availability",
      "rows": [
        {
          "feature": "WordPress plugin",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "WooCommerce-specific module/bundle",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Shopify app",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Google Docs add-on",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "SEO & Content Features",
      "rows": [
        {
          "feature": "Schema markup generator",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Rank Math: 20+ schema types"
        },
        {
          "feature": "Built-in rank tracking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Broken link checker",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Real-time content analysis",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-generated titles/meta descriptions",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free version",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Entry paid tier price",
          "toolA": "available",
          "toolB": "available",
          "note": "Rank Math: €7.99/mo; Yoast: €118.80/yr"
        },
        {
          "feature": "AI premium tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Yoast AI+, €358.80/yr"
        },
        {
          "feature": "Multi-site/agency tier",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Rank Math Business/Agency up to 500 sites; Yoast Premium covers one domain per subscription"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Rank Math free?",
      "answer": "Yes, a free version is available for download; paid PRO, Business, and Agency tiers add more keyword tracking and site limits."
    },
    {
      "question": "Is Yoast SEO free?",
      "answer": "Yes, a free WordPress plugin is available; Premium starts at €118.80/year for additional features."
    },
    {
      "question": "How many keywords can I track with Rank Math?",
      "answer": "500 on PRO, 10,000 on Business, and 50,000 on Agency."
    },
    {
      "question": "What does the Yoast AI+ package include?",
      "answer": "The AI+ package (€358.80/year) adds AI-generated titles/descriptions and brand-mention monitoring across AI platforms like ChatGPT and Claude."
    },
    {
      "question": "Does Yoast SEO support WooCommerce and Shopify?",
      "answer": "Yes, there's a WooCommerce SEO bundle (€178.80/year) and a separate Shopify app ($19/month with a 14-day free trial)."
    },
    {
      "question": "What languages does Rank Math support?",
      "answer": "English, German, Dutch, French, Japanese, Spanish, Italian, and Finnish."
    }
  ]
};

export default rankMathVsYoastSeoContent;

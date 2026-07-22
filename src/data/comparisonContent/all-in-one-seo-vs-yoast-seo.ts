import type { ToolComparisonContent } from './types';

const allInOneSeoVsYoastSeoContent: ToolComparisonContent = {
  "verdict": "All in One SEO (AIOSEO) and Yoast SEO are both freemium WordPress SEO plugins, but AIOSEO stays WordPress-centric with tiered AI content credits and a built-in WooCommerce module, while Yoast extends to a standalone Shopify app and Google Docs add-on and gates AI brand-mention monitoring behind a separate premium tier. Sites wanting AI content/image generation built into their WordPress SEO plugin may lean toward AIOSEO; sites needing coverage on Shopify or Google Docs, or AI brand-mention tracking, may lean toward Yoast.",
  "bestForToolA": "Best for WordPress site owners who want AI content generation (titles, rewrites, images) built into their SEO plugin via tiered AI credits (10,000 on Basic up to 200,000 on Elite) plus a native WooCommerce SEO module, at a lower entry annual price (€49.50/year).",
  "bestForToolB": "Best for teams needing SEO coverage outside core WordPress — a dedicated Shopify app, a Google Docs add-on — or wanting AI brand-mention monitoring across ChatGPT, Gemini, Perplexity, and Claude via the AI+ tier.",
  "whoNeedsBoth": "Agencies managing both WordPress/WooCommerce clients and Shopify clients may use AIOSEO for the WordPress side, with its AI credit system and WooCommerce module, and Yoast's dedicated Shopify app for merchants on that platform, since AIOSEO's facts describe it as WordPress-only.",
  "keyDifferences": [
    {
      "title": "Platform reach",
      "toolA": "AIOSEO's facts describe it as WordPress-only, not usable on other platforms.",
      "toolB": "Yoast SEO is available as a WordPress plugin, WooCommerce bundle, standalone Shopify app, and Google Docs add-on.",
      "whyItMatters": "Merchants on Shopify or writers using Google Docs have no AIOSEO equivalent per the facts, making Yoast the only option of the two for those platforms.",
      "benefitsWho": "Shopify merchants and non-WordPress content teams."
    },
    {
      "title": "AI content generation vs. AI brand monitoring",
      "toolA": "AIOSEO's AI Assistant helps generate and rewrite content, titles, and images using tiered AI Credits (10,000 on Basic up to 200,000 on Elite).",
      "toolB": "Yoast's AI focus is generating titles/meta descriptions plus its AI+ tier's brand-mention monitoring across ChatGPT, Gemini, Perplexity, and Claude — not full content/image generation.",
      "whyItMatters": "Teams wanting AI to draft content and images have that documented in AIOSEO; teams wanting to know where their brand is mentioned in AI answer engines have that documented in Yoast.",
      "benefitsWho": "Content teams (AIOSEO) vs. brand/marketing teams tracking AI visibility (Yoast)."
    },
    {
      "title": "Site-count vs. domain-based pricing",
      "toolA": "AIOSEO plans scale by website count — 1 website on Basic up to 100 websites on Elite.",
      "toolB": "Yoast's facts state each Premium subscription covers only one domain.",
      "whyItMatters": "Agencies managing many WordPress sites may find AIOSEO's multi-site tiers more directly cost-effective than buying separate Yoast Premium subscriptions per domain.",
      "benefitsWho": "Agencies and multi-site portfolio managers."
    },
    {
      "title": "Built-in e-commerce SEO module",
      "toolA": "AIOSEO includes a dedicated WooCommerce SEO module as a core feature for optimizing WooCommerce product pages.",
      "toolB": "Yoast offers WooCommerce SEO as a separate bundle (€178.80/year) rather than included in the base Premium plan.",
      "whyItMatters": "AIOSEO folds WooCommerce optimization into its core feature set, while Yoast requires purchasing an additional bundle for the same coverage.",
      "benefitsWho": "WooCommerce store owners choosing a plugin."
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
          "feature": "WooCommerce module/bundle",
          "toolA": "available",
          "toolB": "available",
          "note": "AIOSEO includes it in core features; Yoast sells it as a separate bundle"
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
      "group": "AI Features",
      "rows": [
        {
          "feature": "AI content/title/image generation",
          "toolA": "available",
          "toolB": "available",
          "note": "AIOSEO's AI Assistant generates content/titles/images; Yoast generates titles and meta descriptions"
        },
        {
          "feature": "AI brand-mention monitoring",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Yoast AI+ tier"
        },
        {
          "feature": "Tiered AI credit system",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free version",
          "toolA": "available",
          "toolB": "available",
          "note": "AIOSEO Lite"
        },
        {
          "feature": "Entry paid tier price",
          "toolA": "available",
          "toolB": "available",
          "note": "AIOSEO: €49.50/year; Yoast: €118.80/year"
        },
        {
          "feature": "Multi-site tier (10+ websites)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "AIOSEO Pro=10, Elite=100 websites; Yoast licenses per domain"
        },
        {
          "feature": "Money-back guarantee",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "AIOSEO: 14-day"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is there a free version of AIOSEO?",
      "answer": "Yes, a free \"Lite\" version exists; paid Basic, Plus, Pro, and Elite tiers add more features and site coverage."
    },
    {
      "question": "Is Yoast SEO free?",
      "answer": "Yes, a free WordPress plugin is available; Premium starts at €118.80/year for additional features."
    },
    {
      "question": "How many websites can I use AIOSEO on?",
      "answer": "Plans range from 1 website (Basic) up to 100 websites (Elite)."
    },
    {
      "question": "Does Yoast SEO support WooCommerce and Shopify?",
      "answer": "Yes, there's a WooCommerce SEO bundle (€178.80/year) and a separate Shopify app ($19/month with a 14-day free trial)."
    },
    {
      "question": "Does AIOSEO include AI content tools?",
      "answer": "Yes, each plan includes a set number of AI Credits for the AI Assistant, Content Generator, and Image Generator."
    },
    {
      "question": "What does the Yoast AI+ package include?",
      "answer": "The AI+ package (€358.80/year) adds AI-generated titles/descriptions and brand-mention monitoring across AI platforms like ChatGPT and Claude."
    }
  ]
};

export default allInOneSeoVsYoastSeoContent;

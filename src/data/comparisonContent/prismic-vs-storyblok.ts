import type { ToolComparisonContent } from './types';

const prismicVsStoryblokContent: ToolComparisonContent = {
  "verdict": "Prismic and Storyblok are both freemium, component-based headless CMSs with published pricing and AI/MCP integrations, but they diverge on price and certification. Prismic's first paid tier is $10/month with unlimited documents/assets and a dedicated local dev tool (Slice Machine), while its AI landing-page builder is a separate paid add-on. Storyblok's first paid tier jumps to $99/month but bundles AI credits into every plan (including free) and carries ISO 27001 certification with high uptime SLAs on enterprise tiers. Budget and compliance requirements should drive the decision more than raw feature counts.",
  "bestForToolA": "Budget-conscious teams and smaller projects wanting a cheap ($10/month) entry paid tier with unlimited documents/assets and a dedicated local developer tool (Slice Machine) for customizing components.",
  "bestForToolB": "Teams needing ISO 27001-certified security, native Shopify integration, and AI credits bundled into every tier from free upward, especially if Growth tier's 5-10 seats and 400GB-1TB traffic fit from the start.",
  "whoNeedsBoth": "Agencies serving both budget-sensitive clients and enterprise/ecommerce clients needing ISO 27001 compliance and Shopify integration may standardize on Prismic for the former and Storyblok for the latter, rather than one CMS across the whole portfolio.",
  "keyDifferences": [
    {
      "title": "Entry paid-tier price and inclusions",
      "toolA": "Starter plan is $10/month for 3 users and 3 locales, with paid overages up to 500GB at $0.30/GB.",
      "toolB": "Growth plan is $99/month ($90.75/month annual) for 5 seats (up to 10), 400GB traffic (up to 1TB), and native Shopify integration.",
      "whyItMatters": "Prismic is far cheaper to start paying for, while Storyblok's higher first tier bundles more seats, traffic headroom, and an ecommerce integration.",
      "benefitsWho": "Small teams and solo builders (Prismic) versus teams needing more seats/traffic and Shopify from the outset (Storyblok)."
    },
    {
      "title": "AI feature bundling",
      "toolA": "AI translation is included, but the AI landing page builder is a separate, separately priced add-on not bundled into any listed plan tier.",
      "toolB": "Includes explicit AI credit quotas on every tier (25k Starter, 100k Growth, 200k Growth Plus) plus an 'AI SEO' feature on Enterprise.",
      "whyItMatters": "Storyblok's AI usage is metered and included by default; Prismic's more advanced AI feature (landing pages) requires an extra purchase.",
      "benefitsWho": "Teams wanting predictable, included AI usage (Storyblok) versus teams only needing AI translation without paying extra (Prismic)."
    },
    {
      "title": "Local developer tooling",
      "toolA": "Ships Slice Machine, a local developer tool for coding and customizing slices within a normal development workflow.",
      "toolB": "No equivalent local developer customization tool is documented; component customization happens through the visual editor's Global Components.",
      "whyItMatters": "Prismic gives developers a dedicated local tool for building/customizing reusable components outside the hosted editor.",
      "benefitsWho": "Development teams wanting a code-first workflow for building CMS components."
    },
    {
      "title": "Security certification",
      "toolA": "No compliance certification is documented in the available facts.",
      "toolB": "ISO 27001 certified, with up to 99.99% uptime SLA on enterprise tiers.",
      "whyItMatters": "Storyblok has a stated security certification that buyers with vendor-review requirements can point to; Prismic does not document one.",
      "benefitsWho": "Enterprise and regulated buyers running security reviews."
    }
  ],
  "featureMatrix": [
    {
      "group": "Content & AI",
      "rows": [
        {
          "feature": "Component-based visual editor",
          "toolA": "available",
          "toolB": "available",
          "note": "Prismic's slices vs. Storyblok's Global Components."
        },
        {
          "feature": "Local developer customization tool",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Prismic's Slice Machine."
        },
        {
          "feature": "AI translation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI credits included in plan tiers",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Prismic's AI landing page builder is a separate paid add-on rather than a metered credit system."
        },
        {
          "feature": "MCP integration for AI assistants",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Entry paid tier price",
          "toolA": "available",
          "toolB": "available",
          "note": "$10/month (Prismic) vs $99/month (Storyblok)."
        },
        {
          "feature": "Native ecommerce integration (e.g. Shopify)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Storyblok includes Shopify from the Growth plan."
        }
      ]
    },
    {
      "group": "Security & Company",
      "rows": [
        {
          "feature": "ISO 27001 certification",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Founded year disclosed",
          "toolA": "available",
          "toolB": "available",
          "note": "Prismic: 2013. Storyblok: 2017."
        },
        {
          "feature": "Headquarters disclosed",
          "toolA": "available",
          "toolB": "available",
          "note": "Prismic: Paris, France. Storyblok: Austria."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Prismic free to use?",
      "answer": "Yes, the Free plan includes 1 user, 4 million API calls/month, and 100GB of CDN bandwidth/month at no cost."
    },
    {
      "question": "How is Prismic priced?",
      "answer": "Per repository, billed annually, ranging from Free up to Platinum at $675/month, with Enterprise available on request."
    },
    {
      "question": "Does Prismic support AI-assisted editing?",
      "answer": "Yes, including AI translation and prompt-driven page updates through its MCP integration with ChatGPT and Claude."
    },
    {
      "question": "Does Storyblok have a free plan?",
      "answer": "Yes, the Starter plan is free and includes 1 space, 1 user seat, and 100GB traffic per month."
    },
    {
      "question": "When was Storyblok founded?",
      "answer": "Storyblok was started in 2017 in Austria by founders Dominik and Alexander."
    },
    {
      "question": "Does Storyblok support AI or agent workflows?",
      "answer": "Yes, it offers an MCP Server and includes AI credits for AI-assisted content features."
    }
  ]
};

export default prismicVsStoryblokContent;

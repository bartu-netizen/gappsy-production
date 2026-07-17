import type { ToolComparisonContent } from './types';

const podiaVsShopwareContent: ToolComparisonContent = {
  "verdict": "Podia and Shopware both sell things online, but they are built for opposite ends of the commerce spectrum. Podia is an all-in-one storefront for creators selling courses, digital downloads, memberships, and coaching, with a free plan and paid tiers starting around $33/month. Shopware is a German ecommerce platform for retailers and B2B sellers, with a free open-source Community Edition and cloud plans that start at €600/month and scale into enterprise-only pricing.",
  "bestForToolA": "Podia fits solo creators and coaches who want to package courses, digital downloads, memberships, and coaching calls under one dashboard without hiring a developer.",
  "bestForToolB": "Shopware fits retailers and B2B merchants who need a full ecommerce stack with Flow Builder automation, B2B components, and omnichannel selling, and who have the budget for €600/month-and-up Rise/Evolve plans or the technical resources to self-host the free Community Edition.",
  "whoNeedsBoth": "A retailer running a Shopware storefront for physical products could separately use Podia to sell an educational course or paid community about their industry, since Shopware has no dedicated course or membership builder and Podia has no physical-inventory or B2B commerce tooling.",
  "keyDifferences": [
    {
      "title": "Core Product Category",
      "toolA": "Podia is built specifically around Online Course Builder, Digital Downloads, Memberships & Community, and Coaching & Webinars products.",
      "toolB": "Shopware is a general ecommerce platform with B2B components, Omnichannel connect, and digital sales rooms, not a course or membership tool.",
      "whyItMatters": "Choosing the wrong category means bolting on workarounds instead of using features built for the job.",
      "benefitsWho": "Creators selling knowledge products benefit from Podia's focus, while retailers benefit from Shopware's commerce depth."
    },
    {
      "title": "Pricing Entry Point",
      "toolA": "Podia has a free plan (with a per-sale transaction fee) plus Mover from around $33/month and Shaker from around $75/month, both billed annually with no transaction fees.",
      "toolB": "Shopware's Community Edition is free and open source, but its hosted Rise plan starts at €600/month, with Evolve from €2,400/month and Beyond requiring a custom quote.",
      "whyItMatters": "The price gap between the two platforms' paid tiers is roughly two orders of magnitude, which reflects very different target customer sizes.",
      "benefitsWho": "Individual creators and small businesses benefit from Podia's low entry cost; funded retail and B2B operations benefit from Shopware's enterprise-grade (and enterprise-priced) tooling."
    },
    {
      "title": "Self-Hosting vs. Managed SaaS",
      "toolA": "Podia is a fully hosted web application with no self-hosted or open-source option.",
      "toolB": "Shopware offers a free, MIT-licensed, self-managed Community Edition alongside SaaS and PaaS deployment options.",
      "whyItMatters": "Self-hosting trades ongoing subscription cost for the engineering effort of running and maintaining the platform.",
      "benefitsWho": "Technical teams that want to avoid recurring SaaS fees benefit from Shopware's open-source route, which Podia does not offer."
    },
    {
      "title": "B2B and Enterprise Commerce Features",
      "toolA": "Podia has no documented B2B selling components; its Affiliate Marketing and Payments & Checkout tools are aimed at direct-to-consumer creator sales.",
      "toolB": "Shopware includes dedicated B2B components and digital sales rooms for business-to-business sales on its higher tiers.",
      "whyItMatters": "B2B commerce requires quoting, custom pricing, and account-based workflows that consumer storefronts typically don't support.",
      "benefitsWho": "Wholesalers and manufacturers selling to other businesses benefit from Shopware's B2B tooling, which has no Podia equivalent."
    },
    {
      "title": "Built-In Audience Tools",
      "toolA": "Podia includes native Email Marketing and an Affiliate Marketing program for driving and retaining an audience without a separate tool.",
      "toolB": "Shopware's documented marketing tooling centers on the Shopware Intelligence Copilot, Flow Builder, and SEO/analytics rather than creator-style email broadcasts or affiliate programs.",
      "whyItMatters": "Creators often need lightweight audience engagement tools bundled in, while retailers typically already run dedicated marketing stacks.",
      "benefitsWho": "Solo creators without a marketing team benefit from Podia's bundled email and affiliate features."
    }
  ],
  "featureMatrix": [
    {
      "group": "Selling & Product Types",
      "rows": [
        {
          "feature": "Online course builder",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Podia's Online Course Builder supports drip content and quizzes"
        },
        {
          "feature": "Digital downloads",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Memberships & community",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "B2B selling components",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Shopware B2B components ship on higher tiers"
        },
        {
          "feature": "Omnichannel / multi-storefront selling",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Shopware Omnichannel connect"
        }
      ]
    },
    {
      "group": "Pricing & Deployment",
      "rows": [
        {
          "feature": "Free plan/edition",
          "toolA": "available",
          "toolB": "available",
          "note": "Podia Free has a transaction fee; Shopware Community Edition is MIT-licensed self-hosted"
        },
        {
          "feature": "Entry-level paid plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Podia Mover ~$33/mo vs Shopware Rise from €600/mo"
        },
        {
          "feature": "Self-hosted / open-source option",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Custom/enterprise pricing tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Shopware Beyond is custom-quoted"
        }
      ]
    },
    {
      "group": "Marketing & Operations",
      "rows": [
        {
          "feature": "Native email marketing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Affiliate program",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Visual automation/rule builder",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Shopware Flow Builder and Rule Builder"
        },
        {
          "feature": "AI-assisted commerce management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Shopware Intelligence Copilot"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can I sell an online course on Shopware the way I can on Podia?",
      "answer": "Shopware's documented feature set is built around general ecommerce (CMS, B2B, omnichannel selling) and does not include a dedicated course builder, so Podia's Online Course Builder is the more direct fit for that use case."
    },
    {
      "question": "Is Podia cheaper than Shopware?",
      "answer": "Yes for most creators: Podia has a free plan and paid tiers from about $33/month, while Shopware's cheapest hosted plan, Rise, starts at €600/month; Shopware's free Community Edition is comparable in cost but requires self-hosting."
    },
    {
      "question": "Does Podia support B2B sales?",
      "answer": "Podia's documented features don't include B2B-specific tooling like quoting or account pricing; Shopware offers dedicated B2B components and digital sales rooms for that use case."
    },
    {
      "question": "Can Shopware be self-hosted for free?",
      "answer": "Yes, Shopware's Community Edition is free and open source under the MIT license and can be self-managed; Podia has no self-hosted or open-source option."
    },
    {
      "question": "Which platform is better for a solo creator just starting out?",
      "answer": "Podia is designed for that scenario, with a free plan to start selling digital downloads and paid tiers from around $33/month once transaction fees need to be removed; Shopware's pricing and B2B/omnichannel feature set target retail and enterprise sellers rather than solo creators."
    }
  ]
};

export default podiaVsShopwareContent;

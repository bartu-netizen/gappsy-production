import type { ToolComparisonContent } from './types';

const builderIoVsJimdoContent: ToolComparisonContent = {
  "verdict": "Builder.io is a visual development platform where AI-assisted edits map directly to production code and a headless CMS, aimed at engineering-led teams; Jimdo is a simplified, hosted website and online store builder aimed at small businesses and individuals who want a working site without touching code. They serve very different technical sophistication levels, so the comparison is really about how much engineering involvement a buyer wants.",
  "bestForToolA": "Engineering-led teams (Builder.io lists users like Everlane, Zapier, and J.Crew) that need visual edits to sync into real production components via Git, with SOC 2 Type II compliance and role-based access on higher tiers.",
  "bestForToolB": "Small businesses or solo owners wanting a hosted, no-code website or online store with built-in booking tools, smart forms, and Jimdo Local business-listing management, without needing a developer.",
  "whoNeedsBoth": "There isn't a natural scenario for using both together — they target opposite ends of the technical spectrum (Jimdo's hosted no-code site/store builder for small businesses versus Builder.io's code-integrated visual development platform for engineering teams), so most buyers would choose one, not combine them.",
  "keyDifferences": [
    {
      "title": "Target User & Technical Model",
      "toolA": "Builder.io's visual editor maps edits into real production components via Git-integrated collaboration, and its Fusion tool builds app/UI code from scratch or an existing repo.",
      "toolB": "Jimdo offers a no-code Website Builder editor for simple sites plus a code-customizable Creator editor for teams wanting more control, but no Git-based production code workflow is documented.",
      "whyItMatters": "Determines whether a developer or engineering team is required to get value from the tool.",
      "benefitsWho": "Engineering teams building on an existing codebase (Builder.io) versus non-technical small business owners (Jimdo)."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Builder.io has a Free tier at $0/user/month (1 user, 60 monthly AI agent credits), then Pro at $24/user/month (500 credits), Team at $40/user/month, and custom Enterprise, with extra AI credits at $25 per 500.",
      "toolB": "Jimdo offers a free plan with the ability to upgrade at any time; specific paid plan pricing isn't documented in the data reviewed, though monthly payment costs more than committing to a 12- or 24-month term.",
      "whyItMatters": "Builder.io's per-user-plus-AI-credit pricing scales predictably with team size and usage, while Jimdo's exact paid pricing needs to be checked directly on its site.",
      "benefitsWho": "Teams budgeting for AI-assisted visual editing at scale (Builder.io) versus small businesses comparing monthly-vs-annual site hosting costs (Jimdo)."
    },
    {
      "title": "E-Commerce & Business Tools",
      "toolA": "Not documented as including a dedicated online store builder; its enterprise integrations connect to commerce, search, and localization tools rather than including a native store.",
      "toolB": "Jimdo has a dedicated Online Store Builder, plus social selling integration for promoting and selling directly on Facebook and Instagram, online booking, and smart contact forms.",
      "whyItMatters": "Matters most for anyone whose primary goal is selling products online without extra integration work.",
      "benefitsWho": "Small merchants needing an out-of-the-box store (Jimdo) versus teams that already have a commerce platform they want to connect (Builder.io)."
    },
    {
      "title": "Compliance & Security",
      "toolA": "Builder.io states it is SOC 2 Type II compliant, with role-based access and SSO available on higher tiers.",
      "toolB": "Not documented for Jimdo.",
      "whyItMatters": "Relevant for enterprise buyers that require a documented security certification during procurement.",
      "benefitsWho": "Larger organizations or regulated industries needing a formal compliance attestation."
    },
    {
      "title": "Customer Support Model",
      "toolA": "Builder.io offers community support on its Free tier and priority support on Enterprise, implying tiered support levels.",
      "toolB": "Jimdo has no customer service phone hotline; support is limited to its help center, live chat, or email.",
      "whyItMatters": "Matters for teams that need guaranteed fast escalation paths versus those comfortable with self-service and chat support.",
      "benefitsWho": "Businesses needing phone-level support would need to look beyond Jimdo; Builder.io's Enterprise tier offers priority support."
    }
  ],
  "featureMatrix": [
    {
      "group": "Editing & Development Model",
      "rows": [
        {
          "feature": "Visual editor tied to production code",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "No-code website editor",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Jimdo Website Builder"
        },
        {
          "feature": "Code-customizable editor",
          "toolA": "available",
          "toolB": "available",
          "note": "Fusion vs. Jimdo Creator"
        },
        {
          "feature": "Git-integrated collaboration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "AI-assisted content/agent credits",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "60-500+ monthly credits by plan"
        }
      ]
    },
    {
      "group": "Commerce & Business Tools",
      "rows": [
        {
          "feature": "Dedicated online store builder",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Online booking",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Social selling (Facebook/Instagram)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Business listings management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Jimdo Local"
        }
      ]
    },
    {
      "group": "Plans, Pricing & Support",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "$0/user/month, 1 user vs. Jimdo free site"
        },
        {
          "feature": "SOC 2 Type II compliance",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Phone support",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "Jimdo explicitly has no phone hotline"
        },
        {
          "feature": "Multi-user seats on entry paid plan",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Up to 5 users on Builder.io Pro"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Builder.io have a free plan?",
      "answer": "Yes, $0/user/month for 1 user with 60 monthly AI agent credits."
    },
    {
      "question": "Can I start free on Jimdo and upgrade later?",
      "answer": "Yes, Jimdo lets you start with a free website and upgrade to a paid plan at any time from the site dashboard."
    },
    {
      "question": "Does Jimdo offer phone support?",
      "answer": "No. Per Jimdo's own listed limitations, support is available only through its help center, live chat, or email, with no phone hotline."
    },
    {
      "question": "Is Builder.io SOC 2 compliant?",
      "answer": "Yes, Builder.io states it is SOC 2 Type II compliant with role-based permissions and workflow controls."
    },
    {
      "question": "Which tool is better for selling products online?",
      "answer": "Jimdo has a dedicated Online Store Builder plus social selling integration for Facebook and Instagram. Builder.io's documented features focus on visual development and a headless CMS with enterprise commerce integrations, rather than a built-in store builder."
    },
    {
      "question": "Do I need a developer to use Builder.io?",
      "answer": "Builder.io's Fusion tool builds app/UI code from scratch or an existing repository and edits map into production components via Git, which points to more technical usage than Jimdo's no-code Website Builder, though Jimdo also offers a code-customizable Creator editor for teams wanting more control."
    }
  ]
};

export default builderIoVsJimdoContent;

import type { ToolComparisonContent } from './types';

const dixaVsGladlyContent: ToolComparisonContent = {
  "verdict": "Dixa and Gladly are both AI-driven, omnichannel customer service platforms, but they differ most in pricing transparency and how they organize AI configuration. Dixa publishes tiered per-agent pricing starting at €89/agent/month with its Mim AI agent billed separately per conversation, while Gladly requires a demo or sales conversation with no published self-serve pricing at all. Neither publicly documents company founding year or headquarters. The choice comes down to whether a transparent, self-serve pricing model or an enterprise sales-led relationship with named large-brand customers fits the buying process better.",
  "bestForToolA": "Teams that want transparent, published per-agent pricing and a visual no-code workflow/routing builder, starting at €89/agent/month.",
  "bestForToolB": "Larger enterprise brands comfortable with a sales-led buying process who want non-technical 'Guides' controls for business users to configure AI behavior without engineering help.",
  "whoNeedsBoth": "A multi-brand retailer expanding from a mid-market Dixa deployment toward enterprise-scale accounts might evaluate Gladly in parallel for flagship brands that need dedicated sales support and reference customers like Ulta Beauty or Nordstrom, while keeping Dixa for cost-transparent teams.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "Publishes three tiers: Growth (€89/agent/month), Ultimate (€139/agent/month), and Prime (€179/agent/month).",
      "toolB": "No published self-serve pricing; requires requesting a demo or contacting sales.",
      "whyItMatters": "Published pricing lets teams budget and compare without a sales cycle.",
      "benefitsWho": "Cost-conscious teams that want to self-serve evaluation."
    },
    {
      "title": "AI billing model",
      "toolA": "Mim AI Agent is billed separately at €0.35 per AI-handled conversation, on top of seat fees.",
      "toolB": "No separate AI usage fee is documented; pricing is entirely custom/quote-based.",
      "whyItMatters": "Per-conversation AI billing makes cost scale directly with automation volume, which is easier to forecast against ticket volume than an opaque custom quote.",
      "benefitsWho": "Finance teams that need to model AI cost against support volume."
    },
    {
      "title": "AI configuration approach",
      "toolA": "Visual, no-code routing and automation builder plus AI Co-Pilot for response suggestions and translation.",
      "toolB": "Plain-English 'Guides' let business users configure brand voice and AI behavior without engineering involvement.",
      "whyItMatters": "Both remove engineering dependency, but the specific mechanism (workflow builder vs. plain-English guides) affects who on the team can maintain it.",
      "benefitsWho": "Non-technical support ops managers responsible for day-to-day AI tuning."
    },
    {
      "title": "Customer proof points",
      "toolA": "States it is used by 850+ brands across 42 countries, with 35+ native integrations from the Growth plan up.",
      "toolB": "Publicly names large enterprise customers including Ulta Beauty, Nordstrom, TUMI, UGG, and Crate & Barrel.",
      "whyItMatters": "Reference customers signal the scale and industry a platform is proven at.",
      "benefitsWho": "Buyers evaluating vendor fit for their company size and sector."
    },
    {
      "title": "Advanced feature gating",
      "toolA": "SSO, advanced AI intent detection, and multi-org support are reserved for the top Prime tier (€179/agent/month).",
      "toolB": "Feature tiers are not published; enterprise capabilities are presumably negotiated as part of the sales process.",
      "whyItMatters": "Knowing exactly which tier unlocks SSO or advanced AI helps buyers price out the real cost of enterprise requirements in advance.",
      "benefitsWho": "IT and security teams evaluating SSO requirements before purchase."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Omnichannel support (phone, email, chat, social, WhatsApp)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI agent for autonomous resolution",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "No-code AI/workflow configuration",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Product catalog integration",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Conversation scoring / QA analytics",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Published self-serve pricing",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Free trial or free tier",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "SSO",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Dixa SSO is reserved for the Prime tier (€179/agent/month)."
        },
        {
          "feature": "Multiple organizations support",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Available on Dixa's Prime tier only."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Dixa offer a free plan?",
      "answer": "No, published plans start at €89/agent/month for the Growth tier; Gladly likewise has no listed free trial or free tier."
    },
    {
      "question": "How much does Gladly cost?",
      "answer": "Pricing isn't published; it requires requesting a demo or contacting sales, unlike Dixa's published per-agent tiers."
    },
    {
      "question": "What is Mim?",
      "answer": "Dixa's AI agent that autonomously resolves routine customer inquiries across chat, email, and WhatsApp, billed separately at €0.35 per conversation."
    },
    {
      "question": "What are Gladly's 'Guides'?",
      "answer": "Plain-English controls that let business users configure brand voice and AI behavior without needing engineering support."
    },
    {
      "question": "Which channels does Gladly support?",
      "answer": "Voice, chat, SMS, email, and social media, unified under one customer timeline."
    },
    {
      "question": "Who uses Gladly?",
      "answer": "Named customers include Ulta Beauty, Nordstrom, TUMI, UGG, and Crate & Barrel, per the company."
    }
  ]
};

export default dixaVsGladlyContent;

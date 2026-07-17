import type { ToolComparisonContent } from './types';

const delightchatVsInteraktContent: ToolComparisonContent = {
  "verdict": "DelightChat and Interakt both target WhatsApp-centric commerce messaging, but their entry points differ sharply: DelightChat has no permanent free plan (only a 14-day trial) and is purpose-built around deep Shopify order data, while Interakt has a genuinely free Starter tier (Instagram only, no WhatsApp) and adds a no-code chatbot builder plus an Enterprise-only RCS channel. The choice depends on whether Shopify-native order context or a truly free entry tier and broader no-code automation matters more.",
  "bestForToolA": "Shopify-based D2C brands that want order data surfaced directly inside support replies and a GPT-powered AI assistant included from the entry Startup plan.",
  "bestForToolB": "Teams that want to start on a genuinely free tier (even if WhatsApp-limited), need a no-code chatbot builder with branching logic, or plan to use the RCS channel at Enterprise scale.",
  "whoNeedsBoth": "A merchant selling on both Shopify and multiple non-Shopify storefronts might use DelightChat for Shopify order-aware WhatsApp support while trialing Interakt's free Instagram tier for a secondary brand or channel, since DelightChat's integration is Shopify-specific and Interakt's free tier excludes WhatsApp.",
  "keyDifferences": [
    {
      "title": "Free tier availability",
      "toolA": "No permanent free plan; only a 14-day free trial with a 1:1 onboarding call.",
      "toolB": "Free Starter tier available with unlimited owner-role agents, though limited to Instagram messaging (no WhatsApp), 15 custom fields, and 15 custom tags.",
      "whyItMatters": "A permanent free tier, even with channel limits, lets a business use the product indefinitely at no cost; a trial only allows evaluation.",
      "benefitsWho": "Very small businesses or those testing Instagram-only workflows before committing budget."
    },
    {
      "title": "Ecommerce platform depth",
      "toolA": "Deep, purpose-built Shopify integration that surfaces and lets agents modify order data while replying to customers.",
      "toolB": "Syncs product catalogs from Shopify, WooCommerce, and Excel, and includes a WhatsApp Store for commerce inside WhatsApp.",
      "whyItMatters": "DelightChat's integration is described as specifically deep for Shopify order data, while Interakt spans multiple ecommerce platforms with catalog sync and native WhatsApp commerce.",
      "benefitsWho": "Single-platform Shopify sellers (DelightChat) vs. multi-platform sellers (Interakt)."
    },
    {
      "title": "No-code automation",
      "toolA": "Automation rules are keyword-triggered auto-replies.",
      "toolB": "Dedicated no-code chatbot builder with drag-and-drop creation, with advanced branching flows on the Advanced plan ($69/month).",
      "whyItMatters": "A full chatbot builder with branching logic supports more complex self-service flows than keyword-triggered replies alone.",
      "benefitsWho": "Teams wanting to automate multi-step conversations without developer resources."
    },
    {
      "title": "Channel ceiling",
      "toolA": "Consolidates WhatsApp, Instagram, Facebook, Email, Live Chat, and Messenger, with mobile apps for iOS and Android.",
      "toolB": "Automates WhatsApp, Instagram, and RCS, with the RCS channel reserved for the Enterprise plan.",
      "whyItMatters": "DelightChat covers email and Messenger that Interakt's facts don't list, while Interakt adds an RCS channel DelightChat's facts don't mention.",
      "benefitsWho": "Teams needing email-based support (DelightChat) vs. teams wanting to adopt RCS messaging at scale (Interakt)."
    },
    {
      "title": "Pricing scale by team size",
      "toolA": "$29/month Startup (5 team members) up to $299/month Growth (50 team members), all plus separate WhatsApp messaging charges.",
      "toolB": "Free Starter up to $69/month Advanced for messaging plans, with a separately billed Sales CRM at ₹2,499/month.",
      "whyItMatters": "DelightChat's paid tiers scale with team size and Shopify store count; Interakt separates its CRM into an independently billed product.",
      "benefitsWho": "Growing support teams (DelightChat) vs. teams that only need a bolt-on sales CRM occasionally (Interakt)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "WhatsApp messaging",
          "toolA": "available",
          "toolB": "limited",
          "note": "Interakt's free tier excludes WhatsApp; it requires the Growth plan ($55/month)."
        },
        {
          "feature": "No-code chatbot builder",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI-powered response assistant",
          "toolA": "available",
          "toolB": "available",
          "note": "DelightChat's is GPT-powered; Interakt calls its version AI Agents."
        },
        {
          "feature": "RCS channel",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Interakt's RCS is Enterprise-only."
        },
        {
          "feature": "Mobile apps (iOS/Android)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Sales CRM",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Interakt's Sales CRM is a separately billed plan (₹2,499/month)."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Permanent free tier",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Both offer 14-day free trials on paid plans."
        },
        {
          "feature": "Multiple Shopify stores",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "DelightChat requires the Scale plan ($99/month) or above for more than 1 store."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does DelightChat have a free plan?",
      "answer": "No; it offers a 14-day free trial rather than a permanent free tier. Interakt, by contrast, has a free Starter tier limited to Instagram messaging."
    },
    {
      "question": "Does Interakt have a free plan?",
      "answer": "Yes, the Starter tier is free but limited to Instagram messaging, 15 custom fields, and 15 custom tags."
    },
    {
      "question": "Does Interakt support WhatsApp on the free plan?",
      "answer": "No, WhatsApp messaging requires the Growth plan ($55/month) or higher."
    },
    {
      "question": "Is DelightChat built for Shopify?",
      "answer": "Yes, it is marketed specifically to Shopify-based D2C brands with native order-data integration, while Interakt syncs catalogs from Shopify, WooCommerce, and Excel."
    },
    {
      "question": "Does DelightChat include AI features?",
      "answer": "Yes, a GPT-powered AI Assistant helps draft and refine support responses on all plans."
    },
    {
      "question": "How many businesses use Interakt?",
      "answer": "Interakt states it serves 50,000+ businesses globally."
    }
  ]
};

export default delightchatVsInteraktContent;

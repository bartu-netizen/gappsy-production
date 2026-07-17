import type { ToolComparisonContent } from './types';

const chaportVsSmartsuppContent: ToolComparisonContent = {
  "verdict": "Chaport and Smartsupp are both freemium live-chat platforms with AI add-ons, but they're built for different contexts: Chaport reserves its AI chatbot and knowledge base/FAQ bot for the top-tier Unlimited plan (€99/month) and leans on Zapier for broad integrations, while Smartsupp is built around e-commerce with 80+ native integrations (Shopify, WooCommerce, Magento) and a Mira AI shopping agent available on lower tiers but usage-capped per plan.",
  "bestForToolA": "Teams that want native desktop apps (Windows, macOS) alongside mobile, prioritize unlimited chat volume even on the free plan, and are fine paying a flat €99/month once they need chatbots and a knowledge base.",
  "bestForToolB": "E-commerce businesses that want native Shopify, WooCommerce, or Magento integrations, WhatsApp support, and an AI shopping agent (Mira) that can answer FAQs and recommend products without a human operator.",
  "whoNeedsBoth": "Agencies supporting clients across different platforms — some e-commerce, some general websites — may need familiarity with both, since Smartsupp's strengths are commerce-specific while Chaport's are more general-purpose messaging.",
  "keyDifferences": [
    {
      "title": "E-commerce integration depth",
      "toolA": "Chaport's integrations center on Zapier, connecting to 4,000+ apps generically.",
      "toolB": "Smartsupp has 80+ integrations specifically named for e-commerce, including Shopify, WordPress, WooCommerce, PrestaShop, Wix, and Magento.",
      "whyItMatters": "Native, named e-commerce integrations reduce setup friction compared to routing through a generic automation tool.",
      "benefitsWho": "Online stores on Shopify, WooCommerce, or Magento."
    },
    {
      "title": "AI chatbot access tier",
      "toolA": "Chaport's AI Chatbots and Knowledge Base/FAQ bot are reserved for the top Unlimited plan (€99/month).",
      "toolB": "Smartsupp's Mira AI Agent and AI Reply Assist are available from lower tiers but are usage-capped per plan (e.g., 50 AI reply assists/month on Solo), with the full AI Agent billed as a separate add-on starting at $16/month.",
      "whyItMatters": "Where AI sits in the plan structure changes the real entry cost for AI-assisted support.",
      "benefitsWho": "Smaller teams trying to access AI features without jumping to the most expensive plan."
    },
    {
      "title": "Free plan conversation limits",
      "toolA": "Chaport's free plan allows unlimited chats and websites, capped at 2 operators and 60-day chat history.",
      "toolB": "Smartsupp's free plan caps at 25 conversations/month and 14-day history, with 1 operator.",
      "whyItMatters": "Chaport's free tier supports higher chat volume, while Smartsupp's is more limited but includes WhatsApp and Messenger from the start.",
      "benefitsWho": "High-volume small teams evaluating a free tier's real capacity."
    },
    {
      "title": "Operator scaling",
      "toolA": "Chaport's Pro plan supports 4 operators, and Unlimited supports unlimited operators at a flat €99/month.",
      "toolB": "Smartsupp requires the Expert plan ($83-117/month) for 5+ operators.",
      "whyItMatters": "Teams with larger support staffs need to check where operator caps force an upgrade.",
      "benefitsWho": "Growing support teams adding operators over time."
    },
    {
      "title": "Desktop app support",
      "toolA": "Chaport offers native Windows and macOS desktop apps in addition to iOS and Android.",
      "toolB": "Smartsupp's facts mention only iOS and Android mobile apps, with no native desktop app noted.",
      "whyItMatters": "A native desktop app can matter for support agents who prefer a dedicated application over a browser tab.",
      "benefitsWho": "Support agents working primarily from desktop computers."
    }
  ],
  "featureMatrix": [
    {
      "group": "Chat & Messaging Channels",
      "rows": [
        {
          "feature": "Live chat widget",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "WhatsApp",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Facebook Messenger",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Telegram / Viber",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI Features",
      "rows": [
        {
          "feature": "AI chatbot",
          "toolA": "available",
          "toolB": "available",
          "note": "Chaport: Unlimited plan only. Smartsupp: Mira AI Agent, tiered/add-on."
        },
        {
          "feature": "AI-assisted operator replies",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Smartsupp: AI Reply Assist."
        },
        {
          "feature": "Knowledge base / FAQ bot",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Chaport: Unlimited plan."
        }
      ]
    },
    {
      "group": "Platforms & Integrations",
      "rows": [
        {
          "feature": "iOS/Android apps",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Native Windows/macOS desktop apps",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Zapier integration",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Native e-commerce platform integrations",
          "toolA": "not-documented",
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
          "toolB": "available",
          "note": "Chaport: 2 operators, unlimited chats, 60-day history. Smartsupp: 1 operator, 25 conversations/month, 14-day history."
        },
        {
          "feature": "Entry paid plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "Chaport: €29/month (Pro). Smartsupp: $17/month annual (Solo)."
        },
        {
          "feature": "Top named plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "Chaport: €99/month (Unlimited). Smartsupp: from $280/month (Ultimate)."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Chaport have a free plan?",
      "answer": "Yes, the Free plan includes 2 operators, unlimited chats and websites, and 60-day chat history."
    },
    {
      "question": "Does Smartsupp have a free plan?",
      "answer": "Yes, the Free plan includes 1 operator, 25 conversations per month, and 14-day chat history."
    },
    {
      "question": "Which plan includes chatbots on Chaport?",
      "answer": "Only the Unlimited plan (€99/month) includes AI chatbots and the knowledge base/FAQ bot."
    },
    {
      "question": "Does Smartsupp use AI?",
      "answer": "Yes, via a Mira AI Agent that answers FAQs and recommends products, plus an AI Reply Assist for human operators."
    },
    {
      "question": "What channels does Chaport support?",
      "answer": "Live chat plus Facebook, Telegram, Viber, and email messaging."
    },
    {
      "question": "What e-commerce platforms does Smartsupp integrate with?",
      "answer": "80+ integrations including Shopify, WordPress, WooCommerce, PrestaShop, Wix, and Magento."
    }
  ]
};

export default chaportVsSmartsuppContent;

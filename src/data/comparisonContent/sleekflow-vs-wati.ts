import type { ToolComparisonContent } from './types';

const sleekflowVsWatiContent: ToolComparisonContent = {
  "verdict": "SleekFlow and WATI both center on WhatsApp-driven customer engagement with AI agents, but SleekFlow spreads across ten-plus channels (WhatsApp, Instagram, TikTok, LINE, WeChat, and more) with a free tier, while WATI stays WhatsApp-first with deep click-to-WhatsApp ad tooling and no confirmed free trial. Pricing is also structured differently: SleekFlow is quoted in Hong Kong dollars starting free, while WATI's cheapest paid plan is $20/month billed annually. The right choice depends on channel breadth needs versus WhatsApp-specific ad-to-chat workflows.",
  "bestForToolA": "Teams needing broad channel coverage beyond WhatsApp (Instagram, Telegram, TikTok, LINE, Viber, WeChat, SMS, Outlook) and multi-language support across 12 UI languages, with a free plan to start.",
  "bestForToolB": "WhatsApp-first businesses that want click-to-WhatsApp ad conversion and an AI Support Agent stated to deflect up to 60% of customer queries, with pricing quoted directly in US dollars.",
  "whoNeedsBoth": "A brand running WhatsApp-heavy paid ad campaigns while also servicing customers across TikTok, LINE, or WeChat in other markets might use WATI for ad-to-WhatsApp conversion and SleekFlow for the broader multichannel inbox, since neither tool's channel list is a strict superset of the other's per the facts.",
  "keyDifferences": [
    {
      "title": "Free tier availability",
      "toolA": "Free plan available, limited to 3 users and 50 monthly active contacts.",
      "toolB": "No free plan or trial period confirmed on the pricing page; a pay-as-you-go single-user option (₹999 one-time) is offered instead.",
      "whyItMatters": "A genuine free tier changes the evaluation process compared to a paid pay-as-you-go entry point.",
      "benefitsWho": "Small teams wanting to test the product before spending."
    },
    {
      "title": "Channel breadth",
      "toolA": "Centralizes WhatsApp, Messenger, Instagram, Telegram, TikTok, LINE, Viber, WeChat, SMS, and Outlook.",
      "toolB": "WhatsApp Business API-focused, extending to Instagram, Facebook, SMS, and website chat.",
      "whyItMatters": "Businesses operating in markets where LINE, WeChat, or Viber are dominant need a platform that supports those channels natively.",
      "benefitsWho": "Multi-region brands operating across Asia-Pacific and beyond."
    },
    {
      "title": "Ad-to-chat conversion",
      "toolA": "Not documented as a distinct feature in the available facts.",
      "toolB": "Click-to-WhatsApp ads convert ad clicks directly into WhatsApp conversations.",
      "whyItMatters": "Direct ad-to-chat conversion tooling is a specific acquisition workflow not both platforms document.",
      "benefitsWho": "Performance marketing teams running WhatsApp-based ad campaigns."
    },
    {
      "title": "Pricing currency and structure",
      "toolA": "Pricing is listed in Hong Kong dollars (HK$); Pro AI starts at HK$399/user/month with a minimum of 3 users.",
      "toolB": "Pricing is listed in US dollars; Growth plan starts at $20/month billed annually ($25/month billed monthly) for 3 users.",
      "whyItMatters": "Currency and minimum-seat requirements affect real cost comparison for teams outside each platform's home market.",
      "benefitsWho": "Finance teams budgeting in USD or needing straightforward currency comparisons."
    },
    {
      "title": "Enterprise-only capabilities",
      "toolA": "Salesforce and custom integrations are Enterprise AI-only; analytics dashboards and webhooks/API require the Premium AI plan.",
      "toolB": "Advanced chatbots and AI agents (Astra add-on) are limited to the Pro plan and above; multiple WhatsApp numbers require the Business plan ($240+/month).",
      "whyItMatters": "Understanding which tier unlocks Salesforce integration, API access, or advanced chatbots avoids underestimating total cost.",
      "benefitsWho": "Teams planning to scale into advanced automation or CRM integration."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "WhatsApp messaging",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "No-code chatbot/flow builder",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI agent",
          "toolA": "available",
          "toolB": "available",
          "note": "WATI's AI Agents are part of the Astra add-on on Pro plan and above."
        },
        {
          "feature": "Click-to-WhatsApp ads",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "CRM integration (Shopify, HubSpot, Salesforce)",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "SleekFlow's Salesforce integration is Enterprise AI-only."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Permanent free tier",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Analytics dashboards",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "SleekFlow analytics requires the Premium AI plan."
        },
        {
          "feature": "Webhook/API access",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "SleekFlow API access requires the Premium AI plan."
        },
        {
          "feature": "Multiple WhatsApp numbers",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "WATI requires the Business plan ($240+/month) for multiple numbers."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does SleekFlow have a free plan?",
      "answer": "Yes, a free plan supports 3 user accounts and 50 monthly active contacts; WATI does not confirm a free plan or trial on its pricing page."
    },
    {
      "question": "What's the cheapest paid WATI plan?",
      "answer": "The Growth plan starts at $20/month billed annually ($25/month billed monthly), for 3 users."
    },
    {
      "question": "What's the cheapest paid SleekFlow plan?",
      "answer": "Pro AI starts at HK$399 per user/month, with a minimum of 3 users."
    },
    {
      "question": "What languages does the WATI interface support?",
      "answer": "Portuguese, Spanish, English, Simplified and Traditional Chinese, and Arabic."
    },
    {
      "question": "What languages does SleekFlow support?",
      "answer": "Arabic, German, English, Spanish, French, Indonesian, Italian, Malay, Dutch, Portuguese, and Simplified/Traditional Chinese, spanning 12 UI languages total."
    },
    {
      "question": "Does WATI have AI features?",
      "answer": "Yes, \"Wati AI\" includes Copilot, AI Agents, and Bring Your Own Agent (BYOA) support, with the AI Support Agent stated to deflect up to 60% of customer queries."
    }
  ]
};

export default sleekflowVsWatiContent;

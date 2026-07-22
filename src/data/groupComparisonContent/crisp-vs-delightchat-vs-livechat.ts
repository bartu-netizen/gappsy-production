import type { GroupComparisonContent } from './types';

const crispVsDelightchatVsLivechatContent: GroupComparisonContent = {
  "verdict": "Crisp, DelightChat, and LiveChat all sit in the live chat and customer messaging category, but they target different buyers. Crisp is the budget-friendly generalist, with a genuinely free tier and per-workspace rather than per-seat pricing. DelightChat is a specialist for D2C and Shopify e-commerce brands built around the official WhatsApp Business API. LiveChat is the most established and financially transparent of the three, backed by a publicly traded parent company and a broader AI-plus-human product suite. The best fit depends heavily on whether WhatsApp commerce, budget, or enterprise stability matters most.",
  "bestFor": {
    "crisp": "Budget-conscious small teams wanting a genuinely free tier and per-workspace, not per-seat, pricing that unifies chat, email, and an AI chatbot.",
    "delightchat": "D2C and e-commerce brands, especially Shopify merchants, that need official WhatsApp Business API messaging paired with order-context support.",
    "livechat": "Mid-market and enterprise support teams wanting a financially stable, publicly traded vendor with an AI-plus-human inbox and a broader product suite spanning chat, chatbots, and ticketing."
  },
  "highlights": [
    {
      "title": "Crisp is the only one with a permanent free plan",
      "description": "Crisp's Free plan supports 2 agent seats with a real shared inbox and mobile apps at no time limit, while DelightChat and LiveChat both rely on 14-day free trials before requiring payment.",
      "toolSlugs": [
        "crisp",
        "delightchat",
        "livechat"
      ]
    },
    {
      "title": "DelightChat is purpose-built for WhatsApp commerce on Shopify",
      "description": "DelightChat uses the official Meta WhatsApp Business API for compliant broadcasts and automation, and pulls Shopify order history directly into the conversation view, a depth of e-commerce-specific integration neither Crisp nor LiveChat's documented features match.",
      "toolSlugs": [
        "delightchat"
      ]
    },
    {
      "title": "LiveChat is backed by a publicly traded parent company",
      "description": "LiveChat is developed by Text S.A., listed on the Warsaw Stock Exchange with roughly 90 million dollars in trailing revenue, giving it a level of financial transparency and stability that Crisp and DelightChat, both privately held, do not offer.",
      "toolSlugs": [
        "livechat"
      ]
    },
    {
      "title": "Pricing models differ significantly across the three",
      "description": "Crisp prices per workspace rather than per seat, DelightChat uses flat monthly tiers from 29 dollars, and LiveChat prices per person starting at 19 dollars per month for a single user and scaling to 49 or 79 dollars per person on higher tiers.",
      "toolSlugs": [
        "crisp",
        "delightchat",
        "livechat"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing Model",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "crisp": "available",
            "delightchat": "unavailable",
            "livechat": "unavailable"
          }
        },
        {
          "feature": "Per-workspace, not per-seat, pricing",
          "statuses": {
            "crisp": "available",
            "delightchat": "not-documented",
            "livechat": "unavailable"
          },
          "note": "LiveChat's Team and Business tiers are priced per person; DelightChat's tiers are flat monthly fees without a clearly stated per-seat structure."
        }
      ]
    },
    {
      "group": "Channel Coverage",
      "rows": [
        {
          "feature": "Official WhatsApp Business API integration",
          "statuses": {
            "crisp": "not-documented",
            "delightchat": "available",
            "livechat": "not-documented"
          }
        },
        {
          "feature": "Unified inbox spanning chat, email, and social or messaging channels",
          "statuses": {
            "crisp": "available",
            "delightchat": "available",
            "livechat": "limited"
          },
          "note": "LiveChat is primarily chat-centric, adding SMS and Apple Messages for Business on higher tiers rather than a full social-channel inbox."
        }
      ]
    },
    {
      "group": "Automation and AI",
      "rows": [
        {
          "feature": "AI chatbot or AI-assisted replies",
          "statuses": {
            "crisp": "available",
            "delightchat": "available",
            "livechat": "available"
          }
        },
        {
          "feature": "Real-time conversation translation",
          "statuses": {
            "crisp": "available",
            "delightchat": "not-documented",
            "livechat": "not-documented"
          },
          "note": "Crisp's LiveTranslate feature translates conversations across 50-plus languages."
        }
      ]
    },
    {
      "group": "Support Depth",
      "rows": [
        {
          "feature": "Full ticketing system included",
          "statuses": {
            "crisp": "available",
            "delightchat": "not-documented",
            "livechat": "not-documented"
          },
          "note": "Crisp's ticketing system is on its top Plus tier; LiveChat sells ticketing separately as a sibling product called HelpDesk."
        },
        {
          "feature": "Staffing and workload prediction",
          "statuses": {
            "crisp": "not-documented",
            "delightchat": "not-documented",
            "livechat": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Crisp, DelightChat, and LiveChat has a free plan?",
      "answer": "Crisp, whose Free plan supports 2 agent seats, a shared inbox, and mobile apps with no time limit. DelightChat and LiveChat both operate on 14-day free trials rather than a permanent free tier."
    },
    {
      "question": "Which is best for WhatsApp-based e-commerce support?",
      "answer": "DelightChat, since it is built around the official WhatsApp Business API and pulls Shopify order history directly into the conversation view, letting agents answer order questions without switching tabs."
    },
    {
      "question": "How does pricing differ between the three?",
      "answer": "Crisp prices per workspace rather than per agent seat, which can be cheaper for larger teams. DelightChat uses flat monthly tiers starting at 29 dollars. LiveChat prices per person, starting at 19 dollars per month for a single user on Starter and rising to 49 or 79 dollars per person on Team and Business."
    },
    {
      "question": "Which vendor is the most financially established?",
      "answer": "LiveChat, developed by Text S.A., a company publicly traded on the Warsaw Stock Exchange since 2014 with roughly 90 million dollars in trailing-twelve-month revenue as of mid-2026."
    },
    {
      "question": "Do all three offer AI chatbot features?",
      "answer": "Yes. Crisp includes an AI chatbot and AI-assisted replies metered by monthly credits, DelightChat offers an AI chatbot for automated first-response handling before human handoff, and LiveChat markets an AI-plus-human inbox with AI agents working alongside human agents."
    },
    {
      "question": "Is LiveChat the same company as LiveAgent?",
      "answer": "No, they are separate, unrelated companies that happen to have similar product names in the same market category. LiveChat is developed by Text S.A. of Poland, while LiveAgent is built by Quality Unit, based in Slovakia."
    }
  ]
};

export default crispVsDelightchatVsLivechatContent;

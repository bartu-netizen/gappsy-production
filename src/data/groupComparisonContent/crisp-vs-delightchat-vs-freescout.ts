import type { GroupComparisonContent } from './types';

const crispVsDelightchatVsFreescoutContent: GroupComparisonContent = {
  "verdict": "Crisp, DelightChat, and FreeScout are all built to unify scattered support conversations into a single inbox, but they target different budgets and workflows: Crisp is a broad, per-workspace-priced omnichannel platform with an AI chatbot and translation built in, DelightChat is purpose-built for D2C and Shopify brands that live on the official WhatsApp Business API, and FreeScout is a free, self-hosted, Help Scout-style help desk with unlimited agents and an a-la-carte module marketplace. Choosing between them really means choosing between hosted SaaS convenience (Crisp), WhatsApp-commerce depth (DelightChat), or total cost control through self-hosting (FreeScout).",
  "bestFor": {
    "crisp": "SaaS and e-commerce support teams that want a hosted, all-in-one live chat, email, and AI chatbot inbox with a genuinely free permanent tier.",
    "delightchat": "D2C and Shopify e-commerce brands that need official WhatsApp Business API support combined with WhatsApp broadcast marketing and order-context lookups.",
    "freescout": "Budget-conscious or data-sovereignty-focused teams that want a self-hosted help desk with unlimited agents and no recurring per-seat licensing fees."
  },
  "highlights": [
    {
      "title": "Unlimited Agents at No Licensing Cost",
      "description": "FreeScout's open-source core has no built-in limit on agents, tickets, or mailboxes, letting growing support teams avoid the per-seat fees charged by Crisp and DelightChat, at the cost of having to self-host.",
      "toolSlugs": [
        "freescout"
      ]
    },
    {
      "title": "Official WhatsApp Business API and Commerce Automation",
      "description": "DelightChat is built around Meta's official WhatsApp Business API, combining support with abandoned-cart recovery, order updates, and broadcast campaigns, plus inline Shopify order lookups that Crisp and FreeScout do not offer.",
      "toolSlugs": [
        "delightchat"
      ]
    },
    {
      "title": "Per-Workspace Pricing With a Real Free Tier",
      "description": "Crisp prices by workspace rather than strictly by agent seat, and its Free plan (2 seats, shared inbox, mobile apps) has no time limit, unlike DelightChat, which only offers a 14-day trial.",
      "toolSlugs": [
        "crisp"
      ]
    },
    {
      "title": "A-la-Carte Module Marketplace",
      "description": "FreeScout keeps its core free and lets teams add live chat, a CRM, WhatsApp and Slack integration, or SSO individually through more than 50 optional paid modules, rather than bundling everything into a small number of rigid tiers.",
      "toolSlugs": [
        "freescout"
      ]
    },
    {
      "title": "Built-In AI Chatbot Support",
      "description": "Both Crisp and DelightChat include an AI chatbot for automating first-response handling before escalating to a human agent, a capability FreeScout's free core does not document.",
      "toolSlugs": [
        "crisp",
        "delightchat"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Inbox and Channels",
      "rows": [
        {
          "feature": "Shared team inbox across channels",
          "statuses": {
            "crisp": "available",
            "delightchat": "available",
            "freescout": "available"
          }
        },
        {
          "feature": "Native official WhatsApp Business API",
          "statuses": {
            "crisp": "not-documented",
            "delightchat": "available",
            "freescout": "limited"
          },
          "note": "FreeScout supports WhatsApp only through an optional paid module; DelightChat is built around it natively."
        },
        {
          "feature": "Website live chat widget",
          "statuses": {
            "crisp": "available",
            "delightchat": "available",
            "freescout": "limited"
          },
          "note": "FreeScout offers live chat as an optional paid module rather than a built-in core feature."
        }
      ]
    },
    {
      "group": "Automation and AI",
      "rows": [
        {
          "feature": "AI chatbot for automated first response",
          "statuses": {
            "crisp": "available",
            "delightchat": "available",
            "freescout": "not-documented"
          }
        },
        {
          "feature": "Marketing and commerce automation (abandoned cart, broadcasts)",
          "statuses": {
            "crisp": "not-documented",
            "delightchat": "available",
            "freescout": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Deployment and Cost Model",
      "rows": [
        {
          "feature": "Self-hosted deployment option",
          "statuses": {
            "crisp": "unavailable",
            "delightchat": "unavailable",
            "freescout": "available"
          }
        },
        {
          "feature": "Permanent free tier with no trial expiration",
          "statuses": {
            "crisp": "available",
            "delightchat": "unavailable",
            "freescout": "available"
          },
          "note": "DelightChat offers only a 14-day free trial rather than an ongoing free plan."
        },
        {
          "feature": "Unlimited agents or seats included at no cost",
          "statuses": {
            "crisp": "unavailable",
            "delightchat": "unavailable",
            "freescout": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has a genuinely free plan I can use indefinitely?",
      "answer": "Crisp's Free plan (2 agent seats, shared inbox, mobile apps) has no time limit, and FreeScout's open-source core is free forever if self-hosted, with unlimited agents. DelightChat only offers a 14-day free trial before requiring a paid plan."
    },
    {
      "question": "Which tool is best for a Shopify brand that relies heavily on WhatsApp?",
      "answer": "DelightChat is purpose-built for this use case, combining the official WhatsApp Business API with Shopify order-context lookups and WhatsApp marketing automation like abandoned-cart recovery, features Crisp and FreeScout don't offer natively."
    },
    {
      "question": "Do I need technical skills to run FreeScout?",
      "answer": "Yes. FreeScout is self-hosted PHP and Laravel software, so a team needs to install it (via Docker, a one-click installer, or manual setup) and handle ongoing server maintenance, backups, and updates, unlike the fully hosted Crisp and DelightChat."
    },
    {
      "question": "Which platforms include an AI chatbot out of the box?",
      "answer": "Both Crisp and DelightChat include AI chatbot capabilities for automating first-response handling before a human agent takes over. FreeScout's free core does not document a built-in AI chatbot, though live chat and other functionality can be added through paid modules."
    },
    {
      "question": "How does pricing scale as a support team grows?",
      "answer": "Crisp prices per workspace rather than strictly per agent, which can be cheaper for larger teams on a single workspace. DelightChat's tiers (Startup, Scale, Growth) scale by conversation volume, team seats, and automation features. FreeScout's core is free with unlimited agents, but advanced functionality is added through separately priced modules."
    },
    {
      "question": "Can I migrate an existing Help Scout account to FreeScout?",
      "answer": "Yes. FreeScout provides specific migration documentation for importing mailboxes, conversations, and customer data from Help Scout, and it was originally created as a free alternative after Help Scout discontinued its free plan."
    }
  ]
};

export default crispVsDelightchatVsFreescoutContent;

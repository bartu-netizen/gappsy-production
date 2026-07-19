import type { GroupComparisonContent } from './types';

const gorgiasVsHappyfoxVsKommunicateContent: GroupComparisonContent = {
  "verdict": "All three combine AI automation with human-agent support, but they are built for different support environments. Gorgias is purpose-built for ecommerce, pairing an AI Support Agent with an AI Shopping Assistant and deep, real-time Shopify data access. HappyFox is the broadest of the three, spanning customer service, IT, and HR ticketing on one platform, with an unlimited-agent flat-fee pricing option that suits larger, high-volume teams. Kommunicate is designed to sit on top of an existing helpdesk like Zendesk or Freshdesk, adding an AI chatbot with human handoff across web, mobile, and messaging channels rather than replacing the underlying ticketing system.",
  "bestFor": {
    "gorgias": "Ecommerce and DTC brands, especially those on Shopify, that want AI-powered support and pre-purchase sales assistance built around live order, inventory, and customer data.",
    "happyfox": "Organizations that need one platform spanning customer support, IT, and HR ticketing, especially larger or high-volume support teams that want predictable flat-fee pricing through Unlimited Agent Plans.",
    "kommunicate": "Small to mid-market support teams that already run Zendesk or Freshdesk and want to add an AI chatbot with human handoff across web, mobile, WhatsApp, Telegram, and Instagram without replacing their existing helpdesk."
  },
  "highlights": [
    {
      "title": "Gorgias is the only one built for ecommerce sales, not just support",
      "description": "Gorgias's AI Agent includes a distinct Shopping Assistant role that engages pre-purchase site visitors with product recommendations and discounts, a capability neither HappyFox nor Kommunicate document.",
      "toolSlugs": [
        "gorgias"
      ]
    },
    {
      "title": "HappyFox is the only one with a flat-fee unlimited-agent option",
      "description": "HappyFox's Unlimited Agent Plans charge a flat annual fee with a fixed yearly ticket allowance instead of per-agent billing, aimed at teams past roughly 20 to 25 agents; Gorgias and Kommunicate both scale price with ticket or conversation volume instead.",
      "toolSlugs": [
        "happyfox"
      ]
    },
    {
      "title": "Kommunicate layers onto existing helpdesks rather than replacing them",
      "description": "Kommunicate documents native integrations with Zendesk and Freshdesk so a team can add AI chat and automation on top of its current ticketing system, whereas Gorgias and HappyFox are each designed as the primary, standalone helpdesk.",
      "toolSlugs": [
        "kommunicate"
      ]
    },
    {
      "title": "Pricing models differ: per-ticket, per-agent, and per-conversation",
      "description": "Gorgias bills by billable ticket volume regardless of agent count, HappyFox's core Help Desk plans bill per agent (with a flat-fee alternative at scale), and Kommunicate bills by monthly conversation volume with agent and team-member counts bundled into each tier.",
      "toolSlugs": [
        "gorgias",
        "happyfox",
        "kommunicate"
      ]
    },
    {
      "title": "Free trial terms vary",
      "description": "HappyFox offers a documented 14-day free trial with no credit card required and Kommunicate offers a documented 30-day free trial with no credit card required; Gorgias's free trial terms are not documented in the available data, though its Starter plan starts at just $10 per month.",
      "toolSlugs": [
        "happyfox",
        "kommunicate",
        "gorgias"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI agent or copilot for ticket resolution",
          "statuses": {
            "gorgias": "available",
            "happyfox": "available",
            "kommunicate": "available"
          }
        },
        {
          "feature": "AI-driven pre-purchase sales assistance",
          "statuses": {
            "gorgias": "available",
            "happyfox": "unavailable",
            "kommunicate": "unavailable"
          },
          "note": "Gorgias's Shopping Assistant role is unique to its ecommerce-focused AI Agent."
        },
        {
          "feature": "Documented bot-to-human handoff",
          "statuses": {
            "gorgias": "not-documented",
            "happyfox": "not-documented",
            "kommunicate": "available"
          },
          "note": "Kommunicate explicitly markets seamless escalation from bot to live agent with preserved context."
        }
      ]
    },
    {
      "group": "Channels and Ecommerce Fit",
      "rows": [
        {
          "feature": "Omnichannel messaging (chat, social, messaging apps)",
          "statuses": {
            "gorgias": "available",
            "happyfox": "available",
            "kommunicate": "available"
          }
        },
        {
          "feature": "Native ecommerce platform integration (e.g. Shopify)",
          "statuses": {
            "gorgias": "available",
            "happyfox": "not-documented",
            "kommunicate": "not-documented"
          },
          "note": "Gorgias holds Shopify Premier Partner status and also supports BigCommerce, Magento, and WooCommerce."
        },
        {
          "feature": "Integrates as an add-on with third-party helpdesks",
          "statuses": {
            "gorgias": "unavailable",
            "happyfox": "unavailable",
            "kommunicate": "available"
          },
          "note": "Gorgias and HappyFox are each a standalone helpdesk rather than a layer on top of another one; Kommunicate documents integrations with Zendesk and Freshdesk specifically."
        }
      ]
    },
    {
      "group": "Pricing and Trial",
      "rows": [
        {
          "feature": "Per-agent seat pricing available",
          "statuses": {
            "gorgias": "unavailable",
            "happyfox": "available",
            "kommunicate": "limited"
          },
          "note": "Kommunicate bundles a set number of team members into each tier, with additional team members priced individually, rather than pure per-seat billing."
        },
        {
          "feature": "Unlimited-agent flat-fee pricing option",
          "statuses": {
            "gorgias": "not-documented",
            "happyfox": "available",
            "kommunicate": "not-documented"
          }
        },
        {
          "feature": "Documented free trial with no credit card",
          "statuses": {
            "gorgias": "not-documented",
            "happyfox": "available",
            "kommunicate": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is best suited to ecommerce brands?",
      "answer": "Gorgias, which was purpose-built for ecommerce support with deep Shopify integration and an AI Shopping Assistant that engages pre-purchase visitors, in addition to its support automation."
    },
    {
      "question": "Which one offers a free trial, and how long is it?",
      "answer": "HappyFox documents a 14-day free trial with no credit card required, and Kommunicate documents a 30-day free trial with no credit card required. Gorgias's trial terms are not documented in the available data, though its Starter plan begins at $10 per month."
    },
    {
      "question": "How does pricing differ between the three?",
      "answer": "Gorgias prices by billable ticket volume regardless of team size, HappyFox's core Help Desk plans price per agent (with an Unlimited Agent flat-fee alternative for larger teams), and Kommunicate prices by monthly conversation volume with a set number of AI agents and team members bundled into each tier."
    },
    {
      "question": "Can Kommunicate be used alongside an existing Zendesk or Freshdesk setup?",
      "answer": "Yes, Kommunicate documents native integrations with Zendesk and Freshdesk, letting a team add AI chat and automation without replacing its underlying ticketing system."
    },
    {
      "question": "Which platform is best for a team that also needs IT or HR ticketing, not just customer support?",
      "answer": "HappyFox, which offers a dedicated Service Desk for ITIL-style IT support alongside its Help Desk, and documents use across customer service, IT, and HR ticketing on a shared platform."
    },
    {
      "question": "Do all three include AI-generated responses out of the box?",
      "answer": "Yes. Gorgias's AI Agent, HappyFox's AI Copilot suite, and Kommunicate's Kompose chatbot builder all provide AI-assisted responses on their respective plans, though Gorgias is the only one that also extends AI into pre-purchase sales assistance."
    }
  ]
};

export default gorgiasVsHappyfoxVsKommunicateContent;

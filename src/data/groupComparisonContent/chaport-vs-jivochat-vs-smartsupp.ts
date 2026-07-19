import type { GroupComparisonContent } from './types';

const chaportVsJivochatVsSmartsuppContent: GroupComparisonContent = {
  "verdict": "Chaport, JivoChat, and Smartsupp all target small and mid-sized businesses that want affordable live chat without committing to a full helpdesk suite, but they differ in channel breadth and pricing structure. JivoChat offers the broadest native omnichannel coverage (WhatsApp, Telegram, Instagram, calls) plus a built-in CRM, Chaport pairs a generous flat-rate free and Pro tier with Viber and Telegram support, and Smartsupp leans into AI-assisted shopping engagement through its Mira agent for e-commerce. None is a full replacement for an enterprise support platform, so the right pick depends on which channels and automation level a team actually needs.",
  "bestFor": {
    "chaport": "Small teams wanting a generous free tier and affordable flat-rate pricing without per-agent costs.",
    "jivochat": "Businesses that want a true omnichannel inbox (WhatsApp, Telegram, Instagram, calls) plus a built-in CRM and telephony in one platform.",
    "smartsupp": "E-commerce stores that want live chat paired with an AI shopping assistant to reduce cart abandonment."
  },
  "highlights": [
    {
      "title": "JivoChat has the broadest native channel coverage",
      "description": "JivoChat unifies website chat, WhatsApp, Telegram, Instagram, Facebook Messenger, Viber, email, and phone calls in one shared inbox, more channels than either Chaport or Smartsupp bundle natively.",
      "toolSlugs": [
        "jivochat"
      ]
    },
    {
      "title": "Chaport and JivoChat both offer more generous free tiers than Smartsupp",
      "description": "Chaport's free plan supports 2 operators with unlimited chats and websites, and JivoChat's free plan supports up to 5 agents, while Smartsupp's free plan caps out at 25 conversations per month for a single operator.",
      "toolSlugs": [
        "chaport",
        "jivochat",
        "smartsupp"
      ]
    },
    {
      "title": "All three now sell AI chatbot capability",
      "description": "Chaport bundles chatbots and an FAQ bot into its top Unlimited tier, JivoChat and Smartsupp both offer an AI agent (JivoChat's AI Agent and Smartsupp's Mira) as a paid add-on rather than a free-tier feature.",
      "toolSlugs": [
        "chaport",
        "jivochat",
        "smartsupp"
      ]
    },
    {
      "title": "Chaport prices its Pro plan flat rather than per agent",
      "description": "Chaport's Pro tier is $29/month for 4 operators as a flat rate, whereas JivoChat and Smartsupp both bill per agent, which can cost more as a team grows.",
      "toolSlugs": [
        "chaport"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Plan and Core Chat",
      "rows": [
        {
          "feature": "Usable free plan",
          "statuses": {
            "chaport": "available",
            "jivochat": "available",
            "smartsupp": "limited"
          },
          "note": "Smartsupp's free plan caps out at 25 conversations per month for one operator."
        },
        {
          "feature": "Multichannel messaging beyond website chat",
          "statuses": {
            "chaport": "available",
            "jivochat": "available",
            "smartsupp": "available"
          }
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI chatbot or AI agent",
          "statuses": {
            "chaport": "available",
            "jivochat": "available",
            "smartsupp": "available"
          },
          "note": "JivoChat and Smartsupp offer their AI agent as a paid add-on; Chaport's is bundled into its top tier."
        },
        {
          "feature": "Automation and routing rules",
          "statuses": {
            "chaport": "available",
            "jivochat": "available",
            "smartsupp": "available"
          }
        }
      ]
    },
    {
      "group": "Advanced Channels and CRM",
      "rows": [
        {
          "feature": "Built-in CRM",
          "statuses": {
            "chaport": "unavailable",
            "jivochat": "available",
            "smartsupp": "not-documented"
          }
        },
        {
          "feature": "Telephony or click-to-call",
          "statuses": {
            "chaport": "unavailable",
            "jivochat": "available",
            "smartsupp": "unavailable"
          }
        },
        {
          "feature": "Video calls",
          "statuses": {
            "chaport": "unavailable",
            "jivochat": "available",
            "smartsupp": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these live chat tools has the best free plan?",
      "answer": "Chaport and JivoChat both offer more usable free plans (2 operators with unlimited chats for Chaport, up to 5 agents for JivoChat) than Smartsupp, whose free plan is capped at 25 conversations per month."
    },
    {
      "question": "Do any of them support WhatsApp?",
      "answer": "JivoChat and Smartsupp both integrate WhatsApp. Chaport's multichannel support centers on Facebook, Viber, Telegram, and email rather than WhatsApp."
    },
    {
      "question": "Which one includes a built-in CRM?",
      "answer": "JivoChat is the only one of the three with a built-in, lightweight CRM for tracking leads and conversation history automatically."
    },
    {
      "question": "Are these tools priced per agent?",
      "answer": "JivoChat and Smartsupp both bill per agent on their paid tiers. Chaport's Pro plan is a flat rate covering up to 4 operators rather than a per-agent charge."
    },
    {
      "question": "Which is best for e-commerce stores specifically?",
      "answer": "Smartsupp positions itself most directly around e-commerce, combining live chat with its Mira AI agent and proactive triggers designed to reduce cart abandonment."
    }
  ]
};

export default chaportVsJivochatVsSmartsuppContent;

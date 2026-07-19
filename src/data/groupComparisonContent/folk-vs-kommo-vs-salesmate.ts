import type { GroupComparisonContent } from './types';

const folkVsKommoVsSalesmateContent: GroupComparisonContent = {
  "verdict": "Folk, Kommo, and Salesmate are all per-seat CRMs with AI layered on top, but each bundles a different core communication capability. Salesmate is the only one of the three with native calling, texting, and a power dialer built into its paid plans rather than requiring a separate telephony add-on. Kommo instead centers on unifying WhatsApp, Instagram, and other messaging channels into one inbox with a no-code Salesbot builder. Folk skips both voice and chat channels as its differentiator and instead leads with folkX, a browser extension for one-click LinkedIn contact capture and AI enrichment. None of the three has a permanent free plan, though all offer trial periods, so the decision mostly comes down to which communication channel matters most to your sales process.",
  "bestFor": {
    "folk": "Small teams that spend their time capturing and enriching relationships from LinkedIn and want a flexible, spreadsheet-style CRM.",
    "kommo": "Sales teams whose leads come primarily through WhatsApp, Instagram, and other messaging channels and want a no-code chatbot builder.",
    "salesmate": "Teams that want native calling, texting, and support ticketing bundled into the CRM instead of paying for a separate telephony or help-desk tool."
  },
  "highlights": [
    {
      "title": "Native voice calling only on Salesmate",
      "description": "Salesmate bundles a power dialer, voicemail drop, SMS, and call transcription directly into its Business tier and above, a native telephony layer that neither Folk nor Kommo's documented feature sets include.",
      "toolSlugs": [
        "salesmate"
      ]
    },
    {
      "title": "Messaging channels versus voice channels",
      "description": "Kommo unifies WhatsApp, Instagram, Facebook Messenger, and Telegram into one inbox, while Salesmate focuses on native phone calling and texting; Folk instead syncs with WhatsApp and email but doesn't lead with either channel.",
      "toolSlugs": [
        "kommo",
        "salesmate",
        "folk"
      ]
    },
    {
      "title": "Every AI assistant works differently",
      "description": "Folk's Magic Fields auto-fill contact data, Kommo's AI Agent drafts chat replies and summarizes conversations, and Salesmate's Sandy AI assistant plus newer AI agents focus on lead qualification and meeting booking.",
      "toolSlugs": [
        "folk",
        "kommo",
        "salesmate"
      ]
    },
    {
      "title": "Support ticketing bundled with Salesmate",
      "description": "Salesmate's Pro tier adds a team inbox and basic support ticketing alongside the sales CRM, a combined sales-and-support layer that Folk and Kommo don't document.",
      "toolSlugs": [
        "salesmate"
      ]
    },
    {
      "title": "LinkedIn capture remains Folk's edge",
      "description": "Folk's folkX extension captures and AI-enriches LinkedIn contacts with one click, a workflow neither Kommo nor Salesmate's feature sets replicate.",
      "toolSlugs": [
        "folk"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Native Communication Tools",
      "rows": [
        {
          "feature": "Native calling, texting, and power dialer",
          "statuses": {
            "folk": "not-documented",
            "kommo": "not-documented",
            "salesmate": "available"
          }
        },
        {
          "feature": "Team or shared inbox",
          "statuses": {
            "folk": "not-documented",
            "kommo": "available",
            "salesmate": "available"
          },
          "note": "Salesmate's team inbox is available from its Pro tier up."
        },
        {
          "feature": "Support ticketing",
          "statuses": {
            "folk": "not-documented",
            "kommo": "not-documented",
            "salesmate": "available"
          },
          "note": "Salesmate's ticketing is available from its Pro tier up."
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI assistant or agent",
          "statuses": {
            "folk": "available",
            "kommo": "available",
            "salesmate": "available"
          }
        },
        {
          "feature": "No-code chatbot or workflow automation builder",
          "statuses": {
            "folk": "not-documented",
            "kommo": "available",
            "salesmate": "limited"
          },
          "note": "Salesmate offers credit-based smart flow automation rather than a conversational chatbot builder."
        }
      ]
    },
    {
      "group": "Trial and Capture",
      "rows": [
        {
          "feature": "Free trial without credit card",
          "statuses": {
            "folk": "available",
            "kommo": "available",
            "salesmate": "available"
          }
        },
        {
          "feature": "Browser extension for contact capture",
          "statuses": {
            "folk": "available",
            "kommo": "not-documented",
            "salesmate": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Folk, Kommo, and Salesmate includes native phone calling?",
      "answer": "Salesmate is the only one of the three that bundles native calling, texting, power dialing, and voicemail drop directly into its paid plans, with power dialer features available from the Business tier up. Folk and Kommo don't document native voice calling."
    },
    {
      "question": "Do any of these have a free plan?",
      "answer": "No, none of the three offers a permanent free plan. Folk offers a 14-day trial, Kommo a 14-day trial, and Salesmate a 15-day trial, all without requiring a credit card."
    },
    {
      "question": "Which is best for WhatsApp-heavy sales teams?",
      "answer": "Kommo is purpose-built around unifying WhatsApp, Instagram, and other messaging channels into one inbox. Folk syncs with WhatsApp but isn't centered on it, and Salesmate's documented features focus on native calling and texting rather than WhatsApp."
    },
    {
      "question": "How do the AI features compare?",
      "answer": "Folk's AI Assistants and Magic Fields auto-enrich and auto-fill contact data. Kommo's AI Agent drafts replies and summarizes chat conversations. Salesmate's Sandy AI assistant plus newer AI agents focus on lead qualification, meeting booking, and workflow triggers."
    },
    {
      "question": "Which tool includes support ticketing?",
      "answer": "Salesmate's Pro tier and above include a team inbox and basic ticketing, combining light customer support with the sales CRM. Folk and Kommo don't document ticketing functionality."
    },
    {
      "question": "How does starting price compare?",
      "answer": "Kommo starts lowest at $15/user/month but requires a minimum six-month commitment. Salesmate's Basic plan starts at $23/user/month. Folk starts at $24/member/month billed annually, with no minimum contract term stated."
    }
  ]
};

export default folkVsKommoVsSalesmateContent;

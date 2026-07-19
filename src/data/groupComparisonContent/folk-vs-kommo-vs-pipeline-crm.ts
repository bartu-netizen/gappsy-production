import type { GroupComparisonContent } from './types';

const folkVsKommoVsPipelineCrmContent: GroupComparisonContent = {
  "verdict": "Folk, Kommo, and Pipeline CRM all target small and mid-sized sales teams, but they optimize for very different workflows. Folk is a spreadsheet-style, relationship-centric CRM built around one-click LinkedIn contact capture and AI enrichment via its folkX browser extension. Kommo is a messaging-first CRM that unifies WhatsApp, Instagram, and other chat channels into one pipeline with a no-code Salesbot builder, though it requires a minimum six-month commitment. Pipeline CRM is the most traditional of the three, a sales-native pipeline and deal tracker with transparent, published per-user pricing, no seat minimums, and built-in project management for post-sale work. Teams doing high-volume relationship capture from LinkedIn should lean toward Folk, chat-heavy sales operations toward Kommo, and straightforward B2B pipeline tracking with no contract lock-in toward Pipeline CRM.",
  "bestFor": {
    "folk": "Small teams managing relationships across sales, recruiting, or fundraising who want fast LinkedIn contact capture and AI enrichment.",
    "kommo": "Sales teams doing high volumes of business over WhatsApp, Instagram, and other messaging channels who want a unified inbox and no-code chatbot automation.",
    "pipeline-crm": "Small and mid-sized B2B sales teams that want transparent per-user pricing, no seat minimums, and built-in project management after the deal closes."
  },
  "highlights": [
    {
      "title": "Contract terms differ sharply",
      "description": "Pipeline CRM advertises no seat minimums and no mandatory onboarding fees, Folk offers a 14-day no-credit-card trial with flexible monthly or annual billing, while Kommo requires a minimum six-month commitment on every paid plan.",
      "toolSlugs": [
        "pipeline-crm",
        "folk",
        "kommo"
      ]
    },
    {
      "title": "Messaging channels are Kommo's core strength",
      "description": "Kommo unifies WhatsApp, Instagram Direct, Facebook Messenger, Telegram, email, and web chat into a single inbox tied to each deal, a level of native multichannel messaging that neither Folk nor Pipeline CRM's documented feature sets match.",
      "toolSlugs": [
        "kommo"
      ]
    },
    {
      "title": "LinkedIn-first capture is unique to Folk",
      "description": "Folk's folkX browser extension adds and AI-enriches contacts directly from LinkedIn, Gmail, and Crunchbase with one click, a capture workflow that Kommo and Pipeline CRM don't offer.",
      "toolSlugs": [
        "folk"
      ]
    },
    {
      "title": "Only one has project management built in",
      "description": "Pipeline CRM's Grow tier adds Kanban and Gantt-view project management for post-sale account work, which is not part of Folk's or Kommo's documented feature set.",
      "toolSlugs": [
        "pipeline-crm"
      ]
    },
    {
      "title": "AI automation, two different flavors",
      "description": "Folk's AI Assistants and Magic Fields focus on enriching and auto-filling relationship data, while Kommo's AI Agent focuses on drafting chat replies and summarizing conversations; Pipeline CRM's feature set does not document AI capabilities.",
      "toolSlugs": [
        "folk",
        "kommo",
        "pipeline-crm"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Trial and Contract Terms",
      "rows": [
        {
          "feature": "Free trial without credit card",
          "statuses": {
            "folk": "available",
            "kommo": "available",
            "pipeline-crm": "not-documented"
          }
        },
        {
          "feature": "No mandatory long-term contract",
          "statuses": {
            "folk": "available",
            "kommo": "unavailable",
            "pipeline-crm": "available"
          },
          "note": "Kommo's paid plans require a minimum six-month commitment."
        }
      ]
    },
    {
      "group": "Communication and Capture",
      "rows": [
        {
          "feature": "Native multichannel messaging inbox",
          "statuses": {
            "folk": "limited",
            "kommo": "available",
            "pipeline-crm": "not-documented"
          },
          "note": "Folk syncs with WhatsApp but is not built around a unified messaging inbox."
        },
        {
          "feature": "No-code chatbot or automation builder",
          "statuses": {
            "folk": "not-documented",
            "kommo": "available",
            "pipeline-crm": "not-documented"
          }
        },
        {
          "feature": "Browser extension for contact capture",
          "statuses": {
            "folk": "available",
            "kommo": "not-documented",
            "pipeline-crm": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Automation and Project Tools",
      "rows": [
        {
          "feature": "AI-driven automation features",
          "statuses": {
            "folk": "available",
            "kommo": "available",
            "pipeline-crm": "not-documented"
          }
        },
        {
          "feature": "Project management with Kanban and Gantt views",
          "statuses": {
            "folk": "not-documented",
            "kommo": "not-documented",
            "pipeline-crm": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Folk, Kommo, or Pipeline CRM have a free plan?",
      "answer": "None of the three offers a permanent free plan. Folk and Kommo both provide a 14-day free trial with no credit card required; Pipeline CRM's free trial terms are not documented in the available data."
    },
    {
      "question": "Which CRM is best for WhatsApp or Instagram-based sales?",
      "answer": "Kommo is purpose-built for messaging-driven sales, with a unified inbox spanning WhatsApp, Instagram Direct, Facebook Messenger, Telegram, and email. Folk syncs with WhatsApp but is not built around it the way Kommo is, and Pipeline CRM doesn't document native messaging-channel support."
    },
    {
      "question": "How do the contract terms compare?",
      "answer": "Kommo requires a minimum six-month commitment on every paid plan. Pipeline CRM explicitly advertises no seat minimums and no mandatory onboarding fees. Folk offers flexible monthly or annual billing with no stated minimum term."
    },
    {
      "question": "Which tool has the strongest LinkedIn contact capture?",
      "answer": "Folk's folkX Chrome extension is built specifically to add and AI-enrich contacts from LinkedIn, Gmail, Crunchbase, and X with one click. Kommo and Pipeline CRM do not document an equivalent LinkedIn capture tool."
    },
    {
      "question": "Do any of these include project management features?",
      "answer": "Pipeline CRM's Grow tier includes project management with Kanban and Gantt views for tracking post-sale work. Folk and Kommo's documented feature sets do not include project management tools."
    },
    {
      "question": "How does pricing scale for growing teams?",
      "answer": "All three charge per user or per seat. Kommo starts at $15/user/month but requires a six-month minimum commitment. Folk starts at $24/member/month billed annually. Pipeline CRM starts at $25/user/month billed annually, with published pricing and no seat minimums."
    }
  ]
};

export default folkVsKommoVsPipelineCrmContent;

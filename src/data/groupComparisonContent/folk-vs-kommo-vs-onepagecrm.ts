import type { GroupComparisonContent } from './types';

const folkVsKommoVsOnepagecrmContent: GroupComparisonContent = {
  "verdict": "Folk, Kommo, and OnePageCRM all serve small teams that want something lighter than an enterprise CRM, but they lead with three different ideas of what 'simple' means. Folk simplifies data capture with LinkedIn-first, AI-enriched Tables. Kommo simplifies conversation management by unifying messaging channels into one inbox with no-code bots. OnePageCRM simplifies the sales process itself with its Next Action methodology, which forces every contact toward a single concrete follow-up task. None has a permanent free plan, so trial length and entry price matter as much as feature depth when comparing them.",
  "bestFor": {
    "folk": "Teams managing a high volume of individual relationships, such as investors, candidates, or prospects, captured largely from LinkedIn and other web sources.",
    "kommo": "Sales teams selling primarily through WhatsApp, Instagram, and other messaging channels who want a unified inbox and no-code automation.",
    "onepagecrm": "Solo founders and small teams who want a simple, action-first CRM without pipeline clutter or enterprise complexity."
  },
  "highlights": [
    {
      "title": "OnePageCRM is built around a single next action, not a dashboard",
      "description": "Rather than a traditional pipeline dashboard, OnePageCRM assigns every contact one concrete next action that surfaces in a prioritized action stream, a Getting Things Done approach to sales that neither Folk nor Kommo replicate.",
      "toolSlugs": [
        "onepagecrm"
      ]
    },
    {
      "title": "Kommo covers messaging channels that Folk and OnePageCRM do not",
      "description": "Kommo's unified inbox spans WhatsApp, Instagram Direct, Facebook Messenger, Telegram, email, and web chat with a no-code Salesbot builder, a level of native messaging automation that is absent from OnePageCRM's documented feature set and only partially present in Folk's WhatsApp sync.",
      "toolSlugs": [
        "kommo"
      ]
    },
    {
      "title": "OnePageCRM is the most affordable entry point",
      "description": "OnePageCRM's Professional plan starts at 9.95 dollars per user per month, undercutting Kommo's Base tier at 15 dollars per user per month and Folk's Standard tier at 24 dollars per member per month billed annually.",
      "toolSlugs": [
        "onepagecrm",
        "kommo",
        "folk"
      ]
    },
    {
      "title": "Folk's AI enrichment and Table-based data model stand apart",
      "description": "Folk's spreadsheet-style Tables and AI-powered contact enrichment via its folkX extension give it a flexibility that OnePageCRM's more structured Next Action workflow and Kommo's channel-first design do not directly aim for.",
      "toolSlugs": [
        "folk"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Workflow Philosophy",
      "rows": [
        {
          "feature": "Single next-action, task-driven workflow",
          "statuses": {
            "folk": "unavailable",
            "kommo": "unavailable",
            "onepagecrm": "available"
          }
        },
        {
          "feature": "Flexible spreadsheet-style Table views",
          "statuses": {
            "folk": "available",
            "kommo": "unavailable",
            "onepagecrm": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Channel and Capture",
      "rows": [
        {
          "feature": "WhatsApp message sync or unified inbox",
          "statuses": {
            "folk": "limited",
            "kommo": "available",
            "onepagecrm": "unavailable"
          }
        },
        {
          "feature": "LinkedIn contact capture browser extension",
          "statuses": {
            "folk": "available",
            "kommo": "unavailable",
            "onepagecrm": "unavailable"
          }
        },
        {
          "feature": "Embeddable web forms for lead capture",
          "statuses": {
            "folk": "not-documented",
            "kommo": "not-documented",
            "onepagecrm": "available"
          }
        }
      ]
    },
    {
      "group": "Automation and Pricing",
      "rows": [
        {
          "feature": "No-code chatbot automation builder",
          "statuses": {
            "folk": "not-documented",
            "kommo": "available",
            "onepagecrm": "not-documented"
          }
        },
        {
          "feature": "Flexible billing with no long-term minimum commitment",
          "statuses": {
            "folk": "available",
            "kommo": "unavailable",
            "onepagecrm": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Folk, Kommo, or OnePageCRM offer a free plan?",
      "answer": "No, none has a permanent free tier. Folk and Kommo each offer a 14-day free trial, and OnePageCRM offers a 21-day free trial, after which a paid subscription is required."
    },
    {
      "question": "Which is cheapest to start with?",
      "answer": "OnePageCRM's Professional plan at 9.95 dollars per user per month is the lowest entry price of the three, ahead of Kommo's Base tier at 15 dollars per user per month and Folk's Standard tier at 24 dollars per member per month billed annually."
    },
    {
      "question": "Which CRM is best for messaging-heavy sales teams?",
      "answer": "Kommo, since it unifies WhatsApp, Instagram, Facebook Messenger, Telegram, email, and web chat into one inbox and includes a no-code chatbot builder called Salesbot."
    },
    {
      "question": "Which CRM is best for LinkedIn-based contact capture?",
      "answer": "Folk, through its folkX browser extension, which adds and AI-enriches contacts directly from LinkedIn with one click."
    },
    {
      "question": "Which CRM is best for a solo founder who wants simplicity?",
      "answer": "OnePageCRM, whose Next Action system is explicitly designed to eliminate cluttered dashboards and analysis paralysis by giving every contact one concrete follow-up task."
    },
    {
      "question": "How do the trial periods compare?",
      "answer": "Folk and Kommo both offer 14-day free trials, while OnePageCRM offers a longer 21-day free trial. None converts automatically into a permanent free plan."
    }
  ]
};

export default folkVsKommoVsOnepagecrmContent;

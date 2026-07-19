import type { GroupComparisonContent } from './types';

const folkVsKommoVsNethuntCrmContent: GroupComparisonContent = {
  "verdict": "Folk, Kommo, and NetHunt CRM are all lightweight, per-seat CRMs aimed at small and mid-sized teams that find Salesforce or HubSpot too heavy, but each is built around a different point of contact capture. Folk centers on LinkedIn-first relationship capture with AI enrichment, Kommo centers on unifying WhatsApp, Instagram, and other messaging channels into one pipeline, and NetHunt CRM centers on living entirely inside Gmail. None offers a permanent free plan, so the decision mostly comes down to which channel your team already lives in.",
  "bestFor": {
    "folk": "Teams that capture relationships primarily from LinkedIn and want AI-driven enrichment across sales, recruiting, and fundraising workflows.",
    "kommo": "Businesses selling primarily through WhatsApp, Instagram, and other messaging apps that want a unified inbox with no-code chatbot automation.",
    "nethunt-crm": "Small teams fully embedded in Gmail and Google Workspace who want CRM functionality without adopting a separate standalone application."
  },
  "highlights": [
    {
      "title": "None of the three offers a permanent free plan",
      "description": "Folk, Kommo, and NetHunt CRM are each trial-only: Folk and Kommo offer 14-day trials and NetHunt offers a 14-day trial with no restriction on invited users, but all require a paid subscription to keep using the product afterward.",
      "toolSlugs": [
        "folk",
        "kommo",
        "nethunt-crm"
      ]
    },
    {
      "title": "Kommo has the deepest native messaging integration",
      "description": "Kommo's unified inbox merges WhatsApp, Instagram Direct, Facebook Messenger, Telegram, email, and web chat into one thread per contact, backed by a no-code Salesbot builder, which neither Folk nor NetHunt CRM match in their documented feature sets.",
      "toolSlugs": [
        "kommo"
      ]
    },
    {
      "title": "Folk and NetHunt CRM both build around a single existing workflow",
      "description": "Folk's folkX browser extension captures and AI-enriches contacts from LinkedIn, Gmail, and Crunchbase with one click, while NetHunt CRM turns Gmail itself into the CRM interface via a sidebar, so both reduce switching cost for teams already anchored to those tools.",
      "toolSlugs": [
        "folk",
        "nethunt-crm"
      ]
    },
    {
      "title": "Kommo is the only one with a minimum contract commitment",
      "description": "Kommo's published pricing requires a minimum six-month commitment on every tier, while Folk and NetHunt CRM both bill monthly or annually without a stated minimum term.",
      "toolSlugs": [
        "kommo"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Channel Integration",
      "rows": [
        {
          "feature": "WhatsApp message sync or unified inbox",
          "statuses": {
            "folk": "limited",
            "kommo": "available",
            "nethunt-crm": "unavailable"
          },
          "note": "Folk syncs WhatsApp messages into contact history but does not offer Kommo's full multichannel inbox with broadcast and bot automation."
        },
        {
          "feature": "Native Gmail or Google Workspace embedding",
          "statuses": {
            "folk": "unavailable",
            "kommo": "unavailable",
            "nethunt-crm": "available"
          }
        },
        {
          "feature": "LinkedIn contact capture browser extension",
          "statuses": {
            "folk": "available",
            "kommo": "unavailable",
            "nethunt-crm": "available"
          }
        }
      ]
    },
    {
      "group": "Automation and AI",
      "rows": [
        {
          "feature": "No-code chatbot automation builder",
          "statuses": {
            "folk": "not-documented",
            "kommo": "available",
            "nethunt-crm": "not-documented"
          }
        },
        {
          "feature": "AI-powered contact enrichment",
          "statuses": {
            "folk": "available",
            "kommo": "not-documented",
            "nethunt-crm": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Pricing and Terms",
      "rows": [
        {
          "feature": "Flexible billing with no long-term minimum commitment",
          "statuses": {
            "folk": "available",
            "kommo": "unavailable",
            "nethunt-crm": "available"
          }
        },
        {
          "feature": "API access included at the entry-level paid tier",
          "statuses": {
            "folk": "unavailable",
            "kommo": "available",
            "nethunt-crm": "not-documented"
          },
          "note": "Folk gates API access to its Premium tier and above; the entry Standard tier does not include it."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Folk, Kommo, or NetHunt CRM offer a free plan?",
      "answer": "No, none of the three has a permanent free tier. All three offer a 14-day free trial, after which a paid subscription is required to keep using the product."
    },
    {
      "question": "Which CRM is best for WhatsApp and Instagram-heavy sales teams?",
      "answer": "Kommo, since it was built around a unified messaging inbox that merges WhatsApp, Instagram Direct, Facebook Messenger, Telegram, email, and web chat into one threaded view, plus a no-code Salesbot builder for automated conversational flows."
    },
    {
      "question": "Which CRM works best for LinkedIn-based prospecting?",
      "answer": "Folk, through its folkX Chrome extension, which adds and AI-enriches contacts directly from LinkedIn, Gmail, Crunchbase, and other sites with one click."
    },
    {
      "question": "Which CRM is best if my team lives inside Gmail?",
      "answer": "NetHunt CRM, since it installs as a sidebar inside Gmail itself, turning existing email threads and contacts into structured CRM records without requiring a separate application."
    },
    {
      "question": "Does any of these require a minimum contract term?",
      "answer": "Yes. Kommo's published pricing requires a minimum six-month commitment on every paid tier. Folk and NetHunt CRM are both billed monthly or annually without a stated minimum term."
    },
    {
      "question": "Which is cheapest to start with?",
      "answer": "Kommo's Base tier at 15 dollars per user per month is the lowest listed entry price among the three, though it carries the six-month minimum commitment. Folk starts at 24 dollars per member per month billed annually, and NetHunt CRM's Basic tier starts around 24 dollars per user per month billed annually."
    }
  ]
};

export default folkVsKommoVsNethuntCrmContent;

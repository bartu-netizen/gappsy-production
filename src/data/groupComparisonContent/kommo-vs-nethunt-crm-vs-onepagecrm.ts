import type { GroupComparisonContent } from './types';

const kommoVsNethuntCrmVsOnepagecrmContent: GroupComparisonContent = {
  "verdict": "Kommo, NetHunt CRM, and OnePageCRM all target small and mid-sized sales teams but solve different problems: Kommo is built around messaging-heavy sales conducted over WhatsApp and Instagram, NetHunt CRM is built for teams that want a CRM without ever leaving Gmail, and OnePageCRM strips the pipeline down to a single prioritized Next Action queue for founders who just want to know who to call next. Kommo offers the most automation and AI depth but requires a six-month commitment, NetHunt rewards Google Workspace-native teams with the lowest context-switching, and OnePageCRM is the cheapest and fastest to learn of the three. There is no universal winner here, only a fit question about which channel and workflow a sales team actually lives in.",
  "bestFor": {
    "kommo": "Sales teams that close deals primarily over WhatsApp, Instagram, or other messaging apps and want chatbot automation built in",
    "nethunt-crm": "Google Workspace teams that want full CRM functionality without ever leaving their Gmail inbox",
    "onepagecrm": "Solo founders and small teams who want a lightweight, action-first CRM instead of a complex pipeline dashboard"
  },
  "highlights": [
    {
      "title": "Kommo wins on native messaging channels",
      "description": "Kommo unifies WhatsApp, Instagram, Facebook Messenger, Telegram, and email into a single inbox with a no-code Salesbot builder, a depth of chat-channel integration neither NetHunt nor OnePageCRM documents.",
      "toolSlugs": [
        "kommo"
      ]
    },
    {
      "title": "NetHunt CRM lives entirely inside Gmail",
      "description": "Rather than pulling reps into a separate app, NetHunt installs as a Gmail sidebar so contacts, deals, and pipelines are managed directly from email threads, which suits teams already standardized on Google Workspace.",
      "toolSlugs": [
        "nethunt-crm"
      ]
    },
    {
      "title": "OnePageCRM is the simplest and cheapest entry point",
      "description": "At $9.95 per user per month with a 21-day trial, OnePageCRM's Next Action system removes the dashboard clutter of a traditional pipeline in favor of one concrete follow-up task per contact.",
      "toolSlugs": [
        "onepagecrm"
      ]
    },
    {
      "title": "AI assistance is a Kommo differentiator",
      "description": "Kommo's AI Agent feature drafts replies, summarizes conversations, and can operate semi-autonomously across up to 50 agents on its Pro plan, a generative AI layer that NetHunt and OnePageCRM do not document.",
      "toolSlugs": [
        "kommo"
      ]
    },
    {
      "title": "Commitment terms vary sharply",
      "description": "Kommo requires a minimum six-month commitment on every paid plan, while NetHunt and OnePageCRM both offer flexible monthly or annual billing without a locked-in term.",
      "toolSlugs": [
        "kommo",
        "nethunt-crm",
        "onepagecrm"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core pipeline and email",
      "rows": [
        {
          "feature": "Visual sales pipeline",
          "statuses": {
            "kommo": "available",
            "nethunt-crm": "available",
            "onepagecrm": "available"
          }
        },
        {
          "feature": "Native email integration",
          "statuses": {
            "kommo": "available",
            "nethunt-crm": "available",
            "onepagecrm": "available"
          },
          "note": "NetHunt is built directly inside Gmail; Kommo and OnePageCRM sync email as one channel among several."
        }
      ]
    },
    {
      "group": "Messaging and social channels",
      "rows": [
        {
          "feature": "Native WhatsApp and Instagram messaging",
          "statuses": {
            "kommo": "available",
            "nethunt-crm": "not-documented",
            "onepagecrm": "not-documented"
          }
        },
        {
          "feature": "LinkedIn integration",
          "statuses": {
            "kommo": "not-documented",
            "nethunt-crm": "available",
            "onepagecrm": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Automation and AI",
      "rows": [
        {
          "feature": "No-code workflow or chatbot automation",
          "statuses": {
            "kommo": "available",
            "nethunt-crm": "available",
            "onepagecrm": "available"
          },
          "note": "Kommo's Salesbot handles branching chat flows; NetHunt and OnePageCRM focus on task and follow-up automation."
        },
        {
          "feature": "Generative AI assistant",
          "statuses": {
            "kommo": "available",
            "nethunt-crm": "not-documented",
            "onepagecrm": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Access and trial",
      "rows": [
        {
          "feature": "Native iOS and Android apps",
          "statuses": {
            "kommo": "available",
            "nethunt-crm": "available",
            "onepagecrm": "available"
          }
        },
        {
          "feature": "Free trial",
          "statuses": {
            "kommo": "available",
            "nethunt-crm": "available",
            "onepagecrm": "available"
          },
          "note": "Kommo and NetHunt both offer 14 days; OnePageCRM offers 21 days."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is the cheapest of Kommo, NetHunt CRM, and OnePageCRM?",
      "answer": "OnePageCRM is the cheapest starting point at $9.95 per user per month for its Professional plan, compared to Kommo's $15 per user per month Base plan and NetHunt's roughly $24 per user per month annual rate."
    },
    {
      "question": "Which CRM is best for teams selling over WhatsApp or Instagram?",
      "answer": "Kommo is built specifically for messaging-heavy sales, with native WhatsApp and Instagram inboxes, broadcast campaigns, and a no-code Salesbot for conversational automation that neither NetHunt CRM nor OnePageCRM offers."
    },
    {
      "question": "Does NetHunt CRM work with Outlook instead of Gmail?",
      "answer": "NetHunt CRM's core differentiator is that it installs directly inside Gmail and Google Workspace, so it is a stronger fit for Gmail-based teams than for Outlook-first organizations."
    },
    {
      "question": "Which tool has the simplest learning curve for a solo founder?",
      "answer": "OnePageCRM is designed around a single Next Action per contact rather than a full pipeline dashboard, which most reviewers cite as faster to learn than Kommo's multichannel inbox or NetHunt's Gmail-embedded feature set."
    },
    {
      "question": "Do any of these three require a long-term contract?",
      "answer": "Kommo requires a minimum six-month commitment on every paid plan, while NetHunt CRM and OnePageCRM both offer flexible monthly or annual billing without that lock-in."
    },
    {
      "question": "Which CRM offers built-in AI features?",
      "answer": "Kommo is the only one of the three with a documented generative AI layer, its AI Agent feature, which can draft replies, summarize conversations, and operate semi-autonomously on higher-tier plans."
    }
  ]
};

export default kommoVsNethuntCrmVsOnepagecrmContent;

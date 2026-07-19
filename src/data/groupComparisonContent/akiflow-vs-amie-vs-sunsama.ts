import type { GroupComparisonContent } from './types';

const akiflowVsAmieVsSunsamaContent: GroupComparisonContent = {
  "verdict": "Amie is the only one of the three with a genuinely permanent free plan and a standout bot-free meeting transcription feature, but it has no Android app. Akiflow and Sunsama both center on time-blocking tasks pulled from other tools onto the calendar, with Akiflow leaning on its Universal Inbox and Aki AI assistant, and Sunsama leaning on a structured daily and weekly planning ritual. None of the three is a clear universal winner; the choice comes down to whether meeting notes, multi-tool aggregation, or a simple planning ritual matters most.",
  "bestFor": {
    "akiflow": "Busy professionals juggling many tools (Trello, Slack, Gmail) who want everything funneled into one Universal Inbox and time-blocked onto the calendar via an AI assistant.",
    "amie": "Users who want a genuinely free calendar and task app plus bot-free AI meeting transcription, and who work primarily on Mac, Windows, or iOS.",
    "sunsama": "Individual knowledge workers who want a structured, guided daily and weekly planning ritual with one simple price and no team distractions."
  },
  "highlights": [
    {
      "title": "Only real free tier",
      "description": "Amie offers a permanent Free plan with unlimited calendars and to-dos, while Akiflow and Sunsama only offer time-limited trials (7 days and 14 days respectively) before requiring payment.",
      "toolSlugs": [
        "amie",
        "akiflow",
        "sunsama"
      ]
    },
    {
      "title": "Bot-free meeting notes",
      "description": "Amie's standout feature is bot-free meeting recording and transcription across Zoom, Meet, Teams, Slack Huddles, Webex, and BlueJeans in 17 languages - neither Akiflow nor Sunsama documents a comparable meeting-transcription feature.",
      "toolSlugs": [
        "amie"
      ]
    },
    {
      "title": "Two flavors of time-blocking",
      "description": "Akiflow and Sunsama are both explicitly built around time-blocking tasks directly onto the calendar, with Akiflow centered on a Universal Inbox pulling from many external tools and Sunsama centered on a guided daily plus weekly planning ritual.",
      "toolSlugs": [
        "akiflow",
        "sunsama"
      ]
    },
    {
      "title": "Platform coverage gaps",
      "description": "Akiflow covers web, Windows, Mac, iOS, and Android; Amie has no Android app at all, limiting it to Mac, Windows, iOS, and web; Sunsama's platform reach isn't detailed beyond its calendar integrations.",
      "toolSlugs": [
        "akiflow",
        "amie",
        "sunsama"
      ]
    },
    {
      "title": "Team reach differs sharply",
      "description": "Amie is the only one of the three with a dedicated Business tier for sales and customer-facing teams; Sunsama offers only a custom Enterprise plan with SSO/SAML/SCIM, and Akiflow has no team pricing tier at all.",
      "toolSlugs": [
        "amie",
        "sunsama",
        "akiflow"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and Trials",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "akiflow": "unavailable",
            "amie": "available",
            "sunsama": "unavailable"
          }
        },
        {
          "feature": "Free trial for paid tiers",
          "statuses": {
            "akiflow": "available",
            "amie": "available",
            "sunsama": "available"
          },
          "note": "Akiflow: 7 days. Amie: 7 days on Pro/Business. Sunsama: 14 days, no credit card required."
        }
      ]
    },
    {
      "group": "Core Planning",
      "rows": [
        {
          "feature": "Time-blocking calendar",
          "statuses": {
            "akiflow": "available",
            "amie": "available",
            "sunsama": "available"
          }
        },
        {
          "feature": "Multi-tool task aggregation",
          "statuses": {
            "akiflow": "available",
            "amie": "limited",
            "sunsama": "available"
          },
          "note": "Akiflow pulls from Trello, Slack, and Gmail via its Universal Inbox; Sunsama pulls from Trello, Asana, Todoist, Slack, and Gmail; Amie's integrations lean toward HubSpot, Notion, Slack, Linear, and Pipedrive rather than task aggregation."
        }
      ]
    },
    {
      "group": "AI and Meetings",
      "rows": [
        {
          "feature": "AI planning or scheduling assistant",
          "statuses": {
            "akiflow": "available",
            "amie": "available",
            "sunsama": "available"
          },
          "note": "Akiflow's Aki, Amie's AI chat assistant, and Sunsama's AI planning suggestions."
        },
        {
          "feature": "Meeting recording and transcription",
          "statuses": {
            "akiflow": "not-documented",
            "amie": "available",
            "sunsama": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Platform and Team",
      "rows": [
        {
          "feature": "Android app",
          "statuses": {
            "akiflow": "available",
            "amie": "unavailable",
            "sunsama": "not-documented"
          }
        },
        {
          "feature": "Dedicated team/business pricing tier",
          "statuses": {
            "akiflow": "unavailable",
            "amie": "available",
            "sunsama": "limited"
          },
          "note": "Sunsama only offers a custom Enterprise tier, with no mid-market team plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Akiflow, Amie, and Sunsama has a free plan?",
      "answer": "Only Amie offers a permanent free tier with unlimited calendars and to-dos; Akiflow and Sunsama are trial-only (7 days and 14 days respectively) before you must subscribe."
    },
    {
      "question": "Which tool is best if I want AI meeting notes?",
      "answer": "Amie is the only one of the three built around bot-free meeting recording and transcription, working across Zoom, Google Meet, Teams, Slack Huddles, Webex, and BlueJeans in 17 languages."
    },
    {
      "question": "I'm on Android - which should I pick?",
      "answer": "Akiflow is the only one of the three with a documented Android app; Amie explicitly has no Android app, and Sunsama's mobile platform coverage isn't detailed in its published feature list."
    },
    {
      "question": "Which is cheapest?",
      "answer": "Amie's Pro plan starts lowest at $15/month billed annually, followed by Sunsama at $17/month and Akiflow at $19/month, all billed annually."
    },
    {
      "question": "Does any of these support team use?",
      "answer": "Amie has a dedicated Business plan for teams with custom branding and a customer success manager; Sunsama only offers a custom Enterprise tier with SSO/SAML/SCIM rather than a mid-market team plan, and Akiflow is built for individual users without a team tier."
    },
    {
      "question": "What's the core workflow difference between Akiflow and Sunsama?",
      "answer": "Akiflow centers on a Universal Inbox that pulls tasks from tools like Trello, Slack, and Gmail before you time-block them, while Sunsama centers on a guided daily planning session plus a weekly review ritual for reflecting on progress."
    }
  ]
};

export default akiflowVsAmieVsSunsamaContent;

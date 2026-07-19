import type { GroupComparisonContent } from './types';

const amieVsRoutineVsSunsamaContent: GroupComparisonContent = {
  "verdict": "Amie, Routine, and Sunsama all promise to replace the scattered stack of calendar, to-do list, and meeting notes app with one workspace, but they solve the problem differently: Amie leans on bot-free meeting transcription and native Mac, Windows, and iOS apps, Routine bundles AI credits and custom databases into a Notion-adjacent workspace, and Sunsama skips the free tier entirely to focus purely on a guided daily planning ritual that pulls tasks in from tools you already use. Amie and Routine both offer a usable free plan and scale into team features, while Sunsama is deliberately single-user with no team pricing at all. The right pick depends on whether you want an AI notetaker, a Notion-style all-in-one workspace, or a disciplined daily and weekly planning practice built around existing tools.",
  "bestFor": {
    "amie": "Individuals and sales or customer-facing teams who want bot-free AI meeting notes merged with their calendar and to-do list.",
    "routine": "Knowledge workers and small teams who want a Notion-style workspace combining tasks, calendar, notes, and AI automations with a generous free tier.",
    "sunsama": "Individual knowledge workers who already use several task tools and want a guided daily and weekly planning ritual rather than another app to manage."
  },
  "highlights": [
    {
      "title": "Bot-free meeting intelligence",
      "description": "Amie records and transcribes calls across Zoom, Meet, Teams, Slack Huddles, Webex, and BlueJeans without a visible bot joining, in 17 languages, while Routine and Sunsama do not document an equivalent bot-free recording capability.",
      "toolSlugs": [
        "amie"
      ]
    },
    {
      "title": "Free tier with real AI features",
      "description": "Amie and Routine both let users try AI-assisted scheduling or assistant features for free, with Routine's Free plan including 250 monthly AI credits, whereas Sunsama offers only a 14-day trial with no permanent free plan.",
      "toolSlugs": [
        "amie",
        "routine"
      ]
    },
    {
      "title": "Task aggregation from other tools",
      "description": "Sunsama's core workflow pulls tasks from Trello, Asana, Todoist, Slack, and Gmail into one time-blocked day, a level of third-party task consolidation that Amie and Routine do not center their product around.",
      "toolSlugs": [
        "sunsama"
      ]
    },
    {
      "title": "Built for teams, not just individuals",
      "description": "Amie's Business plan and Routine's Business and Enterprise tiers add custom branding, audit logs, and organization-wide workspaces, while Sunsama intentionally has no team tier at all.",
      "toolSlugs": [
        "amie",
        "routine"
      ]
    },
    {
      "title": "Y Combinator roots, different playbooks",
      "description": "Both Routine and Sunsama are Y Combinator alumni that built competing takes on unifying tasks and calendar, while Amie grew independently in Berlin with backing from Spark Capital, Creandum, and Tiny.",
      "toolSlugs": [
        "routine",
        "sunsama",
        "amie"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Planning and Tasks",
      "rows": [
        {
          "feature": "Calendar and task unification",
          "statuses": {
            "amie": "available",
            "routine": "available",
            "sunsama": "available"
          }
        },
        {
          "feature": "Time-blocking daily planning ritual",
          "statuses": {
            "amie": "limited",
            "routine": "available",
            "sunsama": "available"
          }
        },
        {
          "feature": "Multi-tool task aggregation from other apps",
          "statuses": {
            "amie": "limited",
            "routine": "limited",
            "sunsama": "available"
          }
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI meeting notes and transcription",
          "statuses": {
            "amie": "available",
            "routine": "available",
            "sunsama": "not-documented"
          }
        },
        {
          "feature": "AI chat assistant",
          "statuses": {
            "amie": "available",
            "routine": "available",
            "sunsama": "available"
          }
        }
      ]
    },
    {
      "group": "Access and Team",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "amie": "available",
            "routine": "available",
            "sunsama": "unavailable"
          }
        },
        {
          "feature": "Team or organization tier",
          "statuses": {
            "amie": "available",
            "routine": "available",
            "sunsama": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Amie, Routine, and Sunsama has a free plan?",
      "answer": "Amie and Routine both offer permanent free plans; Amie's Free plan covers unlimited calendars and to-do lists, and Routine's Free plan adds a basic AI assistant and 250 monthly AI credits. Sunsama has no permanent free tier, only a 14-day free trial."
    },
    {
      "question": "Does any of these tools record and transcribe meetings without a bot?",
      "answer": "Amie is the one built around bot-free meeting recording, transcribing calls across Zoom, Google Meet, Microsoft Teams, Slack Huddles, Webex, and BlueJeans in 17 languages. Routine adds AI-generated meeting notes on its Professional plan, and Sunsama's provided feature set does not document meeting transcription."
    },
    {
      "question": "Can I use any of these with my existing task apps like Trello or Asana?",
      "answer": "Sunsama is built specifically to pull tasks from tools like Trello, Asana, Todoist, Slack, and Gmail into one daily plan. Routine and Amie focus more on their own native to-do lists, though Routine lists integrations with other apps depending on plan tier."
    },
    {
      "question": "Do Amie, Routine, or Sunsama support Android?",
      "answer": "Amie has no Android app. Routine has native apps for macOS, Windows, web, and iOS, with Android support in progress as of its latest public roadmap. Sunsama's platform availability is not detailed in the provided data."
    },
    {
      "question": "Which tool is best for a team rather than a solo user?",
      "answer": "Amie's Business plan and Routine's Business and Enterprise tiers both add team-oriented features like custom branding, audit logs, and access control. Sunsama has no team or collaboration tier and is built exclusively around an individual's daily workflow."
    },
    {
      "question": "How does pricing compare across the three?",
      "answer": "Routine is the cheapest paid option, starting at $5/month for Personal and $10/month for Professional. Amie's Pro plan starts around $15 to $20/month. Sunsama charges a single $17-22/month Pro plan with no lower-cost tier, reflecting its no-frills, single-plan approach."
    }
  ]
};

export default amieVsRoutineVsSunsamaContent;

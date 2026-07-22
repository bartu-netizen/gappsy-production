import type { GroupComparisonContent } from './types';

const akiflowVsRoutineVsSunsamaContent: GroupComparisonContent = {
  "verdict": "Routine stands apart with the most generous permanent free plan and a dedicated notes space, making it a stronger fit for individuals and small teams that don't want to pay upfront. Akiflow and Sunsama both skip a free tier in favor of short trials and lean harder into time-blocking tasks pulled from other tools, with Akiflow built around a Universal Inbox and Sunsama around a guided daily and weekly planning ritual. Team pricing also splits the three: Routine has the clearest per-seat ladder, Sunsama offers only a custom Enterprise plan, and Akiflow has no team tier at all.",
  "bestFor": {
    "akiflow": "Busy professionals who want a Universal Inbox pulling tasks from many tools straight into a time-blocked calendar, backed by the Aki AI assistant.",
    "routine": "Individuals and small teams who want a generous free tier combining tasks, calendar, and notes with metered AI credits, plus a clear per-seat path as they grow.",
    "sunsama": "Solo knowledge workers who want a single simple price for a structured daily and weekly planning ritual, without team-tier complexity."
  },
  "highlights": [
    {
      "title": "Deepest free tier",
      "description": "Routine's Free plan is the most generous of the three, including an AI assistant, offline mode, 3 integrations, 3 custom databases, and 250 AI credits per month at no cost, while Akiflow and Sunsama offer only short free trials before requiring payment.",
      "toolSlugs": [
        "routine",
        "akiflow",
        "sunsama"
      ]
    },
    {
      "title": "Notes as a first-class feature",
      "description": "Routine is the only one of the three built around a dedicated Notes space alongside tasks and calendar, positioning it against tools like Notion as much as against calendar apps.",
      "toolSlugs": [
        "routine"
      ]
    },
    {
      "title": "Clearest team pricing ladder",
      "description": "Routine has the most explicit path for teams, with a $15/seat/month Business plan and a custom Enterprise tier, while Akiflow has no team pricing tier and Sunsama offers only a custom Enterprise plan with no mid-market team option.",
      "toolSlugs": [
        "routine",
        "akiflow",
        "sunsama"
      ]
    },
    {
      "title": "Task aggregation from other tools",
      "description": "Akiflow's Universal Inbox pulls from Trello, Slack, and Gmail, and Sunsama pulls from Trello, Asana, Todoist, Slack, and Gmail; Routine's own integration count is capped by plan tier, from 3 on Free up to unlimited on Professional.",
      "toolSlugs": [
        "akiflow",
        "sunsama",
        "routine"
      ]
    },
    {
      "title": "Platform coverage",
      "description": "Akiflow covers web, Windows, Mac, iOS, and Android; Routine covers macOS, Windows, web, and iOS, with Android support listed as in progress on its roadmap; Sunsama's specific platform list isn't detailed beyond its calendar integrations.",
      "toolSlugs": [
        "akiflow",
        "routine",
        "sunsama"
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
            "routine": "available",
            "sunsama": "unavailable"
          }
        },
        {
          "feature": "Dedicated team/per-seat pricing tier",
          "statuses": {
            "akiflow": "unavailable",
            "routine": "available",
            "sunsama": "limited"
          },
          "note": "Routine's Business plan is $15/seat/month; Sunsama only offers a custom Enterprise tier."
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
            "routine": "available",
            "sunsama": "available"
          }
        },
        {
          "feature": "Notes / documentation space",
          "statuses": {
            "akiflow": "unavailable",
            "routine": "available",
            "sunsama": "unavailable"
          }
        },
        {
          "feature": "Multi-tool task aggregation",
          "statuses": {
            "akiflow": "available",
            "routine": "limited",
            "sunsama": "available"
          },
          "note": "Routine's integration count is capped by plan tier, from 3 on Free up to unlimited on Professional."
        }
      ]
    },
    {
      "group": "AI",
      "rows": [
        {
          "feature": "AI assistant",
          "statuses": {
            "akiflow": "available",
            "routine": "available",
            "sunsama": "available"
          },
          "note": "Routine's AI usage is metered by monthly credits even on paid tiers."
        }
      ]
    },
    {
      "group": "Platform",
      "rows": [
        {
          "feature": "Android app",
          "statuses": {
            "akiflow": "available",
            "routine": "unavailable",
            "sunsama": "not-documented"
          },
          "note": "Routine lists Android support as in progress on its most recent public roadmap."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has a real free plan?",
      "answer": "Routine is the only one with a permanent free tier, including an AI assistant, notes, and calendar for $0; Akiflow and Sunsama only offer trials (7 and 14 days) before you must subscribe."
    },
    {
      "question": "Which tool includes note-taking?",
      "answer": "Routine is built around a dedicated Notes space alongside its calendar and tasks, competing directly with tools like Notion; neither Akiflow nor Sunsama includes a comparable notes feature."
    },
    {
      "question": "Which is best for a growing team?",
      "answer": "Routine has the most explicit team pricing ladder, with a $15/seat/month Business plan and a custom Enterprise tier; Sunsama only offers a custom Enterprise plan with no mid-tier team option, and Akiflow has no team pricing at all."
    },
    {
      "question": "Is Android supported?",
      "answer": "Akiflow has a full native Android app; Routine lists Android support as in progress on its roadmap; Sunsama's platform coverage isn't detailed in its published data."
    },
    {
      "question": "How do the free-tier AI features compare?",
      "answer": "Routine's free plan includes 250 AI credits per month for its assistant; Akiflow and Sunsama both gate their AI features (Aki and AI planning suggestions, respectively) behind paid subscriptions with only short trials."
    },
    {
      "question": "Which is cheapest for an individual?",
      "answer": "Routine's Personal plan starts at $5/month, well below Sunsama's $17/month and Akiflow's $19/month annual pricing, though Routine's cheaper tiers have lower AI credit and integration limits."
    }
  ]
};

export default akiflowVsRoutineVsSunsamaContent;

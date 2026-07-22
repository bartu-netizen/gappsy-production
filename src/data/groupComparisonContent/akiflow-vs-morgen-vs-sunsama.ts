import type { GroupComparisonContent } from './types';

const akiflowVsMorgenVsSunsamaContent: GroupComparisonContent = {
  "verdict": "Akiflow, Morgen, and Sunsama all help knowledge workers turn scattered tasks and calendar events into a single planned day, but they emphasize different parts of that job. Morgen stands out for its generous free plan, true cross-platform reach including Linux, and built-in scheduling links, Akiflow leans on its Universal Inbox and Aki AI assistant to pull tasks in from many tools at once, and Sunsama is the most opinionated of the three, built around a guided daily and weekly planning ritual with a single simple pricing tier. None offers a permanent free plan for the full product except Morgen, so budget-conscious users should weigh that alongside workflow fit.",
  "bestFor": {
    "akiflow": "Busy professionals who want an AI assistant and a Universal Inbox pulling tasks from many different tools into one time-blocked calendar",
    "morgen": "Knowledge workers juggling multiple calendar accounts who also want scheduling links and a generous free plan",
    "sunsama": "Individuals who want a structured, guided daily and weekly planning ritual with simple, single-tier pricing"
  },
  "highlights": [
    {
      "title": "Morgen is the only one with a real free plan",
      "description": "Morgen's Free plan includes a personal booking page, unlimited one-time scheduling links, and unlimited tasks, while Akiflow and Sunsama only offer time-limited free trials before requiring payment.",
      "toolSlugs": [
        "morgen"
      ]
    },
    {
      "title": "Akiflow centers on an AI assistant and Universal Inbox",
      "description": "Aki, Akiflow's AI assistant, handles scheduling, prioritization, voice commands, and daily briefings on top of a Universal Inbox that pulls in tasks from tools like Trello, Slack, and Gmail.",
      "toolSlugs": [
        "akiflow"
      ]
    },
    {
      "title": "Sunsama is built around a daily and weekly ritual",
      "description": "Rather than a general planning surface, Sunsama structures each day around a guided planning session and a recurring weekly review, a more prescriptive workflow than Akiflow or Morgen impose.",
      "toolSlugs": [
        "sunsama"
      ]
    },
    {
      "title": "Morgen is the only true cross-platform option including Linux",
      "description": "Morgen ships native apps for macOS, Windows, Linux, iOS, Android, and web, while Akiflow and Sunsama do not document Linux support.",
      "toolSlugs": [
        "morgen"
      ]
    },
    {
      "title": "Only Morgen bundles Calendly-style scheduling links",
      "description": "Morgen's personal booking pages and recurring or one-time scheduling links let external contacts book meetings directly, a feature Akiflow and Sunsama do not offer as a core capability.",
      "toolSlugs": [
        "morgen"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Planning and AI",
      "rows": [
        {
          "feature": "AI-assisted scheduling and prioritization",
          "statuses": {
            "akiflow": "available",
            "morgen": "not-documented",
            "sunsama": "available"
          },
          "note": "Akiflow's Aki assistant and Sunsama's AI planning suggestions are documented; Morgen does not document dedicated AI scheduling features."
        },
        {
          "feature": "Guided daily and weekly planning ritual",
          "statuses": {
            "akiflow": "limited",
            "morgen": "unavailable",
            "sunsama": "available"
          },
          "note": "Akiflow offers time-blocking but not a structured ritual with the same emphasis as Sunsama's daily and weekly review workflow."
        },
        {
          "feature": "Scheduling links and booking pages",
          "statuses": {
            "akiflow": "unavailable",
            "morgen": "available",
            "sunsama": "unavailable"
          }
        },
        {
          "feature": "Task manager integrations (Trello, Todoist, Notion, etc.)",
          "statuses": {
            "akiflow": "available",
            "morgen": "available",
            "sunsama": "available"
          }
        }
      ]
    },
    {
      "group": "Platform and Pricing",
      "rows": [
        {
          "feature": "Free plan (not just a trial)",
          "statuses": {
            "akiflow": "unavailable",
            "morgen": "available",
            "sunsama": "unavailable"
          }
        },
        {
          "feature": "Native Linux app",
          "statuses": {
            "akiflow": "unavailable",
            "morgen": "available",
            "sunsama": "not-documented"
          }
        },
        {
          "feature": "Team or multi-seat plan",
          "statuses": {
            "akiflow": "not-documented",
            "morgen": "available",
            "sunsama": "unavailable"
          },
          "note": "Sunsama is intentionally built for individual workflows with no team tier."
        },
        {
          "feature": "Enterprise security controls (SSO, SAML, SCIM)",
          "statuses": {
            "akiflow": "not-documented",
            "morgen": "not-documented",
            "sunsama": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of the three has a free plan?",
      "answer": "Only Morgen offers a permanent free plan, including a personal booking page and unlimited tasks. Akiflow and Sunsama both require payment after a 7-day and 14-day free trial, respectively."
    },
    {
      "question": "Which tool is best for scheduling meetings with external contacts?",
      "answer": "Morgen is the strongest fit since it includes Calendly-style booking pages and scheduling links based on real combined calendar availability, a feature Akiflow and Sunsama do not build around."
    },
    {
      "question": "How is Sunsama different from Akiflow and Morgen?",
      "answer": "Sunsama is more prescriptive, centering the entire product around a guided daily planning session and a weekly review ritual, rather than being a general-purpose unified calendar and task inbox like Akiflow and Morgen."
    },
    {
      "question": "Does any of these tools support Linux?",
      "answer": "Morgen is the only one of the three with a native Linux app, alongside macOS, Windows, iOS, Android, and web. Akiflow and Sunsama do not document Linux support."
    },
    {
      "question": "Which tool has team or enterprise features?",
      "answer": "Morgen offers a Team plan with shared availability and team scheduling, and Sunsama offers a custom Enterprise plan with SSO, SAML, and SCIM. Akiflow does not document a dedicated team tier."
    }
  ]
};

export default akiflowVsMorgenVsSunsamaContent;

import type { GroupComparisonContent } from './types';

const akiflowVsAmieVsRoutineContent: GroupComparisonContent = {
  "verdict": "Akiflow, Amie, and Routine are all AI-powered calendar and task apps aimed at unifying scheduling and to-dos into one planning workflow, but they differ sharply on pricing and platform reach. Akiflow has no perpetual free plan and asks users to commit after a short trial, while Amie and Routine both offer usable free tiers before upgrading. Amie stands out for bot-free AI meeting notes and native Mac, Windows, and iOS apps, Routine adds custom databases and team workspaces on top of tasks and calendar, and Akiflow's time-blocking planner and universal inbox are built to pull tasks in from many other tools at once.",
  "bestFor": {
    "akiflow": "Users who already rely on many different task and calendar tools and want a single time-blocking planner to consolidate everything, and are comfortable paying from day one",
    "amie": "Users who want a free-to-start calendar with bot-free AI meeting notes and a clean to-do list across Mac, Windows, and iOS",
    "routine": "Individuals and small teams who want tasks, calendar, and notes combined with custom databases and team workspaces, starting from a generous free tier"
  },
  "highlights": [
    {
      "title": "Only Amie and Routine offer a perpetual free plan",
      "description": "Amie and Routine both let users start for $0, while Akiflow offers only a 7-day free trial before requiring a paid subscription starting around $19 to $34 per month.",
      "toolSlugs": [
        "amie",
        "routine",
        "akiflow"
      ]
    },
    {
      "title": "Amie's bot-free AI meeting notes are a distinct feature",
      "description": "Amie captures meeting notes without a visible notetaker bot joining the call, a specific feature not documented for Akiflow and offered as part of Routine's broader AI meeting notes and agents.",
      "toolSlugs": [
        "amie",
        "routine"
      ]
    },
    {
      "title": "Akiflow's universal inbox targets heavy tool consolidation",
      "description": "Akiflow is built specifically to pull tasks and calendars in from many different source tools into one time-blocking planner, which is a stronger consolidation story than the integrations documented for Amie or Routine.",
      "toolSlugs": [
        "akiflow"
      ]
    },
    {
      "title": "Routine goes furthest into team and database features",
      "description": "Routine adds custom databases and team workspaces with access control on top of its tasks, calendar, and notes, functionality that is not documented for Akiflow or Amie.",
      "toolSlugs": [
        "routine"
      ]
    },
    {
      "title": "Android support is a shared weak point",
      "description": "Amie has no Android app at all, and Routine's cons note that its Android app support has lagged other platforms, while Akiflow markets itself as cross-platform including mobile.",
      "toolSlugs": [
        "amie",
        "routine",
        "akiflow"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Planning and Tasks",
      "rows": [
        {
          "feature": "Time blocking",
          "statuses": {
            "akiflow": "available",
            "amie": "not-documented",
            "routine": "available"
          }
        },
        {
          "feature": "Task and to-do management",
          "statuses": {
            "akiflow": "available",
            "amie": "available",
            "routine": "available"
          }
        },
        {
          "feature": "AI meeting notes",
          "statuses": {
            "akiflow": "not-documented",
            "amie": "available",
            "routine": "available"
          },
          "note": "Amie's meeting notes are bot-free; Routine bundles meeting notes with broader AI agents"
        }
      ]
    },
    {
      "group": "Platform Access",
      "rows": [
        {
          "feature": "Cross-platform desktop apps (Mac and Windows)",
          "statuses": {
            "akiflow": "available",
            "amie": "available",
            "routine": "available"
          }
        },
        {
          "feature": "Android app",
          "statuses": {
            "akiflow": "available",
            "amie": "unavailable",
            "routine": "limited"
          },
          "note": "Amie has no Android app; Routine's Android support has lagged its other platforms per user feedback"
        }
      ]
    },
    {
      "group": "Collaboration and Plans",
      "rows": [
        {
          "feature": "Perpetual free plan",
          "statuses": {
            "akiflow": "unavailable",
            "amie": "available",
            "routine": "available"
          },
          "note": "Akiflow offers only a 7-day free trial before requiring payment"
        },
        {
          "feature": "Team workspaces",
          "statuses": {
            "akiflow": "not-documented",
            "amie": "limited",
            "routine": "available"
          },
          "note": "Amie's Business plan implies team-oriented features such as custom branding; Routine documents dedicated team workspaces with access control"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Akiflow, Amie, or Routine has a free plan?",
      "answer": "Amie and Routine both offer a perpetual free tier, while Akiflow only offers a 7-day free trial before requiring a paid subscription starting around $19 to $34 per month."
    },
    {
      "question": "Which app is best for consolidating tasks from many other tools?",
      "answer": "Akiflow is built specifically around a universal inbox and unified calendar designed to pull tasks and events in from many different source tools into one time-blocking planner."
    },
    {
      "question": "Does Amie have an Android app?",
      "answer": "No, Amie is documented as having no Android app, with native apps limited to Mac, Windows, and iOS; Akiflow markets cross-platform mobile support, and Routine's Android support has lagged its other platforms."
    },
    {
      "question": "Which tool supports team collaboration?",
      "answer": "Routine documents dedicated team workspaces with access control, Amie's paid Business plan implies team-oriented features like custom branding, and Akiflow does not document team workspace features."
    },
    {
      "question": "How do the AI meeting notes compare between Amie and Routine?",
      "answer": "Amie offers bot-free AI meeting notes that avoid a visible notetaker joining the call, while Routine bundles AI meeting notes together with broader AI agents; Akiflow does not document a comparable meeting notes feature."
    },
    {
      "question": "Which app is the cheapest way to get started?",
      "answer": "Routine has the lowest paid entry point at $5 per month for its Personal plan on top of a free tier, Amie's Pro plan starts around $15 per month billed annually on top of its own free tier, and Akiflow has no free plan, starting near $19 per month billed annually."
    }
  ]
};

export default akiflowVsAmieVsRoutineContent;

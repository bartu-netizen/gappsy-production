import type { GroupComparisonContent } from './types';

const celoxisVsHiveVsWrikeContent: GroupComparisonContent = {
  "verdict": "Celoxis, Hive, and Wrike are all cloud project management platforms with Gantt charts, resource management, and time tracking, but they target different buyers. Celoxis leans PMO-grade with an on-premise deployment option and what-if scenario analytics, Hive bundles native chat and email into the same workspace as tasks, and Wrike counters with the deepest integration catalog and AI features included free on every plan. None is a universal winner; the right pick depends on whether deployment flexibility, built-in communication, or integration depth matters most.",
  "bestFor": {
    "celoxis": "PMOs and enterprises that need on-premise deployment or advanced what-if scenario forecasting",
    "hive": "teams that want native chat and email folded into the same workspace as their tasks",
    "wrike": "cross-functional teams that need deep third-party integrations and AI features without extra add-on fees"
  },
  "highlights": [
    {
      "title": "Wrike includes AI on every plan, no upsell required",
      "description": "Wrike bundles AI Agents and an AI Priority Inbox across all plans, including Free, positioning it against rivals that charge 20 to 40 dollars per user per month extra for comparable AI add-ons.",
      "toolSlugs": [
        "wrike"
      ]
    },
    {
      "title": "Celoxis is the only one of the three with on-premise deployment",
      "description": "Celoxis can run as a self-managed on-premise install on Linux and PostgreSQL in addition to its cloud SaaS option, a fit for organizations with data residency requirements that rule out cloud-only tools like Hive and Wrike.",
      "toolSlugs": [
        "celoxis"
      ]
    },
    {
      "title": "Hive folds chat and email into the same workspace as tasks",
      "description": "Hive's native team chat, direct messaging, and built-in email integration mean conversations happen alongside tasks rather than in a separate app, which Celoxis and Wrike do not offer natively.",
      "toolSlugs": [
        "hive"
      ]
    },
    {
      "title": "Wrike's 400+ integrations include a deep, bidirectional Adobe Creative Cloud connection",
      "description": "Wrike connects to more than 400 external tools and stands out for creative teams with its especially deep Adobe Creative Cloud integration, beyond what Celoxis or Hive document.",
      "toolSlugs": [
        "wrike"
      ]
    },
    {
      "title": "Entry-level access differs sharply",
      "description": "Hive and Wrike both offer genuine free plans, while Celoxis requires a minimum of five full-access paid users, making it a heavier commitment for small teams evaluating the category.",
      "toolSlugs": [
        "hive",
        "wrike",
        "celoxis"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Planning and Views",
      "rows": [
        {
          "feature": "Interactive Gantt charts with critical path",
          "statuses": {
            "celoxis": "available",
            "hive": "available",
            "wrike": "available"
          }
        },
        {
          "feature": "Multiple views (Kanban, table, calendar)",
          "statuses": {
            "celoxis": "limited",
            "hive": "available",
            "wrike": "available"
          },
          "note": "Celoxis documents Gantt charts and dashboards but not Kanban or table views; Hive and Wrike both support switching between Gantt, Kanban, calendar, and table on shared data."
        }
      ]
    },
    {
      "group": "Collaboration",
      "rows": [
        {
          "feature": "Native team chat and messaging",
          "statuses": {
            "celoxis": "unavailable",
            "hive": "available",
            "wrike": "unavailable"
          },
          "note": "Wrike integrates with Slack and Microsoft Teams rather than offering built-in chat."
        },
        {
          "feature": "Proofing and approval workflows",
          "statuses": {
            "celoxis": "not-documented",
            "hive": "available",
            "wrike": "available"
          }
        }
      ]
    },
    {
      "group": "Resourcing and AI",
      "rows": [
        {
          "feature": "Resource and capacity management",
          "statuses": {
            "celoxis": "available",
            "hive": "available",
            "wrike": "available"
          },
          "note": "Wrike gates resource management behind its Business plan or higher."
        },
        {
          "feature": "Built-in AI assistant",
          "statuses": {
            "celoxis": "not-documented",
            "hive": "available",
            "wrike": "available"
          },
          "note": "Hive's AI Assistant requires the paid Starter tier or above; Wrike includes AI Agents and Priority Inbox free on every plan."
        }
      ]
    },
    {
      "group": "Deployment and Access",
      "rows": [
        {
          "feature": "On-premise deployment option",
          "statuses": {
            "celoxis": "available",
            "hive": "unavailable",
            "wrike": "unavailable"
          }
        },
        {
          "feature": "Free plan available",
          "statuses": {
            "celoxis": "unavailable",
            "hive": "available",
            "wrike": "available"
          },
          "note": "Celoxis has no free tier and requires a five full-access-user minimum on its paid Core plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Celoxis, Hive, and Wrike supports on-premise deployment?",
      "answer": "Only Celoxis. It can be deployed as self-managed on-premise software running on Linux and PostgreSQL, in addition to its cloud SaaS option, while Hive and Wrike are cloud-only."
    },
    {
      "question": "Does Wrike's AI functionality really cost nothing extra?",
      "answer": "As of January 2026, Wrike includes AI Agents and an AI Priority Inbox across all plans, including its free plan, at no additional cost, which the company positions against competitors that charge 20 to 40 dollars per user per month for similar AI add-ons."
    },
    {
      "question": "Which tool has built-in team chat instead of relying on integrations?",
      "answer": "Hive is the only one of the three with native team chat and direct messaging built into the same workspace as tasks. Wrike and Celoxis rely on integrations like Slack or Microsoft Teams for chat instead."
    },
    {
      "question": "What is the cheapest way to start with each tool?",
      "answer": "Hive and Wrike both offer genuine free plans (Hive for up to 10 members, Wrike with unlimited users on basic boards and tables). Celoxis has no free tier; its Core plan starts at 10 dollars per user per month with a five full-access-user minimum."
    },
    {
      "question": "Which tool is best suited to a PMO managing a large project portfolio?",
      "answer": "Celoxis is built specifically for PMO-style portfolio planning, with advanced analytics, trend analysis, and what-if scenario forecasting aimed at Fortune 500 and enterprise PMOs. Wrike also scales to enterprise portfolios through its Enterprise and Pinnacle plans."
    },
    {
      "question": "Which tool fits creative teams that rely on Adobe Creative Cloud?",
      "answer": "Wrike stands out here with an especially deep, bidirectional Adobe Creative Cloud integration alongside its native proofing tools, which neither Celoxis nor Hive document."
    }
  ]
};

export default celoxisVsHiveVsWrikeContent;

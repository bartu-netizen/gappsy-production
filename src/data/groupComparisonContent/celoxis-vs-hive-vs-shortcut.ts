import type { GroupComparisonContent } from './types';

const celoxisVsHiveVsShortcutContent: GroupComparisonContent = {
  "verdict": "Celoxis, Hive, and Shortcut are all project management tools, but they target different scales and workflows: Celoxis is the analytics-heavy, cloud-or-on-premise option built for PMOs, Hive is a flexible, chat-and-AI-equipped workspace for general teams, and Shortcut is purpose-built for software engineering teams with native dev-tool integrations. The best choice depends more on team type and deployment needs than on any single feature advantage.",
  "bestFor": {
    "celoxis": "PMOs and enterprises that need deep analytics, resource management, and the option of on-premise deployment.",
    "hive": "Teams wanting a flexible project view (Gantt, Kanban, Table) bundled with native chat and an AI assistant at an affordable per-user price.",
    "shortcut": "Software engineering teams that want a purpose-built, developer-centric issue tracker with native GitHub and GitLab integration."
  },
  "highlights": [
    {
      "title": "On-premise deployment is a Celoxis-only option",
      "description": "Celoxis is one of the few modern project management tools offering both cloud and on-premise deployment, useful for organizations with data-residency or infrastructure requirements. Neither Hive nor Shortcut documents an on-premise option.",
      "toolSlugs": [
        "celoxis"
      ]
    },
    {
      "title": "Native chat and AI set Hive apart for general collaboration",
      "description": "Hive bundles native team chat, email integration, and an AI Assistant directly into the same workspace as its project views, reducing the need for separate communication tools.",
      "toolSlugs": [
        "hive"
      ]
    },
    {
      "title": "Shortcut is built for developers, not general teams",
      "description": "Shortcut combines stories, iterations, and docs with native GitHub, GitLab, and Slack integrations in an interface explicitly designed to be simpler and faster than heavier tools like Jira for engineering workflows.",
      "toolSlugs": [
        "shortcut"
      ]
    },
    {
      "title": "Free-tier access differs sharply",
      "description": "Hive and Shortcut both offer generous free plans for teams up to 10 users, while Celoxis has no free tier and requires a five-user minimum for full-access plans starting at $10/user/month.",
      "toolSlugs": [
        "hive",
        "shortcut",
        "celoxis"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Views",
      "rows": [
        {
          "feature": "On-premise deployment option",
          "statuses": {
            "celoxis": "available",
            "hive": "unavailable",
            "shortcut": "unavailable"
          }
        },
        {
          "feature": "Multiple project views (Gantt, Kanban, Table)",
          "statuses": {
            "celoxis": "available",
            "hive": "available",
            "shortcut": "available"
          }
        }
      ]
    },
    {
      "group": "Collaboration and AI",
      "rows": [
        {
          "feature": "Native team chat",
          "statuses": {
            "celoxis": "unavailable",
            "hive": "available",
            "shortcut": "unavailable"
          }
        },
        {
          "feature": "Built-in AI assistant",
          "statuses": {
            "celoxis": "unavailable",
            "hive": "available",
            "shortcut": "unavailable"
          },
          "note": "Hive's AI Assistant is gated to its paid Starter tier and above."
        }
      ]
    },
    {
      "group": "Planning and Integration",
      "rows": [
        {
          "feature": "Resource and workload management",
          "statuses": {
            "celoxis": "available",
            "hive": "available",
            "shortcut": "not-documented"
          }
        },
        {
          "feature": "Native GitHub or GitLab integration",
          "statuses": {
            "celoxis": "not-documented",
            "hive": "not-documented",
            "shortcut": "available"
          }
        }
      ]
    },
    {
      "group": "Analytics and Access",
      "rows": [
        {
          "feature": "What-if scenario or trend analytics",
          "statuses": {
            "celoxis": "available",
            "hive": "unavailable",
            "shortcut": "unavailable"
          }
        },
        {
          "feature": "Permanent free plan",
          "statuses": {
            "celoxis": "unavailable",
            "hive": "available",
            "shortcut": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three can be deployed on-premise?",
      "answer": "Celoxis, which offers both cloud and on-premise deployment. Hive and Shortcut are cloud-only."
    },
    {
      "question": "Which is purpose-built for software development teams?",
      "answer": "Shortcut, which is designed specifically around stories, iterations, and native GitHub and GitLab integration rather than general project management."
    },
    {
      "question": "Which has a built-in AI assistant?",
      "answer": "Hive includes an AI Assistant, though it is gated behind the paid Starter tier and above. Celoxis and Shortcut do not document AI assistant features."
    },
    {
      "question": "Is there a free plan available?",
      "answer": "Hive offers a free plan for up to 10 workspace members, and Shortcut offers a free plan for up to 10 users. Celoxis has no free tier; its Core plan starts at $10/user/month with a five-user minimum for full-access tiers."
    },
    {
      "question": "Which offers the deepest reporting and analytics?",
      "answer": "Celoxis, with what-if scenario modeling and trend analysis alongside customizable dashboards, a level of analytics depth neither Hive nor Shortcut documents."
    }
  ]
};

export default celoxisVsHiveVsShortcutContent;

import type { GroupComparisonContent } from './types';

const celoxisVsHiveVsTeamworkContent: GroupComparisonContent = {
  "verdict": "Celoxis, Hive, and Teamwork all manage projects, but each is optimized for a different buyer: Celoxis for PMOs that need deep analytics and deployment flexibility, Hive for general teams that want native chat and AI in one workspace, and Teamwork for agencies and client-services teams that need billing, budgeting, and capacity planning built in. The right pick depends on whether analytics, collaboration, or client-work financials matter most.",
  "bestFor": {
    "celoxis": "PMOs and enterprises wanting deep analytics, resource management, and the option of on-premise deployment.",
    "hive": "Teams that want flexible project views paired with native chat and an AI assistant at accessible per-user pricing.",
    "teamwork": "Agencies and client-services teams that need project management bundled with time tracking, budgeting, and client billing and invoicing."
  },
  "highlights": [
    {
      "title": "Celoxis is the only one with an on-premise option",
      "description": "Celoxis offers both cloud and on-premise deployment, a differentiator for organizations with data-residency requirements that neither Hive nor Teamwork addresses.",
      "toolSlugs": [
        "celoxis"
      ]
    },
    {
      "title": "Teamwork is built around client billing and profitability",
      "description": "Teamwork combines project management with native time tracking, client billing and invoicing, and budgeting and profitability tracking, positioning it squarely at agencies managing multiple client budgets. Hive and Celoxis do not offer bundled client invoicing.",
      "toolSlugs": [
        "teamwork"
      ]
    },
    {
      "title": "Hive centers collaboration and AI inside the workspace",
      "description": "Hive bundles native team chat, email integration, and an AI Assistant directly alongside its Gantt, Kanban, and Table views, reducing the need for a separate chat tool.",
      "toolSlugs": [
        "hive"
      ]
    },
    {
      "title": "Free-plan access favors Hive and Teamwork",
      "description": "Hive offers a free plan for up to 10 members and Teamwork offers a free plan for up to 5 users and 5 projects, while Celoxis has no free tier and starts at $10/user/month.",
      "toolSlugs": [
        "hive",
        "teamwork",
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
            "teamwork": "unavailable"
          }
        },
        {
          "feature": "Multiple project views (Gantt, Kanban, Table, List)",
          "statuses": {
            "celoxis": "available",
            "hive": "available",
            "teamwork": "available"
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
            "teamwork": "unavailable"
          }
        },
        {
          "feature": "Built-in AI features",
          "statuses": {
            "celoxis": "unavailable",
            "hive": "available",
            "teamwork": "available"
          },
          "note": "Hive's AI Assistant and Teamwork AI are both included on paid tiers."
        }
      ]
    },
    {
      "group": "Client and Financial Tools",
      "rows": [
        {
          "feature": "Client billing and invoicing",
          "statuses": {
            "celoxis": "available",
            "hive": "unavailable",
            "teamwork": "available"
          },
          "note": "Celoxis includes billing and a client portal only on its Business tier and above."
        },
        {
          "feature": "Budgeting and profitability tracking",
          "statuses": {
            "celoxis": "not-documented",
            "hive": "unavailable",
            "teamwork": "available"
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
            "teamwork": "unavailable"
          }
        },
        {
          "feature": "Permanent free plan",
          "statuses": {
            "celoxis": "unavailable",
            "hive": "available",
            "teamwork": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is best suited for agencies billing clients by project?",
      "answer": "Teamwork, since it combines project management with native time tracking, client billing and invoicing, and budgeting and profitability tracking in one platform."
    },
    {
      "question": "Which of these supports on-premise deployment?",
      "answer": "Celoxis, which offers both cloud and on-premise options. Hive and Teamwork are cloud-only."
    },
    {
      "question": "Do these tools include AI features?",
      "answer": "Hive includes an AI Assistant and Teamwork includes Teamwork AI, both on paid tiers. Celoxis does not document AI features."
    },
    {
      "question": "Is there a free plan available?",
      "answer": "Hive offers a free plan for up to 10 workspace members, and Teamwork offers a free plan for up to 5 users and 5 projects. Celoxis has no free tier and starts at $10/user/month."
    },
    {
      "question": "Which has the strongest resource and capacity planning?",
      "answer": "Celoxis includes a dedicated resource management module with what-if scenario modeling, and Teamwork offers capacity planning starting on its Accelerate tier. Hive's resource and workload management is available on its Teams tier."
    }
  ]
};

export default celoxisVsHiveVsTeamworkContent;

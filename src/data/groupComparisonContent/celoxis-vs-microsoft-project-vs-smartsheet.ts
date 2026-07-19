import type { GroupComparisonContent } from './types';

const celoxisVsMicrosoftProjectVsSmartsheetContent: GroupComparisonContent = {
  "verdict": "Celoxis, Microsoft Project, and Smartsheet all target structured project management for mid-size to large teams, but they solve it from different starting points: Celoxis leans into PMO-grade analytics and a rare cloud-or-on-premise choice, Microsoft Project leans into deep Microsoft 365 integration and industry-standard critical-path scheduling, and Smartsheet leans into a familiar spreadsheet interface that scales into lightweight app-building. None is a blanket best choice; the right pick depends on whether an organization is already standardized on Microsoft's ecosystem, needs on-premise deployment, or wants the lowest learning curve for spreadsheet-literate teams.",
  "bestFor": {
    "celoxis": "PMOs and enterprise teams that want deep what-if scenario analytics and the option to deploy on-premise instead of only in the cloud",
    "microsoft-project": "Organizations already standardized on Microsoft 365 that need industry-standard Gantt and critical-path scheduling tied into Teams and Power BI",
    "smartsheet": "Teams that want a spreadsheet-familiar interface with a low learning curve that can scale into automation and lightweight custom apps"
  },
  "highlights": [
    {
      "title": "A rare on-premise option",
      "description": "Celoxis is the only one of the three that can be deployed on self-managed Linux and PostgreSQL infrastructure instead of only as cloud SaaS, which matters for organizations with data residency or security requirements.",
      "toolSlugs": [
        "celoxis"
      ]
    },
    {
      "title": "Deep Microsoft 365 integration",
      "description": "Microsoft Project ties natively into Teams, SharePoint, Power BI, and Entra ID authentication, making it the most natural fit for organizations already standardized on the Microsoft ecosystem.",
      "toolSlugs": [
        "microsoft-project"
      ]
    },
    {
      "title": "Lowest-friction entry point",
      "description": "Smartsheet's Pro plan starts at 9 dollars per user per month with a spreadsheet-style grid that most business users already know, and it generates Gantt and calendar views automatically without manual chart building.",
      "toolSlugs": [
        "smartsheet"
      ]
    },
    {
      "title": "Scenario modeling for PMOs",
      "description": "Celoxis offers what-if scenario forecasting across its paid tiers, while Microsoft Project reserves comparable portfolio optimization and demand management for its top-tier Plan 5, so the depth of PMO-grade analytics comes at different price points.",
      "toolSlugs": [
        "celoxis",
        "microsoft-project"
      ]
    },
    {
      "title": "Enterprise trust at scale",
      "description": "Both Microsoft Project's decades-long history as the .mpp scheduling standard and Smartsheet's use by roughly 85 percent of Fortune 500 companies signal proven reliability for large, complex organizations.",
      "toolSlugs": [
        "microsoft-project",
        "smartsheet"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Scheduling and Views",
      "rows": [
        {
          "feature": "Gantt chart with critical path",
          "statuses": {
            "celoxis": "available",
            "microsoft-project": "available",
            "smartsheet": "available"
          },
          "note": "Smartsheet generates Gantt and calendar views automatically from sheet data rather than requiring manual chart setup."
        },
        {
          "feature": "Multiple project views (grid, board, timeline)",
          "statuses": {
            "celoxis": "not-documented",
            "microsoft-project": "available",
            "smartsheet": "available"
          }
        }
      ]
    },
    {
      "group": "Resource, Time and Cost",
      "rows": [
        {
          "feature": "Built-in time tracking",
          "statuses": {
            "celoxis": "available",
            "microsoft-project": "available",
            "smartsheet": "not-documented"
          },
          "note": "Time tracking is a named feature on Celoxis (from Essentials) and Microsoft Project (Plan 3+), but is not listed among Smartsheet's documented features."
        },
        {
          "feature": "Resource capacity planning",
          "statuses": {
            "celoxis": "available",
            "microsoft-project": "available",
            "smartsheet": "limited"
          },
          "note": "Smartsheet supports resource management as a common use case built on its sheets and dashboards rather than as a dedicated resource-planning module."
        }
      ]
    },
    {
      "group": "Reporting, Analytics and Automation",
      "rows": [
        {
          "feature": "What-if scenario / portfolio optimization",
          "statuses": {
            "celoxis": "available",
            "microsoft-project": "available",
            "smartsheet": "not-documented"
          },
          "note": "Microsoft Project reserves portfolio selection and optimization for its top Plan 5 tier; Celoxis includes what-if analytics across its analytics feature set."
        },
        {
          "feature": "Workflow automation",
          "statuses": {
            "celoxis": "not-documented",
            "microsoft-project": "not-documented",
            "smartsheet": "available"
          }
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
            "microsoft-project": "unavailable",
            "smartsheet": "unavailable"
          }
        },
        {
          "feature": "Client-facing portal or lightweight app builder",
          "statuses": {
            "celoxis": "available",
            "microsoft-project": "not-documented",
            "smartsheet": "available"
          },
          "note": "Celoxis includes a free client portal from its Business tier; Smartsheet offers WorkApps for building lightweight custom apps from Business tier up."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three tools can be deployed on-premise instead of the cloud?",
      "answer": "Celoxis is the only one of the three offered as a self-hosted, on-premise deployment running on Linux and PostgreSQL, in addition to its cloud SaaS version. Microsoft Project and Smartsheet are both cloud-only, though Microsoft Project also ships an optional Windows desktop client for advanced offline scheduling."
    },
    {
      "question": "Is Microsoft Project worth it if a team is not already using Microsoft 365?",
      "answer": "Microsoft Project's biggest advantages, native Teams and SharePoint connections, Power BI reporting, and Entra ID authentication, are most valuable to teams already inside the Microsoft ecosystem. Teams outside that ecosystem may find Celoxis or Smartsheet easier to adopt standalone."
    },
    {
      "question": "Which tool has the lowest starting price?",
      "answer": "Smartsheet's Pro plan starts at 9 dollars per user per month, slightly below Celoxis's Core tier and Microsoft Project's Project Plan 1, both of which start at 10 dollars per user per month."
    },
    {
      "question": "Which tool is easiest for non-technical business users to pick up?",
      "answer": "Smartsheet's spreadsheet-style grid interface is generally the most familiar starting point for business users who already work in spreadsheets, whereas Celoxis and Microsoft Project both have steeper learning curves tied to their deeper scheduling and analytics features."
    },
    {
      "question": "Which is best for a formal PMO managing a portfolio of projects?",
      "answer": "Celoxis and Microsoft Project's Plan 5 tier both offer dedicated portfolio-level tools, what-if scenario modeling and portfolio optimization respectively, aimed specifically at PMOs managing competing projects across an organization."
    },
    {
      "question": "Do any of these three offer a free plan?",
      "answer": "No. All three are paid, per-user subscription products; none lists an ongoing free tier in its published pricing plans."
    }
  ]
};

export default celoxisVsMicrosoftProjectVsSmartsheetContent;

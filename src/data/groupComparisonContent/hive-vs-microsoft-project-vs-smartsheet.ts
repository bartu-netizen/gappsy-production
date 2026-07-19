import type { GroupComparisonContent } from './types';

const hiveVsMicrosoftProjectVsSmartsheetContent: GroupComparisonContent = {
  "verdict": "Hive, Microsoft Project, and Smartsheet all manage projects and tasks, but they are built for different working styles: Hive bundles native chat, email, and an AI assistant directly into flexible project views for teams that want communication and planning in one workspace, Microsoft Project delivers industry-standard critical-path scheduling deeply wired into Microsoft 365, and Smartsheet offers a spreadsheet-first interface that scales into automation and lightweight app-building. Smaller, communication-heavy teams tend to gravitate toward Hive, while Microsoft-standardized enterprises and spreadsheet-native organizations tend to prefer the other two respectively.",
  "bestFor": {
    "hive": "Small to midsize teams that want native chat, email, and an AI assistant built into the same workspace as their project views",
    "microsoft-project": "Organizations already standardized on Microsoft 365 that need industry-standard critical-path scheduling and enterprise portfolio management",
    "smartsheet": "Teams that prefer a spreadsheet-style interface and want to scale from simple sheets into automation and lightweight custom apps"
  },
  "highlights": [
    {
      "title": "The only free tier of the three",
      "description": "Hive's Free plan supports up to 10 workspace members with unlimited tasks at no cost, while Microsoft Project and Smartsheet are both paid, per-user subscription products from their first tier.",
      "toolSlugs": [
        "hive"
      ]
    },
    {
      "title": "Communication built into the workspace",
      "description": "Hive includes native team chat, direct messaging, and two-way email integration inside the same workspace as tasks, reducing the need for a separate messaging app that Microsoft Project and Smartsheet users typically rely on Teams or an email client for.",
      "toolSlugs": [
        "hive"
      ]
    },
    {
      "title": "An AI assistant from the Starter tier",
      "description": "Hive's AI Assistant, available from its 5 dollar per user Starter plan, can summarize project status and draft updates; neither Microsoft Project nor Smartsheet documents a comparable built-in AI assistant.",
      "toolSlugs": [
        "hive"
      ]
    },
    {
      "title": "The Microsoft 365-native scheduling standard",
      "description": "Microsoft Project's decades-long history as the .mpp critical-path scheduling standard, plus native Teams, SharePoint, and Power BI integration, makes it the strongest fit for enterprises already inside the Microsoft ecosystem.",
      "toolSlugs": [
        "microsoft-project"
      ]
    },
    {
      "title": "Spreadsheet-native scale",
      "description": "Smartsheet's grid interface is familiar to spreadsheet users out of the box, and its Business tier adds WorkApps for building lightweight custom applications on top of the same sheet data.",
      "toolSlugs": [
        "smartsheet"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Views and Interface",
      "rows": [
        {
          "feature": "Kanban / board view",
          "statuses": {
            "hive": "available",
            "microsoft-project": "available",
            "smartsheet": "not-documented"
          },
          "note": "Smartsheet's documented views center on its grid, automatic Gantt charts, and calendar rather than a native Kanban board."
        },
        {
          "feature": "Gantt chart scheduling",
          "statuses": {
            "hive": "available",
            "microsoft-project": "available",
            "smartsheet": "available"
          },
          "note": "Hive's Gantt view is available from its Starter tier and up."
        }
      ]
    },
    {
      "group": "Collaboration and Communication",
      "rows": [
        {
          "feature": "Native team chat",
          "statuses": {
            "hive": "available",
            "microsoft-project": "not-documented",
            "smartsheet": "not-documented"
          },
          "note": "Microsoft Project relies on Teams integration rather than native in-app chat."
        },
        {
          "feature": "Built-in email integration",
          "statuses": {
            "hive": "available",
            "microsoft-project": "not-documented",
            "smartsheet": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Automation and AI",
      "rows": [
        {
          "feature": "AI assistant",
          "statuses": {
            "hive": "available",
            "microsoft-project": "not-documented",
            "smartsheet": "not-documented"
          },
          "note": "Hive's AI Assistant is available from the Starter tier."
        },
        {
          "feature": "Workflow automation",
          "statuses": {
            "hive": "not-documented",
            "microsoft-project": "not-documented",
            "smartsheet": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Free plan available",
          "statuses": {
            "hive": "available",
            "microsoft-project": "unavailable",
            "smartsheet": "unavailable"
          }
        },
        {
          "feature": "Dedicated API for custom integrations",
          "statuses": {
            "hive": "available",
            "microsoft-project": "not-documented",
            "smartsheet": "not-documented"
          },
          "note": "Hive documents an Enterprise API on its top tier; API access is not documented in the provided feature lists for Microsoft Project or Smartsheet."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Hive have a free plan, and what does it include?",
      "answer": "Yes. Hive's Free plan costs nothing forever and supports up to 10 workspace members with 200MB of storage, unlimited tasks, collaborative notes, and native chat and email integration. Microsoft Project and Smartsheet are both paid from their first tier."
    },
    {
      "question": "Which of these three includes native chat or email without a separate integration?",
      "answer": "Hive is the only one of the three with native team chat, direct messaging, and two-way email built directly into the same workspace as tasks. Microsoft Project instead integrates with Microsoft Teams, and Smartsheet does not document a native chat feature."
    },
    {
      "question": "Which tool makes the most sense for a company already running Microsoft 365?",
      "answer": "Microsoft Project is the strongest fit for Microsoft-standardized organizations, since it connects natively to Teams, SharePoint, Power BI, and Entra ID authentication in ways Hive and Smartsheet do not document."
    },
    {
      "question": "Can Smartsheet do more than track projects in a spreadsheet grid?",
      "answer": "Yes. Beyond its spreadsheet-style grid, Smartsheet's Business tier adds WorkApps for building lightweight custom applications and Data Shuttle for automating recurring data imports and exports, on top of its workflow automation and dashboard reporting."
    },
    {
      "question": "Which tool has a built-in AI assistant?",
      "answer": "Hive is the only one of the three that documents a built-in AI Assistant, available from its 5 dollar per user Starter plan, which can summarize project status and draft updates."
    },
    {
      "question": "Which is the cheapest way to get started?",
      "answer": "Hive's Free plan costs nothing for up to 10 members, making it the lowest-cost entry point of the three. Among the paid tiers, Smartsheet's Pro plan at 9 dollars per user per month undercuts both Hive's Starter tier and Microsoft Project's Project Plan 1, which start at 5 and 10 dollars per user per month respectively."
    }
  ]
};

export default hiveVsMicrosoftProjectVsSmartsheetContent;

import type { GroupComparisonContent } from './types';

const microsoftProjectVsScoroVsSmartsheetContent: GroupComparisonContent = {
  "verdict": "Microsoft Project, Scoro, and Smartsheet approach work management from three different starting points. Microsoft Project is the deep enterprise scheduling engine tied to Microsoft 365, Scoro bundles project management with agency billing and profitability reporting, and Smartsheet wraps project tracking in a familiar spreadsheet grid that scales from simple task lists to automated workflows and lightweight custom apps. Teams that need formal critical-path scheduling should default to Microsoft Project, agencies that bill clients directly tend to prefer Scoro, and organizations wanting a low-friction, broadly integrated platform used across large enterprises often land on Smartsheet.",
  "bestFor": {
    "microsoft-project": "Enterprise PMOs needing formal Gantt and critical-path scheduling with deep Microsoft 365 and Power BI integration.",
    "scoro": "Agencies and consultancies that need project management combined with quoting, invoicing, and profitability reporting.",
    "smartsheet": "Teams that want a spreadsheet-familiar interface that scales from project tracking to workflow automation and custom WorkApps across a large organization."
  },
  "highlights": [
    {
      "title": "Familiar interface lowers the learning curve",
      "description": "Smartsheet's spreadsheet-style grid is immediately recognizable to non-technical business users, in contrast to Microsoft Project's steeper scheduling learning curve.",
      "toolSlugs": [
        "smartsheet",
        "microsoft-project"
      ]
    },
    {
      "title": "Enterprise scheduling depth",
      "description": "Microsoft Project's critical path analysis, resource leveling, and Power BI reporting remain the most detailed scheduling toolset of the three.",
      "toolSlugs": [
        "microsoft-project"
      ]
    },
    {
      "title": "Agency billing built in",
      "description": "Scoro adds quoting, invoicing, retainer management, and role-based labor costing directly to project tracking, a financial layer neither competitor offers.",
      "toolSlugs": [
        "scoro"
      ]
    },
    {
      "title": "Automation and lightweight apps",
      "description": "Smartsheet's workflow automation and WorkApps let teams build simple custom applications on top of sheet data without traditional coding.",
      "toolSlugs": [
        "smartsheet"
      ]
    },
    {
      "title": "Broad third-party reach vs deep ecosystem lock-in",
      "description": "Smartsheet connects broadly with Microsoft 365, Google Workspace, Slack, and Salesforce, while Microsoft Project's integration strength is narrower but deeper, centered on Teams, SharePoint, and Power BI.",
      "toolSlugs": [
        "smartsheet",
        "microsoft-project"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Scheduling and resourcing",
      "rows": [
        {
          "feature": "Gantt chart scheduling",
          "statuses": {
            "microsoft-project": "available",
            "scoro": "available",
            "smartsheet": "available"
          },
          "note": "Smartsheet generates Gantt views automatically from sheet data rather than requiring manual chart building."
        },
        {
          "feature": "Dedicated resource management",
          "statuses": {
            "microsoft-project": "available",
            "scoro": "available",
            "smartsheet": "limited"
          },
          "note": "Smartsheet is commonly used for resource planning, but the provided feature data does not describe a dedicated resource allocation module the way Microsoft Project and Scoro's Performance plan do."
        }
      ]
    },
    {
      "group": "Automation and reporting",
      "rows": [
        {
          "feature": "Workflow automation",
          "statuses": {
            "microsoft-project": "not-documented",
            "scoro": "not-documented",
            "smartsheet": "available"
          }
        },
        {
          "feature": "Custom low-code apps",
          "statuses": {
            "microsoft-project": "unavailable",
            "scoro": "unavailable",
            "smartsheet": "available"
          },
          "note": "Smartsheet's WorkApps are available on the Business plan and above."
        },
        {
          "feature": "Executive dashboards and BI reporting",
          "statuses": {
            "microsoft-project": "available",
            "scoro": "available",
            "smartsheet": "available"
          },
          "note": "Microsoft Project reports through native Power BI connectors, Scoro through financial and utilization reports, and Smartsheet through real-time dashboards."
        }
      ]
    },
    {
      "group": "Billing and enterprise controls",
      "rows": [
        {
          "feature": "Quoting and invoicing",
          "statuses": {
            "microsoft-project": "unavailable",
            "scoro": "available",
            "smartsheet": "unavailable"
          }
        },
        {
          "feature": "Portfolio and PPM management",
          "statuses": {
            "microsoft-project": "available",
            "scoro": "not-documented",
            "smartsheet": "not-documented"
          },
          "note": "Microsoft Project's portfolio selection and optimization tools are exclusive to Plan 5."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is easiest to learn for teams new to formal project management software?",
      "answer": "Smartsheet generally has the lowest learning curve because it builds on a spreadsheet-style grid that most business users already understand, whereas Microsoft Project's critical-path scheduling tools require more training."
    },
    {
      "question": "Does Smartsheet do critical-path scheduling the way Microsoft Project does?",
      "answer": "Smartsheet can generate Gantt and calendar views automatically from sheet data, but the provided feature data does not describe the critical-path analysis, resource leveling, and baseline tracking depth that Microsoft Project offers, especially on its higher tiers."
    },
    {
      "question": "Is Scoro a good fit for a two-person team?",
      "answer": "No. Scoro requires a minimum of 5 user seats on every plan, so it is built for small-to-midsize teams and agencies rather than solo users or very small teams."
    },
    {
      "question": "Which of these tools can bill clients directly?",
      "answer": "Scoro is the only one of the three built for direct client billing, with quoting, invoicing, and retainer management included in its core product."
    },
    {
      "question": "Does Smartsheet's 2025 ownership change affect which tool to pick?",
      "answer": "Smartsheet became privately held after Vista Equity Partners and Blackstone completed an acquisition in January 2025. This does not change its current feature set, but it is worth noting since it may affect long-term public roadmap transparency compared to Microsoft Project's backing by Microsoft or Scoro's venture-backed but still independent status."
    }
  ]
};

export default microsoftProjectVsScoroVsSmartsheetContent;

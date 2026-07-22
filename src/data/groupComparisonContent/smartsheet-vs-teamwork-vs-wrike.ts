import type { GroupComparisonContent } from './types';

const smartsheetVsTeamworkVsWrikeContent: GroupComparisonContent = {
  "verdict": "Smartsheet, Teamwork, and Wrike are all established work management platforms, but they lead with different interfaces and audiences: Smartsheet's spreadsheet-style grid appeals to enterprises already comfortable with rows and columns, Teamwork layers in the time tracking and client billing agencies need, and Wrike pairs deep Gantt and dependency management with AI Agents included on every paid plan. Smartsheet is the only one of the three without a permanent free plan, while Teamwork and Wrike both let small teams start at no cost.",
  "bestFor": {
    "smartsheet": "Large organizations and enterprise teams already comfortable with spreadsheets that want deep automation and reporting at scale.",
    "teamwork": "Agencies and client-services teams that need project management combined with time tracking, budgeting, and client billing.",
    "wrike": "Cross-functional and creative teams that want deep Gantt and dependency management with AI Agents included on every paid tier."
  },
  "highlights": [
    {
      "title": "A Spreadsheet Interface at Enterprise Scale",
      "description": "Smartsheet's grid-based interface gives teams already fluent in spreadsheets a low learning curve, and the platform reports use by a majority of Fortune 500 companies.",
      "toolSlugs": [
        "smartsheet"
      ]
    },
    {
      "title": "Billing and Time Tracking for Client Work",
      "description": "Teamwork is the only one of the three built specifically around client billing and invoicing alongside project planning, a fit for agencies and consultancies.",
      "toolSlugs": [
        "teamwork"
      ]
    },
    {
      "title": "AI Agents Come Standard on Wrike",
      "description": "Wrike includes AI Agents and a Priority Inbox on all of its plans rather than selling them as a paid add-on, alongside 400-plus third-party integrations.",
      "toolSlugs": [
        "wrike"
      ]
    },
    {
      "title": "Free Plans Split the Field",
      "description": "Teamwork and Wrike both offer an ongoing free plan for small teams, while Smartsheet's lowest tier, Pro, starts at 9 dollars per user per month with no free option.",
      "toolSlugs": [
        "teamwork",
        "wrike",
        "smartsheet"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Views and Planning",
      "rows": [
        {
          "feature": "Gantt chart with dependencies",
          "statuses": {
            "smartsheet": "available",
            "teamwork": "available",
            "wrike": "available"
          }
        },
        {
          "feature": "Spreadsheet-style grid interface",
          "statuses": {
            "smartsheet": "available",
            "teamwork": "not-documented",
            "wrike": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Reporting and Automation",
      "rows": [
        {
          "feature": "Real-time dashboards",
          "statuses": {
            "smartsheet": "available",
            "teamwork": "not-documented",
            "wrike": "available"
          }
        },
        {
          "feature": "Workflow automation engine",
          "statuses": {
            "smartsheet": "available",
            "teamwork": "available",
            "wrike": "limited"
          },
          "note": "Wrike documents custom workflows and fields rather than a separately named automation engine like Teamwork's."
        }
      ]
    },
    {
      "group": "Resource and Client Management",
      "rows": [
        {
          "feature": "Resource or capacity planning",
          "statuses": {
            "smartsheet": "not-documented",
            "teamwork": "available",
            "wrike": "available"
          },
          "note": "Wrike gates resource management behind its Business plan or higher."
        },
        {
          "feature": "Client billing and invoicing",
          "statuses": {
            "smartsheet": "not-documented",
            "teamwork": "available",
            "wrike": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Pricing and AI",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "smartsheet": "unavailable",
            "teamwork": "available",
            "wrike": "available"
          }
        },
        {
          "feature": "AI features included",
          "statuses": {
            "smartsheet": "not-documented",
            "teamwork": "available",
            "wrike": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Smartsheet have a free plan like Teamwork and Wrike?",
      "answer": "No, Smartsheet's lowest published tier is the Pro plan at 9 dollars per user per month billed annually, with no permanent free option. Teamwork offers a free plan for up to 5 users and Wrike offers a free plan with unlimited users for basic use cases."
    },
    {
      "question": "Which of the three has the deepest Gantt chart and dependency features?",
      "answer": "Wrike and Smartsheet both offer detailed Gantt chart functionality, with Wrike specifically documenting dependency management as a core strength. Teamwork also includes Gantt views alongside board, list, and table views on the same data."
    },
    {
      "question": "Which tool is built for agencies that need to bill clients?",
      "answer": "Teamwork is the clearest fit, combining project planning with native time tracking, budgeting, and client invoicing. Smartsheet and Wrike do not document built-in client billing features."
    },
    {
      "question": "Are AI features included in the base price on any of these platforms?",
      "answer": "Wrike includes AI Agents and a Priority Inbox on all of its plans without an extra add-on fee, and Teamwork includes Teamwork AI. Smartsheet does not document a specific AI feature set in its published plans."
    },
    {
      "question": "Which platform suits a team that already works in spreadsheets?",
      "answer": "Smartsheet is built specifically around a spreadsheet-style grid interface, making it the most familiar starting point for teams used to rows-and-columns planning. Teamwork and Wrike both use more traditional board and Gantt-first interfaces."
    }
  ]
};

export default smartsheetVsTeamworkVsWrikeContent;

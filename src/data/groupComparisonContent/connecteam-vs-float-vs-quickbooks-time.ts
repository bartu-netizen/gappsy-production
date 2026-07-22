import type { GroupComparisonContent } from './types';

const connecteamVsFloatVsQuickbooksTimeContent: GroupComparisonContent = {
  "verdict": "These three only look similar because they all touch scheduling, but they solve different problems: Connecteam and QuickBooks Time are built around clocking hourly and field workers in and out, with QuickBooks Time tied tightly to Intuit's payroll, while Float is a capacity-planning tool for agencies that staff people onto billable projects rather than track punch-in times. Pick Connecteam for an affordable, all-in-one deskless-workforce app, QuickBooks Time if you are already inside the QuickBooks ecosystem, and Float if your core problem is who is available for which project and whether it is profitable.",
  "bestFor": {
    "connecteam": "Deskless or field-based small businesses in retail, construction, or hospitality that want scheduling, GPS time tracking, HR, and internal communication bundled into one app with a genuine free tier for small teams.",
    "float": "Agencies, studios, and professional services firms that need to plan team capacity, track project margins, and compare estimates to actuals rather than clock hourly attendance.",
    "quickbooks-time": "Businesses already running QuickBooks Online and QuickBooks Payroll that want GPS time tracking and scheduling to flow directly into their existing accounting and payroll workflow."
  },
  "highlights": [
    {
      "title": "Connecteam is the only one with a free-forever plan",
      "description": "Connecteam's Small Business Plan is free for life for businesses with up to 10 employees and includes all three of its hubs, while Float and QuickBooks Time only offer free trials before billing begins.",
      "toolSlugs": [
        "connecteam"
      ]
    },
    {
      "title": "Float is built for capacity planning and project profitability, not attendance",
      "description": "Float centers on a drag-and-drop schedule grid with project margin tracking, rate cards, and, on its Pro plan, estimates-versus-actuals reporting, a financial-planning focus that Connecteam and QuickBooks Time do not document.",
      "toolSlugs": [
        "float"
      ]
    },
    {
      "title": "QuickBooks Time requires an active QuickBooks Online subscription",
      "description": "QuickBooks Time is designed to work together with QuickBooks Online and QuickBooks Payroll, and a QuickBooks Online subscription is required to use it, unlike Connecteam or Float which stand alone.",
      "toolSlugs": [
        "quickbooks-time"
      ]
    },
    {
      "title": "Connecteam and QuickBooks Time both offer GPS time clocks and geofencing",
      "description": "Both are built for verifying that hourly or field employees are clocking in from the right location, a capability that is not part of Float's documented feature set.",
      "toolSlugs": [
        "connecteam",
        "quickbooks-time"
      ]
    },
    {
      "title": "Pricing structures differ sharply across all three",
      "description": "Connecteam and QuickBooks Time both use a flat base fee, or free tier, plus a per-user add-on, while Float charges a straightforward per-person monthly rate with no permanent free plan.",
      "toolSlugs": [
        "connecteam",
        "float",
        "quickbooks-time"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Time and Attendance Tracking",
      "rows": [
        {
          "feature": "GPS-based time clock",
          "statuses": {
            "connecteam": "available",
            "float": "unavailable",
            "quickbooks-time": "available"
          }
        },
        {
          "feature": "Geofencing",
          "statuses": {
            "connecteam": "available",
            "float": "unavailable",
            "quickbooks-time": "available"
          }
        },
        {
          "feature": "Overtime alerts",
          "statuses": {
            "connecteam": "not-documented",
            "float": "not-documented",
            "quickbooks-time": "available"
          }
        }
      ]
    },
    {
      "group": "Resource and Capacity Planning",
      "rows": [
        {
          "feature": "Project margin or rate-card tracking",
          "statuses": {
            "connecteam": "not-documented",
            "float": "available",
            "quickbooks-time": "not-documented"
          }
        },
        {
          "feature": "Estimates versus actuals reporting",
          "statuses": {
            "connecteam": "not-documented",
            "float": "available",
            "quickbooks-time": "not-documented"
          },
          "note": "Available on Float's Pro plan and above"
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Free-forever plan, not just a trial",
          "statuses": {
            "connecteam": "available",
            "float": "unavailable",
            "quickbooks-time": "unavailable"
          },
          "note": "Connecteam's free plan is capped at 10 employees"
        }
      ]
    },
    {
      "group": "Integrations and Team Tools",
      "rows": [
        {
          "feature": "Native payroll or accounting integration",
          "statuses": {
            "connecteam": "not-documented",
            "float": "not-documented",
            "quickbooks-time": "available"
          },
          "note": "Requires an active QuickBooks Online subscription"
        },
        {
          "feature": "HR document management and internal team chat",
          "statuses": {
            "connecteam": "available",
            "float": "unavailable",
            "quickbooks-time": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has a real free plan?",
      "answer": "Connecteam, which is free for life for businesses with up to 10 employees; Float and QuickBooks Time only offer free trials."
    },
    {
      "question": "Do I need QuickBooks to use QuickBooks Time?",
      "answer": "Yes, an active QuickBooks Online subscription is required to use QuickBooks Time since the two products are designed to work together."
    },
    {
      "question": "Which is best for agencies that need to plan project capacity and profitability rather than track hourly attendance?",
      "answer": "Float, which is built specifically around resource scheduling, project margins, and rate cards rather than GPS time clocks."
    },
    {
      "question": "Which is best for field service or construction crews clocking in from job sites?",
      "answer": "Connecteam or QuickBooks Time, both offering GPS time tracking and geofencing; Connecteam adds task checklists and HR tools, while QuickBooks Time ties directly into QuickBooks payroll."
    },
    {
      "question": "Which offers the deepest reporting on whether a project is staying within budget?",
      "answer": "Float's Pro plan, with estimates-versus-actuals reporting and delivery dashboards."
    },
    {
      "question": "Which has the lowest starting cost for a small team?",
      "answer": "Connecteam is free for up to 10 employees; beyond that, Float starts at 7 dollars per person per month, while QuickBooks Time starts at a 20 dollar monthly base plus 10 dollars per user on top of a required QuickBooks Online subscription."
    }
  ]
};

export default connecteamVsFloatVsQuickbooksTimeContent;

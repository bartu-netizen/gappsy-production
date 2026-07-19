import type { GroupComparisonContent } from './types';

const clockifyVsFloatVsQuickbooksTimeContent: GroupComparisonContent = {
  "verdict": "Clockify, Float, and QuickBooks Time all help teams manage time and scheduling, but they are not interchangeable: Clockify is a general-purpose timer-based time tracker with a free plan and broad integrations, Float is purpose-built visual capacity and resource scheduling for agencies rather than a raw timer tool, and QuickBooks Time is a GPS-enabled field-workforce time tracker tightly coupled to QuickBooks Online and Payroll. Teams should pick based on which specific problem is primary, tracking hours, planning capacity, or paying an hourly field workforce, rather than treating these as three versions of the same product.",
  "bestFor": {
    "clockify": "Teams that want a free-to-start timer-based time tracker with broad third-party integrations and optional invoicing.",
    "float": "Agencies and studios that need visual capacity planning, workload allocation, and project margin tracking more than raw timesheet entry.",
    "quickbooks-time": "Field service businesses and mobile hourly workforces already on QuickBooks Online or Payroll that need GPS-enabled time tracking."
  },
  "highlights": [
    {
      "title": "Only Clockify has a permanent free plan",
      "description": "Clockify offers a free plan for up to 5 users, while Float offers only a free trial and QuickBooks Time requires an active QuickBooks Online subscription with no free tier.",
      "toolSlugs": [
        "clockify",
        "float",
        "quickbooks-time"
      ]
    },
    {
      "title": "Float is scheduling-first, not a timer-based tracker",
      "description": "Float centers on visual drag-and-drop scheduling, capacity management, and estimates-versus-actuals reporting rather than clock-in/clock-out time tracking, making it a different tool than Clockify or QuickBooks Time despite the category overlap.",
      "toolSlugs": [
        "float"
      ]
    },
    {
      "title": "QuickBooks Time is built for GPS-tracked field workforces",
      "description": "QuickBooks Time offers GPS-enabled mobile time tracking and geofencing reminders, plus native QuickBooks Online and Payroll integration, features neither Clockify nor Float document.",
      "toolSlugs": [
        "quickbooks-time"
      ]
    },
    {
      "title": "Clockify has the widest integration library",
      "description": "Clockify lists 90-plus integrations, more than Float or QuickBooks Time document, making it easier to embed into an existing tool stack.",
      "toolSlugs": [
        "clockify"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Tier and Pricing",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "clockify": "available",
            "float": "unavailable",
            "quickbooks-time": "unavailable"
          },
          "note": "Clockify's free plan is capped at 5 users as of April 2026; Float offers only a free trial; QuickBooks Time requires a paid QuickBooks Online subscription."
        }
      ]
    },
    {
      "group": "Time Tracking and Scheduling",
      "rows": [
        {
          "feature": "Timer-based time tracking",
          "statuses": {
            "clockify": "available",
            "float": "not-documented",
            "quickbooks-time": "available"
          },
          "note": "Float's documented feature set centers on scheduling rather than timer-based tracking."
        },
        {
          "feature": "Visual resource and capacity scheduling",
          "statuses": {
            "clockify": "not-documented",
            "float": "available",
            "quickbooks-time": "available"
          },
          "note": "Float's core product is drag-and-drop scheduling; QuickBooks Time bundles employee scheduling alongside GPS time tracking."
        },
        {
          "feature": "GPS tracking and geofencing",
          "statuses": {
            "clockify": "available",
            "float": "not-documented",
            "quickbooks-time": "available"
          },
          "note": "Clockify offers GPS tracking and screenshots as a feature; QuickBooks Time adds geofencing reminders on top of GPS tracking."
        }
      ]
    },
    {
      "group": "Reporting, Billing and Integrations",
      "rows": [
        {
          "feature": "Invoicing",
          "statuses": {
            "clockify": "available",
            "float": "unavailable",
            "quickbooks-time": "not-documented"
          },
          "note": "QuickBooks Time relies on the connected QuickBooks Online subscription for invoicing rather than a native module."
        },
        {
          "feature": "Project margin or profitability reporting",
          "statuses": {
            "clockify": "not-documented",
            "float": "available",
            "quickbooks-time": "not-documented"
          },
          "note": "Float's Pro tier adds project margin tracking and rate cards."
        },
        {
          "feature": "Native mobile apps (iOS and Android)",
          "statuses": {
            "clockify": "available",
            "float": "available",
            "quickbooks-time": "available"
          }
        },
        {
          "feature": "Payroll or accounting integration",
          "statuses": {
            "clockify": "not-documented",
            "float": "not-documented",
            "quickbooks-time": "available"
          },
          "note": "QuickBooks Time integrates natively with QuickBooks Online and QuickBooks Payroll."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Float a direct alternative to Clockify?",
      "answer": "Not exactly. Float is built around visual resource and capacity scheduling rather than timer-based time tracking, so it solves a related but different problem than Clockify's clock-in/clock-out tracking."
    },
    {
      "question": "Do I need a QuickBooks Online subscription to use QuickBooks Time?",
      "answer": "Yes, QuickBooks Time requires an active QuickBooks Online subscription to use, which adds to its total cost compared to standalone tools like Clockify or Float."
    },
    {
      "question": "Which of these has a permanent free plan?",
      "answer": "Only Clockify, and as of April 2026 that free plan is capped at 5 users. Float offers a free trial rather than a permanent free tier, and QuickBooks Time has no free plan."
    },
    {
      "question": "Which tool is best for field service teams with mobile workers?",
      "answer": "QuickBooks Time, thanks to its GPS-enabled mobile time tracking and geofencing reminders built specifically for field and mobile workforces."
    },
    {
      "question": "Which tool includes invoicing?",
      "answer": "Clockify includes invoicing on its paid tiers. Float does not document a native invoicing feature, and QuickBooks Time relies on the connected QuickBooks Online subscription for billing."
    },
    {
      "question": "Which is best for agencies tracking project profitability, not just hours?",
      "answer": "Float, whose Pro tier adds project margin tracking, rate cards, and estimates-versus-actuals reporting aimed specifically at agency delivery profitability."
    }
  ]
};

export default clockifyVsFloatVsQuickbooksTimeContent;

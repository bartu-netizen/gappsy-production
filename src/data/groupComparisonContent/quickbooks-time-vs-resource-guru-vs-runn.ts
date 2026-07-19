import type { GroupComparisonContent } from './types';

const quickbooksTimeVsResourceGuruVsRunnContent: GroupComparisonContent = {
  "verdict": "QuickBooks Time, Resource Guru, and Runn all fall under scheduling software, but they solve different problems: QuickBooks Time is a payroll-linked attendance and GPS time-tracking tool for hourly and field workforces already inside the QuickBooks ecosystem, while Resource Guru and Runn are visual resource-scheduling tools built for agencies and professional services teams booking people, equipment, or billable capacity. Between the two resourcing tools, Resource Guru wins on simplicity and low entry price, while Runn adds project financial forecasting and revenue modeling on top of scheduling. The right pick depends on whether the buyer needs payroll-grade time tracking or agency-style capacity planning.",
  "bestFor": {
    "quickbooks-time": "Field service and hourly workforce businesses already using QuickBooks Online that need GPS time tracking and geofencing tied directly to payroll.",
    "resource-guru": "Agencies and studios that want a simple, affordable drag-and-drop calendar for booking people, equipment, and rooms without a steep learning curve.",
    "runn": "Mid-sized professional services firms that need to combine visual resource scheduling with project budgets, billable rates, and revenue forecasting."
  },
  "highlights": [
    {
      "title": "Payroll-Linked Time Tracking",
      "description": "QuickBooks Time pairs GPS-enabled clock-in/out and geofencing with direct integration into QuickBooks Online and QuickBooks Payroll, a workflow neither Resource Guru nor Runn is built to replicate.",
      "toolSlugs": [
        "quickbooks-time"
      ]
    },
    {
      "title": "Simple Multi-Resource Booking",
      "description": "Resource Guru schedules people, equipment, and meeting rooms in one drag-and-drop calendar at the lowest entry price of the three, starting around 5 US dollars per user per month.",
      "toolSlugs": [
        "resource-guru"
      ]
    },
    {
      "title": "Financial Forecasting Built Into Scheduling",
      "description": "Runn layers project budgets, billable rates, and forecasted revenue directly onto its scheduling grid, letting managers protect margins while they plan capacity.",
      "toolSlugs": [
        "runn"
      ]
    },
    {
      "title": "Three Very Different Pricing Models",
      "description": "QuickBooks Time charges a base fee plus per-active-user pricing, Resource Guru bills per person across three tiers, and Runn bills per resource seat with a 20-seat minimum, so total cost scales very differently depending on team size.",
      "toolSlugs": [
        "quickbooks-time",
        "resource-guru",
        "runn"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Scheduling Core",
      "rows": [
        {
          "feature": "Visual drag-and-drop scheduling calendar",
          "statuses": {
            "quickbooks-time": "available",
            "resource-guru": "available",
            "runn": "available"
          }
        },
        {
          "feature": "Equipment and room booking",
          "statuses": {
            "quickbooks-time": "unavailable",
            "resource-guru": "available",
            "runn": "not-documented"
          },
          "note": "Resource Guru explicitly bills non-human resources like equipment and rooms at a reduced rate; Runn's provided data centers on people and skills rather than equipment or rooms."
        },
        {
          "feature": "GPS-enabled time tracking with geofencing",
          "statuses": {
            "quickbooks-time": "available",
            "resource-guru": "unavailable",
            "runn": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Financial and Payroll",
      "rows": [
        {
          "feature": "Payroll system integration",
          "statuses": {
            "quickbooks-time": "available",
            "resource-guru": "unavailable",
            "runn": "unavailable"
          }
        },
        {
          "feature": "Project budgets and revenue forecasting",
          "statuses": {
            "quickbooks-time": "unavailable",
            "resource-guru": "available",
            "runn": "available"
          },
          "note": "Resource Guru offers project rates and budgets from its Blackbelt tier up; Runn includes financial forecasting on its entry-level Lite plan."
        }
      ]
    },
    {
      "group": "Access and Trial",
      "rows": [
        {
          "feature": "API access",
          "statuses": {
            "quickbooks-time": "available",
            "resource-guru": "available",
            "runn": "available"
          },
          "note": "All three are tagged with API access; depth and plan requirements vary, so confirm current documentation before committing."
        },
        {
          "feature": "Free trial",
          "statuses": {
            "quickbooks-time": "available",
            "resource-guru": "available",
            "runn": "available"
          },
          "note": "QuickBooks Time requires an active QuickBooks Online subscription to use; Resource Guru's 30-day trial and Runn's trial do not require a credit card."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What is the main difference between QuickBooks Time, Resource Guru, and Runn?",
      "answer": "QuickBooks Time is built for tracking employee attendance and hours worked, feeding that data into QuickBooks Payroll. Resource Guru and Runn are built for scheduling and capacity planning across projects, with Runn adding financial forecasting that Resource Guru only partly matches on its higher tiers."
    },
    {
      "question": "Which of the three is cheapest to start with?",
      "answer": "Resource Guru has the lowest published starting price at 5 US dollars per user per month (4.16 US dollars billed annually). Runn starts at 7 US dollars per resource per month but requires a 20-resource minimum. QuickBooks Time starts at a 20 US dollar base fee plus 10 US dollars per active user per month and also requires an active QuickBooks Online subscription."
    },
    {
      "question": "Do I need QuickBooks Online to use QuickBooks Time?",
      "answer": "Yes. QuickBooks Time is designed to work alongside QuickBooks Online and QuickBooks Payroll rather than as a fully independent product, so an active QuickBooks Online subscription is required."
    },
    {
      "question": "Can Resource Guru or Runn replace QuickBooks Time for payroll-linked attendance tracking?",
      "answer": "No. Neither Resource Guru nor Runn is built around GPS clock-in/out, geofencing, or direct payroll integration the way QuickBooks Time is; they focus on scheduling people and resources against projects rather than tracking attendance for payroll."
    },
    {
      "question": "Is there a minimum team size requirement for any of these tools?",
      "answer": "Runn requires a 20-resource minimum on its paid plans, since it prices by every resource placed on the planner. QuickBooks Time and Resource Guru scale per active user or per person without a stated minimum."
    },
    {
      "question": "Which tool is best for an agency that needs financial forecasting alongside scheduling?",
      "answer": "Runn is built specifically to combine scheduling with project budgets, billable rates, and forecasted revenue from its entry-level plan. Resource Guru offers project rates and budgets starting on its Blackbelt tier, while QuickBooks Time does not include this kind of project financial forecasting."
    }
  ]
};

export default quickbooksTimeVsResourceGuruVsRunnContent;

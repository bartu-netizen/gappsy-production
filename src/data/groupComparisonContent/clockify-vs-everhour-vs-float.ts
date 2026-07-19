import type { GroupComparisonContent } from './types';

const clockifyVsEverhourVsFloatContent: GroupComparisonContent = {
  "verdict": "Clockify, Everhour, and Float all get used by agencies and client-services teams, but they solve overlapping pieces of a bigger puzzle rather than the exact same job. Clockify and Everhour are timer-first tools for logging actual hours and turning them into invoices, while Float is built around planning who is available before the work starts, tracking margins and capacity rather than start/stop timers. The practical choice usually comes down to whether a team's biggest pain point is capturing billable time cheaply (Clockify), embedding time and budgets into an existing PM tool like Asana or Jira (Everhour), or seeing team capacity and project profitability at a glance (Float).",
  "bestFor": {
    "clockify": "Teams that want a free time tracker to start with, then a long ladder of paid tiers (invoicing, approvals, GPS tracking, SSO) to add as they grow.",
    "everhour": "Agencies and dev teams already living inside Asana, Trello, Jira, or GitHub who want budgets, budget alerts, and invoicing without leaving those tools.",
    "float": "Agencies and studios whose main problem is knowing who is available and whether a project is staying profitable, not logging every minute worked."
  },
  "highlights": [
    {
      "title": "Only Clockify and Everhour offer a permanent free plan",
      "description": "Both cap the free tier at 5 users with core time tracking and reporting. Float has no free plan at all, only a free trial, so teams pay from day one at $7/person/month.",
      "toolSlugs": [
        "clockify",
        "everhour",
        "float"
      ]
    },
    {
      "title": "Everhour's whole pitch is embedding into the tools you already use",
      "description": "Everhour adds a timer widget directly onto task cards in Asana, Trello, Jira, Basecamp, GitHub, ClickUp, Monday, Linear, and Notion, rather than asking teams to adopt a separate destination app.",
      "toolSlugs": [
        "everhour"
      ]
    },
    {
      "title": "Float is a scheduling and capacity tool first, a time tracker second",
      "description": "Float's core feature is a visual drag-and-drop schedule for allocating people to projects, with margin tracking and estimates-vs-actuals reporting on Pro, rather than a start/stop timer for logging hours.",
      "toolSlugs": [
        "float"
      ]
    },
    {
      "title": "Everhour's free plan skips the feature that makes it Everhour",
      "description": "The free tier excludes the native third-party integrations that are Everhour's core differentiator, so most teams evaluating it for Asana or Jira embedding will need the paid Team plan.",
      "toolSlugs": [
        "everhour"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Time Tracking",
      "rows": [
        {
          "feature": "Start/stop timer and manual time entry",
          "statuses": {
            "clockify": "available",
            "everhour": "available",
            "float": "not-documented"
          },
          "note": "Float's documented feature set centers on scheduling and estimates-vs-actuals rather than a native timer."
        },
        {
          "feature": "Native embedding in PM tools (Asana, Trello, Jira, etc.)",
          "statuses": {
            "clockify": "available",
            "everhour": "available",
            "float": "available"
          },
          "note": "Clockify connects via 90+ integrations; Everhour embeds a timer widget in task cards; Float lets teams drag Jira issues onto the schedule."
        }
      ]
    },
    {
      "group": "Budgeting and Billing",
      "rows": [
        {
          "feature": "Project or task budgets with alerts",
          "statuses": {
            "clockify": "available",
            "everhour": "available",
            "float": "available"
          },
          "note": "Gated to Clockify's Pro tier; core to Everhour's Team plan; part of Float's rate-card and margin-tracking features."
        },
        {
          "feature": "Client invoicing",
          "statuses": {
            "clockify": "available",
            "everhour": "available",
            "float": "unavailable"
          },
          "note": "Clockify (Standard tier+) and Everhour (Team plan, with QuickBooks/Xero export) generate invoices from tracked hours; Float has no documented invoicing feature."
        },
        {
          "feature": "Multi-currency support",
          "statuses": {
            "clockify": "available",
            "everhour": "not-documented",
            "float": "available"
          },
          "note": "Clockify includes it on Pro; Float supports up to 5 multi-currency projects on Pro and unlimited on Enterprise."
        }
      ]
    },
    {
      "group": "Resourcing and Access",
      "rows": [
        {
          "feature": "Visual capacity/resource scheduling",
          "statuses": {
            "clockify": "available",
            "everhour": "available",
            "float": "available"
          },
          "note": "It is Clockify's and Everhour's add-on capability but Float's central, defining feature."
        },
        {
          "feature": "Permanent free plan",
          "statuses": {
            "clockify": "available",
            "everhour": "available",
            "float": "unavailable"
          },
          "note": "Clockify and Everhour cap free usage at 5 users; Float offers only a free trial."
        },
        {
          "feature": "Native iOS and Android apps",
          "statuses": {
            "clockify": "available",
            "everhour": "not-documented",
            "float": "available"
          },
          "note": "Everhour's documented client is a web app plus a Chrome browser extension, with no native mobile apps mentioned."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Clockify, Everhour, and Float all have a free plan?",
      "answer": "Clockify and Everhour both offer a free plan capped at 5 users with core time tracking and reporting. Float has no permanent free plan, only a free trial, with paid pricing starting at $7 per person per month."
    },
    {
      "question": "Which of the three integrates most deeply with tools like Asana, Trello, or Jira?",
      "answer": "Everhour is built specifically to embed a timer widget directly into task cards inside Asana, Trello, Jira, Basecamp, GitHub, and similar tools, which is its core differentiator. Clockify connects to over 90 apps through more general integrations, and Float can pull Jira issues onto its schedule but is not primarily an embedded-timer tool."
    },
    {
      "question": "Which tool is best for tracking actual billable hours versus planning future team capacity?",
      "answer": "Clockify and Everhour are timer-first tools built to log actual hours worked and turn them into invoices. Float is built around forward-looking capacity planning, allocating people's time on a visual schedule and comparing estimates to actuals rather than running a start/stop timer."
    },
    {
      "question": "Can any of these generate client invoices directly?",
      "answer": "Clockify (Standard tier and above) and Everhour (Team plan, with QuickBooks and Xero export) can generate invoices from tracked billable hours. Float does not have a documented invoicing feature; it focuses on margin tracking and rate cards instead."
    },
    {
      "question": "Do they support multi-currency billing for international clients?",
      "answer": "Clockify includes multi-currency support on its Pro tier, and Float supports up to 5 concurrent multi-currency projects on Pro (unlimited on Enterprise). Everhour does not document multi-currency support."
    },
    {
      "question": "Is single sign-on (SSO) available on all three?",
      "answer": "Yes, but only at higher tiers: Clockify includes SSO on its Enterprise plan, Everhour includes it on its paid Team plan, and Float adds it starting on the Pro plan."
    }
  ]
};

export default clockifyVsEverhourVsFloatContent;

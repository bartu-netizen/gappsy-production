import type { GroupComparisonContent } from './types';

const activitywatchVsJibbleVsTmetricContent: GroupComparisonContent = {
  "verdict": "ActivityWatch, Jibble, and TMetric solve different jobs inside the same category: ActivityWatch is a free, local-first personal tracker with no team or billing layer, Jibble is a free-forever attendance clock built around GPS and facial recognition for hourly and field teams, and TMetric is a billing-grade tracker for freelancers and agencies that need budgets, invoicing, and a timer embedded in other apps. The right pick depends on whether you need private personal insight, fraud-resistant attendance, or client-ready time billing.",
  "bestFor": {
    "activitywatch": "Privacy-conscious individuals and developers who want completely free, automatic personal time tracking with data that never leaves their device",
    "jibble": "Small and mid-sized businesses with hourly or field-based teams that need a free, unlimited-user attendance clock with GPS and facial recognition",
    "tmetric": "Freelancers and agencies that need budgets, alerts, and client invoicing built on top of billing-grade time tracking"
  },
  "highlights": [
    {
      "title": "Personal privacy versus team oversight",
      "description": "ActivityWatch stores all tracked data locally on the user's own device with no cloud sync, while Jibble and TMetric are cloud-based tools designed for managers to review team time.",
      "toolSlugs": [
        "activitywatch",
        "jibble",
        "tmetric"
      ]
    },
    {
      "title": "Free-forever unlimited users",
      "description": "Jibble's Free plan supports unlimited users with no credit card required, a much higher ceiling than TMetric's two-seat free tier or ActivityWatch's single-device personal use case.",
      "toolSlugs": [
        "jibble"
      ]
    },
    {
      "title": "Fraud-resistant attendance verification",
      "description": "Jibble bundles GPS geofencing and AI facial recognition into its free plan, features aimed at stopping buddy punching for construction, retail, and field service teams.",
      "toolSlugs": [
        "jibble"
      ]
    },
    {
      "title": "Billing-grade budgets and invoicing",
      "description": "TMetric turns tracked hours into client invoices and lets teams set project budgets with alerts, plus a timer that embeds inside more than fifty other web apps.",
      "toolSlugs": [
        "tmetric"
      ]
    },
    {
      "title": "Fully automatic capture with zero setup cost",
      "description": "ActivityWatch automatically logs active applications, window titles, and browsing activity in the background with no premium tiers, usage limits, or ads at any point.",
      "toolSlugs": [
        "activitywatch"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Tracking Method",
      "rows": [
        {
          "feature": "Automatic app or window tracking",
          "statuses": {
            "activitywatch": "available",
            "jibble": "unavailable",
            "tmetric": "limited"
          },
          "note": "TMetric's activity monitoring is a Business-tier add-on rather than a core free-plan feature"
        },
        {
          "feature": "GPS geofencing and facial recognition clock-in",
          "statuses": {
            "activitywatch": "unavailable",
            "jibble": "available",
            "tmetric": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Team and Workforce Management",
      "rows": [
        {
          "feature": "Leave and PTO management",
          "statuses": {
            "activitywatch": "unavailable",
            "jibble": "available",
            "tmetric": "limited"
          },
          "note": "TMetric's time-off module ships on the Business plan"
        },
        {
          "feature": "Shared kiosk or terminal clock-in",
          "statuses": {
            "activitywatch": "unavailable",
            "jibble": "available",
            "tmetric": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Billing and Reporting",
      "rows": [
        {
          "feature": "Client invoicing",
          "statuses": {
            "activitywatch": "unavailable",
            "jibble": "available",
            "tmetric": "available"
          }
        },
        {
          "feature": "Project budgets and alerts",
          "statuses": {
            "activitywatch": "unavailable",
            "jibble": "not-documented",
            "tmetric": "available"
          }
        }
      ]
    },
    {
      "group": "Data and Privacy",
      "rows": [
        {
          "feature": "Local-only, on-device data storage",
          "statuses": {
            "activitywatch": "available",
            "jibble": "unavailable",
            "tmetric": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is ActivityWatch really free with no paid tiers?",
      "answer": "Yes. ActivityWatch is fully open source under MPL-2.0 with no premium tiers, usage limits, or ads, though cross-device sync is still in development."
    },
    {
      "question": "Which of these tools suits an hourly or field-based workforce?",
      "answer": "Jibble, since its free plan supports unlimited users along with GPS geofencing and facial recognition designed to prevent buddy punching."
    },
    {
      "question": "Which tool is best for freelancers who bill clients?",
      "answer": "TMetric, because it converts tracked hours directly into invoices and includes project budgets with alerts, features ActivityWatch and Jibble do not offer."
    },
    {
      "question": "Do any of these track computer activity automatically without clocking in?",
      "answer": "ActivityWatch tracks apps and windows automatically at all times. TMetric offers similar activity monitoring only on its paid Business tier. Jibble is attendance-based and relies on manual clock-in rather than automatic app tracking."
    },
    {
      "question": "Which option keeps time data completely private?",
      "answer": "ActivityWatch, since all tracked data stays on the user's own device and is never sent to a server, unlike the cloud-based Jibble and TMetric."
    },
    {
      "question": "What is the cheapest way for a small team to get started?",
      "answer": "Jibble's free plan covers unlimited users at no cost, while TMetric's free plan is capped at two seats, making Jibble the more scalable free option for teams larger than a pair of freelancers."
    }
  ]
};

export default activitywatchVsJibbleVsTmetricContent;

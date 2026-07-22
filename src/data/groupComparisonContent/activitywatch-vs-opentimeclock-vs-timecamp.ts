import type { GroupComparisonContent } from './types';

const activitywatchVsOpentimeclockVsTimecampContent: GroupComparisonContent = {
  "verdict": "These three tools solve related but distinct time-tracking problems. ActivityWatch is a free, open-source, local-only tracker for individuals who want automatic app and website tracking without any data leaving their device. OpenTimeClock and TimeCamp are business-facing platforms with unlimited free tiers, but OpenTimeClock centers on employee attendance with GPS and biometric clock-in, while TimeCamp pairs automatic tracking with invoicing, budgeting, and resource planning for teams and agencies.",
  "bestFor": {
    "activitywatch": "Individuals and developers who want completely free, local-only automatic time tracking without sending any data to a server.",
    "opentimeclock": "Small businesses, schools, and nonprofits that need an employee time clock with GPS or facial-recognition verification and unlimited free users.",
    "timecamp": "Agencies and teams that want automatic time tracking combined with invoicing, budgeting, and resource planning under one free-to-start platform."
  },
  "highlights": [
    {
      "title": "Completely Local, Privacy-First Tracking",
      "description": "ActivityWatch stores all tracked data on the user's own device and never sends it to a server, with no premium tiers, usage limits, or ads.",
      "toolSlugs": [
        "activitywatch"
      ]
    },
    {
      "title": "Unlimited Free Users for Businesses",
      "description": "Both OpenTimeClock and TimeCamp offer free plans that support unlimited employees, unusually generous for the time-tracking category where most competitors charge per seat.",
      "toolSlugs": [
        "opentimeclock",
        "timecamp"
      ]
    },
    {
      "title": "Built-In Invoicing and Budgeting",
      "description": "TimeCamp layers invoicing, project budgets, and a resource planner on top of automatic time tracking, letting agencies bill clients directly from tracked hours.",
      "toolSlugs": [
        "timecamp"
      ]
    },
    {
      "title": "GPS and Biometric Clock-In",
      "description": "OpenTimeClock supports GPS geofencing and facial recognition at clock-in, helping field and multi-site teams verify attendance and reduce time theft.",
      "toolSlugs": [
        "opentimeclock"
      ]
    },
    {
      "title": "No Team or Business Features",
      "description": "ActivityWatch is a personal, single-device tracker with no multi-employee accounts, attendance tracking, or billing tools, unlike OpenTimeClock and TimeCamp.",
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
          "feature": "Automatic background tracking",
          "statuses": {
            "activitywatch": "available",
            "opentimeclock": "unavailable",
            "timecamp": "available"
          },
          "note": "OpenTimeClock relies on manual, GPS, or biometric clock-in rather than automatic background tracking."
        },
        {
          "feature": "Manual clock-in and attendance logging",
          "statuses": {
            "activitywatch": "unavailable",
            "opentimeclock": "available",
            "timecamp": "available"
          }
        }
      ]
    },
    {
      "group": "Team and Business Features",
      "rows": [
        {
          "feature": "Multi-employee or team accounts",
          "statuses": {
            "activitywatch": "unavailable",
            "opentimeclock": "available",
            "timecamp": "available"
          }
        },
        {
          "feature": "Invoicing",
          "statuses": {
            "activitywatch": "unavailable",
            "opentimeclock": "not-documented",
            "timecamp": "available"
          }
        },
        {
          "feature": "PTO or attendance tracking",
          "statuses": {
            "activitywatch": "unavailable",
            "opentimeclock": "available",
            "timecamp": "available"
          }
        }
      ]
    },
    {
      "group": "Privacy and Platform Support",
      "rows": [
        {
          "feature": "Local-only data storage",
          "statuses": {
            "activitywatch": "available",
            "opentimeclock": "unavailable",
            "timecamp": "unavailable"
          }
        },
        {
          "feature": "Cross-platform apps",
          "statuses": {
            "activitywatch": "available",
            "opentimeclock": "available",
            "timecamp": "available"
          },
          "note": "ActivityWatch covers Windows, macOS, Linux, and Android with no official iOS app; OpenTimeClock and TimeCamp are web-based with companion mobile apps."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is ActivityWatch really free with no limits?",
      "answer": "Yes. ActivityWatch has no premium tiers, no usage limits, and no ads, and it is licensed under MPL-2.0 as fully open-source software."
    },
    {
      "question": "Does ActivityWatch support teams or multiple employees?",
      "answer": "No. ActivityWatch is a personal, local-only tool with no multi-employee accounts, attendance tracking, or admin dashboard, unlike OpenTimeClock or TimeCamp."
    },
    {
      "question": "Which has the most generous free plan for a business?",
      "answer": "Both OpenTimeClock and TimeCamp offer free plans that support unlimited users, which is unusually generous for the time-tracking category. OpenTimeClock's free plan loses PDF and Excel export after an initial 30-day period, while TimeCamp's free plan keeps core timesheet functionality indefinitely."
    },
    {
      "question": "Which tool includes invoicing?",
      "answer": "TimeCamp includes invoicing generated directly from billable tracked hours starting on its Starter tier. Invoicing is not documented as a feature of OpenTimeClock or ActivityWatch."
    },
    {
      "question": "Does OpenTimeClock track time automatically like ActivityWatch?",
      "answer": "No. OpenTimeClock relies on manual, GPS-verified, or facial-recognition clock-in rather than the automatic, passive background tracking that defines ActivityWatch."
    },
    {
      "question": "Which is best for privacy-conscious individuals?",
      "answer": "ActivityWatch, since all tracked data stays on the user's own device and is never sent to a server, unlike the cloud-hosted OpenTimeClock and TimeCamp."
    }
  ]
};

export default activitywatchVsOpentimeclockVsTimecampContent;

import type { GroupComparisonContent } from './types';

const activitywatchVsDesktimeVsJibbleContent: GroupComparisonContent = {
  "verdict": "ActivityWatch, DeskTime, and Jibble sit at different points on the personal-versus-team tracking spectrum: ActivityWatch is a free, local-first tool for individuals who want private automatic tracking, DeskTime automates productivity scoring for remote and hybrid teams from the same app and URL data, and Jibble is a free-forever attendance clock built around GPS and facial recognition for hourly and field workforces. The right choice hinges on whether the goal is personal insight, productivity monitoring, or attendance verification.",
  "bestFor": {
    "activitywatch": "Privacy-conscious individuals who want completely free, automatic personal time tracking with data that stays on their own device",
    "desktime": "Remote and hybrid teams that want automatic productivity scoring and optional screenshot verification without manual timers",
    "jibble": "Hourly and field-based workforces that need a free, unlimited-user attendance clock with GPS and facial recognition"
  },
  "highlights": [
    {
      "title": "Personal privacy versus team monitoring",
      "description": "ActivityWatch keeps all tracked data on the user's own device with no cloud sync, while DeskTime and Jibble are cloud-based tools built for managers to review team activity and attendance.",
      "toolSlugs": [
        "activitywatch",
        "desktime",
        "jibble"
      ]
    },
    {
      "title": "Automatic productivity scoring",
      "description": "DeskTime classifies tracked apps and URLs into productive, unproductive, or neutral categories automatically, giving managers a productivity score with minimal setup.",
      "toolSlugs": [
        "desktime"
      ]
    },
    {
      "title": "Free-forever unlimited-user attendance",
      "description": "Jibble's Free plan supports unlimited users with GPS geofencing and facial recognition included at no cost, a much higher ceiling than DeskTime's single-user free tier.",
      "toolSlugs": [
        "jibble"
      ]
    },
    {
      "title": "Zero-cost, fully automatic personal tracking",
      "description": "ActivityWatch automatically logs active applications and window titles in the background with no premium tiers, usage limits, or ads at any point in its use.",
      "toolSlugs": [
        "activitywatch"
      ]
    },
    {
      "title": "Platform coverage gaps",
      "description": "ActivityWatch has no official iOS app, while DeskTime and Jibble both ship mobile apps for iOS and Android alongside desktop clients.",
      "toolSlugs": [
        "activitywatch",
        "desktime",
        "jibble"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Tracking Approach",
      "rows": [
        {
          "feature": "Automatic app or window tracking",
          "statuses": {
            "activitywatch": "available",
            "desktime": "available",
            "jibble": "unavailable"
          }
        },
        {
          "feature": "Built-in productivity scoring",
          "statuses": {
            "activitywatch": "unavailable",
            "desktime": "available",
            "jibble": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Attendance and Verification",
      "rows": [
        {
          "feature": "GPS geofencing",
          "statuses": {
            "activitywatch": "unavailable",
            "desktime": "unavailable",
            "jibble": "available"
          }
        },
        {
          "feature": "Facial recognition clock-in",
          "statuses": {
            "activitywatch": "unavailable",
            "desktime": "unavailable",
            "jibble": "available"
          }
        }
      ]
    },
    {
      "group": "Team Management",
      "rows": [
        {
          "feature": "Screenshot capture",
          "statuses": {
            "activitywatch": "unavailable",
            "desktime": "limited",
            "jibble": "limited"
          },
          "note": "Screenshots are gated behind DeskTime's Premium plan and Jibble's Premium and Ultimate plans"
        },
        {
          "feature": "PTO and leave management",
          "statuses": {
            "activitywatch": "unavailable",
            "desktime": "limited",
            "jibble": "available"
          },
          "note": "DeskTime's absence calendar is part of its Premium plan"
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
            "desktime": "unavailable",
            "jibble": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three tools is completely free with no paid tiers?",
      "answer": "ActivityWatch. It has no premium tiers, usage limits, or ads, unlike DeskTime and Jibble which are both freemium products."
    },
    {
      "question": "Which tool tracks work automatically versus requiring a manual clock-in?",
      "answer": "ActivityWatch and DeskTime both track apps and windows automatically in the background. Jibble instead relies on employees clocking in and out, verified by GPS and facial recognition."
    },
    {
      "question": "Which tool offers biometric attendance verification?",
      "answer": "Jibble, which bundles AI-based facial recognition and GPS geofencing into its free plan to help prevent buddy punching."
    },
    {
      "question": "Which option keeps time data entirely private and on-device?",
      "answer": "ActivityWatch, since all tracked data stays on the user's own device and is never sent to a server, unlike the cloud-based DeskTime and Jibble."
    },
    {
      "question": "Which is best for a solo freelancer who wants private personal tracking?",
      "answer": "ActivityWatch, given its local-first storage and lack of any team or monitoring features aimed at managers."
    },
    {
      "question": "Which is best suited for outsourced or BPO-style productivity monitoring?",
      "answer": "DeskTime, thanks to its automatic productivity scoring and optional screenshot capture built for verifying contractor work."
    }
  ]
};

export default activitywatchVsDesktimeVsJibbleContent;

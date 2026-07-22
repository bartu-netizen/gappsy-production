import type { GroupComparisonContent } from './types';

const desktimeVsJibbleVsTmetricContent: GroupComparisonContent = {
  "verdict": "DeskTime, Jibble, and TMetric all track work hours but are optimized for different workforces: DeskTime automates tracking around desktop activity and productivity scoring, Jibble is built around GPS and facial-recognition attendance verification for hourly and field teams on a genuinely free-forever plan, and TMetric leans toward project budgeting, client invoicing, and a timer that embeds into other web apps for freelancers and agencies.",
  "bestFor": {
    "desktime": "Desk-based teams that want automatic tracking and productivity scoring without employees managing manual timers",
    "jibble": "Hourly, shift-based, or field workforces that need GPS geofencing and facial recognition attendance verification on a free plan",
    "tmetric": "Freelancers and agencies that need project budgeting, client invoicing, and a timer embedded across other web apps"
  },
  "highlights": [
    {
      "title": "Jibble's free plan has no user cap",
      "description": "Jibble offers unlimited users on a genuinely free-forever plan with GPS tracking, facial recognition verification, and unlimited integrations, no credit card required.",
      "toolSlugs": [
        "jibble"
      ]
    },
    {
      "title": "DeskTime tracks without manual timers",
      "description": "DeskTime starts and stops tracking automatically based on computer activity and classifies apps and URLs into productivity categories out of the box.",
      "toolSlugs": [
        "desktime"
      ]
    },
    {
      "title": "Jibble verifies identity with biometrics",
      "description": "AI-based facial recognition and selfie capture at clock-in, combined with configurable geofences, help prevent buddy punching for on-site and field teams.",
      "toolSlugs": [
        "jibble"
      ]
    },
    {
      "title": "TMetric is built around budgets and billing",
      "description": "TMetric lets teams set per-project budgets with spend alerts and turn tracked billable hours directly into client-ready invoices.",
      "toolSlugs": [
        "tmetric"
      ]
    },
    {
      "title": "TMetric's timer follows you into other apps",
      "description": "TMetric's cross-app timer works inside more than 50 popular web apps, letting users track time without leaving their existing workflow.",
      "toolSlugs": [
        "tmetric"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Tracking Method",
      "rows": [
        {
          "feature": "Fully automatic tracking without starting a manual timer",
          "statuses": {
            "desktime": "available",
            "jibble": "limited",
            "tmetric": "limited"
          },
          "note": "Jibble is clock-in/clock-out based with GPS verification rather than fully automatic; TMetric relies on a manual or cross-app timer with calendar-based suggestions."
        },
        {
          "feature": "Timer embedded inside other web apps",
          "statuses": {
            "desktime": "not-documented",
            "jibble": "not-documented",
            "tmetric": "available"
          },
          "note": "TMetric's timer works inside 50+ popular web apps."
        }
      ]
    },
    {
      "group": "Monitoring and Verification",
      "rows": [
        {
          "feature": "Periodic screenshot capture",
          "statuses": {
            "desktime": "available",
            "jibble": "limited",
            "tmetric": "limited"
          },
          "note": "Available on higher tiers for all three: DeskTime Premium, Jibble Premium/Ultimate, and TMetric Business."
        },
        {
          "feature": "GPS location tracking and geofencing",
          "statuses": {
            "desktime": "not-documented",
            "jibble": "available",
            "tmetric": "not-documented"
          }
        },
        {
          "feature": "Facial recognition clock-in verification",
          "statuses": {
            "desktime": "not-documented",
            "jibble": "available",
            "tmetric": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Workforce Management",
      "rows": [
        {
          "feature": "Shift scheduling",
          "statuses": {
            "desktime": "available",
            "jibble": "not-documented",
            "tmetric": "limited"
          },
          "note": "DeskTime includes shift scheduling on its Premium plan; TMetric offers a time-off module on Business rather than full shift scheduling."
        }
      ]
    },
    {
      "group": "Pricing and Billing",
      "rows": [
        {
          "feature": "Free plan supports unlimited users",
          "statuses": {
            "desktime": "unavailable",
            "jibble": "available",
            "tmetric": "limited"
          },
          "note": "DeskTime's free tier is limited to a single user; TMetric's free tier supports up to 2 seats; Jibble's free plan has no user cap."
        },
        {
          "feature": "Client invoicing from tracked hours",
          "statuses": {
            "desktime": "available",
            "jibble": "not-documented",
            "tmetric": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has a genuinely free plan with no user limit?",
      "answer": "Jibble. Its free-forever plan supports unlimited users with GPS tracking, facial recognition verification, and unlimited integrations, with no credit card required. DeskTime's free plan is capped at a single user and TMetric's at 2 seats."
    },
    {
      "question": "Does DeskTime require me to start and stop a timer manually?",
      "answer": "No. DeskTime tracks automatically based on computer activity, starting and stopping without employees managing a manual timer, and classifies app and URL usage into a productivity score."
    },
    {
      "question": "Does Jibble really use facial recognition for clock-ins?",
      "answer": "Yes. Jibble uses AI-based facial recognition and selfie capture to verify employee identity at clock-in, combined with configurable geofences, specifically to prevent buddy punching."
    },
    {
      "question": "Can TMetric turn tracked time directly into a client invoice?",
      "answer": "Yes. TMetric lets teams turn tracked billable hours directly into client-ready invoices, alongside per-project budgets with spend alerts."
    },
    {
      "question": "Which tool is best suited to a field or hourly workforce?",
      "answer": "Jibble, given its GPS geofencing, facial recognition verification, kiosk mode for shared devices, and offline mode for field and remote employees without signal."
    },
    {
      "question": "Do these tools integrate with payroll or project management software?",
      "answer": "Jibble integrates natively with QuickBooks, Xero, and Deel for payroll; TMetric integrates with Jira, Redmine, ClickUp, and QuickBooks; DeskTime's documented integration strength is its own built-in automated invoicing."
    }
  ]
};

export default desktimeVsJibbleVsTmetricContent;

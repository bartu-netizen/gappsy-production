import type { GroupComparisonContent } from './types';

const desktimeVsJibbleVsTimecampContent: GroupComparisonContent = {
  "verdict": "DeskTime, Jibble, and TimeCamp all track work hours but lead with different strengths: DeskTime automates productivity scoring from app and URL activity, Jibble focuses on fraud-resistant attendance with GPS and facial recognition on an unlimited free plan, and TimeCamp pairs a free unlimited-user tracker with budgeting, invoicing, and resource planning. Teams choosing between them should weigh automatic productivity insight against attendance verification against project financial control.",
  "bestFor": {
    "desktime": "Remote and hybrid teams that want fully automatic productivity scoring and optional screenshot verification without manual timers",
    "jibble": "Hourly and field-based workforces that need a genuinely free, unlimited-user attendance clock with GPS and biometric verification",
    "timecamp": "Agencies and mid-size teams that want a free unlimited-user tracker combined with budgeting, resource planning, and invoicing"
  },
  "highlights": [
    {
      "title": "Free plan scope differs sharply",
      "description": "Jibble and TimeCamp both offer genuinely free plans with unlimited users, while DeskTime's free tier is capped at a single user, pushing small teams toward a paid plan almost immediately.",
      "toolSlugs": [
        "desktime",
        "jibble",
        "timecamp"
      ]
    },
    {
      "title": "Automatic productivity scoring",
      "description": "DeskTime classifies apps and URLs into productive, unproductive, or neutral categories out of the box, giving managers a productivity score without configuration.",
      "toolSlugs": [
        "desktime"
      ]
    },
    {
      "title": "Biometric attendance verification",
      "description": "Jibble bundles facial recognition and GPS geofencing into its free plan to stop buddy punching, a combination most competitors reserve for paid tiers.",
      "toolSlugs": [
        "jibble"
      ]
    },
    {
      "title": "Budgeting and resource planning on a free plan",
      "description": "TimeCamp's free tier still includes core timesheets and scales into project budgets, estimates, and a resource planner on paid tiers, undercutting DeskTime and Jibble on price at each level.",
      "toolSlugs": [
        "timecamp"
      ]
    },
    {
      "title": "Screenshot-based verification",
      "description": "DeskTime and TimeCamp both offer optional screenshot capture on higher tiers for outsourced or contractor accountability, a feature Jibble does not provide.",
      "toolSlugs": [
        "desktime",
        "timecamp"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Automatic Tracking",
      "rows": [
        {
          "feature": "Automatic app or URL tracking",
          "statuses": {
            "desktime": "available",
            "jibble": "unavailable",
            "timecamp": "available"
          }
        },
        {
          "feature": "Built-in productivity scoring",
          "statuses": {
            "desktime": "available",
            "jibble": "unavailable",
            "timecamp": "not-documented"
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
            "desktime": "unavailable",
            "jibble": "available",
            "timecamp": "not-documented"
          }
        },
        {
          "feature": "Facial recognition clock-in",
          "statuses": {
            "desktime": "unavailable",
            "jibble": "available",
            "timecamp": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Project and Billing",
      "rows": [
        {
          "feature": "Project budgets and estimates",
          "statuses": {
            "desktime": "not-documented",
            "jibble": "not-documented",
            "timecamp": "available"
          }
        },
        {
          "feature": "Client invoicing",
          "statuses": {
            "desktime": "available",
            "jibble": "available",
            "timecamp": "available"
          }
        }
      ]
    },
    {
      "group": "Plan Structure",
      "rows": [
        {
          "feature": "Unlimited users on the free plan",
          "statuses": {
            "desktime": "unavailable",
            "jibble": "available",
            "timecamp": "available"
          },
          "note": "DeskTime's free plan is limited to a single user"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool has the most generous free plan for a growing team?",
      "answer": "Jibble and TimeCamp both offer unlimited users on their free plans, while DeskTime's free tier only covers a single user."
    },
    {
      "question": "Does Jibble automatically track which apps or websites employees use?",
      "answer": "No. Jibble is built around attendance and clock-in verification with GPS and facial recognition rather than automatic app or URL tracking, which is DeskTime and TimeCamp's approach."
    },
    {
      "question": "Which option is cheapest as a team grows?",
      "answer": "TimeCamp's paid tiers start lower than DeskTime's and undercut most direct competitors, though Jibble's unlimited free plan can still be cheaper for teams that don't need advanced reporting."
    },
    {
      "question": "Which tool includes biometric fraud prevention for attendance?",
      "answer": "Jibble, which bundles AI-based facial recognition and selfie verification even into its free plan."
    },
    {
      "question": "Can any of these capture screenshots for verification?",
      "answer": "DeskTime offers screenshots on its Premium plan and TimeCamp offers screenshot monitoring on its higher tiers; Jibble does not offer screenshot capture."
    },
    {
      "question": "Which tool is best for combining time tracking with project budgeting?",
      "answer": "TimeCamp, since it layers project budgets, estimates, and a resource planner on top of its free unlimited-user timesheet base."
    }
  ]
};

export default desktimeVsJibbleVsTimecampContent;

import type { GroupComparisonContent } from './types';

const desktimeVsTimecampVsTmetricContent: GroupComparisonContent = {
  "verdict": "DeskTime, TimeCamp, and TMetric all automate the tedious parts of team time tracking, but they lead with different strengths. DeskTime is built around fully automatic, idle-aware tracking with a built-in productivity score out of the box. TimeCamp undercuts both on price and offers a genuinely free plan for unlimited users, making it the budget pick for growing teams. TMetric leans on its embedded, cross-app timer and solid budgeting and invoicing tools, appealing most to freelancers and agencies already living inside dozens of other web apps.",
  "bestFor": {
    "desktime": "Teams that want fully automatic, idle-aware tracking with a productivity score built in from day one",
    "timecamp": "Budget-conscious teams that need a genuinely free plan with unlimited users before scaling into paid tiers",
    "tmetric": "Freelancers and agencies who want the timer embedded directly inside the 50+ web apps they already use"
  },
  "highlights": [
    {
      "title": "TimeCamp's free plan has no user limit",
      "description": "Unlike DeskTime (capped at one user) and TMetric (capped at two seats), TimeCamp's Free plan supports unlimited users and projects with core timesheet functionality at no cost.",
      "toolSlugs": [
        "timecamp",
        "desktime",
        "tmetric"
      ]
    },
    {
      "title": "DeskTime tracks and scores automatically",
      "description": "DeskTime starts and stops tracking based on computer activity without manual timers, then classifies app and URL usage into a productivity score, requiring minimal setup.",
      "toolSlugs": [
        "desktime"
      ]
    },
    {
      "title": "TMetric's timer lives inside your other apps",
      "description": "TMetric can be started from inside more than 50 popular web apps, so teams can log time without switching context, alongside calendar sync that suggests entries.",
      "toolSlugs": [
        "tmetric"
      ]
    },
    {
      "title": "Screenshot monitoring is gated on all three",
      "description": "Each tool offers optional screenshot capture for verification, but all three reserve it for a higher-priced tier: DeskTime's Premium, TimeCamp's Premium/Ultimate, and TMetric's Business plan.",
      "toolSlugs": [
        "desktime",
        "timecamp",
        "tmetric"
      ]
    },
    {
      "title": "Project budgets and invoicing are strongest in TimeCamp and TMetric",
      "description": "Both TimeCamp and TMetric build in project budgets, estimates, and client invoicing from their entry paid tiers, while DeskTime's automated invoicing ships without a dedicated budgeting layer.",
      "toolSlugs": [
        "timecamp",
        "tmetric",
        "desktime"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Tracking",
      "rows": [
        {
          "feature": "Automatic time tracking",
          "statuses": {
            "desktime": "available",
            "timecamp": "available",
            "tmetric": "limited"
          },
          "note": "TMetric's cross-app timer is embedded in other apps but is started manually rather than fully idle-aware like DeskTime and TimeCamp."
        },
        {
          "feature": "Productivity scoring",
          "statuses": {
            "desktime": "available",
            "timecamp": "not-documented",
            "tmetric": "not-documented"
          }
        },
        {
          "feature": "Screenshot monitoring",
          "statuses": {
            "desktime": "available",
            "timecamp": "available",
            "tmetric": "available"
          },
          "note": "Gated to a higher-priced plan on all three."
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
            "timecamp": "available",
            "tmetric": "available"
          }
        },
        {
          "feature": "Client invoicing",
          "statuses": {
            "desktime": "available",
            "timecamp": "available",
            "tmetric": "available"
          }
        }
      ]
    },
    {
      "group": "Team Management",
      "rows": [
        {
          "feature": "Free plan",
          "statuses": {
            "desktime": "limited",
            "timecamp": "available",
            "tmetric": "limited"
          },
          "note": "DeskTime's free plan caps at one user, TimeCamp's free plan allows unlimited users, and TMetric's free plan caps at two seats."
        },
        {
          "feature": "Shift scheduling and absence tracking",
          "statuses": {
            "desktime": "available",
            "timecamp": "available",
            "tmetric": "available"
          }
        }
      ]
    },
    {
      "group": "Integrations",
      "rows": [
        {
          "feature": "Cross-app embedded timer",
          "statuses": {
            "desktime": "not-documented",
            "timecamp": "not-documented",
            "tmetric": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of DeskTime, TimeCamp, and TMetric has the most generous free plan?",
      "answer": "TimeCamp, since its Free plan supports unlimited users and projects, while DeskTime's free tier is limited to a single user and TMetric's is capped at two seats."
    },
    {
      "question": "Do I need to manually start a timer with DeskTime?",
      "answer": "No. DeskTime tracks automatically based on computer activity, whereas TMetric's cross-app timer generally needs to be started, even though it is embedded inside other web apps."
    },
    {
      "question": "Which tool is cheapest for a small team of five?",
      "answer": "Based on published pricing, TimeCamp's paid tiers start lower (from around $3.99/user/month annually) than DeskTime's Pro plan ($7/user/month) or TMetric's Professional plan ($7/user/month)."
    },
    {
      "question": "Can I get screenshot monitoring on all three tools?",
      "answer": "Yes, but each reserves it for a higher tier: DeskTime's Premium plan, TimeCamp's Premium and Ultimate plans, and TMetric's Business plan."
    },
    {
      "question": "Which tool integrates the timer directly inside other web apps?",
      "answer": "TMetric, which offers a timer overlay inside more than 50 popular web apps so teams can track time without leaving their existing workflow."
    }
  ]
};

export default desktimeVsTimecampVsTmetricContent;

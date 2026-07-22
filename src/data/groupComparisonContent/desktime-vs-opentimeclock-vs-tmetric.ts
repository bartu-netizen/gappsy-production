import type { GroupComparisonContent } from './types';

const desktimeVsOpentimeclockVsTmetricContent: GroupComparisonContent = {
  "verdict": "DeskTime, OpenTimeClock, and TMetric approach time tracking from different angles: DeskTime automates productivity scoring from app and URL activity, OpenTimeClock is a straightforward attendance clock with a free unlimited-employee plan and a flat-fee paid tier, and TMetric is built for freelancers and agencies that need project budgets and client invoicing. The best fit depends on whether the priority is automatic productivity insight, low-cost attendance for a large headcount, or billing-grade project tracking.",
  "bestFor": {
    "desktime": "Teams that want fully automatic productivity scoring with optional screenshot capture for remote or outsourced staff",
    "opentimeclock": "Businesses, schools, or nonprofits with large or fluctuating headcounts that need a free unlimited-employee attendance clock with GPS and PTO tracking",
    "tmetric": "Freelancers and agencies that need project budgets, alerts, and client invoicing on top of time tracking"
  },
  "highlights": [
    {
      "title": "Free plan scope varies widely",
      "description": "OpenTimeClock's Free Plan supports unlimited employees, DeskTime's free tier is capped at one user, and TMetric's free tier caps out at two seats, making the free plans suited to very different team sizes.",
      "toolSlugs": [
        "desktime",
        "opentimeclock",
        "tmetric"
      ]
    },
    {
      "title": "Automatic productivity scoring",
      "description": "DeskTime classifies tracked apps and URLs into productive, unproductive, or neutral categories automatically, a capability neither OpenTimeClock nor TMetric offers out of the box.",
      "toolSlugs": [
        "desktime"
      ]
    },
    {
      "title": "Flat-fee pricing for large teams",
      "description": "OpenTimeClock's Paid Plan is a flat $39 per month for unlimited users rather than per-seat pricing, which can be far cheaper than DeskTime or TMetric once a team grows past a handful of people.",
      "toolSlugs": [
        "opentimeclock"
      ]
    },
    {
      "title": "Billing-grade budgets and invoicing",
      "description": "TMetric turns tracked hours into client invoices and lets teams set project budgets with alerts, plus a timer embedded inside more than fifty other web apps.",
      "toolSlugs": [
        "tmetric"
      ]
    },
    {
      "title": "GPS and biometric attendance verification",
      "description": "OpenTimeClock supports GPS geofencing and facial recognition clock-in, verification methods that DeskTime and TMetric do not document.",
      "toolSlugs": [
        "opentimeclock"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Tracking Method",
      "rows": [
        {
          "feature": "Automatic app or URL tracking",
          "statuses": {
            "desktime": "available",
            "opentimeclock": "unavailable",
            "tmetric": "limited"
          },
          "note": "TMetric's activity monitoring ships on the Business tier rather than the free plan"
        },
        {
          "feature": "GPS geofenced clock-in",
          "statuses": {
            "desktime": "unavailable",
            "opentimeclock": "available",
            "tmetric": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Attendance and Team Management",
      "rows": [
        {
          "feature": "Facial recognition clock-in",
          "statuses": {
            "desktime": "unavailable",
            "opentimeclock": "available",
            "tmetric": "not-documented"
          }
        },
        {
          "feature": "PTO and time-off tracking",
          "statuses": {
            "desktime": "limited",
            "opentimeclock": "available",
            "tmetric": "limited"
          },
          "note": "DeskTime and TMetric gate time-off tracking behind their higher paid tiers"
        }
      ]
    },
    {
      "group": "Billing and Budgets",
      "rows": [
        {
          "feature": "Client invoicing",
          "statuses": {
            "desktime": "available",
            "opentimeclock": "not-documented",
            "tmetric": "available"
          }
        },
        {
          "feature": "Project budgets and alerts",
          "statuses": {
            "desktime": "not-documented",
            "opentimeclock": "not-documented",
            "tmetric": "available"
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
            "opentimeclock": "available",
            "tmetric": "unavailable"
          },
          "note": "TMetric's free plan is capped at two seats and DeskTime's at one user"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool has the best free plan for a large headcount?",
      "answer": "OpenTimeClock, since its Free Plan supports unlimited employees and departments, unlike DeskTime's single-user free tier or TMetric's two-seat cap."
    },
    {
      "question": "Does DeskTime support GPS or facial recognition clock-in?",
      "answer": "No. DeskTime focuses on automatic app and URL tracking with productivity scoring rather than location or biometric verification, which are OpenTimeClock's strengths."
    },
    {
      "question": "Which tool is best for freelance client billing?",
      "answer": "TMetric, since it converts tracked hours into invoices and supports project budgets with alerts."
    },
    {
      "question": "How does cost compare for a team of twenty employees?",
      "answer": "OpenTimeClock's flat $39-per-month Paid Plan covers unlimited users, which can be cheaper than DeskTime or TMetric's per-seat pricing once a team reaches around ten to twenty people."
    },
    {
      "question": "Which tool includes a built-in focus timer?",
      "answer": "DeskTime includes a Pomodoro-style focus timer; this is not mentioned as a feature of OpenTimeClock or TMetric."
    },
    {
      "question": "Does OpenTimeClock disclose its company headquarters?",
      "answer": "No, OpenTimeClock does not publicly disclose a physical headquarters, though it states it has operated since 1997 and hosts data on AWS; DeskTime and TMetric both publish their headquarters locations."
    }
  ]
};

export default desktimeVsOpentimeclockVsTmetricContent;

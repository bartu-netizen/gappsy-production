import type { GroupComparisonContent } from './types';

const desktimeVsJibbleVsOpentimeclockContent: GroupComparisonContent = {
  "verdict": "DeskTime, Jibble, and OpenTimeClock solve time tracking from three different angles: DeskTime automatically tracks computer activity without anyone clocking in, while Jibble and OpenTimeClock are attendance-first tools built around a verified clock-in event. Jibble and OpenTimeClock both offer genuinely free plans with unlimited users, whereas DeskTime's free tier is capped at a single user. There is no single winner here - the right choice depends on whether you need passive productivity monitoring for a remote team, low-cost biometric attendance verification for a deskless or hourly workforce, or a flat monthly fee that does not scale per seat as headcount grows.",
  "bestFor": {
    "desktime": "Teams that want passive, automatic tracking of computer activity and a built-in productivity score without requiring employees to manually clock in or out.",
    "jibble": "Small and mid-sized businesses or field, retail, and hospitality teams that need free, unlimited-user attendance tracking with GPS and facial recognition to stop buddy punching.",
    "opentimeclock": "Schools, nonprofits, franchises, and other organizations with large or fluctuating headcounts that need unlimited free users and are comfortable with a flat-fee upgrade instead of per-seat pricing."
  },
  "highlights": [
    {
      "title": "Only DeskTime tracks automatically",
      "description": "DeskTime starts and stops tracking based on computer activity with no clock-in step, while Jibble and OpenTimeClock are both built around an explicit clock-in and clock-out event, often verified with GPS or facial recognition.",
      "toolSlugs": [
        "desktime",
        "jibble",
        "opentimeclock"
      ]
    },
    {
      "title": "Two free plans with no user cap",
      "description": "Jibble and OpenTimeClock both let an unlimited number of employees use the free tier at no cost, while DeskTime's free plan is limited to a single user, pushing small teams toward a paid plan almost immediately.",
      "toolSlugs": [
        "jibble",
        "opentimeclock"
      ]
    },
    {
      "title": "Biometric identity verification is a Jibble and OpenTimeClock feature",
      "description": "Both Jibble and OpenTimeClock support GPS geofencing and facial recognition to confirm who is clocking in and where, a fraud-prevention layer that is not part of DeskTime's documented feature set.",
      "toolSlugs": [
        "jibble",
        "opentimeclock"
      ]
    },
    {
      "title": "OpenTimeClock prices by the account, not the seat",
      "description": "OpenTimeClock's Paid Plan is a flat $39/month (or $399/year) regardless of user count, unlike DeskTime's $7/user/month and Jibble's $4.49/user/month, making it comparatively cheaper as a team grows larger.",
      "toolSlugs": [
        "opentimeclock"
      ]
    },
    {
      "title": "Jibble's paid tiers got notably more expensive",
      "description": "Jibble's own documentation notes that Premium and Ultimate prices rose roughly 60 to 80 percent in March 2026, which buyers evaluating long-term cost should factor in even though the free tier remains unlimited.",
      "toolSlugs": [
        "jibble"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Tracking and verification method",
      "rows": [
        {
          "feature": "Automatic time tracking without manual clock-in",
          "statuses": {
            "desktime": "available",
            "jibble": "unavailable",
            "opentimeclock": "unavailable"
          },
          "note": "DeskTime starts and stops tracking based on activity; Jibble and OpenTimeClock both require an employee clock-in event."
        },
        {
          "feature": "GPS location tracking and geofencing",
          "statuses": {
            "desktime": "not-documented",
            "jibble": "available",
            "opentimeclock": "available"
          }
        },
        {
          "feature": "Facial recognition or biometric verification",
          "statuses": {
            "desktime": "not-documented",
            "jibble": "available",
            "opentimeclock": "available"
          }
        },
        {
          "feature": "Screenshot capture for verification",
          "statuses": {
            "desktime": "available",
            "jibble": "available",
            "opentimeclock": "not-documented"
          },
          "note": "Gated behind DeskTime's Premium tier and Jibble's Premium/Ultimate tiers."
        }
      ]
    },
    {
      "group": "Scheduling and leave management",
      "rows": [
        {
          "feature": "Shift scheduling",
          "statuses": {
            "desktime": "available",
            "jibble": "limited",
            "opentimeclock": "available"
          },
          "note": "Jibble's own documentation says it has less scheduling depth than dedicated shift-planning tools."
        },
        {
          "feature": "PTO or leave accrual tracking",
          "statuses": {
            "desktime": "limited",
            "jibble": "available",
            "opentimeclock": "available"
          },
          "note": "DeskTime offers an absence calendar on Premium rather than full accrual tracking."
        }
      ]
    },
    {
      "group": "Pricing and access",
      "rows": [
        {
          "feature": "Free plan supports unlimited users",
          "statuses": {
            "desktime": "limited",
            "jibble": "available",
            "opentimeclock": "available"
          },
          "note": "DeskTime's free plan is capped at a single user."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has a free plan for an unlimited number of employees?",
      "answer": "Jibble and OpenTimeClock both offer free plans with no cap on user count. DeskTime's free plan is limited to a single user, so small teams typically need to move to a paid plan quickly."
    },
    {
      "question": "Which tool tracks time automatically without requiring employees to clock in?",
      "answer": "DeskTime is the only one of the three that starts and stops tracking automatically based on computer activity. Jibble and OpenTimeClock are both built around an explicit clock-in and clock-out action."
    },
    {
      "question": "Which is cheapest as a team grows larger?",
      "answer": "DeskTime and Jibble both charge per user ($7 and $4.49 per user per month respectively at their entry paid tiers), so cost scales with headcount. OpenTimeClock charges a flat $39/month regardless of user count, which can make it cheaper for larger teams."
    },
    {
      "question": "Which tools support facial recognition or GPS-verified clock-ins?",
      "answer": "Jibble and OpenTimeClock both support GPS geofencing and facial recognition verification. This is not part of DeskTime's documented feature set, which instead relies on activity tracking and optional screenshots."
    },
    {
      "question": "Which company has been operating the longest?",
      "answer": "OpenTimeClock states it has been in business since 1997, making it the longest-running of the three. DeskTime was founded in 2011 and Jibble in 2016."
    },
    {
      "question": "Can any of these generate invoices from tracked hours?",
      "answer": "DeskTime includes automated invoicing based on tracked billable hours, and Jibble converts billable hours into client invoices. Automated invoicing is not documented as a feature of OpenTimeClock, though it does support job and project cost tracking."
    }
  ]
};

export default desktimeVsJibbleVsOpentimeclockContent;

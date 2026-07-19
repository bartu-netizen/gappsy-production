import type { GroupComparisonContent } from './types';

const jibbleVsTimecampVsTmetricContent: GroupComparisonContent = {
  "verdict": "Jibble leads with an unlimited-user free plan plus built-in biometric and GPS fraud prevention aimed at hourly and field workforces. TimeCamp also offers a free unlimited-user tier and undercuts rivals on paid pricing while adding budgeting and resource planning. TMetric caps its free plan at two seats but layers in strong budgeting, invoicing, and a timer that embeds directly inside more than 50 other web apps.",
  "bestFor": {
    "jibble": "Hourly, field-based, or deskless workforces that need low-cost attendance tracking with GPS and facial-recognition fraud prevention.",
    "timecamp": "Cost-conscious agencies and mid-size teams that want automatic time tracking plus budgeting and invoicing at aggressively low paid-tier prices.",
    "tmetric": "Freelancers and small teams who want their timer embedded directly inside 50+ other web apps alongside billing-grade budgeting and invoicing."
  },
  "highlights": [
    {
      "title": "Unlimited-User Free Plans",
      "description": "Jibble and TimeCamp both offer a genuinely free tier with unlimited users, while TMetric's free plan caps out at two seats.",
      "toolSlugs": [
        "jibble",
        "timecamp"
      ]
    },
    {
      "title": "Biometric and Location Verification",
      "description": "Jibble bundles facial recognition and GPS geofencing to prevent buddy punching, even on its free plan.",
      "toolSlugs": [
        "jibble"
      ]
    },
    {
      "title": "Cross-App Embedded Timer",
      "description": "TMetric's timer works as an overlay inside more than 50 popular web apps, letting users track time without leaving their existing tools.",
      "toolSlugs": [
        "tmetric"
      ]
    },
    {
      "title": "Automatic, No-Timer Tracking",
      "description": "TimeCamp automatically tracks time spent in applications and websites in the background and maps it to projects without manual start and stop actions.",
      "toolSlugs": [
        "timecamp"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Location and Identity Verification",
      "rows": [
        {
          "feature": "GPS location tracking and geofencing",
          "statuses": {
            "jibble": "available",
            "timecamp": "not-documented",
            "tmetric": "not-documented"
          }
        },
        {
          "feature": "Facial recognition or biometric verification",
          "statuses": {
            "jibble": "available",
            "timecamp": "not-documented",
            "tmetric": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Monitoring and Billing",
      "rows": [
        {
          "feature": "Automatic background time tracking (no manual timer)",
          "statuses": {
            "jibble": "not-documented",
            "timecamp": "available",
            "tmetric": "not-documented"
          },
          "note": "TMetric is primarily a manual timer plus embedded cross-app widget rather than fully automatic background tracking."
        },
        {
          "feature": "Screenshot or activity monitoring",
          "statuses": {
            "jibble": "available",
            "timecamp": "available",
            "tmetric": "available"
          },
          "note": "All three gate this behind a paid tier above the free plan."
        },
        {
          "feature": "Client invoicing from tracked hours",
          "statuses": {
            "jibble": "available",
            "timecamp": "available",
            "tmetric": "available"
          }
        }
      ]
    },
    {
      "group": "Access and Integrations",
      "rows": [
        {
          "feature": "Free plan with unlimited users",
          "statuses": {
            "jibble": "available",
            "timecamp": "available",
            "tmetric": "unavailable"
          },
          "note": "TMetric's free plan is capped at two seats."
        },
        {
          "feature": "Payroll or accounting integrations",
          "statuses": {
            "jibble": "available",
            "timecamp": "available",
            "tmetric": "available"
          },
          "note": "Jibble connects to QuickBooks, Xero, and Deel; TMetric connects to QuickBooks alongside Jira, Redmine, and ClickUp."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool has a truly unlimited free plan?",
      "answer": "Jibble and TimeCamp both offer a free plan with unlimited users and no credit card required. TMetric's free plan is capped at two seats, making it better suited to solo freelancers or very small teams."
    },
    {
      "question": "Does TMetric offer a free plan?",
      "answer": "Yes, but it is limited to two seats with unlimited time tracking, clients, and projects. Jibble and TimeCamp both scale their free plans to unlimited users."
    },
    {
      "question": "Which tool is best for preventing buddy punching?",
      "answer": "Jibble is the strongest choice for fraud prevention, since it bundles AI-powered facial recognition, selfie capture, and GPS geofencing into its clock-in flow, including on the free plan. TimeCamp and TMetric do not document equivalent biometric verification features."
    },
    {
      "question": "Can I generate invoices from tracked time in all three tools?",
      "answer": "Yes. Jibble, TimeCamp, and TMetric all support converting billable tracked hours directly into client invoices, though the specific invoicing depth and tier requirements vary by plan."
    },
    {
      "question": "Which tool tracks time automatically without manual timers?",
      "answer": "TimeCamp is built around automatic time tracking that runs in the background across applications and websites and maps activity to projects without requiring a manual start or stop. TMetric relies more on a manual timer, including an embedded widget inside other web apps."
    },
    {
      "question": "Do these tools integrate with payroll systems like QuickBooks?",
      "answer": "Jibble integrates with QuickBooks, Xero, and Deel; TMetric integrates with QuickBooks alongside Jira, Redmine, and ClickUp. TimeCamp also connects to accounting and payroll-adjacent tools, though specific integration names are less documented here."
    }
  ]
};

export default jibbleVsTimecampVsTmetricContent;

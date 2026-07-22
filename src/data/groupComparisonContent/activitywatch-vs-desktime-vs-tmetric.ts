import type { GroupComparisonContent } from './types';

const activitywatchVsDesktimeVsTmetricContent: GroupComparisonContent = {
  "verdict": "ActivityWatch is a free, open-source, privacy-first tracker that stores all data locally with no premium tier at all, making it best suited to individuals who want personal insight rather than team monitoring. DeskTime and TMetric are commercial, freemium team time-tracking platforms: DeskTime emphasizes fully automatic tracking with built-in productivity scoring, while TMetric leans into budgeting, invoicing, and an embeddable cross-app timer for freelancers and agencies.",
  "bestFor": {
    "activitywatch": "Privacy-conscious individuals and developers who want free, local-only automatic time tracking with no cloud sync or premium tiers.",
    "desktime": "Teams and managers who want fully automatic tracking with built-in productivity scoring and minimal manual configuration.",
    "tmetric": "Freelancers and agencies who need budgeting, client invoicing, and a timer embedded inside their existing web apps."
  },
  "highlights": [
    {
      "title": "Local-Only Privacy Model",
      "description": "ActivityWatch stores all tracked data on the user's own device and, per the project, never sends it to a server, unlike the cloud-based DeskTime and TMetric.",
      "toolSlugs": [
        "activitywatch"
      ]
    },
    {
      "title": "Completely Free, No Premium Tier",
      "description": "ActivityWatch has no usage limits, ads, or paid upgrade path at all, unlike DeskTime and TMetric's freemium models with paid tiers above the free plan.",
      "toolSlugs": [
        "activitywatch"
      ]
    },
    {
      "title": "Automatic Productivity Scoring",
      "description": "DeskTime classifies tracked apps and URLs into productive, unproductive, or neutral categories to calculate a productivity score out of the box.",
      "toolSlugs": [
        "desktime"
      ]
    },
    {
      "title": "Cross-App Embedded Timer",
      "description": "TMetric's timer works as an overlay inside more than 50 popular web apps for tracking without switching context.",
      "toolSlugs": [
        "tmetric"
      ]
    },
    {
      "title": "Team Management Features",
      "description": "DeskTime and TMetric both include screenshot monitoring, scheduling or time-off tools, and client billing that ActivityWatch, as a single-user local tool, does not offer.",
      "toolSlugs": [
        "desktime",
        "tmetric"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Privacy and Openness",
      "rows": [
        {
          "feature": "Local-only data storage (no cloud sync)",
          "statuses": {
            "activitywatch": "available",
            "desktime": "not-documented",
            "tmetric": "not-documented"
          }
        },
        {
          "feature": "Open-source codebase",
          "statuses": {
            "activitywatch": "available",
            "desktime": "unavailable",
            "tmetric": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Tracking Intelligence",
      "rows": [
        {
          "feature": "Automatic tracking (no manual timer required)",
          "statuses": {
            "activitywatch": "available",
            "desktime": "available",
            "tmetric": "not-documented"
          },
          "note": "TMetric is primarily a manual timer plus embedded cross-app widget."
        },
        {
          "feature": "Built-in productivity scoring",
          "statuses": {
            "activitywatch": "not-documented",
            "desktime": "available",
            "tmetric": "not-documented"
          },
          "note": "ActivityWatch offers category rules for organizing activity but does not document an automatic productivity score."
        }
      ]
    },
    {
      "group": "Team, Billing, and Access",
      "rows": [
        {
          "feature": "Screenshot or activity monitoring",
          "statuses": {
            "activitywatch": "unavailable",
            "desktime": "available",
            "tmetric": "available"
          },
          "note": "Gated behind paid tiers for both DeskTime and TMetric."
        },
        {
          "feature": "Client invoicing",
          "statuses": {
            "activitywatch": "unavailable",
            "desktime": "available",
            "tmetric": "available"
          }
        },
        {
          "feature": "Free to use",
          "statuses": {
            "activitywatch": "available",
            "desktime": "available",
            "tmetric": "available"
          },
          "note": "ActivityWatch is entirely free with no tiers; DeskTime's free plan is limited to a single user, and TMetric's free plan is limited to two seats."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does ActivityWatch send my data to the cloud?",
      "answer": "No. ActivityWatch stores all tracked time data locally on the user's own device and, according to the project, never sends it to any server, which sets it apart from the cloud-based DeskTime and TMetric."
    },
    {
      "question": "Is ActivityWatch really free with no premium tier?",
      "answer": "Yes. ActivityWatch is described by its own project as having no premium tiers, no usage limits, and no ads, unlike DeskTime and TMetric, which are both freemium with paid tiers above their free plans."
    },
    {
      "question": "Which tool automatically calculates a productivity score?",
      "answer": "DeskTime classifies tracked applications and URLs into productive, unproductive, or neutral categories to generate a productivity score automatically. ActivityWatch offers category rules for organizing activity but does not document an equivalent automatic score, and TMetric does not document this feature either."
    },
    {
      "question": "Can I invoice clients directly from tracked time?",
      "answer": "DeskTime and TMetric both support generating client invoices from tracked billable hours. ActivityWatch does not include invoicing, since it is built as a personal, local-only productivity tool rather than a client-billing platform."
    },
    {
      "question": "Is ActivityWatch open source?",
      "answer": "Yes. ActivityWatch is licensed under MPL-2.0 with its source code publicly available, unlike the proprietary, commercial DeskTime and TMetric."
    },
    {
      "question": "Which tool works across the most platforms including mobile?",
      "answer": "ActivityWatch runs on Windows, macOS, Linux, and Android, with no official iOS app documented. TMetric offers apps for Windows, macOS, Linux, and mobile, while DeskTime provides desktop and mobile agents as well; all three cover the major desktop platforms."
    }
  ]
};

export default activitywatchVsDesktimeVsTmetricContent;

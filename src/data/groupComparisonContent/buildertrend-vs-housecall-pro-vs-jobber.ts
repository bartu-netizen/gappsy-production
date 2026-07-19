import type { GroupComparisonContent } from './types';

const buildertrendVsHousecallProVsJobberContent: GroupComparisonContent = {
  "verdict": "Buildertrend, Housecall Pro, and Jobber all help contractors run job operations, but they are built for different scales of work. Buildertrend is purpose-built construction project management for homebuilders and remodelers juggling estimating, RFIs, selections, and multi-month builds under a flat company-wide subscription, while Housecall Pro and Jobber are field service platforms optimized for trades like HVAC, plumbing, and cleaning that need fast scheduling, invoicing, and payment collection per technician. Between the two field service tools, Jobber generally starts cheaper for solo operators and adds an AI Receptionist and marketing suite at its top tier, while Housecall Pro leans on a strong support reputation and an active user community; a general contractor managing full remodels and new builds will likely fit Buildertrend better than either field service tool.",
  "bestFor": {
    "buildertrend": "Homebuilders, remodelers, and general contractors managing full construction projects who need estimating, RFIs, selections, and a client portal rather than simple job scheduling.",
    "housecall-pro": "Home service trades like HVAC, plumbing, and cleaning that want a strong customer support reputation and an active user community alongside scheduling and invoicing.",
    "jobber": "Solo operators and multi-crew home service businesses that want the lowest entry price plus AI-assisted call answering and marketing tools at the top tier."
  },
  "highlights": [
    {
      "title": "Buildertrend is built for full construction projects, not quick jobs",
      "description": "Buildertrend covers estimating, RFIs, change orders, and homeowner selections, workflows specific to multi-month residential builds and remodels.",
      "toolSlugs": [
        "buildertrend"
      ]
    },
    {
      "title": "Jobber undercuts both on solo-operator pricing",
      "description": "Jobber's Core plan starts around $21-30/month for a single user, generally the cheapest entry point of the three.",
      "toolSlugs": [
        "jobber"
      ]
    },
    {
      "title": "Housecall Pro leans on support and community reputation",
      "description": "Housecall Pro is frequently cited for its responsive support and an active user community, alongside route optimization and GPS tracking on higher tiers.",
      "toolSlugs": [
        "housecall-pro"
      ]
    },
    {
      "title": "Only Buildertrend handles RFIs, change orders, and selections",
      "description": "These construction-specific workflows are core to Buildertrend but absent from the field-service feature sets of Housecall Pro and Jobber.",
      "toolSlugs": [
        "buildertrend"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Per-user pricing model",
          "statuses": {
            "buildertrend": "unavailable",
            "housecall-pro": "available",
            "jobber": "available"
          },
          "note": "Buildertrend uses flat, company-wide pricing regardless of headcount"
        },
        {
          "feature": "Native mobile apps (iOS/Android)",
          "statuses": {
            "buildertrend": "available",
            "housecall-pro": "available",
            "jobber": "available"
          }
        }
      ]
    },
    {
      "group": "Field and Client Operations",
      "rows": [
        {
          "feature": "Route optimization",
          "statuses": {
            "buildertrend": "not-documented",
            "housecall-pro": "available",
            "jobber": "available"
          },
          "note": "Housecall Pro from Essentials, Jobber from Core with real-time optimization on Grow and above"
        },
        {
          "feature": "Client-facing self-serve portal",
          "statuses": {
            "buildertrend": "available",
            "housecall-pro": "not-documented",
            "jobber": "available"
          }
        }
      ]
    },
    {
      "group": "Construction and Financial Management",
      "rows": [
        {
          "feature": "Estimating and job costing",
          "statuses": {
            "buildertrend": "available",
            "housecall-pro": "not-documented",
            "jobber": "available"
          },
          "note": "Jobber's job costing requires the Grow plan or above"
        },
        {
          "feature": "RFIs, change orders, and selections",
          "statuses": {
            "buildertrend": "available",
            "housecall-pro": "unavailable",
            "jobber": "unavailable"
          }
        },
        {
          "feature": "QuickBooks/Xero sync",
          "statuses": {
            "buildertrend": "available",
            "housecall-pro": "available",
            "jobber": "available"
          },
          "note": "Housecall Pro syncs with QuickBooks Online from Essentials; Jobber adds Xero from Connect"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Buildertrend priced the same way as Housecall Pro and Jobber?",
      "answer": "No. Buildertrend uses flat, company-wide monthly pricing (roughly $339 to $999 per month) regardless of user count, while Housecall Pro and Jobber price primarily by the number of users included in each tier."
    },
    {
      "question": "Which of these three includes RFIs, change orders, and selections management?",
      "answer": "Only Buildertrend, since it is purpose-built construction project management software; Housecall Pro and Jobber are field service platforms that do not include these construction-specific workflows."
    },
    {
      "question": "Which tool is cheapest for a solo operator?",
      "answer": "Jobber's Core plan starts around $21 to $30 per month for a single user, generally undercutting Housecall Pro's Basic plan at $59 to $79 per month and well below Buildertrend's flat $339-per-month Essential tier."
    },
    {
      "question": "Do Housecall Pro and Jobber both sync with QuickBooks?",
      "answer": "Yes, both sync with QuickBooks Online on their mid-tier plans and above, and Jobber additionally supports Xero, matching Buildertrend's QuickBooks and Xero integrations."
    },
    {
      "question": "Which of the three has an AI receptionist or marketing tools built in?",
      "answer": "Jobber's top-tier Plus plan adds an AI Receptionist and a Marketing Suite; these are not documented features of Buildertrend or Housecall Pro."
    }
  ]
};

export default buildertrendVsHousecallProVsJobberContent;

import type { GroupComparisonContent } from './types';

const apptivoVsFreshsalesVsInsightlyContent: GroupComparisonContent = {
  "verdict": "Apptivo, Freshsales, and Insightly are all SMB-friendly CRMs, but they optimize for different jobs. Apptivo is the broadest, low-cost suite, bundling CRM with help desk, field service, and campaign tools for teams that want one no-code system. Freshsales is a sales-first pipeline tool with built-in phone, email, and Freddy AI lead scoring. Insightly pairs CRM with native project management and an AI Copilot, which suits teams that hand off closed deals into delivery work. None of the three is a universal winner; the right pick depends on whether you need extra modules, sales automation, or post-sale project tracking.",
  "bestFor": {
    "apptivo": "Budget-conscious SMBs that want CRM bundled with help desk, field service, and campaign tools in one no-code platform.",
    "freshsales": "Sales teams that want an AI-assisted deal pipeline with built-in phone and email, especially those already using other Freshworks products.",
    "insightly": "Teams that need CRM and project management combined natively, such as agencies or professional-services firms handing closed deals to a delivery team."
  },
  "highlights": [
    {
      "title": "All-in-one operations suite",
      "description": "Apptivo goes beyond core CRM with dedicated help desk, field service, and campaign modules, plus no-code customization, letting small teams run several business functions from one system instead of stitching together separate tools.",
      "toolSlugs": [
        "apptivo"
      ]
    },
    {
      "title": "AI-assisted sales pipeline",
      "description": "Freshsales bakes built-in phone and email into the CRM and layers on Freddy AI for lead scoring, sales sequences, and AI-powered forecasting insights, aimed squarely at sales teams that want automation without a separate tool.",
      "toolSlugs": [
        "freshsales"
      ]
    },
    {
      "title": "CRM plus native project management",
      "description": "Insightly is the only one of the three with built-in project management alongside the CRM, plus an AI Copilot and pre-built business intelligence dashboards, which suits teams that need to track work after a deal closes.",
      "toolSlugs": [
        "insightly"
      ]
    },
    {
      "title": "Free access varies sharply",
      "description": "Apptivo offers a permanently free Starter tier and Freshsales is free for up to 3 users, while Insightly has no free tier at all, only a 14-day trial, so ongoing no-cost usage is not an option with Insightly.",
      "toolSlugs": [
        "apptivo",
        "freshsales",
        "insightly"
      ]
    },
    {
      "title": "Advanced features are tier-gated across all three",
      "description": "Freshsales' Freddy AI lead scoring requires the Pro tier or higher, Insightly's REST API, webhooks, and AI Copilot require the Professional tier or higher, and Apptivo's deeper automation and reporting need its higher-priced plans, so entry-level plans are noticeably lighter everywhere.",
      "toolSlugs": [
        "apptivo",
        "freshsales",
        "insightly"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core CRM and Pipeline",
      "rows": [
        {
          "feature": "Deal and pipeline management",
          "statuses": {
            "apptivo": "available",
            "freshsales": "available",
            "insightly": "available"
          }
        },
        {
          "feature": "Built-in phone and email",
          "statuses": {
            "apptivo": "not-documented",
            "freshsales": "available",
            "insightly": "limited"
          },
          "note": "Freshsales bundles both native phone and email; Insightly offers bidirectional email sync but does not document a native phone system."
        }
      ]
    },
    {
      "group": "Automation and AI",
      "rows": [
        {
          "feature": "AI lead scoring or copilot",
          "statuses": {
            "apptivo": "unavailable",
            "freshsales": "available",
            "insightly": "available"
          },
          "note": "Freshsales' Freddy AI requires Pro tier or above; Insightly's AI Copilot requires Professional tier or above."
        },
        {
          "feature": "Workflow automation",
          "statuses": {
            "apptivo": "available",
            "freshsales": "available",
            "insightly": "available"
          },
          "note": "All three gate deeper automation behind mid-to-upper tiers."
        }
      ]
    },
    {
      "group": "Project and Service Management",
      "rows": [
        {
          "feature": "Native project management",
          "statuses": {
            "apptivo": "not-documented",
            "freshsales": "unavailable",
            "insightly": "available"
          }
        },
        {
          "feature": "Help desk and field service modules",
          "statuses": {
            "apptivo": "available",
            "freshsales": "unavailable",
            "insightly": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Access and Extensibility",
      "rows": [
        {
          "feature": "Permanently free plan",
          "statuses": {
            "apptivo": "available",
            "freshsales": "available",
            "insightly": "unavailable"
          },
          "note": "Insightly offers only a 14-day free trial, not an ongoing free tier."
        },
        {
          "feature": "REST API and webhooks",
          "statuses": {
            "apptivo": "not-documented",
            "freshsales": "not-documented",
            "insightly": "available"
          },
          "note": "Insightly's API access requires the Professional tier or above."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three CRMs has a truly free plan?",
      "answer": "Apptivo's Starter tier and Freshsales' free tier (up to 3 users) are both permanently free. Insightly does not offer an ongoing free plan, only a 14-day free trial."
    },
    {
      "question": "Which CRM includes built-in calling?",
      "answer": "Freshsales bundles a native phone system directly into the CRM. Insightly offers bidirectional email sync but does not document a native phone feature, and Apptivo's phone capability is not documented in its listed features."
    },
    {
      "question": "Do any of these CRMs include project management?",
      "answer": "Insightly is the one built with native project management alongside the CRM. Apptivo covers adjacent operations like help desk and field service, but not project management specifically, and Freshsales is a sales-only pipeline tool."
    },
    {
      "question": "Which CRM has AI-powered sales features?",
      "answer": "Freshsales has Freddy AI for lead scoring and AI-powered forecasting, available from the Pro tier up. Insightly offers an AI Copilot from its Professional tier up. Apptivo does not advertise AI-driven sales features."
    },
    {
      "question": "Is API access available on entry-level plans?",
      "answer": "Not with Insightly, whose REST API and webhooks require the Professional tier or higher. API availability is not documented for Apptivo or Freshsales in their published feature sets."
    },
    {
      "question": "Which is the best fit for a team that also runs help desk or field service work?",
      "answer": "Apptivo, since it natively bundles help desk and field service modules alongside its CRM, whereas Freshsales and Insightly are focused on sales and, in Insightly's case, project delivery."
    }
  ]
};

export default apptivoVsFreshsalesVsInsightlyContent;

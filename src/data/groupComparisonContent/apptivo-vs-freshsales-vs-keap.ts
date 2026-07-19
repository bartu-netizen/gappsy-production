import type { GroupComparisonContent } from './types';

const apptivoVsFreshsalesVsKeapContent: GroupComparisonContent = {
  "verdict": "Apptivo and Freshsales are per-seat CRMs that start free and scale user by user, while Keap is a flat-rate, all-in-one CRM-plus-marketing-automation platform priced by contact volume with a much higher entry cost and a mandatory onboarding fee. Freshsales leans toward AI-assisted sales pipeline work, Apptivo toward a broad, low-cost operations suite, and Keap toward small businesses that want email and SMS marketing automation, invoicing, and payments fused directly into the CRM. The right choice depends heavily on budget and whether marketing automation needs to live inside the CRM itself.",
  "bestFor": {
    "apptivo": "Budget-conscious SMBs that want CRM bundled with help desk, field service, and campaign tools in one inexpensive, no-code suite.",
    "freshsales": "Sales-first teams that want an affordable, AI-assisted deal pipeline with built-in phone and email.",
    "keap": "Small businesses that want deep marketing automation, invoicing, and payments fused directly into the CRM and are willing to pay a premium flat rate for it."
  },
  "highlights": [
    {
      "title": "Flat-rate marketing automation engine",
      "description": "Keap combines contact CRM, email and SMS automation, landing pages, appointment scheduling, and invoicing and payments into a single flat-priced platform refined over two decades for small-business workflows.",
      "toolSlugs": [
        "keap"
      ]
    },
    {
      "title": "Lowest cost of entry",
      "description": "Apptivo's free Starter tier and roughly $15/user/month Lite plan sit far below Keap's approximately $249/month Pro plan, making Apptivo the cheapest way into a multi-module business suite.",
      "toolSlugs": [
        "apptivo"
      ]
    },
    {
      "title": "AI lead scoring on a per-seat budget",
      "description": "Freshsales offers Freddy AI lead scoring and AI-powered forecasting from its $39/user/month Pro tier, giving teams AI-assisted selling without Keap's flat $249+/month entry price.",
      "toolSlugs": [
        "freshsales"
      ]
    },
    {
      "title": "Per-seat versus flat pricing",
      "description": "Apptivo and Freshsales charge per user and let a solo user pay little or nothing, while Keap charges a flat monthly rate that already includes 2 user licenses, so cost scales differently as a team grows or shrinks.",
      "toolSlugs": [
        "apptivo",
        "freshsales",
        "keap"
      ]
    },
    {
      "title": "Keap's mandatory onboarding fee",
      "description": "New Keap Pro and Max customers must pay a one-time Kickstart onboarding fee on top of the subscription, a cost that Apptivo and Freshsales do not require.",
      "toolSlugs": [
        "keap"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core CRM",
      "rows": [
        {
          "feature": "Contact and deal pipeline management",
          "statuses": {
            "apptivo": "available",
            "freshsales": "available",
            "keap": "available"
          }
        }
      ]
    },
    {
      "group": "Marketing and Automation",
      "rows": [
        {
          "feature": "Marketing campaign automation",
          "statuses": {
            "apptivo": "available",
            "freshsales": "limited",
            "keap": "available"
          },
          "note": "Keap has a dedicated email and SMS automation engine; Apptivo has a Campaigns module; Freshsales offers SMS and WhatsApp integration at the Growth tier, but full marketing automation is a separate Freshworks product (Freshmarketer)."
        },
        {
          "feature": "AI lead scoring",
          "statuses": {
            "apptivo": "unavailable",
            "freshsales": "available",
            "keap": "not-documented"
          },
          "note": "Freshsales' Freddy AI requires the Pro tier or above."
        }
      ]
    },
    {
      "group": "Payments and Operations",
      "rows": [
        {
          "feature": "Quotes, invoicing, and payments",
          "statuses": {
            "apptivo": "not-documented",
            "freshsales": "not-documented",
            "keap": "available"
          }
        },
        {
          "feature": "Help desk and field service modules",
          "statuses": {
            "apptivo": "available",
            "freshsales": "unavailable",
            "keap": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Permanently free plan",
          "statuses": {
            "apptivo": "available",
            "freshsales": "available",
            "keap": "unavailable"
          }
        },
        {
          "feature": "Mandatory onboarding fee",
          "statuses": {
            "apptivo": "unavailable",
            "freshsales": "unavailable",
            "keap": "available"
          },
          "note": "Keap requires a one-time Kickstart onboarding fee for new Pro and Max customers."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Why is Keap so much more expensive than Apptivo and Freshsales?",
      "answer": "Keap bundles deep marketing automation, invoicing, and payments into a flat monthly rate starting around $249/month that already includes 2 user licenses, plus a mandatory one-time Kickstart onboarding fee, versus Apptivo and Freshsales' per-seat pricing that starts free."
    },
    {
      "question": "Which tool has a genuinely free plan?",
      "answer": "Apptivo and Freshsales both offer permanently free tiers. Keap has no free tier at all."
    },
    {
      "question": "Which is best for marketing automation built into the CRM?",
      "answer": "Keap, since it has a purpose-built email and SMS automation engine plus landing pages bundled directly into the CRM. Freshsales' marketing automation lives in a separate Freshworks product, and Apptivo's Campaigns module is part of its broader app suite."
    },
    {
      "question": "Does any of these three include invoicing or payments?",
      "answer": "Keap includes quotes, invoicing, and payments as core features. This is not documented as a feature for Apptivo or Freshsales in their published feature sets."
    },
    {
      "question": "Which has AI-assisted sales features?",
      "answer": "Freshsales offers Freddy AI lead scoring and AI-powered forecasting from its Pro tier up. AI features are not documented for Keap or Apptivo."
    },
    {
      "question": "Is Keap's pricing per user or flat?",
      "answer": "Keap's plans are flat monthly rates that include 2 user licenses and a set contact limit, rather than per-seat pricing like Apptivo and Freshsales, so cost scales with contacts and add-on seats rather than headcount alone."
    }
  ]
};

export default apptivoVsFreshsalesVsKeapContent;

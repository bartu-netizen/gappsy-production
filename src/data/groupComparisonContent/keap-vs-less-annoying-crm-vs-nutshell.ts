import type { GroupComparisonContent } from './types';

const keapVsLessAnnoyingCrmVsNutshellContent: GroupComparisonContent = {
  "verdict": "Keap, Less Annoying CRM, and Nutshell represent three distinct philosophies on small-business CRM: Keap bundles the deepest marketing automation and invoicing into a higher-priced package with a mandatory onboarding fee; Less Annoying CRM strips everything to one flat, predictable price with no automation or AI; and Nutshell sits in the middle with tiered, per-user pricing plus optional paid add-ons for marketing, sales engagement, and AI. Which one wins depends on whether you value built-in depth, pricing simplicity, or the ability to add capability only when you need it.",
  "bestFor": {
    "keap": "Solo entrepreneurs and small service businesses that want the deepest built-in marketing automation plus invoicing and payments in one bundle, and don't mind a higher starting price and mandatory onboarding fee.",
    "less-annoying-crm": "Small businesses and independent professionals who want the simplest possible CRM at one predictable flat price with no add-ons to track.",
    "nutshell": "Small and midsize B2B sales teams that want flexible pipeline visualizations, including a map view, and the option to add marketing, engagement, or AI capability only as needed."
  },
  "highlights": [
    {
      "title": "Nutshell is the only one with a geographic map pipeline view",
      "description": "Nutshell offers Kanban board, list, chart, and geographic map views of the sales pipeline, useful for territory-based field sales teams; neither Keap nor Less Annoying CRM documents a comparable range of pipeline visualizations.",
      "toolSlugs": [
        "nutshell"
      ]
    },
    {
      "title": "Less Annoying CRM remains the only flat-price option",
      "description": "Less Annoying CRM charges one flat $15/user/month with no tiers, while Keap (three bundle tiers plus onboarding fees) and Nutshell (five tiers plus paid add-ons) both scale price with feature depth.",
      "toolSlugs": [
        "less-annoying-crm",
        "keap",
        "nutshell"
      ]
    },
    {
      "title": "Keap's automation is built in; Nutshell's equivalent is a paid add-on",
      "description": "Keap's marketing-automation engine is included in its base bundle pricing, while Nutshell sells comparable email-campaign and drip-sequence capability separately through its Marketing Pro add-on at $49 per company per month.",
      "toolSlugs": [
        "keap",
        "nutshell"
      ]
    },
    {
      "title": "AI capability exists for one of the three as a distinct paid layer",
      "description": "Nutshell IQ adds AI-generated call/email summaries and coaching insights as a $37-per-company add-on; neither Keap's nor Less Annoying CRM's provided data documents a dedicated AI assistant feature.",
      "toolSlugs": [
        "nutshell",
        "keap",
        "less-annoying-crm"
      ]
    },
    {
      "title": "Nutshell's entry price undercuts Keap's bundle pricing significantly",
      "description": "Nutshell's Foundation tier starts at $13/user/month versus Keap's roughly $249/month bundle covering two users, though matching Keap's built-in automation and AI depth on Nutshell requires stacking its paid add-ons.",
      "toolSlugs": [
        "nutshell",
        "keap"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core CRM and Mobile",
      "rows": [
        {
          "feature": "Contact and pipeline management",
          "statuses": {
            "keap": "available",
            "less-annoying-crm": "available",
            "nutshell": "available"
          }
        },
        {
          "feature": "Native iOS/Android app",
          "statuses": {
            "keap": "available",
            "less-annoying-crm": "limited",
            "nutshell": "available"
          },
          "note": "Less Annoying CRM's provided data describes mobile access via a browser rather than a documented dedicated native app."
        },
        {
          "feature": "Multiple pipeline visualizations (Kanban/list/map/chart)",
          "statuses": {
            "keap": "not-documented",
            "less-annoying-crm": "limited",
            "nutshell": "available"
          },
          "note": "Less Annoying CRM offers custom pipeline stages but no documented map or chart views like Nutshell's."
        }
      ]
    },
    {
      "group": "Automation, Marketing and AI",
      "rows": [
        {
          "feature": "Marketing automation / email campaigns",
          "statuses": {
            "keap": "available",
            "less-annoying-crm": "unavailable",
            "nutshell": "limited"
          },
          "note": "Nutshell's email-campaign and drip-sequence capability requires the paid Marketing Pro add-on; Less Annoying CRM explicitly lacks marketing automation."
        },
        {
          "feature": "Built-in AI assistant",
          "statuses": {
            "keap": "not-documented",
            "less-annoying-crm": "unavailable",
            "nutshell": "limited"
          },
          "note": "Nutshell IQ is a separate paid add-on; Less Annoying CRM explicitly lists lack of AI features."
        },
        {
          "feature": "Sales engagement / follow-up sequences",
          "statuses": {
            "keap": "available",
            "less-annoying-crm": "not-documented",
            "nutshell": "limited"
          },
          "note": "Nutshell's sequencing and click-to-call tools require the paid Engagement Pro add-on."
        }
      ]
    },
    {
      "group": "Pricing Model and Extras",
      "rows": [
        {
          "feature": "Invoicing and payments",
          "statuses": {
            "keap": "available",
            "less-annoying-crm": "not-documented",
            "nutshell": "not-documented"
          }
        },
        {
          "feature": "Single flat price with no tiers",
          "statuses": {
            "keap": "unavailable",
            "less-annoying-crm": "available",
            "nutshell": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of the three is cheapest to start?",
      "answer": "Nutshell's Foundation tier starts at $13/user/month, just under Less Annoying CRM's flat $15/user/month, while Keap starts around $249/month for a bundle covering two users."
    },
    {
      "question": "Which one has a map-based pipeline view?",
      "answer": "Nutshell, which offers board (Kanban), list, chart, and geographic map views for visualizing deals and contacts, useful for territory-based sales teams."
    },
    {
      "question": "Does Less Annoying CRM offer AI or marketing automation?",
      "answer": "No. Its provided data explicitly lists the lack of advanced automation and AI features as a known tradeoff of its simplicity-first design."
    },
    {
      "question": "Are there hidden add-on costs to budget for?",
      "answer": "Nutshell sells Marketing Pro ($49/company/month), Engagement Pro ($16/user/month), and Nutshell IQ ($37/company/month) as separate add-ons. Keap typically requires a mandatory one-time Kickstart onboarding fee and meters SMS/voice usage. Less Annoying CRM has a single flat price with no add-on fees."
    },
    {
      "question": "Which have native mobile apps?",
      "answer": "Keap and Nutshell both document native mobile apps. Less Annoying CRM's provided data describes browser-based mobile access rather than a dedicated native app."
    },
    {
      "question": "Do all three offer a free trial?",
      "answer": "Only Less Annoying CRM's provided data confirms specific free-trial terms, 30 days with no credit card required. Keap's and Nutshell's available details do not document specific trial terms."
    }
  ]
};

export default keapVsLessAnnoyingCrmVsNutshellContent;

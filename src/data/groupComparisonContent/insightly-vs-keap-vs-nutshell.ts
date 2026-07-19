import type { GroupComparisonContent } from './types';

const insightlyVsKeapVsNutshellContent: GroupComparisonContent = {
  "verdict": "Insightly, Keap, and Nutshell all target small and mid-sized B2B teams but solve different problems beyond the sales pipeline: Insightly's standout feature is converting won deals directly into tracked delivery projects inside the same platform, Keap pairs CRM with a mature marketing-automation engine plus invoicing and payment collection, and Nutshell combines CRM with flexible pipeline visualizations and optional marketing or AI add-ons. Nutshell has the lowest published starting price of the three, while Keap's bundled pricing is the highest and includes a mandatory onboarding fee. The right choice depends on whether post-sale project handoff, marketing automation with invoicing, or flexible pipeline views and add-on flexibility matters most.",
  "bestFor": {
    "insightly": "Teams that need to hand closed deals directly into tracked delivery projects without switching to a separate project-management tool",
    "keap": "Solo entrepreneurs and small service businesses that want CRM, marketing automation, and invoicing and payment collection bundled into one platform",
    "nutshell": "Small and midsize B2B sales teams that want CRM with flexible pipeline visualizations and optional email marketing or AI add-ons"
  },
  "highlights": [
    {
      "title": "Native project management on top of the CRM",
      "description": "Insightly lets teams convert a won deal directly into a trackable delivery project inside the same platform, a differentiator from CRMs that stop at the sale.",
      "toolSlugs": [
        "insightly"
      ]
    },
    {
      "title": "Deepest built-in marketing automation and invoicing",
      "description": "Keap centers on a purpose-built small-business automation engine with multi-step email and SMS sequences, plus quote, invoice, and payment collection tools included in the core platform.",
      "toolSlugs": [
        "keap"
      ]
    },
    {
      "title": "Flexible pipeline views including a map",
      "description": "Nutshell offers board, list, chart, and geographic map pipeline visualizations, useful for territory-based sales teams, alongside optional Marketing Pro and Nutshell IQ AI add-ons.",
      "toolSlugs": [
        "nutshell"
      ]
    },
    {
      "title": "AI features sold differently across the three",
      "description": "Insightly includes an AI Copilot on its Professional and Enterprise tiers, Nutshell sells its Nutshell IQ AI layer as a separate paid add-on, and Keap does not document AI assistant features.",
      "toolSlugs": [
        "insightly",
        "nutshell",
        "keap"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Sales and Delivery Workflow",
      "rows": [
        {
          "feature": "Native project management for post-sale delivery",
          "statuses": {
            "insightly": "available",
            "keap": "not-documented",
            "nutshell": "not-documented"
          }
        },
        {
          "feature": "Multiple pipeline visualizations",
          "statuses": {
            "insightly": "available",
            "keap": "not-documented",
            "nutshell": "available"
          },
          "note": "Insightly offers a Kanban-style view; Nutshell adds board, list, chart, and map views."
        }
      ]
    },
    {
      "group": "Automation and AI",
      "rows": [
        {
          "feature": "AI assistant for emails or summaries",
          "statuses": {
            "insightly": "available",
            "keap": "not-documented",
            "nutshell": "limited"
          },
          "note": "Insightly's AI Copilot is included on Professional and Enterprise tiers; Nutshell IQ is a separate paid add-on."
        },
        {
          "feature": "Email or SMS marketing automation",
          "statuses": {
            "insightly": "not-documented",
            "keap": "available",
            "nutshell": "available"
          },
          "note": "Marketing automation is core to Keap; Nutshell offers it via the Marketing Pro add-on."
        }
      ]
    },
    {
      "group": "Billing and Integration",
      "rows": [
        {
          "feature": "Invoicing and payment collection",
          "statuses": {
            "insightly": "not-documented",
            "keap": "available",
            "nutshell": "not-documented"
          }
        },
        {
          "feature": "REST API and webhooks",
          "statuses": {
            "insightly": "available",
            "keap": "not-documented",
            "nutshell": "not-documented"
          },
          "note": "Available on Insightly's Professional tier and above."
        }
      ]
    },
    {
      "group": "Access",
      "rows": [
        {
          "feature": "No-credit-card free trial",
          "statuses": {
            "insightly": "available",
            "keap": "not-documented",
            "nutshell": "not-documented"
          },
          "note": "Insightly documents a 14-day free trial across all plans."
        },
        {
          "feature": "Native iOS and Android mobile app",
          "statuses": {
            "insightly": "available",
            "keap": "available",
            "nutshell": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is best for handing off closed deals into project delivery?",
      "answer": "Insightly is purpose-built for this, letting sales teams convert a won deal directly into a trackable delivery project inside the same platform rather than exporting to a separate tool."
    },
    {
      "question": "Which includes invoicing and payment collection?",
      "answer": "Keap includes quote, invoice, and payment collection tools as part of its core platform. Insightly and Nutshell do not document built-in invoicing."
    },
    {
      "question": "Which has a geographic map pipeline view?",
      "answer": "Nutshell is the only one of the three that documents a map pipeline view, alongside board, list, and chart views."
    },
    {
      "question": "Which is the most affordable to start with?",
      "answer": "Nutshell's Foundation plan starts at $13 per user per month, well below Insightly's $29 per user per month and Keap's roughly $249 per month bundled starting price."
    },
    {
      "question": "Which offers a documented free trial?",
      "answer": "Insightly documents a free 14-day trial across all its plans. Keap and Nutshell do not document a free trial in the provided pricing information."
    },
    {
      "question": "Which of these include AI features?",
      "answer": "Insightly includes an AI Copilot for email summaries and reply drafting on its Professional and Enterprise tiers. Nutshell offers AI-generated insights through its separately priced Nutshell IQ add-on. Keap does not document AI assistant features."
    }
  ]
};

export default insightlyVsKeapVsNutshellContent;

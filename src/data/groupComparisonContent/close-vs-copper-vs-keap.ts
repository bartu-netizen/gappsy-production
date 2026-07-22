import type { GroupComparisonContent } from './types';

const closeVsCopperVsKeapContent: GroupComparisonContent = {
  "verdict": "Close, Copper, and Keap all target small and mid-sized sales teams but optimize for different workflows: Close bakes native calling, SMS, and an AI assistant into every plan for outbound-heavy teams, Copper wraps a CRM around Gmail and Google Workspace for relationship-driven teams that live in their inbox, and Keap pairs CRM with deep marketing automation, invoicing, and payment collection for solo service businesses. Keap's starting price is far higher than the other two, reflecting its broader all-in-one scope and mandatory onboarding package rather than a simple per-seat markup. No single tool wins outright; the right choice depends on whether calling volume, Gmail integration, or bundled invoicing matters most.",
  "bestFor": {
    "close": "Outbound-heavy sales teams and solo founders that want native calling, SMS, and an AI assistant included in every plan without a separate dialer tool",
    "copper": "Teams already running their business inside Gmail and Google Workspace that want a CRM which auto-captures email and calendar activity with minimal setup",
    "keap": "Solo entrepreneurs and small service businesses that want CRM, marketing automation, and invoicing and payment collection bundled into a single platform"
  },
  "highlights": [
    {
      "title": "Calling, SMS, and AI included in every plan",
      "description": "Close bundles native calling, SMS, and the Chloe AI assistant into all four pricing tiers, though calling minutes and SMS are billed on top of the subscription at usage rates.",
      "toolSlugs": [
        "close"
      ]
    },
    {
      "title": "Deepest native Google Workspace integration",
      "description": "Copper automatically logs emails, calls, and calendar events against the correct contact and syncs bidirectionally with Google Contacts and Calendar, and is listed as a Google-recommended CRM in the Workspace Marketplace.",
      "toolSlugs": [
        "copper"
      ]
    },
    {
      "title": "Invoicing and payments built into the CRM",
      "description": "Keap includes quote, invoice, and payment collection tools alongside its CRM and automation engine, removing the need for a separate billing tool.",
      "toolSlugs": [
        "keap"
      ]
    },
    {
      "title": "Large starting-price gap",
      "description": "Close starts at $9 per user per month and Copper at $23, while Keap starts around $249 per month for a bundle that includes two user licenses, reflecting its broader marketing-automation and invoicing scope plus a mandatory onboarding fee.",
      "toolSlugs": [
        "close",
        "copper",
        "keap"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Calling and AI",
      "rows": [
        {
          "feature": "Native calling and SMS",
          "statuses": {
            "close": "available",
            "copper": "not-documented",
            "keap": "available"
          },
          "note": "Close includes Power and Predictive Dialers; Keap offers SMS automation plus metered voice/SMS add-on capacity."
        },
        {
          "feature": "Built-in AI assistant for calls or follow-ups",
          "statuses": {
            "close": "available",
            "copper": "not-documented",
            "keap": "not-documented"
          },
          "note": "Close's Chloe AI assistant summarizes calls and drafts follow-ups on every plan."
        }
      ]
    },
    {
      "group": "Ecosystem and Automation",
      "rows": [
        {
          "feature": "Native Gmail and Google Workspace integration",
          "statuses": {
            "close": "not-documented",
            "copper": "available",
            "keap": "not-documented"
          }
        },
        {
          "feature": "Multi-step marketing or sales automation",
          "statuses": {
            "close": "available",
            "copper": "available",
            "keap": "available"
          },
          "note": "Close's Workflows are limited to its two highest-priced tiers; automation is Keap's core, most mature capability."
        }
      ]
    },
    {
      "group": "Billing Tools",
      "rows": [
        {
          "feature": "Invoicing and payment collection",
          "statuses": {
            "close": "unavailable",
            "copper": "unavailable",
            "keap": "available"
          }
        },
        {
          "feature": "No-credit-card free trial",
          "statuses": {
            "close": "available",
            "copper": "available",
            "keap": "not-documented"
          },
          "note": "Close and Copper both offer 14-day trials with no credit card required; Keap does not document a free trial and typically requires a paid Kickstart onboarding package."
        }
      ]
    },
    {
      "group": "Access and Pricing",
      "rows": [
        {
          "feature": "Native iOS and Android mobile app",
          "statuses": {
            "close": "available",
            "copper": "not-documented",
            "keap": "available"
          }
        },
        {
          "feature": "Published, transparent starting price",
          "statuses": {
            "close": "available",
            "copper": "available",
            "keap": "available"
          },
          "note": "Close starts at $9/user/month, Copper at $23/user/month, and Keap at roughly $249/month for a bundle covering two users."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three CRMs is cheapest to start with?",
      "answer": "Close has the lowest published starting price at $9 per user per month for its Solo plan, followed by Copper at $23 per user per month. Keap starts around $249 per month, but that price covers a bundle including two user licenses plus a broader marketing-automation and invoicing feature set."
    },
    {
      "question": "Which CRM integrates most deeply with Gmail and Google Workspace?",
      "answer": "Copper is purpose-built around native Google Workspace integration, automatically logging emails, calls, and calendar events and syncing bidirectionally with Google Contacts and Calendar."
    },
    {
      "question": "Which one includes invoicing and payment collection?",
      "answer": "Keap includes quote, invoice, and payment collection tools as part of its core platform. Close and Copper do not document built-in invoicing or payments."
    },
    {
      "question": "Do Close and Copper offer free trials?",
      "answer": "Yes. Both Close and Copper offer 14-day free trials that do not require a credit card. Keap does not document a free trial in its published pricing."
    },
    {
      "question": "Which is best for high-volume outbound calling?",
      "answer": "Close is built around native calling, with a Power Dialer available from its Growth plan and a Predictive Dialer on its top Scale plan."
    },
    {
      "question": "Are there extra costs beyond the listed subscription price?",
      "answer": "Yes for two of the three. Close bills calling minutes and SMS on a usage basis on top of the subscription. Keap typically requires a one-time Kickstart onboarding fee of roughly $499 to $999 and meters extra SMS and voice capacity. Copper's tiers are flat per-user prices, though lower tiers cap contacts and custom fields."
    }
  ]
};

export default closeVsCopperVsKeapContent;

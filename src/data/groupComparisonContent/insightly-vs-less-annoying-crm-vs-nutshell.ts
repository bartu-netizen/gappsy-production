import type { GroupComparisonContent } from './types';

const insightlyVsLessAnnoyingCrmVsNutshellContent: GroupComparisonContent = {
  "verdict": "These three small-business CRMs sit at different points on the simplicity-to-capability spectrum. Less Annoying CRM is the simplest and cheapest, with one flat price and no feature gating, Nutshell sits in the middle with multiple pipeline views and optional marketing and AI add-ons, and Insightly goes furthest by combining CRM with native project management for teams that need to track delivery after the sale. No single tool wins outright; the right pick depends on how much automation and structure a small team actually wants to manage.",
  "bestFor": {
    "insightly": "Small and mid-sized businesses that want to move a closed deal directly into a tracked delivery project without a separate tool.",
    "less-annoying-crm": "Small businesses and independent professionals who want one simple, flat-priced CRM with no tiers, upsells, or feature gating.",
    "nutshell": "Small and midsize B2B sales teams that want multiple pipeline views, built-in email marketing, and optional AI insights in one system."
  },
  "highlights": [
    {
      "title": "Less Annoying CRM has a single, transparent price",
      "description": "At $15 per user per month with one plan and no feature gating, Less Annoying CRM avoids the tiered upsell structure that both Insightly and Nutshell use.",
      "toolSlugs": [
        "less-annoying-crm"
      ]
    },
    {
      "title": "Insightly is the only one with native project management",
      "description": "Insightly lets a sales team convert a won deal directly into a trackable delivery project in the same platform, a feature neither Less Annoying CRM nor Nutshell offers.",
      "toolSlugs": [
        "insightly"
      ]
    },
    {
      "title": "Nutshell offers the most pipeline visualization options",
      "description": "Nutshell supports board (Kanban), list, chart, and map views for visualizing deals, including a geographic map view for territory-based sales teams, going further than the single pipeline views in Insightly and Less Annoying CRM.",
      "toolSlugs": [
        "nutshell"
      ]
    },
    {
      "title": "Nutshell's marketing and AI features are paid add-ons",
      "description": "Nutshell's Marketing Pro email automation, Engagement Pro sales sequencing, and Nutshell IQ AI insights are all sold separately from the core plans, whereas Insightly bundles AI Copilot and Less Annoying CRM includes its full feature set in its single price.",
      "toolSlugs": [
        "nutshell",
        "insightly",
        "less-annoying-crm"
      ]
    },
    {
      "title": "Less Annoying CRM trades depth for simplicity",
      "description": "Less Annoying CRM intentionally lacks advanced automation, AI features, and a large integration marketplace, which Insightly and Nutshell both offer to varying degrees on their higher tiers.",
      "toolSlugs": [
        "less-annoying-crm"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and plans",
      "rows": [
        {
          "feature": "Single flat-rate plan",
          "statuses": {
            "insightly": "unavailable",
            "less-annoying-crm": "available",
            "nutshell": "unavailable"
          },
          "note": "Insightly and Nutshell both use multi-tier pricing; Less Annoying CRM has one plan for every customer."
        },
        {
          "feature": "Free trial",
          "statuses": {
            "insightly": "available",
            "less-annoying-crm": "available",
            "nutshell": "not-documented"
          },
          "note": "Insightly offers a 14-day free trial and Less Annoying CRM offers a 30-day free trial with full feature access."
        }
      ]
    },
    {
      "group": "Pipeline and sales",
      "rows": [
        {
          "feature": "Custom sales pipeline",
          "statuses": {
            "insightly": "available",
            "less-annoying-crm": "available",
            "nutshell": "available"
          }
        },
        {
          "feature": "Multiple pipeline views (list, chart, map)",
          "statuses": {
            "insightly": "unavailable",
            "less-annoying-crm": "unavailable",
            "nutshell": "available"
          }
        },
        {
          "feature": "Workflow/sales automation",
          "statuses": {
            "insightly": "limited",
            "less-annoying-crm": "unavailable",
            "nutshell": "available"
          },
          "note": "Insightly requires its Professional tier or above for workflow automation."
        }
      ]
    },
    {
      "group": "Marketing, AI, and delivery",
      "rows": [
        {
          "feature": "Native project management",
          "statuses": {
            "insightly": "available",
            "less-annoying-crm": "unavailable",
            "nutshell": "unavailable"
          }
        },
        {
          "feature": "Email marketing automation",
          "statuses": {
            "insightly": "unavailable",
            "less-annoying-crm": "unavailable",
            "nutshell": "limited"
          },
          "note": "Nutshell's email marketing automation requires the separate Marketing Pro add-on."
        },
        {
          "feature": "AI-assisted features",
          "statuses": {
            "insightly": "limited",
            "less-annoying-crm": "unavailable",
            "nutshell": "limited"
          },
          "note": "Insightly's AI Copilot requires Professional tier or above; Nutshell IQ is a paid add-on."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three CRMs is the cheapest overall?",
      "answer": "Less Annoying CRM is the cheapest at a flat $15 per user per month with every feature included, compared to Nutshell's Foundation plan at $13 per user per month (which lacks automation and add-ons) and Insightly's Plus plan at $29 per user per month."
    },
    {
      "question": "Which CRM is easiest for a non-technical small business owner to set up alone?",
      "answer": "Less Annoying CRM is built specifically for that scenario, with a single plan, no feature gating, and a design philosophy centered on simplicity over enterprise-style configuration. Nutshell is also positioned as fast to set up for non-technical reps, while Insightly's project-management depth makes it somewhat more involved to configure."
    },
    {
      "question": "Do any of these CRMs include email marketing automation by default?",
      "answer": "No. Nutshell offers email marketing automation only through its separate Marketing Pro add-on at $49 per company per month, and neither Insightly nor Less Annoying CRM includes dedicated email marketing automation at all."
    },
    {
      "question": "Which CRM should I pick if I need to manage projects after a deal closes?",
      "answer": "Insightly is the only one of the three with native project management, letting a team convert a won deal directly into a trackable delivery project in the same platform."
    },
    {
      "question": "Does Less Annoying CRM have a free trial like the others?",
      "answer": "Yes. Less Annoying CRM offers a 30-day free trial with full, unrestricted access to every feature and no credit card required, while Insightly offers a 14-day free trial across its tiers."
    },
    {
      "question": "Which CRM has the best mobile experience for sales reps?",
      "answer": "All three offer mobile access, with Insightly and Nutshell providing dedicated native iOS and Android apps. Less Annoying CRM is accessible from mobile browsers rather than dedicated native apps, which may matter for reps who prefer an installed app."
    }
  ]
};

export default insightlyVsLessAnnoyingCrmVsNutshellContent;

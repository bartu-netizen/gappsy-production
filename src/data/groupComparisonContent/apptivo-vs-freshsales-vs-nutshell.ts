import type { GroupComparisonContent } from './types';

const apptivoVsFreshsalesVsNutshellContent: GroupComparisonContent = {
  "verdict": "Apptivo, Freshsales, and Nutshell all target small and midsize sales teams, but they solve slightly different problems. Apptivo is the broadest, bundling help desk, field service, and marketing modules alongside its CRM for teams that want one low-cost suite instead of several point tools. Freshsales leans hardest into AI-assisted selling with Freddy AI lead scoring and built-in phone and email, backed by the wider Freshworks ecosystem. Nutshell sits in between, prioritizing easy onboarding and multiple pipeline views (including a map view) for B2B teams that want a straightforward CRM with optional email marketing and AI add-ons rather than a sprawling suite.",
  "bestFor": {
    "apptivo": "SMBs that want one subscription covering CRM, help desk ticketing, field service, and marketing campaigns instead of stitching together separate tools.",
    "freshsales": "Sales teams that want AI-powered lead scoring and built-in phone/email dialing in a sales-first CRM, especially those already using Freshdesk or Freshservice.",
    "nutshell": "Small and midsize B2B teams that want an easy-to-adopt CRM with multiple pipeline views and optional email marketing and AI add-ons, without a steep learning curve."
  },
  "highlights": [
    {
      "title": "Apptivo bundles the most beyond core sales",
      "description": "Apptivo is the only one of the three that includes Help Desk ticketing, Field Service management, and a Campaigns module as part of its core suite rather than a separate product or paid add-on, making it the closest thing to an all-in-one business suite.",
      "toolSlugs": [
        "apptivo"
      ]
    },
    {
      "title": "Freshsales leads on built-in AI and sales engagement",
      "description": "Freshsales includes Freddy AI lead scoring, sales sequences, and multiple sales pipelines starting on its Pro tier, plus a built-in phone dialer and email integration available even on lower tiers.",
      "toolSlugs": [
        "freshsales"
      ]
    },
    {
      "title": "Nutshell offers the most pipeline visualization options",
      "description": "Nutshell supports board (Kanban), list, chart, and a geographic map view of deals and contacts, which is useful for territory-based sales teams that other two tools do not document.",
      "toolSlugs": [
        "nutshell"
      ]
    },
    {
      "title": "Free tiers differ in who they fit",
      "description": "Apptivo's free Starter plan supports a single user, and Freshsales' free plan supports up to 3 users; Nutshell has no permanent free plan and starts at $13/user/month billed annually.",
      "toolSlugs": [
        "apptivo",
        "freshsales",
        "nutshell"
      ]
    },
    {
      "title": "Marketing automation is add-on or separate everywhere",
      "description": "None of the three includes full email marketing automation for free: Apptivo folds Campaigns into its core suite, Nutshell sells it as the Marketing Pro add-on, and Freshsales keeps it in the separate Freshmarketer product.",
      "toolSlugs": [
        "apptivo",
        "freshsales",
        "nutshell"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core CRM and Pipeline",
      "rows": [
        {
          "feature": "Free plan available",
          "statuses": {
            "apptivo": "available",
            "freshsales": "available",
            "nutshell": "unavailable"
          },
          "note": "Apptivo's free Starter plan covers 1 user and Freshsales' free plan covers up to 3 users; Nutshell has no permanent free plan and starts at $13/user/month billed annually."
        },
        {
          "feature": "Visual, customizable sales pipeline",
          "statuses": {
            "apptivo": "available",
            "freshsales": "available",
            "nutshell": "available"
          },
          "note": "Nutshell uniquely adds board, list, chart, and geographic map views on top of standard pipeline management."
        },
        {
          "feature": "Native mobile apps (iOS and Android)",
          "statuses": {
            "apptivo": "available",
            "freshsales": "available",
            "nutshell": "available"
          },
          "note": "Apptivo also ships a Windows app in addition to iOS and Android."
        }
      ]
    },
    {
      "group": "Sales Engagement and AI",
      "rows": [
        {
          "feature": "Built-in phone and email dialer",
          "statuses": {
            "apptivo": "not-documented",
            "freshsales": "available",
            "nutshell": "limited"
          },
          "note": "Freshsales includes phone and email natively across tiers; Nutshell offers basic email tracking standard, with click-to-call and sequencing gated behind the paid Engagement Pro add-on."
        },
        {
          "feature": "AI-powered lead scoring or insights",
          "statuses": {
            "apptivo": "not-documented",
            "freshsales": "available",
            "nutshell": "limited"
          },
          "note": "Freddy AI lead scoring ships on Freshsales' Pro tier and above; Nutshell IQ is a separate paid add-on billed per company; Apptivo does not document a dedicated AI scoring feature."
        }
      ]
    },
    {
      "group": "Marketing and Extended Modules",
      "rows": [
        {
          "feature": "Email marketing or campaign automation",
          "statuses": {
            "apptivo": "available",
            "freshsales": "unavailable",
            "nutshell": "limited"
          },
          "note": "Apptivo bundles Campaigns into its core suite; Freshsales keeps marketing automation in the separate Freshmarketer product; Nutshell offers it as the paid Marketing Pro add-on."
        },
        {
          "feature": "Help desk or ticketing module",
          "statuses": {
            "apptivo": "available",
            "freshsales": "unavailable",
            "nutshell": "unavailable"
          },
          "note": "Apptivo bundles Help Desk ticketing directly into its suite; Freshsales support lives in the separate Freshdesk product, and Nutshell has no built-in ticketing system."
        },
        {
          "feature": "Field service management",
          "statuses": {
            "apptivo": "available",
            "freshsales": "unavailable",
            "nutshell": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three CRMs has a free plan?",
      "answer": "Apptivo and Freshsales both offer permanently free tiers: Apptivo's free Starter plan covers 1 user, and Freshsales' free plan covers up to 3 users. Nutshell has no free plan; its cheapest tier, Foundation, starts at $13/user/month billed annually."
    },
    {
      "question": "Does any of them include AI-powered lead scoring?",
      "answer": "Freshsales includes Freddy AI lead scoring starting on its Pro plan at $39/user/month. Nutshell offers AI-generated deal summaries and coaching insights through the separate Nutshell IQ add-on. Apptivo does not document a dedicated AI lead-scoring feature."
    },
    {
      "question": "Which CRM bundles the most functionality beyond core sales?",
      "answer": "Apptivo is the broadest of the three, bundling Help Desk ticketing, Field Service management, and a Campaigns module alongside its Sales CRM in one subscription. Freshsales and Nutshell keep support and marketing largely in separate Freshworks products or paid add-ons."
    },
    {
      "question": "Is email marketing included by default in any of these tools?",
      "answer": "No. Freshsales requires the separate Freshmarketer product for email marketing automation, Nutshell requires the paid Marketing Pro add-on at $49/company/month, and Apptivo's Campaigns module is included as part of its bundled suite."
    },
    {
      "question": "Which is cheapest for a small 3 to 5 person sales team?",
      "answer": "It depends on needs. Freshsales is free for up to 3 users, then $9/user/month on Growth. Apptivo's Lite plan runs about $15/user/month after its 1-user free Starter tier. Nutshell starts at $13/user/month with no free option, so cost ordering shifts once a team grows past Freshsales' free-tier user limit."
    },
    {
      "question": "Do all three offer a free trial?",
      "answer": "Apptivo and Freshsales publish specific trial lengths, 14 days and 21 days respectively, on their paid plans. Nutshell also provides trial access and free guided onboarding on most plans, though the source data does not specify an exact trial duration."
    }
  ]
};

export default apptivoVsFreshsalesVsNutshellContent;

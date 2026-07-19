import type { GroupComparisonContent } from './types';

const closeVsCopperVsNutshellContent: GroupComparisonContent = {
  "verdict": "Close, Copper, and Nutshell all serve small and mid-sized B2B sales teams, but each leans into a different strength: Close bundles native calling, SMS, and an AI assistant into every plan, Copper wraps a CRM tightly around Gmail and Google Workspace, and Nutshell combines CRM with optional email marketing and sales-engagement add-ons plus multiple pipeline views, including a geographic map. Nutshell's Foundation tier has the lowest published starting price of the three, while Close's core AI and calling features are included at every tier rather than sold as add-ons the way Nutshell's IQ and Marketing Pro modules are. The best fit depends on whether outbound calling, Gmail integration, or bundled marketing automation matters most.",
  "bestFor": {
    "close": "Outbound-heavy sales teams and solo founders that want native calling, SMS, and an AI assistant included in every plan without a separate dialer tool",
    "copper": "Teams already running their business inside Gmail and Google Workspace that want a CRM which auto-captures email and calendar activity with minimal setup",
    "nutshell": "Small and midsize B2B sales teams that want CRM, flexible pipeline visualizations, and optional email marketing or sales-engagement add-ons in one platform"
  },
  "highlights": [
    {
      "title": "Calling, SMS, and AI included at every tier",
      "description": "Close bundles native calling, SMS, and the Chloe AI assistant into all four pricing tiers, while Nutshell's comparable AI layer, Nutshell IQ, is sold as a separate paid add-on.",
      "toolSlugs": [
        "close",
        "nutshell"
      ]
    },
    {
      "title": "Deepest native Google Workspace integration",
      "description": "Copper automatically logs emails, calls, and calendar events against the correct contact and syncs bidirectionally with Google Contacts and Calendar, and is a Google-recommended CRM in the Workspace Marketplace.",
      "toolSlugs": [
        "copper"
      ]
    },
    {
      "title": "Multiple pipeline views including a map",
      "description": "Nutshell offers board, list, chart, and geographic map pipeline visualizations, which is useful for territory-based sales teams and goes beyond the pipeline views documented for Close or Copper.",
      "toolSlugs": [
        "nutshell"
      ]
    },
    {
      "title": "Email marketing bundled as an add-on, not built in",
      "description": "Nutshell's Marketing Pro add-on brings email campaigns, drip sequences, and landing pages onto the same contact data as the CRM, a capability neither Close nor Copper documents.",
      "toolSlugs": [
        "nutshell"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Calling, AI, and Communication",
      "rows": [
        {
          "feature": "Native calling and dialer tools",
          "statuses": {
            "close": "available",
            "copper": "not-documented",
            "nutshell": "limited"
          },
          "note": "Nutshell's click-to-call is part of the paid Engagement Pro add-on rather than the base plan."
        },
        {
          "feature": "Built-in AI assistant",
          "statuses": {
            "close": "available",
            "copper": "not-documented",
            "nutshell": "limited"
          },
          "note": "Nutshell IQ is a paid add-on at $37 per company per month for 100 credits; Close includes Chloe AI on every plan."
        }
      ]
    },
    {
      "group": "Marketing and Pipeline Tools",
      "rows": [
        {
          "feature": "Native Gmail and Google Workspace integration",
          "statuses": {
            "close": "not-documented",
            "copper": "available",
            "nutshell": "available"
          },
          "note": "Copper's integration is deeper and purpose-built; Nutshell offers two-way sync with Google Workspace and Outlook."
        },
        {
          "feature": "Email marketing and drip campaigns",
          "statuses": {
            "close": "not-documented",
            "copper": "not-documented",
            "nutshell": "available"
          },
          "note": "Available via Nutshell's Marketing Pro add-on."
        },
        {
          "feature": "Multiple pipeline visualizations (board, list, chart, map)",
          "statuses": {
            "close": "not-documented",
            "copper": "not-documented",
            "nutshell": "available"
          }
        }
      ]
    },
    {
      "group": "Automation and Access",
      "rows": [
        {
          "feature": "Workflow or sales automation",
          "statuses": {
            "close": "available",
            "copper": "available",
            "nutshell": "available"
          },
          "note": "Close's Workflows are limited to its two highest tiers; Nutshell's automation starts at its Growth tier."
        },
        {
          "feature": "No-credit-card free trial",
          "statuses": {
            "close": "available",
            "copper": "available",
            "nutshell": "not-documented"
          }
        },
        {
          "feature": "Native iOS and Android mobile app",
          "statuses": {
            "close": "available",
            "copper": "not-documented",
            "nutshell": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three CRMs bundles email marketing automation?",
      "answer": "Nutshell offers email marketing through its Marketing Pro add-on, which adds a campaign builder, drip sequences, and landing pages on the same contact and deal data as the CRM. Close and Copper do not document built-in email marketing tools."
    },
    {
      "question": "Which has a geographic or map-based pipeline view?",
      "answer": "Nutshell is the only one of the three that documents a map pipeline view, alongside board, list, and chart views, which is useful for territory-based sales teams."
    },
    {
      "question": "Which is best for teams that live in Gmail?",
      "answer": "Copper offers the deepest native Google Workspace integration of the three, automatically capturing email, calendar, and contact activity from Gmail."
    },
    {
      "question": "Which includes native calling in its base subscription?",
      "answer": "Close includes native calling and SMS in every plan. Nutshell's click-to-call is part of its paid Engagement Pro add-on, and Copper does not document native calling."
    },
    {
      "question": "Which is the most affordable to start with?",
      "answer": "Nutshell's Foundation plan starts at $13 per user per month, the lowest published starting price among the three, though Close's Solo plan at $9 per user per month is cheaper on paper before usage-based calling and SMS charges."
    },
    {
      "question": "Do any of these charge extra for AI features?",
      "answer": "Yes. Nutshell IQ is a paid add-on at $37 per company per month for 100 credits. Close includes its Chloe AI assistant in every plan at no extra cost, and Copper does not document AI assistant features."
    }
  ]
};

export default closeVsCopperVsNutshellContent;

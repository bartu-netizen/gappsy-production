import type { GroupComparisonContent } from './types';

const closeVsCopperVsZendeskSellContent: GroupComparisonContent = {
  "verdict": "Close, Copper, and Zendesk Sell each optimize for a different sales context: Close bundles native calling, SMS, and an AI assistant into every plan for outbound-heavy teams, Copper wraps a CRM around Gmail and Google Workspace, and Zendesk Sell is most differentiated for teams already running Zendesk Support, since it can surface a prospect's customer service history alongside the sales pipeline and pairs that with a geolocation-enabled mobile app for field reps. Zendesk Sell's higher tiers (Professional and Enterprise) run well above Close and Copper's comparable plans, so the price-to-feature tradeoff depends heavily on which specific capabilities, calling, Gmail integration, or support-data visibility, matter most to the buyer.",
  "bestFor": {
    "close": "Outbound-heavy sales teams and solo founders that want native calling, SMS, and an AI assistant included in every plan without a separate dialer tool",
    "copper": "Teams already running their business inside Gmail and Google Workspace that want a CRM which auto-captures email and calendar activity with minimal setup",
    "zendesk-sell": "Teams that already use Zendesk Support and want shared customer context between support and sales, plus a geolocation-enabled mobile app for field sales reps"
  },
  "highlights": [
    {
      "title": "Calling, SMS, and AI included at every tier",
      "description": "Close bundles native calling, SMS, and the Chloe AI assistant into all four pricing tiers without a separate dialer add-on.",
      "toolSlugs": [
        "close"
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
      "title": "Shared support and sales context",
      "description": "Because Zendesk Sell shares account infrastructure with Zendesk Support, teams using both products can see a prospect's customer service history directly inside the sales pipeline.",
      "toolSlugs": [
        "zendesk-sell"
      ]
    },
    {
      "title": "Field-sales mobile app with geolocation",
      "description": "Zendesk Sell's mobile app is documented as including geolocation features that let reps see nearby prospects while traveling, a capability not documented for Close or Copper's mobile experiences.",
      "toolSlugs": [
        "zendesk-sell"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Calling and AI",
      "rows": [
        {
          "feature": "Native calling and dialer tools",
          "statuses": {
            "close": "available",
            "copper": "not-documented",
            "zendesk-sell": "not-documented"
          }
        },
        {
          "feature": "Built-in AI assistant",
          "statuses": {
            "close": "available",
            "copper": "not-documented",
            "zendesk-sell": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Integrations and Forecasting",
      "rows": [
        {
          "feature": "Native Gmail and Outlook email sync",
          "statuses": {
            "close": "not-documented",
            "copper": "available",
            "zendesk-sell": "available"
          },
          "note": "Copper's integration is Google-specific and deeper; Zendesk Sell syncs with both Gmail and Outlook."
        },
        {
          "feature": "Built-in sales forecasting",
          "statuses": {
            "close": "not-documented",
            "copper": "available",
            "zendesk-sell": "available"
          }
        },
        {
          "feature": "Shared data with a customer support platform",
          "statuses": {
            "close": "not-documented",
            "copper": "not-documented",
            "zendesk-sell": "available"
          },
          "note": "Zendesk Sell shares account infrastructure with Zendesk Support."
        }
      ]
    },
    {
      "group": "Mobile and Automation",
      "rows": [
        {
          "feature": "Mobile app with geolocation for field sales",
          "statuses": {
            "close": "limited",
            "copper": "not-documented",
            "zendesk-sell": "available"
          },
          "note": "Close has a native mobile app but does not document geolocation features; Zendesk Sell explicitly documents geolocation."
        },
        {
          "feature": "Multi-step email or task sequences",
          "statuses": {
            "close": "available",
            "copper": "available",
            "zendesk-sell": "available"
          }
        },
        {
          "feature": "No-credit-card free trial",
          "statuses": {
            "close": "available",
            "copper": "available",
            "zendesk-sell": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three connects sales data to customer support history?",
      "answer": "Zendesk Sell shares account infrastructure with Zendesk Support, letting reps see a prospect's support tickets and service history directly inside the sales pipeline. Close and Copper do not document this kind of support-platform data sharing."
    },
    {
      "question": "Which is best for Gmail-centric sales teams?",
      "answer": "Copper offers the deepest native Google Workspace integration, automatically capturing email, calendar, and contact activity from Gmail. Zendesk Sell also syncs with Gmail and Outlook, but as one of several features rather than its core differentiator."
    },
    {
      "question": "Which includes native calling and dialer tools?",
      "answer": "Close is the only one of the three that documents native calling tools, including a Power Dialer and a Predictive Dialer on its higher tiers."
    },
    {
      "question": "Which has the strongest mobile app for field sales?",
      "answer": "Zendesk Sell's mobile app is documented as including geolocation features so reps can see nearby prospects while traveling, which is not documented for Close or Copper."
    },
    {
      "question": "Which is the cheapest to start with?",
      "answer": "Close has the lowest published starting price at $9 per user per month, followed by Copper at $23 and Zendesk Sell's Sell Team plan at $19 per user per month annually, though Zendesk Sell's higher tiers scale up to roughly $169 per user per month."
    },
    {
      "question": "Do these include AI features?",
      "answer": "Close includes its Chloe AI assistant on every plan. Copper and Zendesk Sell do not document AI assistant features in their published capabilities."
    }
  ]
};

export default closeVsCopperVsZendeskSellContent;

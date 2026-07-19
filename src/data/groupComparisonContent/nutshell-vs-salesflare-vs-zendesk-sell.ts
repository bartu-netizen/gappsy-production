import type { GroupComparisonContent } from './types';

const nutshellVsSalesflareVsZendeskSellContent: GroupComparisonContent = {
  "verdict": "These three CRMs all target small and midsize B2B sales teams, but each optimizes for a different pain point. Nutshell bundles CRM, email marketing, and sales engagement into one subscription for teams that want fewer tools rather than more automation. Salesflare's entire premise is eliminating manual data entry by auto-capturing activity from email, calendar, phone, and LinkedIn. Zendesk Sell leans on a strong mobile app and its shared data with Zendesk Support, making it a natural fit for field reps and existing Zendesk customers. The best pick depends on whether the priority is fewer tools, less typing, or better mobile and support-team alignment.",
  "bestFor": {
    "nutshell": "Small and midsize B2B sales and marketing teams that want CRM, email marketing automation, and sales engagement combined in one subscription rather than separate tools.",
    "salesflare": "Small B2B teams, agencies, and startups that want a CRM that keeps itself updated automatically from Gmail, Outlook, LinkedIn, and phone activity instead of relying on manual logging.",
    "zendesk-sell": "Field sales teams that need a strongly rated mobile app with geolocation, especially companies already using Zendesk Support that want shared customer context between sales and support."
  },
  "highlights": [
    {
      "title": "Entry pricing favors Nutshell and Zendesk Sell",
      "description": "Nutshell starts at $13 per user per month and Zendesk Sell at $19 per user per month, both undercutting Salesflare's $29 per user per month entry price for its Growth plan.",
      "toolSlugs": [
        "nutshell",
        "salesflare",
        "zendesk-sell"
      ]
    },
    {
      "title": "Salesflare is built around automatic data capture",
      "description": "Salesflare's defining feature is automatically logging emails, meetings, calls, and LinkedIn activity without manual input, a level of automatic capture that goes further than Nutshell's email tracking or Zendesk Sell's Gmail/Outlook sync.",
      "toolSlugs": [
        "salesflare",
        "nutshell",
        "zendesk-sell"
      ]
    },
    {
      "title": "Nutshell is the only one with bundled email marketing",
      "description": "Nutshell's optional Marketing Pro add-on layers email campaigns, landing pages, and drip sequences onto the same contact and deal data as the CRM, a combined marketing-plus-CRM feature not documented for Salesflare or Zendesk Sell.",
      "toolSlugs": [
        "nutshell"
      ]
    },
    {
      "title": "Salesflare includes native LinkedIn prospecting on every plan",
      "description": "Salesflare connects with personal LinkedIn and LinkedIn Sales Navigator through a Chrome extension on all of its tiers, a feature not documented for Nutshell or Zendesk Sell.",
      "toolSlugs": [
        "salesflare"
      ]
    },
    {
      "title": "Zendesk Sell stands out for field sales and Zendesk data sharing",
      "description": "Zendesk Sell's mobile app is highlighted for geolocation features that surface nearby prospects, and it can pull in a prospect's Zendesk Support ticket history, neither of which is documented for Nutshell or Salesflare.",
      "toolSlugs": [
        "zendesk-sell"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Data Capture and Automation",
      "rows": [
        {
          "feature": "Automatic activity capture across email, calls, and LinkedIn",
          "statuses": {
            "nutshell": "limited",
            "salesflare": "available",
            "zendesk-sell": "limited"
          },
          "note": "Nutshell offers email tracking and Zendesk Sell auto-logs Gmail/Outlook activity, but neither documents the multi-channel auto-capture (including LinkedIn and phone) that Salesflare is built around."
        },
        {
          "feature": "Native LinkedIn/Sales Navigator integration",
          "statuses": {
            "nutshell": "not-documented",
            "salesflare": "available",
            "zendesk-sell": "not-documented"
          }
        },
        {
          "feature": "Automated multi-step outreach sequences",
          "statuses": {
            "nutshell": "available",
            "salesflare": "limited",
            "zendesk-sell": "available"
          },
          "note": "Nutshell offers this via its Engagement Pro add-on and Zendesk Sell has it natively; Salesflare documents Pro-tier workflow automation without specifying sequence-style outreach."
        }
      ]
    },
    {
      "group": "Marketing and AI",
      "rows": [
        {
          "feature": "Built-in email marketing campaigns and drip sequences",
          "statuses": {
            "nutshell": "available",
            "salesflare": "unavailable",
            "zendesk-sell": "unavailable"
          },
          "note": "Available on Nutshell via the Marketing Pro add-on."
        },
        {
          "feature": "AI-generated call/email summaries and coaching insights",
          "statuses": {
            "nutshell": "available",
            "salesflare": "unavailable",
            "zendesk-sell": "unavailable"
          },
          "note": "Available on Nutshell via the Nutshell IQ add-on."
        }
      ]
    },
    {
      "group": "Reporting and Mobile",
      "rows": [
        {
          "feature": "Prebuilt reporting dashboards",
          "statuses": {
            "nutshell": "available",
            "salesflare": "available",
            "zendesk-sell": "available"
          }
        },
        {
          "feature": "Mobile app with geolocation for nearby prospects",
          "statuses": {
            "nutshell": "not-documented",
            "salesflare": "not-documented",
            "zendesk-sell": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three CRMs is cheapest to start with?",
      "answer": "Nutshell has the lowest entry price at $13 per user per month billed annually, followed by Zendesk Sell at $19 per user per month. Salesflare's Growth plan starts higher at $29 per user per month."
    },
    {
      "question": "Which CRM requires the least manual data entry?",
      "answer": "Salesflare, whose core design automatically captures emails, meetings, calls, and LinkedIn activity without manual logging. Nutshell offers email tracking and Zendesk Sell syncs with Gmail and Outlook, but neither documents the same breadth of automatic multi-channel capture."
    },
    {
      "question": "Does any of these include email marketing automation built in?",
      "answer": "Only Nutshell, through its optional Marketing Pro add-on, which adds email campaigns, drip sequences, and landing pages that share the same contact and deal data as the CRM."
    },
    {
      "question": "Which has the best mobile app for field sales reps?",
      "answer": "Zendesk Sell's mobile app is specifically highlighted for geolocation features that let reps see nearby prospects while traveling, a capability not documented for Nutshell or Salesflare."
    },
    {
      "question": "Are there minimum seat requirements on any of these?",
      "answer": "Yes. Salesflare's Enterprise plan requires a minimum of five users. Nutshell and Zendesk Sell do not document a minimum seat requirement, though Zendesk Sell's entry Sell Team plan caps out at 3 paid users."
    },
    {
      "question": "Can these CRMs integrate with Gmail and Outlook?",
      "answer": "Yes, all three sync with Gmail and Outlook. Salesflare and Zendesk Sell use this sync to automatically log email activity, while Nutshell also supports two-way sync with Google Workspace and Microsoft Outlook."
    }
  ]
};

export default nutshellVsSalesflareVsZendeskSellContent;

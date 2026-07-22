import type { GroupComparisonContent } from './types';

const onepagecrmVsSalesflareVsSalesmateContent: GroupComparisonContent = {
  "verdict": "OnePageCRM, Salesflare, and Salesmate are all subscription CRMs aimed at small and midsize sales teams, but each leads with a different core mechanic. OnePageCRM strips the interface down to a single prioritized Next Action queue and is the cheapest to start. Salesflare automates data entry from email, calendar, and LinkedIn so reps spend less time updating records. Salesmate bundles native calling, texting, and an AI assistant directly into the CRM. None of the three offers a permanently free plan, so the decision mostly comes down to which workflow, simplicity, automation, or built-in communications, matters most to the team.",
  "bestFor": {
    "onepagecrm": "Solo founders and small teams who want a low-cost, uncluttered CRM built around a single daily follow-up action per contact.",
    "salesflare": "Small B2B teams doing email- and LinkedIn-heavy outreach who want activity logged automatically instead of typed in by hand.",
    "salesmate": "Sales and support teams that want native calling, texting, and AI-assisted automation included in one CRM subscription."
  },
  "highlights": [
    {
      "title": "Lowest entry price",
      "description": "OnePageCRM's Professional plan starts at $9.95 per user per month, undercutting both Salesflare's $29 Growth plan and Salesmate's $23 Basic plan.",
      "toolSlugs": [
        "onepagecrm"
      ]
    },
    {
      "title": "Automation-first data capture",
      "description": "Salesflare automatically pulls in emails, meetings, calls, and LinkedIn activity so reps do not have to manually log interactions, a differentiator from the other two.",
      "toolSlugs": [
        "salesflare"
      ]
    },
    {
      "title": "Calling and texting built into the CRM",
      "description": "Salesmate includes a native power dialer, voicemail drop, and SMS on its higher tiers, removing the need for a separate telephony add-on that OnePageCRM and Salesflare do not offer.",
      "toolSlugs": [
        "salesmate"
      ]
    },
    {
      "title": "A single-action philosophy instead of a dashboard",
      "description": "OnePageCRM's Next Action system assigns every contact one concrete follow-up task, aiming to reduce the decision paralysis that can come with more feature-dense CRMs.",
      "toolSlugs": [
        "onepagecrm"
      ]
    },
    {
      "title": "Built-in AI assistant for workflow automation",
      "description": "Salesmate's Sandy AI assistant and credit-based smart flow automation help automate lead qualification, meeting booking, and follow-up triggers from the Pro tier up.",
      "toolSlugs": [
        "salesmate"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Data Capture and Enrichment",
      "rows": [
        {
          "feature": "Automated email and calendar activity logging",
          "statuses": {
            "onepagecrm": "limited",
            "salesflare": "available",
            "salesmate": "available"
          },
          "note": "OnePageCRM offers email integration and templates but is built around manually assigning a Next Action rather than fully automated activity capture."
        },
        {
          "feature": "Native LinkedIn data enrichment",
          "statuses": {
            "onepagecrm": "not-documented",
            "salesflare": "available",
            "salesmate": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Native Communication Channels",
      "rows": [
        {
          "feature": "Built-in phone calling or power dialer",
          "statuses": {
            "onepagecrm": "not-documented",
            "salesflare": "not-documented",
            "salesmate": "available"
          },
          "note": "Salesmate's power dialer and voicemail drop are available from the Business tier up."
        },
        {
          "feature": "Built-in SMS or texting",
          "statuses": {
            "onepagecrm": "not-documented",
            "salesflare": "not-documented",
            "salesmate": "available"
          }
        }
      ]
    },
    {
      "group": "Automation and AI",
      "rows": [
        {
          "feature": "Built-in AI assistant",
          "statuses": {
            "onepagecrm": "not-documented",
            "salesflare": "not-documented",
            "salesmate": "available"
          },
          "note": "Salesmate's Sandy AI assistant is available on the Pro tier and above."
        },
        {
          "feature": "No-code workflow automation rules",
          "statuses": {
            "onepagecrm": "available",
            "salesflare": "limited",
            "salesmate": "available"
          },
          "note": "Salesflare's deeper workflow automation is part of its Pro plan rather than Growth."
        }
      ]
    },
    {
      "group": "Access and Trial",
      "rows": [
        {
          "feature": "Permanently free plan",
          "statuses": {
            "onepagecrm": "unavailable",
            "salesflare": "unavailable",
            "salesmate": "unavailable"
          },
          "note": "All three offer only a free trial: 21 days for OnePageCRM, 30 days for Salesflare, and 15 days for Salesmate."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do OnePageCRM, Salesflare, or Salesmate offer a permanently free plan?",
      "answer": "No. All three are paid-only products with free trials of different lengths: 21 days for OnePageCRM, 30 days for Salesflare, and 15 days for Salesmate."
    },
    {
      "question": "Which CRM automates the most manual data entry?",
      "answer": "Salesflare, which automatically captures emails, meetings, calls, and LinkedIn activity without requiring reps to log it by hand."
    },
    {
      "question": "Which is the cheapest to start with?",
      "answer": "OnePageCRM, with its Professional plan starting at $9.95 per user per month billed annually, compared to $23 for Salesmate's Basic plan and $29 for Salesflare's Growth plan."
    },
    {
      "question": "Which CRM includes native calling and texting?",
      "answer": "Salesmate, which bundles a power dialer, voicemail drop, and SMS into its Business tier and above, without needing a separate telephony add-on."
    },
    {
      "question": "What is OnePageCRM's Next Action system?",
      "answer": "It is a Getting Things Done-inspired approach that assigns every contact a single concrete next step, which surfaces in a prioritized action stream instead of a traditional pipeline dashboard."
    },
    {
      "question": "Which CRM fits LinkedIn-heavy B2B prospecting best?",
      "answer": "Salesflare, due to its native LinkedIn and Sales Navigator integration included on every plan and its relationship-intelligence scoring based on email activity."
    }
  ]
};

export default onepagecrmVsSalesflareVsSalesmateContent;

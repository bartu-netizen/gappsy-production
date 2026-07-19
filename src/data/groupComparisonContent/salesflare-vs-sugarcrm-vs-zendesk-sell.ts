import type { GroupComparisonContent } from './types';

const salesflareVsSugarcrmVsZendeskSellContent: GroupComparisonContent = {
  "verdict": "These three CRMs suit different stages and buying priorities rather than one clearly beating the others. Salesflare leans hardest into automation, capturing email, calendar, LinkedIn, and call activity automatically so small B2B teams spend less time on data entry. SugarCRM offers the deepest configurability through its business process management tools, but that flexibility comes with the highest entry price and a 15-user minimum on every tier. Zendesk Sell has the lowest published starting price and the strongest documented mobile app, and it is the clear pick for teams already standardized on Zendesk Support who want shared customer context.",
  "bestFor": {
    "salesflare": "Small B2B sales teams that want data entry automated from Gmail, Outlook, LinkedIn, and calls, and that want native LinkedIn and Sales Navigator access on every plan without a large minimum-seat commitment.",
    "sugarcrm": "Larger, established sales and support organizations of 15 or more users that need highly configurable workflows via business process management and are willing to pay premium annual per-seat pricing for that flexibility.",
    "zendesk-sell": "Teams already using or evaluating Zendesk Support that want the lowest-cost entry-level sales CRM in this group, plus a strong mobile app with geolocation for field sales reps."
  },
  "highlights": [
    {
      "title": "Salesflare automates the most manual data entry",
      "description": "Salesflare is built around automatically capturing emails, meetings, calls, and LinkedIn activity into contact timelines and deal histories, in contrast to Zendesk Sell's email-sync-plus-manual-logging approach and SugarCRM's more traditional data-entry model.",
      "toolSlugs": [
        "salesflare"
      ]
    },
    {
      "title": "SugarCRM requires the biggest commitment",
      "description": "SugarCRM's Standard, Advanced, and Premier tiers all carry a 15-user minimum on annual billing with no documented free trial, versus Salesflare's 30-day free trial with no setup fees and Zendesk Sell's lower per-seat entry price.",
      "toolSlugs": [
        "sugarcrm"
      ]
    },
    {
      "title": "Zendesk Sell is the cheapest entry point but caps out fast",
      "description": "Zendesk Sell's Sell Team plan starts around $19 per user per month billed annually, the lowest of the three, but it caps at 3 paid users and a single sales pipeline before requiring an upgrade to Growth or Professional.",
      "toolSlugs": [
        "zendesk-sell"
      ]
    },
    {
      "title": "LinkedIn integration depth varies sharply",
      "description": "Salesflare includes native LinkedIn and Sales Navigator integration on every plan; SugarCRM only adds a LinkedIn connector on its top Premier tier; Zendesk Sell does not document a LinkedIn integration at all.",
      "toolSlugs": [
        "salesflare",
        "sugarcrm",
        "zendesk-sell"
      ]
    },
    {
      "title": "Only Zendesk Sell shares data with a support platform",
      "description": "Zendesk Sell can connect to Zendesk Support data so reps see a prospect's customer service history, a cross-functional advantage neither Salesflare nor SugarCRM document.",
      "toolSlugs": [
        "zendesk-sell"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pipeline, Forecasting, and Workflow",
      "rows": [
        {
          "feature": "Visual pipeline management",
          "statuses": {
            "salesflare": "available",
            "sugarcrm": "available",
            "zendesk-sell": "available"
          }
        },
        {
          "feature": "Sales forecasting",
          "statuses": {
            "salesflare": "not-documented",
            "sugarcrm": "not-documented",
            "zendesk-sell": "available"
          },
          "note": "Zendesk Sell explicitly documents forecasting tools; forecasting is not called out as a named feature for Salesflare or SugarCRM in the available data."
        },
        {
          "feature": "Custom business process automation",
          "statuses": {
            "salesflare": "not-documented",
            "sugarcrm": "available",
            "zendesk-sell": "not-documented"
          },
          "note": "SugarCRM names business process management as a core feature for building custom workflows."
        }
      ]
    },
    {
      "group": "Automation and AI",
      "rows": [
        {
          "feature": "Automated activity capture (email, calendar, calls)",
          "statuses": {
            "salesflare": "available",
            "sugarcrm": "not-documented",
            "zendesk-sell": "limited"
          },
          "note": "Zendesk Sell auto-logs email activity via Gmail/Outlook sync but does not document automatic calendar or call capture the way Salesflare does."
        },
        {
          "feature": "AI-driven insights or scoring",
          "statuses": {
            "salesflare": "available",
            "sugarcrm": "available",
            "zendesk-sell": "not-documented"
          },
          "note": "Salesflare's relationship intelligence and SugarCRM's Sugar Intelligence and Discover both provide AI-driven scoring or research."
        },
        {
          "feature": "Automated multi-step outreach sequences",
          "statuses": {
            "salesflare": "not-documented",
            "sugarcrm": "not-documented",
            "zendesk-sell": "available"
          }
        }
      ]
    },
    {
      "group": "Integrations, Mobile, and Access",
      "rows": [
        {
          "feature": "Native LinkedIn integration",
          "statuses": {
            "salesflare": "available",
            "sugarcrm": "limited",
            "zendesk-sell": "not-documented"
          },
          "note": "Salesflare includes it on every plan; SugarCRM only on the Premier tier."
        },
        {
          "feature": "Dedicated mobile app with geolocation",
          "statuses": {
            "salesflare": "not-documented",
            "sugarcrm": "not-documented",
            "zendesk-sell": "available"
          }
        },
        {
          "feature": "Documented free trial",
          "statuses": {
            "salesflare": "available",
            "sugarcrm": "not-documented",
            "zendesk-sell": "not-documented"
          },
          "note": "Salesflare explicitly offers a 30-day free trial with no setup fees."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three CRMs has the lowest starting price?",
      "answer": "Zendesk Sell's Sell Team plan starts around $19 per user per month billed annually, the lowest of the three, but it caps at 3 paid users and a single pipeline. Salesflare starts at $29 per user per month with no documented user cap on its entry Growth plan."
    },
    {
      "question": "Do any of these offer a free trial?",
      "answer": "Salesflare explicitly offers a 30-day free trial with no setup fees. Free trial terms are not documented in the available data for SugarCRM or Zendesk Sell."
    },
    {
      "question": "Which CRM automates the most manual data entry?",
      "answer": "Salesflare, which is built specifically around capturing email, calendar, LinkedIn, and phone activity automatically rather than relying on reps to log it manually."
    },
    {
      "question": "Is there a minimum number of users required to buy?",
      "answer": "SugarCRM requires a 15-user minimum on every tier. Salesflare's Enterprise plan has a 5-user minimum, but Growth and Pro do not document a minimum. Zendesk Sell's entry Sell Team tier caps at 3 paid users rather than requiring a minimum."
    },
    {
      "question": "Which is best if we already use Zendesk for customer support?",
      "answer": "Zendesk Sell, since it runs on the same account infrastructure as Zendesk Support and can surface a prospect's support history directly to sales reps."
    },
    {
      "question": "Which CRM is the most customizable for complex sales processes?",
      "answer": "SugarCRM, through its business process management tools for building custom, configurable workflows, though that flexibility comes with the highest per-seat pricing and a 15-user minimum of the three."
    }
  ]
};

export default salesflareVsSugarcrmVsZendeskSellContent;

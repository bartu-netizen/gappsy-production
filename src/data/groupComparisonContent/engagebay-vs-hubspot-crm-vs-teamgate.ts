import type { GroupComparisonContent } from './types';

const engagebayVsHubspotCrmVsTeamgateContent: GroupComparisonContent = {
  "verdict": "EngageBay, HubSpot CRM, and Teamgate all start free, but they target different jobs. EngageBay bundles marketing automation, sales pipelines, and a helpdesk into one low-cost platform explicitly positioned as a cheaper HubSpot alternative, HubSpot CRM offers the broadest integration ecosystem and a genuinely unlimited-user free tier with a frictionless upgrade path, and Teamgate stays narrowly focused on sales pipeline management with built-in calling and SMS. Businesses that need marketing and support tools alongside a CRM will likely prefer EngageBay's bundled pricing, while sales-only teams may find Teamgate's focused feature set or HubSpot's free tier more efficient.",
  "bestFor": {
    "engagebay": "Small businesses that want marketing automation, sales pipelines, and a helpdesk bundled into one affordable platform instead of paying for separate HubSpot Hubs.",
    "hubspot-crm": "Teams that want a genuinely free, unlimited-user CRM with the deepest integration ecosystem and room to grow into full marketing and service automation.",
    "teamgate": "Sales-focused teams that want built-in calling and SMS plus transparent per-user pricing without marketing or helpdesk bloat."
  },
  "highlights": [
    {
      "title": "EngageBay bundles marketing, sales, and support",
      "description": "EngageBay's Marketing Bay, CRM and Sales Bay, and Service Bay are combined in one product with a shared contact database, even on the free plan.",
      "toolSlugs": [
        "engagebay"
      ]
    },
    {
      "title": "HubSpot CRM stays free at any team size",
      "description": "HubSpot CRM's free tier has no seat cap, letting unlimited users manage contacts and deals before ever paying for a Hub.",
      "toolSlugs": [
        "hubspot-crm"
      ]
    },
    {
      "title": "Teamgate keeps pricing simple and sales-focused",
      "description": "Teamgate skips marketing and helpdesk features entirely in favor of a focused pipeline, calling, and SMS toolkit at transparent per-user pricing.",
      "toolSlugs": [
        "teamgate"
      ]
    },
    {
      "title": "All three offer a real free starting tier",
      "description": "EngageBay, HubSpot CRM, and Teamgate each let a small team begin managing contacts and deals without a credit card.",
      "toolSlugs": [
        "engagebay",
        "hubspot-crm",
        "teamgate"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Platform",
      "rows": [
        {
          "feature": "Permanent free tier",
          "statuses": {
            "engagebay": "available",
            "hubspot-crm": "available",
            "teamgate": "available"
          },
          "note": "EngageBay caps free at 250 contacts, HubSpot allows unlimited users, Teamgate caps free at 2 users/500 contacts"
        },
        {
          "feature": "Native mobile apps (iOS/Android)",
          "statuses": {
            "engagebay": "available",
            "hubspot-crm": "available",
            "teamgate": "available"
          }
        },
        {
          "feature": "Open/REST API",
          "statuses": {
            "engagebay": "available",
            "hubspot-crm": "available",
            "teamgate": "available"
          }
        }
      ]
    },
    {
      "group": "Marketing and Support",
      "rows": [
        {
          "feature": "Built-in marketing automation",
          "statuses": {
            "engagebay": "available",
            "hubspot-crm": "available",
            "teamgate": "unavailable"
          },
          "note": "EngageBay includes automation from Growth; HubSpot sells deeper automation as a paid Hub"
        },
        {
          "feature": "Built-in helpdesk and live chat",
          "statuses": {
            "engagebay": "available",
            "hubspot-crm": "available",
            "teamgate": "unavailable"
          },
          "note": "Both EngageBay and HubSpot include live chat on their free tiers"
        }
      ]
    },
    {
      "group": "Sales Tools",
      "rows": [
        {
          "feature": "In-app calling and SMS",
          "statuses": {
            "engagebay": "available",
            "hubspot-crm": "not-documented",
            "teamgate": "available"
          },
          "note": "EngageBay offers SMS marketing from Basic; Teamgate offers two-way calling and SMS from Team"
        },
        {
          "feature": "Lead scoring",
          "statuses": {
            "engagebay": "available",
            "hubspot-crm": "available",
            "teamgate": "available"
          },
          "note": "EngageBay from Basic, HubSpot predictive scoring on Enterprise, Teamgate on Growth"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three CRMs bundles marketing automation and a helpdesk in with the CRM?",
      "answer": "EngageBay is the only one of the three that includes email marketing automation and helpdesk or live chat tools even on its free plan; HubSpot CRM offers live chat for free but sells deeper marketing automation as a separate paid Hub, and Teamgate does not include marketing or helpdesk tools at all."
    },
    {
      "question": "Is EngageBay actually cheaper than HubSpot?",
      "answer": "For teams that need marketing, sales, and support together, generally yes: EngageBay's paid tiers start at $14.99 per user per month and bundle all three functions, while combining equivalent HubSpot Hubs typically costs significantly more per seat."
    },
    {
      "question": "Which CRM has the most generous free plan for a growing contact list?",
      "answer": "HubSpot CRM's free plan supports unlimited users with no explicit contact cap tied to seat count, while EngageBay's free plan is capped at 250 contacts and Teamgate's free Starter plan is capped at 500 contacts and 2 users."
    },
    {
      "question": "Does Teamgate include marketing tools like EngageBay or HubSpot?",
      "answer": "No. Teamgate is a sales-focused CRM built around pipeline management, calling, and SMS, and it does not include email marketing automation or a helpdesk module the way EngageBay and HubSpot CRM do."
    },
    {
      "question": "Which tool includes native two-way calling and texting?",
      "answer": "Teamgate includes in-app calling and SMS starting on its Team plan; EngageBay offers SMS marketing campaigns from its Basic tier, a broadcast-style capability rather than one-to-one calling."
    }
  ]
};

export default engagebayVsHubspotCrmVsTeamgateContent;

import type { GroupComparisonContent } from './types';

const attioVsEngagebayVsHubspotCrmContent: GroupComparisonContent = {
  "verdict": "Attio, EngageBay, and HubSpot CRM take three distinct approaches to the same broad market. Attio is an AI-native CRM built for revenue teams that want deep automation and real-time data sync rather than a bundled marketing suite. EngageBay bundles marketing automation, sales pipelines, and a helpdesk into one affordable product, explicitly positioning itself as a cheaper alternative to HubSpot for small businesses. HubSpot CRM's free core is genuinely unlimited on users, with the option to add HubSpot's much larger paid Marketing, Sales, and Service Hubs later without migrating data.",
  "bestFor": {
    "attio": "Revenue and sales operations teams that want an AI-native CRM with configurable agents, real-time sync, and flexible data modeling.",
    "engagebay": "Small businesses that want marketing automation, sales CRM, and helpdesk tools bundled into one platform at a fraction of HubSpot's cost.",
    "hubspot-crm": "Businesses that want a free, unlimited-user CRM core with a proven path to scale into full marketing, sales, and service automation."
  },
  "highlights": [
    {
      "title": "All-in-one versus specialist CRM",
      "description": "EngageBay bundles email marketing, landing pages, sales pipelines, and a helpdesk into a single subscription, while Attio focuses specifically on CRM and sales automation without marketing or support tooling.",
      "toolSlugs": [
        "engagebay",
        "attio"
      ]
    },
    {
      "title": "Positioned directly against HubSpot on price",
      "description": "EngageBay is marketed and reviewed specifically as a more affordable HubSpot alternative, bundling marketing, sales, and service tools that HubSpot unbundles into separate paid Hubs.",
      "toolSlugs": [
        "engagebay",
        "hubspot-crm"
      ]
    },
    {
      "title": "AI-native automation depth",
      "description": "Attio's configurable AI agents, Workflows, and Sequences go further than EngageBay's AI-assisted email writing and lead scoring, or HubSpot's Enterprise-only predictive lead scoring.",
      "toolSlugs": [
        "attio"
      ]
    },
    {
      "title": "Free plan design differs by intent",
      "description": "HubSpot CRM's free plan has no user cap at all, Attio's free plan caps out at 3 seats aimed at small teams testing its automation, and EngageBay's free plan caps contacts at 250 rather than users.",
      "toolSlugs": [
        "attio",
        "engagebay",
        "hubspot-crm"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Plan and Core CRM",
      "rows": [
        {
          "feature": "Usable free plan",
          "statuses": {
            "attio": "available",
            "engagebay": "available",
            "hubspot-crm": "available"
          }
        },
        {
          "feature": "Native email and calendar sync",
          "statuses": {
            "attio": "available",
            "engagebay": "not-documented",
            "hubspot-crm": "available"
          }
        }
      ]
    },
    {
      "group": "Marketing and Support Tools",
      "rows": [
        {
          "feature": "Built-in helpdesk and live chat",
          "statuses": {
            "attio": "not-documented",
            "engagebay": "available",
            "hubspot-crm": "available"
          },
          "note": "HubSpot's free live chat is part of its core CRM; deeper support automation requires Service Hub."
        },
        {
          "feature": "Built-in email marketing and landing pages",
          "statuses": {
            "attio": "not-documented",
            "engagebay": "available",
            "hubspot-crm": "limited"
          },
          "note": "HubSpot CRM includes basic email templates and forms free, but full marketing automation requires the separate Marketing Hub."
        },
        {
          "feature": "SMS marketing",
          "statuses": {
            "attio": "not-documented",
            "engagebay": "available",
            "hubspot-crm": "not-documented"
          }
        }
      ]
    },
    {
      "group": "AI and Governance",
      "rows": [
        {
          "feature": "AI-native workflow or agent automation",
          "statuses": {
            "attio": "available",
            "engagebay": "available",
            "hubspot-crm": "limited"
          },
          "note": "HubSpot's predictive lead scoring is reserved for its Enterprise tier."
        },
        {
          "feature": "SSO",
          "statuses": {
            "attio": "available",
            "engagebay": "available",
            "hubspot-crm": "available"
          },
          "note": "Available on Attio Enterprise, EngageBay Pro, and HubSpot Enterprise."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Attio, EngageBay, and HubSpot CRM is cheapest for a small business needing marketing tools too?",
      "answer": "EngageBay is explicitly positioned as a lower-cost alternative to HubSpot, bundling email marketing, landing pages, sales pipelines, and a helpdesk into paid tiers starting well below equivalent HubSpot Hub pricing."
    },
    {
      "question": "Which CRM is most AI-native?",
      "answer": "Attio is built around AI from the ground up, with configurable AI agents for research and lead scoring, natural-language search and record creation, and automated Workflows and Sequences as core features."
    },
    {
      "question": "Does HubSpot CRM's free plan really have no user limit?",
      "answer": "Yes, HubSpot CRM's free tier supports unlimited users, which the company has offered since launching the free CRM in 2014 as a lead magnet for its paid Hubs."
    },
    {
      "question": "Which tool includes a built-in helpdesk or live chat?",
      "answer": "EngageBay includes live chat and helpdesk ticketing even on its free plan. HubSpot CRM's free tier includes basic live chat, with deeper support automation available through the paid Service Hub."
    },
    {
      "question": "Which is best for a team that only needs CRM and sales automation, not marketing?",
      "answer": "Attio is the most focused of the three on CRM and sales automation specifically, without bundling marketing campaign tools the way EngageBay does."
    },
    {
      "question": "Can I add SMS marketing with any of these?",
      "answer": "EngageBay includes SMS marketing from its Basic tier upward. SMS marketing is not documented as a feature of Attio or HubSpot CRM."
    }
  ]
};

export default attioVsEngagebayVsHubspotCrmContent;

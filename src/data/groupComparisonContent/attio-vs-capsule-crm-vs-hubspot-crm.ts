import type { GroupComparisonContent } from './types';

const attioVsCapsuleCrmVsHubspotCrmContent: GroupComparisonContent = {
  "verdict": "Attio, Capsule CRM, and HubSpot CRM all serve sales teams but assume different starting points. Attio is the most AI-forward of the three, built around real-time data sync and configurable AI agents for revenue operations teams that want deep automation. Capsule CRM prioritizes simplicity, pairing sales pipelines with post-sale project boards so a small business or agency can be running within a day. HubSpot CRM's core advantage is that its free tier supports unlimited users with no time limit, plus a direct upgrade path into HubSpot's much larger marketing, sales, and service platform without a data migration.",
  "bestFor": {
    "attio": "Sales and revenue operations teams that want an AI-native CRM with real-time data sync, configurable AI agents, and flexible object modeling.",
    "capsule-crm": "Small businesses and agencies that want a CRM they can set up in a day, with post-sale project boards for tracking delivery work.",
    "hubspot-crm": "Businesses that want a genuinely free, unlimited-user CRM with a seamless upgrade path into full marketing, sales, and service automation."
  },
  "highlights": [
    {
      "title": "Free plan generosity varies sharply",
      "description": "HubSpot CRM's free tier supports unlimited users, while Attio caps its free plan at 3 seats and Capsule CRM caps its free plan at 2 users and 250 contacts.",
      "toolSlugs": [
        "attio",
        "capsule-crm",
        "hubspot-crm"
      ]
    },
    {
      "title": "AI agents and automation depth",
      "description": "Attio's Workflows, Sequences, and configurable AI agents for research and lead scoring go further than the AI enrichment and summary features Capsule CRM adds from its Growth tier up, or HubSpot's Enterprise-only predictive lead scoring.",
      "toolSlugs": [
        "attio"
      ]
    },
    {
      "title": "Post-sale delivery tracking",
      "description": "Capsule CRM's project boards let a team manage the work that happens after a deal closes inside the same product, a capability not documented for Attio or the core HubSpot CRM.",
      "toolSlugs": [
        "capsule-crm"
      ]
    },
    {
      "title": "One platform to grow into",
      "description": "HubSpot CRM sits on the same object model as HubSpot's paid Marketing, Sales, Service, and CMS Hubs, so a team can add advanced functionality later without migrating existing contact and deal data.",
      "toolSlugs": [
        "hubspot-crm"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Plan and Access",
      "rows": [
        {
          "feature": "Usable free plan",
          "statuses": {
            "attio": "available",
            "capsule-crm": "available",
            "hubspot-crm": "available"
          }
        },
        {
          "feature": "Unlimited users on the free plan",
          "statuses": {
            "attio": "unavailable",
            "capsule-crm": "unavailable",
            "hubspot-crm": "available"
          },
          "note": "Attio's free plan caps out at 3 seats and Capsule CRM's at 2 users."
        }
      ]
    },
    {
      "group": "Automation, AI and Support",
      "rows": [
        {
          "feature": "AI-powered agents or workflow automation",
          "statuses": {
            "attio": "available",
            "capsule-crm": "available",
            "hubspot-crm": "limited"
          },
          "note": "HubSpot's predictive lead scoring is reserved for its Enterprise tier; Capsule's AI enrichment and summaries begin at its Growth tier."
        },
        {
          "feature": "Native email and calendar sync",
          "statuses": {
            "attio": "available",
            "capsule-crm": "available",
            "hubspot-crm": "available"
          }
        },
        {
          "feature": "SSO and advanced admin controls",
          "statuses": {
            "attio": "available",
            "capsule-crm": "not-documented",
            "hubspot-crm": "available"
          },
          "note": "Both are reserved for the top Enterprise tier."
        }
      ]
    },
    {
      "group": "Pipeline and Growth Path",
      "rows": [
        {
          "feature": "Post-sale project or task boards",
          "statuses": {
            "attio": "not-documented",
            "capsule-crm": "available",
            "hubspot-crm": "not-documented"
          }
        },
        {
          "feature": "Upgrade path into a broader marketing/service suite without data migration",
          "statuses": {
            "attio": "not-documented",
            "capsule-crm": "limited",
            "hubspot-crm": "available"
          },
          "note": "Capsule offers a separate add-on product, Transpond, for marketing rather than a unified platform upgrade."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which CRM has the most generous free plan?",
      "answer": "HubSpot CRM, whose free tier supports unlimited users with no time limit. Attio's free plan is capped at 3 seats and Capsule CRM's at 2 users and 250 contacts."
    },
    {
      "question": "Which is best for AI-native sales automation?",
      "answer": "Attio is the most automation-heavy of the three, offering configurable AI agents, natural-language search and record creation, automated Workflows, and outreach Sequences as core parts of the product."
    },
    {
      "question": "Which is the simplest CRM to set up for a small business?",
      "answer": "Capsule CRM is positioned specifically as a simpler alternative to platforms like Salesforce or HubSpot, with a straightforward pipeline and project-board setup a small team can start using within a day."
    },
    {
      "question": "Can I upgrade from a free CRM into more advanced marketing or service tools without switching platforms?",
      "answer": "HubSpot CRM is built for this: it shares the same underlying object model as HubSpot's paid Marketing, Sales, Service, and CMS Hubs, so contacts and deal history carry forward automatically when a team upgrades."
    },
    {
      "question": "Which CRM offers project management after a deal closes?",
      "answer": "Capsule CRM includes project boards for tracking delivery work once a sale is won, a feature not documented for Attio or HubSpot CRM's core product."
    },
    {
      "question": "Which is most affordable to scale as a sales team grows?",
      "answer": "It depends on usage: HubSpot CRM stays free for basic use regardless of team size, but its paid Hubs get expensive per seat; Attio and Capsule CRM both charge per seat once a team exceeds their free-tier caps."
    }
  ]
};

export default attioVsCapsuleCrmVsHubspotCrmContent;

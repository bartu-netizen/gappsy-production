import type { GroupComparisonContent } from './types';

const attioVsHubspotCrmVsTeamgateContent: GroupComparisonContent = {
  "verdict": "Attio, HubSpot CRM, and Teamgate all offer a free entry point and target teams that do not want to start with an expensive enterprise CRM, but they differ sharply in maturity and philosophy. HubSpot CRM is the only one with a genuinely unlimited-user free tier and a huge integration ecosystem behind a public company. Attio is the most AI-native and automation-heavy option, built around real-time data sync and configurable agents. Teamgate is the simplest and most transparently priced of the three, aimed squarely at small sales teams that find the other two more platform than they need.",
  "bestFor": {
    "attio": "Fast-growing startups and revenue operations teams that want an AI-first CRM with flexible data modeling, automated workflows, and configurable AI agents.",
    "hubspot-crm": "Businesses of any size that want a permanently free, unlimited-user CRM with a clear upgrade path into marketing, sales, and service automation without a data migration.",
    "teamgate": "Small sales teams that want simple, transparent per-user pricing and core pipeline features without HubSpot's broader platform complexity."
  },
  "highlights": [
    {
      "title": "HubSpot CRM is the only one with unlimited free users",
      "description": "HubSpot CRM has no seat cap on its free tier, while Attio's free plan is capped at 3 seats and Teamgate's free Starter plan is capped at 2 users and 500 contacts.",
      "toolSlugs": [
        "hubspot-crm",
        "attio",
        "teamgate"
      ]
    },
    {
      "title": "Attio leads on AI-native automation",
      "description": "Attio's Ask Attio natural-language search, configurable AI agents for research and lead scoring, and Call Intelligence for meeting analysis go further into AI-driven workflows than either HubSpot CRM or Teamgate's documented feature sets.",
      "toolSlugs": [
        "attio"
      ]
    },
    {
      "title": "Teamgate is the more affordable step up once teams outgrow free plans",
      "description": "Teamgate's Team plan starts at 39.90 dollars per user per month, while HubSpot's paid Starter tier begins around 15 to 20 dollars per seat per month but scales quickly toward Professional pricing around 100 dollars per seat for more advanced sales tooling.",
      "toolSlugs": [
        "teamgate",
        "hubspot-crm"
      ]
    },
    {
      "title": "HubSpot's ecosystem and upgrade path is unmatched",
      "description": "With over 1,700 App Marketplace listings and the ability to add Marketing, Sales, or Service Hub later without migrating existing CRM data, HubSpot CRM offers a scaling path that neither Attio nor Teamgate's documented integration counts (50-plus for Attio) currently match.",
      "toolSlugs": [
        "hubspot-crm"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Permanently free plan",
          "statuses": {
            "attio": "available",
            "hubspot-crm": "available",
            "teamgate": "available"
          }
        },
        {
          "feature": "Unlimited users on the free tier",
          "statuses": {
            "attio": "unavailable",
            "hubspot-crm": "available",
            "teamgate": "unavailable"
          },
          "note": "Attio's free plan is capped at 3 seats and Teamgate's Starter plan is capped at 2 users."
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI-native agents or assistants",
          "statuses": {
            "attio": "available",
            "hubspot-crm": "not-documented",
            "teamgate": "not-documented"
          }
        },
        {
          "feature": "Configurable workflow automation",
          "statuses": {
            "attio": "available",
            "hubspot-crm": "limited",
            "teamgate": "available"
          },
          "note": "HubSpot's automation is limited on the free tier, with more workflows unlocked starting at Starter."
        }
      ]
    },
    {
      "group": "Sales Engagement",
      "rows": [
        {
          "feature": "In-app calling",
          "statuses": {
            "attio": "not-documented",
            "hubspot-crm": "not-documented",
            "teamgate": "available"
          }
        },
        {
          "feature": "Call recording and analysis",
          "statuses": {
            "attio": "available",
            "hubspot-crm": "not-documented",
            "teamgate": "not-documented"
          },
          "note": "Attio's Call Intelligence (Pro tier) records and analyzes meetings."
        }
      ]
    },
    {
      "group": "Ecosystem",
      "rows": [
        {
          "feature": "Broad third-party integration marketplace",
          "statuses": {
            "attio": "available",
            "hubspot-crm": "available",
            "teamgate": "not-documented"
          },
          "note": "Attio connects to 50-plus tools; HubSpot's App Marketplace lists over 1,700 integrations."
        },
        {
          "feature": "Native iOS and Android mobile apps",
          "statuses": {
            "attio": "available",
            "hubspot-crm": "available",
            "teamgate": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Attio, HubSpot CRM, and Teamgate has a genuinely free plan for a whole team?",
      "answer": "HubSpot CRM, since its free tier has no seat limit at all. Attio's free plan is capped at 3 seats and Teamgate's free Starter plan is capped at 2 users and 500 contacts."
    },
    {
      "question": "What makes Attio different from HubSpot CRM and Teamgate?",
      "answer": "Attio is built as an AI-native CRM with real-time data sync, a flexible object data model, and configurable AI agents (Ask Attio, automation Workflows, Call Intelligence) that go beyond the more traditional pipeline-and-record approach used by HubSpot CRM and Teamgate."
    },
    {
      "question": "Is Teamgate cheaper than HubSpot or Attio once you need to pay?",
      "answer": "It depends on the tier compared. Teamgate's Team plan starts at 39.90 dollars per user per month. Attio's Plus plan starts around 29 euros per user per month billed annually. HubSpot's Starter tier begins lower, around 15 to 20 dollars per seat per month, but its Professional tier jumps to roughly 100 dollars per seat."
    },
    {
      "question": "Can I make or log calls directly from any of these CRMs?",
      "answer": "Teamgate includes in-app calling and SMS as a core feature. Attio offers Call Intelligence for recording and analyzing calls on its Pro tier rather than native dialing. HubSpot CRM's provided feature set does not document native in-app calling."
    },
    {
      "question": "Which CRM has the easiest path to add marketing or service automation later?",
      "answer": "HubSpot CRM, because it shares the same underlying data model as HubSpot's Marketing Hub, Sales Hub, and Service Hub, so upgrading does not require migrating existing contacts or deals."
    },
    {
      "question": "Do Attio, HubSpot CRM, and Teamgate all have mobile apps?",
      "answer": "Yes, all three offer native iOS and Android apps for managing contacts and deals on the go."
    }
  ]
};

export default attioVsHubspotCrmVsTeamgateContent;

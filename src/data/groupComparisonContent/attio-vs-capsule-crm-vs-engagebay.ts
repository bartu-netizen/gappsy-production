import type { GroupComparisonContent } from './types';

const attioVsCapsuleCrmVsEngagebayContent: GroupComparisonContent = {
  "verdict": "Attio pushes furthest on AI-native automation with configurable agents and real-time data sync, aimed at revenue teams comfortable with a newer, VC-backed tool. Capsule CRM stays intentionally simple, pairing Kanban pipelines with post-sale project boards for small businesses that want to set up a CRM in a day. EngageBay takes the widest scope, bundling marketing automation and helpdesk/live chat into the CRM as a lower-cost alternative to HubSpot's separate hubs. Each wins on a different axis: automation depth, simplicity, or breadth.",
  "bestFor": {
    "attio": "Sales and revenue operations teams that want an AI-native, highly automated CRM with real-time data sync and configurable AI agents, and are comfortable with a newer, VC-backed vendor.",
    "capsule-crm": "Small businesses and agencies that want a CRM they can set up in a day, with simple Kanban pipelines and project boards rather than heavy configuration.",
    "engagebay": "Small businesses that want marketing automation, sales pipelines, and a helpdesk/live chat module all in one affordable platform instead of paying for HubSpot's separate hubs."
  },
  "highlights": [
    {
      "title": "Breadth vs depth",
      "description": "EngageBay is the only one of the three that bundles marketing automation and a helpdesk/live chat module directly into the CRM, while Attio and Capsule CRM focus specifically on sales and contact management.",
      "toolSlugs": [
        "engagebay",
        "attio",
        "capsule-crm"
      ]
    },
    {
      "title": "AI automation depth",
      "description": "Attio's AI features go furthest, with configurable AI agents for research and lead scoring, natural-language search (Ask Attio), and automated Workflows and Sequences, versus Capsule's more targeted AI enrichment and summaries (Growth tier up) and EngageBay's AI writing assistance and predictive lead scoring.",
      "toolSlugs": [
        "attio",
        "capsule-crm",
        "engagebay"
      ]
    },
    {
      "title": "Free plan limits differ",
      "description": "EngageBay's free plan allows up to 250 contacts with basic CRM, helpdesk, and live chat included; Capsule's free plan caps out at 2 users and 250 contacts; Attio's free plan is seat-limited to 3 seats rather than contact-limited.",
      "toolSlugs": [
        "engagebay",
        "capsule-crm",
        "attio"
      ]
    },
    {
      "title": "Ease of setup",
      "description": "Capsule CRM is explicitly positioned as simple enough to set up without a dedicated CRM administrator, contrasting with Attio's more configurable, automation-heavy data model that rewards deeper setup investment.",
      "toolSlugs": [
        "capsule-crm",
        "attio"
      ]
    },
    {
      "title": "HubSpot alternative positioning",
      "description": "EngageBay is frequently marketed and reviewed as a direct, lower-cost HubSpot alternative, bundling marketing, sales, and service tools that HubSpot sells as separate paid hubs.",
      "toolSlugs": [
        "engagebay"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core CRM",
      "rows": [
        {
          "feature": "Contact and company management",
          "statuses": {
            "attio": "available",
            "capsule-crm": "available",
            "engagebay": "available"
          }
        },
        {
          "feature": "Sales pipeline (Kanban/deal stages)",
          "statuses": {
            "attio": "available",
            "capsule-crm": "available",
            "engagebay": "available"
          }
        },
        {
          "feature": "Free plan available",
          "statuses": {
            "attio": "available",
            "capsule-crm": "available",
            "engagebay": "available"
          },
          "note": "Attio: 3 seats. Capsule: 2 users, 250 contacts. EngageBay: 250 contacts."
        }
      ]
    },
    {
      "group": "Automation and AI",
      "rows": [
        {
          "feature": "AI-native agents and workflows",
          "statuses": {
            "attio": "available",
            "capsule-crm": "limited",
            "engagebay": "limited"
          },
          "note": "Capsule's AI Pipeline Generator and enrichment start at Growth tier; EngageBay's AI is limited to writing assistance and predictive lead scoring."
        },
        {
          "feature": "Automatic data enrichment",
          "statuses": {
            "attio": "available",
            "capsule-crm": "available",
            "engagebay": "not-documented"
          },
          "note": "Capsule's enrichment is available from the Growth tier up."
        }
      ]
    },
    {
      "group": "Beyond Sales",
      "rows": [
        {
          "feature": "Marketing automation (email, landing pages)",
          "statuses": {
            "attio": "unavailable",
            "capsule-crm": "limited",
            "engagebay": "available"
          },
          "note": "Capsule sells marketing capability as a separate paid add-on, Transpond."
        },
        {
          "feature": "Helpdesk / live chat",
          "statuses": {
            "attio": "unavailable",
            "capsule-crm": "unavailable",
            "engagebay": "available"
          }
        },
        {
          "feature": "Post-sale project/delivery boards",
          "statuses": {
            "attio": "unavailable",
            "capsule-crm": "available",
            "engagebay": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Attio, Capsule CRM, and EngageBay is easiest to set up?",
      "answer": "Capsule CRM is explicitly built to be usable within a day without a dedicated CRM administrator, making it the most approachable of the three for a small team with simple needs."
    },
    {
      "question": "Which has the most advanced AI?",
      "answer": "Attio goes furthest with configurable AI agents for research and lead scoring, natural-language search (Ask Attio), and automated Workflows and Sequences; Capsule and EngageBay offer more targeted AI features like enrichment, summaries, and AI-assisted writing."
    },
    {
      "question": "Which includes marketing and helpdesk tools, not just sales?",
      "answer": "EngageBay is the only one of the three built as an all-in-one platform bundling email marketing automation, landing pages, and a live chat/helpdesk module alongside its CRM and sales pipeline."
    },
    {
      "question": "Do all three have a free plan?",
      "answer": "Yes - Attio's free plan supports up to 3 seats, Capsule's supports 2 users and 250 contacts, and EngageBay's supports 250 contacts with basic CRM, helpdesk, and live chat included."
    },
    {
      "question": "Which is the best HubSpot alternative?",
      "answer": "EngageBay is the one most directly and frequently marketed as a lower-cost HubSpot alternative, bundling marketing, sales, and service tools that HubSpot sells as separate paid hubs."
    },
    {
      "question": "Which is best for a small agency managing client projects after a deal closes?",
      "answer": "Capsule CRM includes dedicated project boards for tracking delivery work post-sale, a feature neither Attio nor EngageBay documents."
    }
  ]
};

export default attioVsCapsuleCrmVsEngagebayContent;

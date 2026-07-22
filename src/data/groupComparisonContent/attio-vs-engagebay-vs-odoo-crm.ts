import type { GroupComparisonContent } from './types';

const attioVsEngagebayVsOdooCrmContent: GroupComparisonContent = {
  "verdict": "Attio, EngageBay, and Odoo CRM are all CRMs with usable free tiers, but they are built for different jobs: Attio is an AI-native CRM focused on flexible data modeling and automated go-to-market workflows for revenue teams, EngageBay bundles marketing automation, sales pipeline, and helpdesk tools into one HubSpot-style suite for small businesses, and Odoo CRM is the sales module of a much larger ERP, with quote-to-cash automation built in once a business adopts other Odoo apps. Fast-growing sales and marketing teams will likely prefer Attio or EngageBay, while businesses that want their CRM tied directly into invoicing, inventory, or a broader ERP will lean toward Odoo.",
  "bestFor": {
    "attio": "Revenue teams that want an AI-native CRM with flexible data modeling, real-time syncing, and configurable AI agents for research and automation.",
    "engagebay": "Small and growing businesses that want marketing automation, sales pipeline, and helpdesk tools combined in one affordable, HubSpot-style platform.",
    "odoo-crm": "Businesses that want their sales pipeline tied directly into quoting, invoicing, and inventory, especially those already using or planning to adopt other Odoo apps."
  },
  "highlights": [
    {
      "title": "The most AI-native of the three",
      "description": "Attio's Ask Attio natural-language search, configurable AI Agents, and Call Intelligence build automation and AI research directly into the CRM rather than layering it on as an add-on.",
      "toolSlugs": [
        "attio"
      ]
    },
    {
      "title": "Marketing, sales, and support in one affordable suite",
      "description": "EngageBay bundles email marketing automation, sales pipelines, live chat, and helpdesk ticketing under a single free plan for up to 250 contacts, positioning it as a lower-cost HubSpot alternative.",
      "toolSlugs": [
        "engagebay"
      ]
    },
    {
      "title": "The only one with native quote-to-cash",
      "description": "Odoo CRM can convert a closed opportunity straight into a quote, sales order, stock reservation, and invoice without leaving the record, a workflow that requires separate tools for Attio or EngageBay.",
      "toolSlugs": [
        "odoo-crm"
      ]
    },
    {
      "title": "Free plans differ sharply in structure",
      "description": "Attio's free plan caps out at 3 seats, EngageBay's caps out at 250 contacts, and Odoo CRM's One App Free plan allows unlimited users on the CRM app alone, reflecting three different growth ceilings before a business needs to pay.",
      "toolSlugs": [
        "attio",
        "engagebay",
        "odoo-crm"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Automation and AI",
      "rows": [
        {
          "feature": "AI-native agents and natural-language search",
          "statuses": {
            "attio": "available",
            "engagebay": "limited",
            "odoo-crm": "limited"
          },
          "note": "EngageBay and Odoo CRM both use AI for narrower tasks like email writing assistance or predictive lead scoring, rather than configurable AI agents."
        },
        {
          "feature": "Marketing automation workflows",
          "statuses": {
            "attio": "not-documented",
            "engagebay": "available",
            "odoo-crm": "limited"
          }
        },
        {
          "feature": "Built-in helpdesk or support ticketing",
          "statuses": {
            "attio": "unavailable",
            "engagebay": "available",
            "odoo-crm": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Deployment and Access",
      "rows": [
        {
          "feature": "Usable free plan",
          "statuses": {
            "attio": "available",
            "engagebay": "available",
            "odoo-crm": "available"
          }
        },
        {
          "feature": "Native iOS and Android apps",
          "statuses": {
            "attio": "not-documented",
            "engagebay": "available",
            "odoo-crm": "not-documented"
          }
        },
        {
          "feature": "Quote-to-cash and invoicing integration",
          "statuses": {
            "attio": "unavailable",
            "engagebay": "unavailable",
            "odoo-crm": "available"
          }
        },
        {
          "feature": "SSO for enterprise access control",
          "statuses": {
            "attio": "available",
            "engagebay": "available",
            "odoo-crm": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Attio, EngageBay, and Odoo CRM has the most generous free plan?",
      "answer": "Odoo CRM's One App Free plan allows unlimited users on the CRM app with no seat cap, while Attio's free plan caps at 3 seats and EngageBay's free plan caps at 250 contacts."
    },
    {
      "question": "Which CRM is the most AI-native?",
      "answer": "Attio is built around AI from the ground up, with natural-language search and record creation through Ask Attio, configurable AI Agents for research and lead scoring, and Call Intelligence for analyzing sales calls. EngageBay and Odoo CRM use AI more narrowly, for email writing assistance and predictive lead scoring respectively."
    },
    {
      "question": "Which tool includes marketing automation and a helpdesk?",
      "answer": "EngageBay bundles email marketing automation, live chat, and helpdesk ticketing alongside its CRM, even on the free plan. Attio does not document built-in helpdesk tools, and Odoo CRM's marketing automation trails dedicated marketing platforms."
    },
    {
      "question": "Can any of these CRMs generate invoices directly from a closed deal?",
      "answer": "Only Odoo CRM supports this natively, converting a won opportunity into a quote, sales order, stock reservation, and invoice without leaving the record, since it is part of the broader Odoo ERP suite."
    },
    {
      "question": "Do Attio, EngageBay, and Odoo CRM have native mobile apps?",
      "answer": "EngageBay documents native iOS and Android apps for managing contacts, deals, and support conversations. Native mobile app availability for Attio and Odoo CRM is not documented in the provided data."
    }
  ]
};

export default attioVsEngagebayVsOdooCrmContent;

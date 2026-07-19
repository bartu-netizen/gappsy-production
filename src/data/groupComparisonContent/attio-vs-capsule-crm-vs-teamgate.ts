import type { GroupComparisonContent } from './types';

const attioVsCapsuleCrmVsTeamgateContent: GroupComparisonContent = {
  "verdict": "Attio, Capsule CRM, and Teamgate all sell CRM software to small and mid-sized revenue teams with a usable free tier, but they lead with different strengths. Attio is the most AI-forward of the three, built around a flexible, real-time-synced data model with configurable AI agents, call intelligence, and outreach sequences, and it's backed by well-known investors like a16z. Capsule CRM leans into simplicity and native accounting integrations with Xero and QuickBooks, plus post-sale project boards, adding AI enrichment only from its Growth tier up. Teamgate keeps things pipeline-first with built-in calling and SMS baked into every paid tier, but doesn't document AI features at all. Teams that want automation-heavy, AI-native workflows should look at Attio, those that want a lightweight CRM tied to their accounting stack should consider Capsule, and teams that most value in-app calling without extra telephony add-ons may prefer Teamgate.",
  "bestFor": {
    "attio": "Sales and revenue operations teams that want an AI-native CRM with configurable agents, real-time data sync, and deep automation.",
    "capsule-crm": "Small businesses and agencies that want a simple CRM with native accounting integrations and post-sale project boards, addable AI enrichment as they grow.",
    "teamgate": "Small and mid-sized sales teams that want built-in calling and SMS plus straightforward pipeline management without a separate telephony tool."
  },
  "highlights": [
    {
      "title": "AI depth varies widely",
      "description": "Attio ships configurable AI agents, natural-language search via Ask Attio, and Call Intelligence across its paid tiers. Capsule adds AI enrichment and summaries starting at its Growth plan. Teamgate's provided feature set does not document any AI capabilities.",
      "toolSlugs": [
        "attio",
        "capsule-crm",
        "teamgate"
      ]
    },
    {
      "title": "Built-in calling only on Teamgate",
      "description": "Teamgate is the only one of the three with in-app calling and SMS included as a core feature across its paid tiers, while Attio and Capsule don't document native telephony in the same way.",
      "toolSlugs": [
        "teamgate"
      ]
    },
    {
      "title": "Every plan starts free",
      "description": "Attio, Capsule CRM, and Teamgate all offer a permanent free tier for small teams, though limits differ: Attio caps at 3 seats, Capsule at 2 users and 250 contacts, and Teamgate at 2 users and 500 contacts.",
      "toolSlugs": [
        "attio",
        "capsule-crm",
        "teamgate"
      ]
    },
    {
      "title": "Accounting integrations set Capsule apart",
      "description": "Capsule CRM natively integrates with Xero and QuickBooks for billing and accounting, an integration depth that Attio and Teamgate don't document in their feature sets.",
      "toolSlugs": [
        "capsule-crm"
      ]
    },
    {
      "title": "Enterprise security only on Attio",
      "description": "Attio's Enterprise plan adds SSO and SCIM for larger organizations; Capsule and Teamgate's provided plans don't document equivalent enterprise identity controls.",
      "toolSlugs": [
        "attio"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI agents and automation workflows",
          "statuses": {
            "attio": "available",
            "capsule-crm": "limited",
            "teamgate": "not-documented"
          },
          "note": "Capsule's AI features are available from its Growth plan up."
        },
        {
          "feature": "Automatic data enrichment",
          "statuses": {
            "attio": "available",
            "capsule-crm": "limited",
            "teamgate": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Sales Communication Tools",
      "rows": [
        {
          "feature": "In-app calling and SMS",
          "statuses": {
            "attio": "not-documented",
            "capsule-crm": "not-documented",
            "teamgate": "available"
          }
        },
        {
          "feature": "Call recording and intelligence",
          "statuses": {
            "attio": "available",
            "capsule-crm": "not-documented",
            "teamgate": "not-documented"
          },
          "note": "Attio's Call Intelligence is available on its Pro plan."
        }
      ]
    },
    {
      "group": "Plans and Enterprise Controls",
      "rows": [
        {
          "feature": "Permanent free plan",
          "statuses": {
            "attio": "available",
            "capsule-crm": "available",
            "teamgate": "available"
          }
        },
        {
          "feature": "Custom or flexible object modeling",
          "statuses": {
            "attio": "available",
            "capsule-crm": "limited",
            "teamgate": "not-documented"
          }
        },
        {
          "feature": "Enterprise SSO and SCIM",
          "statuses": {
            "attio": "available",
            "capsule-crm": "not-documented",
            "teamgate": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Attio, Capsule CRM, and Teamgate all have free plans?",
      "answer": "Yes. Attio's Free plan supports up to 3 seats, Capsule's Free plan supports 2 users and 250 contacts, and Teamgate's free Starter plan supports 2 users and 500 contacts."
    },
    {
      "question": "Which CRM has the most AI features?",
      "answer": "Attio is the most AI-forward of the three, with Ask Attio for natural-language search, configurable AI agents, Call Intelligence, and automation Workflows. Capsule adds AI enrichment and summaries from its Growth tier up. Teamgate's documented feature set does not include AI capabilities."
    },
    {
      "question": "Which of these includes built-in phone calling?",
      "answer": "Teamgate includes in-app calling and SMS across its paid tiers. Attio and Capsule CRM's provided feature data doesn't document native calling, though Attio does offer Call Intelligence for recording and analyzing calls on its Pro plan."
    },
    {
      "question": "Does any of these integrate with accounting software?",
      "answer": "Capsule CRM natively integrates with Xero and QuickBooks for billing and accounting. Attio integrates with Stripe. Teamgate's integrations are not detailed to the same accounting depth in the provided data."
    },
    {
      "question": "Which is best for a small business just starting out?",
      "answer": "Capsule CRM is built specifically for small and mid-sized businesses and is designed to be set up without a dedicated CRM administrator. Teamgate offers a similarly simple free Starter tier. Attio's flexible data model has more depth but may take longer to configure for a very small team."
    },
    {
      "question": "How does enterprise-tier security compare?",
      "answer": "Attio's Enterprise plan adds SSO and SCIM alongside unlimited objects and teams. Capsule CRM and Teamgate's provided plans do not document equivalent single sign-on or SCIM provisioning options."
    }
  ]
};

export default attioVsCapsuleCrmVsTeamgateContent;

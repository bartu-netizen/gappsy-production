import type { GroupComparisonContent } from './types';

const capsuleCrmVsEngagebayVsHubspotCrmContent: GroupComparisonContent = {
  "verdict": "Capsule CRM, EngageBay, and HubSpot CRM all give small businesses a usable free tier, but their scope differs. Capsule stays narrowly focused on contacts, sales pipelines, and post-sale project boards. EngageBay bundles marketing automation, sales, and helpdesk ticketing around the CRM at a fraction of HubSpot's cost. HubSpot CRM is free for unlimited users with the deepest ecosystem and a seamless upgrade path, but its paid Hubs get expensive quickly once seats and advanced automation are added.",
  "bestFor": {
    "capsule-crm": "Small teams that want a simple, focused sales CRM with project tracking, without marketing or support bloat",
    "engagebay": "Growing businesses that want marketing automation, sales, and helpdesk tools in one affordable platform",
    "hubspot-crm": "Businesses that want a genuinely free, unlimited-user CRM with the option to add Marketing, Sales, or Service Hub later without migrating data"
  },
  "highlights": [
    {
      "title": "HubSpot's free tier has no user cap",
      "description": "HubSpot CRM's Free plan supports unlimited users, while Capsule's free plan caps at 2 users and 250 contacts, and EngageBay's free plan caps at 250 contacts.",
      "toolSlugs": [
        "hubspot-crm",
        "capsule-crm",
        "engagebay"
      ]
    },
    {
      "title": "EngageBay bundles marketing, sales, and support at a lower price",
      "description": "EngageBay combines email marketing automation, sales pipelines, and helpdesk ticketing with live chat in one platform, undercutting HubSpot's per-seat cost for equivalent functionality.",
      "toolSlugs": [
        "engagebay"
      ]
    },
    {
      "title": "Capsule's AI tools arrive at the Growth tier",
      "description": "Capsule's AI-powered contact and business enrichment, record summaries, and beta meeting-prep tool become available starting on its Growth plan, alongside multiple pipelines and project boards.",
      "toolSlugs": [
        "capsule-crm"
      ]
    },
    {
      "title": "HubSpot's upgrade path requires no data migration",
      "description": "Businesses that outgrow HubSpot's free CRM can add Marketing, Sales, or Service Hub without migrating existing CRM data, a continuity advantage neither Capsule nor EngageBay documents in the same way.",
      "toolSlugs": [
        "hubspot-crm"
      ]
    },
    {
      "title": "EngageBay includes helpdesk and live chat even on lower tiers",
      "description": "EngageBay's live chat widget and ticketing system are included starting on its free plan, while Capsule has no built-in helpdesk and instead relies on a separate paid marketing add-on (Transpond) for adjacent functionality.",
      "toolSlugs": [
        "engagebay",
        "capsule-crm"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Access and Free Tier",
      "rows": [
        {
          "feature": "Free plan with no user cap",
          "statuses": {
            "capsule-crm": "limited",
            "engagebay": "limited",
            "hubspot-crm": "available"
          },
          "note": "Capsule's free plan caps at 2 users and 250 contacts; EngageBay's free plan caps at 250 contacts."
        }
      ]
    },
    {
      "group": "Marketing and Support",
      "rows": [
        {
          "feature": "Marketing automation",
          "statuses": {
            "capsule-crm": "unavailable",
            "engagebay": "available",
            "hubspot-crm": "limited"
          },
          "note": "Capsule's marketing tools live in a separate paid product (Transpond); HubSpot's free tier has limited automation, expanded through the paid Marketing Hub."
        },
        {
          "feature": "Helpdesk and live chat",
          "statuses": {
            "capsule-crm": "unavailable",
            "engagebay": "available",
            "hubspot-crm": "available"
          }
        }
      ]
    },
    {
      "group": "Mobile and AI",
      "rows": [
        {
          "feature": "Native mobile apps",
          "statuses": {
            "capsule-crm": "not-documented",
            "engagebay": "available",
            "hubspot-crm": "available"
          }
        },
        {
          "feature": "AI-assisted features",
          "statuses": {
            "capsule-crm": "available",
            "engagebay": "available",
            "hubspot-crm": "not-documented"
          },
          "note": "Capsule offers AI enrichment, summaries, and meeting prep from its Growth tier; EngageBay offers AI email writing and predictive lead scoring."
        }
      ]
    },
    {
      "group": "Developer and Enterprise",
      "rows": [
        {
          "feature": "REST API access",
          "statuses": {
            "capsule-crm": "available",
            "engagebay": "limited",
            "hubspot-crm": "not-documented"
          },
          "note": "EngageBay's API call allowance is documented specifically on its top Pro tier."
        },
        {
          "feature": "Single sign-on",
          "statuses": {
            "capsule-crm": "not-documented",
            "engagebay": "available",
            "hubspot-crm": "not-documented"
          },
          "note": "EngageBay's Pro plan documents SSO explicitly."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of the three has the most generous free plan?",
      "answer": "HubSpot CRM, since its Free plan has no user cap, while Capsule's free tier is limited to 2 users and 250 contacts and EngageBay's free tier caps at 250 contacts."
    },
    {
      "question": "Which one includes helpdesk or support tools out of the box?",
      "answer": "EngageBay includes live chat and ticketing starting on its free plan, and HubSpot CRM's free tier includes live chat as well. Capsule CRM has no built-in helpdesk."
    },
    {
      "question": "Does Capsule CRM include marketing automation?",
      "answer": "No. Capsule's marketing capabilities live in a separate paid product called Transpond rather than being built into the core CRM."
    },
    {
      "question": "Which is the more affordable option for a small, growing team?",
      "answer": "Based on published pricing, EngageBay bundles marketing, sales, and support at a lower cost per user than adding equivalent paid HubSpot Hubs."
    },
    {
      "question": "Which of the three has AI-powered features?",
      "answer": "Capsule (AI enrichment, summaries, and meeting prep from the Growth tier) and EngageBay (AI email writing and predictive lead scoring). AI features are not documented for HubSpot CRM in this comparison."
    }
  ]
};

export default capsuleCrmVsEngagebayVsHubspotCrmContent;

import type { GroupComparisonContent } from './types';

const capsuleCrmVsEngagebayVsTeamgateContent: GroupComparisonContent = {
  "verdict": "Capsule CRM, EngageBay, and Teamgate all target small and mid-sized sales teams that find enterprise CRMs like Salesforce too heavy, but each has a different center of gravity. Capsule CRM pairs simple pipelines with post-sale project boards for teams that also need to manage delivery work. EngageBay goes broadest, bundling marketing automation and a helpdesk alongside its CRM at a low price point. Teamgate stays narrowly focused on the sales process itself, with in-app calling, SMS, and sales analytics dashboards built for pipeline visibility rather than marketing or support.",
  "bestFor": {
    "capsule-crm": "Small businesses and agencies that want a simple CRM with post-sale project boards to manage delivery work after a deal closes.",
    "engagebay": "Small businesses that want marketing automation, sales CRM, and a helpdesk bundled together at a low price point.",
    "teamgate": "Sales-led startups and SMBs that want strong pipeline visibility, in-app calling and SMS, and sales analytics without a lengthy implementation."
  },
  "highlights": [
    {
      "title": "Post-sale delivery tracking",
      "description": "Capsule CRM's project boards let a team manage the work that happens after a deal is won, a capability not documented for either EngageBay or Teamgate.",
      "toolSlugs": [
        "capsule-crm"
      ]
    },
    {
      "title": "All-in-one marketing, sales, and support",
      "description": "EngageBay bundles email marketing, landing pages, and a helpdesk alongside its sales CRM, going broader than the sales-only focus of Capsule CRM and Teamgate.",
      "toolSlugs": [
        "engagebay"
      ]
    },
    {
      "title": "Built for the sales call itself",
      "description": "Teamgate includes in-app calling and SMS directly in the CRM, paired with sales analytics dashboards, a combination purpose-built for outbound sales teams rather than marketing-led ones.",
      "toolSlugs": [
        "teamgate"
      ]
    },
    {
      "title": "Free plans cap different things",
      "description": "Capsule CRM's free plan caps at 2 users and 250 contacts, EngageBay's caps at 250 contacts with no explicit user cap in the provided data, and Teamgate's caps at 2 users and 500 contacts.",
      "toolSlugs": [
        "capsule-crm",
        "engagebay",
        "teamgate"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Plan and Core Pipeline",
      "rows": [
        {
          "feature": "Usable free plan",
          "statuses": {
            "capsule-crm": "available",
            "engagebay": "available",
            "teamgate": "available"
          }
        },
        {
          "feature": "Native email and calendar sync",
          "statuses": {
            "capsule-crm": "available",
            "engagebay": "not-documented",
            "teamgate": "available"
          }
        }
      ]
    },
    {
      "group": "Communication and Support Tools",
      "rows": [
        {
          "feature": "In-app calling and SMS",
          "statuses": {
            "capsule-crm": "not-documented",
            "engagebay": "limited",
            "teamgate": "available"
          },
          "note": "EngageBay offers SMS marketing campaigns but not in-app calling; Teamgate offers both calling and SMS."
        },
        {
          "feature": "Built-in helpdesk or live chat",
          "statuses": {
            "capsule-crm": "not-documented",
            "engagebay": "available",
            "teamgate": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Analytics and Growth Tools",
      "rows": [
        {
          "feature": "Post-sale project or task boards",
          "statuses": {
            "capsule-crm": "available",
            "engagebay": "not-documented",
            "teamgate": "not-documented"
          }
        },
        {
          "feature": "Sales analytics dashboards",
          "statuses": {
            "capsule-crm": "available",
            "engagebay": "limited",
            "teamgate": "available"
          },
          "note": "Capsule's advanced sales reporting begins at its Growth tier; EngageBay's Pro tier adds web and proposal analytics rather than dedicated pipeline dashboards."
        },
        {
          "feature": "AI-assisted enrichment or summaries",
          "statuses": {
            "capsule-crm": "available",
            "engagebay": "available",
            "teamgate": "not-documented"
          },
          "note": "Capsule's AI features begin at its Growth tier."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Capsule CRM, EngageBay, and Teamgate is best for teams that need marketing tools too?",
      "answer": "EngageBay is the clear choice, bundling email marketing, landing pages, and web pop-ups alongside its sales CRM and helpdesk, whereas Capsule CRM and Teamgate focus specifically on sales pipeline management."
    },
    {
      "question": "Which tool includes in-app calling and SMS?",
      "answer": "Teamgate includes both in-app calling and SMS directly in its paid tiers. EngageBay offers SMS marketing campaigns but not in-app calling, and Capsule CRM does not document either feature."
    },
    {
      "question": "Which CRM helps manage work after a deal closes?",
      "answer": "Capsule CRM includes project boards specifically for tracking post-sale delivery work, a feature not documented for EngageBay or Teamgate."
    },
    {
      "question": "Which has the most generous free plan?",
      "answer": "All three offer a usable free plan: Capsule CRM allows 2 users and 250 contacts, EngageBay allows up to 250 contacts, and Teamgate allows 2 users and 500 contacts."
    },
    {
      "question": "Which is best for a small business that wants a built-in helpdesk?",
      "answer": "EngageBay includes live chat and helpdesk ticketing even on its free plan, a capability not documented for Capsule CRM or Teamgate."
    },
    {
      "question": "Which tool offers the strongest sales pipeline analytics?",
      "answer": "Teamgate and Capsule CRM both offer dedicated sales analytics dashboards, with Capsule's advanced reporting starting at its Growth tier. EngageBay's analytics are more focused on web and proposal tracking than pipeline performance."
    }
  ]
};

export default capsuleCrmVsEngagebayVsTeamgateContent;

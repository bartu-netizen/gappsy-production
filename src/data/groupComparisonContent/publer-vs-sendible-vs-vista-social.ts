import type { GroupComparisonContent } from './types';

const publerVsSendibleVsVistaSocialContent: GroupComparisonContent = {
  "verdict": "Publer, Sendible, and Vista Social all schedule and publish across multiple social networks, but they target different budgets and workflows. Publer is the lowest-cost bootstrapped option with a genuine free plan and AI-assisted captions, Sendible is built for agencies that need white-label client reporting and approval workflows and is willing to pay a steep price at its top tiers, and Vista Social bundles publishing with social listening, review management, DM automation, and employee advocacy in a mid-priced, AI-powered package with no permanent free tier. The choice largely comes down to budget stage and how much engagement and reputation management functionality a team needs beyond scheduling.",
  "bestFor": {
    "publer": "Budget-conscious freelancers and small teams that want a strong free plan plus AI-assisted captions and Canva integration.",
    "sendible": "Agencies that need white-label client reporting and content approval workflows across many client accounts and can absorb premium pricing at scale.",
    "vista-social": "Teams that want a broader all-in-one platform combining social listening, review management, and DM automation with AI assistance at mid-tier pricing."
  },
  "highlights": [
    {
      "title": "Only Publer has a permanent free plan",
      "description": "Publer's free plan supports 3 social accounts, 10 pending scheduled posts per account, and 25 saved drafts, while Sendible and Vista Social both start at paid tiers with no free option.",
      "toolSlugs": [
        "publer",
        "sendible",
        "vista-social"
      ]
    },
    {
      "title": "Agency-grade white-label reporting",
      "description": "Sendible's white-label and automated performance reports are built specifically for agencies presenting results to clients, and Vista Social offers a comparable white-label setup starting on its Scale plan.",
      "toolSlugs": [
        "sendible",
        "vista-social"
      ]
    },
    {
      "title": "Reputation and engagement management",
      "description": "Vista Social bundles review management, social listening, and DM automation into every plan, functionality that goes beyond pure scheduling and that the provided data does not describe for Publer or Sendible.",
      "toolSlugs": [
        "vista-social"
      ]
    },
    {
      "title": "Pricing spreads widely at the top end",
      "description": "Sendible's Enterprise tier reaches $750 to $891 per month, well above Vista Social's Scale plan at $349 per month and Publer's custom-priced Enterprise tier for unlimited users and accounts.",
      "toolSlugs": [
        "sendible",
        "vista-social",
        "publer"
      ]
    },
    {
      "title": "AI features on two of the three",
      "description": "Publer's AI Assist drafts captions and hashtags, and Vista Social's AI Assistant and AI Knowledge generate content and answer performance questions using monthly AI credits; the provided Sendible data does not describe comparable AI features.",
      "toolSlugs": [
        "publer",
        "vista-social"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Publishing and scheduling",
      "rows": [
        {
          "feature": "Multi-network scheduling",
          "statuses": {
            "publer": "available",
            "sendible": "available",
            "vista-social": "available"
          }
        },
        {
          "feature": "Permanently free plan",
          "statuses": {
            "publer": "available",
            "sendible": "unavailable",
            "vista-social": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Engagement and listening",
      "rows": [
        {
          "feature": "Unified inbox for comments and messages",
          "statuses": {
            "publer": "not-documented",
            "sendible": "available",
            "vista-social": "available"
          }
        },
        {
          "feature": "Social listening",
          "statuses": {
            "publer": "not-documented",
            "sendible": "not-documented",
            "vista-social": "available"
          }
        },
        {
          "feature": "Review management",
          "statuses": {
            "publer": "not-documented",
            "sendible": "not-documented",
            "vista-social": "available"
          }
        }
      ]
    },
    {
      "group": "Reporting and agency tools",
      "rows": [
        {
          "feature": "White-label client reporting",
          "statuses": {
            "publer": "not-documented",
            "sendible": "available",
            "vista-social": "available"
          },
          "note": "Vista Social's white-label setup is gated to the Scale plan and above."
        },
        {
          "feature": "AI content assistance",
          "statuses": {
            "publer": "available",
            "sendible": "not-documented",
            "vista-social": "available"
          }
        },
        {
          "feature": "Content approval workflows",
          "statuses": {
            "publer": "not-documented",
            "sendible": "available",
            "vista-social": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Publer have a free plan like the others?",
      "answer": "Publer is the only one of the three with a permanently free plan, covering 3 social accounts excluding X, 10 pending scheduled posts per account, and 25 saved drafts. Sendible and Vista Social both require a paid subscription from the start."
    },
    {
      "question": "Which tool includes review management for places like Google Business Profile listings?",
      "answer": "Vista Social includes review management as a core feature across its plans, functionality the provided data does not describe for Publer or Sendible."
    },
    {
      "question": "Is Sendible's higher pricing worth it for a growing agency?",
      "answer": "Sendible's Advanced and Enterprise tiers, ranging up to roughly $891 per month, are built around white-label reporting and content approval workflows specifically for agencies managing many client accounts, which can justify the cost for agencies that need those features, though it is notably pricier at scale than Publer or Vista Social."
    },
    {
      "question": "Do any of these three include social listening?",
      "answer": "Vista Social is the only one of the three where the provided feature data describes dedicated social listening, tracking brand mentions and keywords across platforms in real time."
    },
    {
      "question": "Which is the cheapest option for a solo freelancer just starting out?",
      "answer": "Publer is the cheapest entry point, with a usable free plan and a Professional tier starting at $12 per month, compared to Sendible's Creator plan at $29 per month and Vista Social's Professional plan at $79 per month."
    }
  ]
};

export default publerVsSendibleVsVistaSocialContent;

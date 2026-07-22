import type { GroupComparisonContent } from './types';

const iconosquareVsSendibleVsVistaSocialContent: GroupComparisonContent = {
  "verdict": "Iconosquare, Sendible and Vista Social all cover multi-network scheduling for agencies and marketing teams, but they diverge on scope and pricing structure: Iconosquare pairs a genuine free plan with deep analytics, Sendible bundles bulk scheduling, evergreen content recycling and white-label reporting for agencies at a steep price ceiling, and Vista Social bundles publishing, social listening, review management and employee advocacy into one subscription with no free tier. Which one wins depends on whether you need a free entry point, agency-grade recycling and reporting, or the broadest all-in-one feature bundle.",
  "bestFor": {
    "iconosquare": "Teams and creators who want to start on a genuinely free plan and prioritize deep analytics and competitor benchmarking over an all-in-one feature bundle.",
    "sendible": "Agencies handling many client profiles across mainstream and newer networks, including Threads and Bluesky, that need bulk content import, evergreen content recycling through Smart Queues, and white-label client reporting.",
    "vista-social": "Businesses that want publishing, social listening, review management, DM automation and employee advocacy bundled under one subscription without piecing together separate tools, and do not need a permanently free tier."
  },
  "highlights": [
    {
      "title": "Only Iconosquare has a permanently free plan",
      "description": "Iconosquare offers a genuinely free tier (2 social profiles, 10 scheduled posts per profile per month). Sendible starts at $29 per month with no free option, and Vista Social explicitly has no permanently free tier.",
      "toolSlugs": [
        "iconosquare",
        "sendible",
        "vista-social"
      ]
    },
    {
      "title": "Sendible automates evergreen content recycling",
      "description": "Sendible's Smart Queues automatically recycle evergreen content on a recurring schedule, a capability the provided data does not document for Iconosquare or Vista Social.",
      "toolSlugs": [
        "sendible"
      ]
    },
    {
      "title": "Vista Social bundles review management into the same dashboard",
      "description": "Vista Social is the only one of the three that includes review management, including Google Business Profile listings, alongside its scheduling and engagement tools.",
      "toolSlugs": [
        "vista-social"
      ]
    },
    {
      "title": "Enterprise pricing gaps are wide",
      "description": "Sendible's Enterprise tier can reach $750 to $891 per month, well above Vista Social's top published Scale tier ($349 per month) and Iconosquare's Excel tier (EUR 116 per month).",
      "toolSlugs": [
        "sendible",
        "vista-social",
        "iconosquare"
      ]
    },
    {
      "title": "AI content assistance splits two ways",
      "description": "Iconosquare and Vista Social both document AI-assisted content tools, AI caption writing and an AI Assistant with monthly credits respectively, while Sendible's provided feature set does not mention AI writing assistance.",
      "toolSlugs": [
        "iconosquare",
        "vista-social",
        "sendible"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Scheduling and content creation",
      "rows": [
        {
          "feature": "Evergreen content recycling",
          "statuses": {
            "iconosquare": "not-documented",
            "sendible": "available",
            "vista-social": "not-documented"
          },
          "note": "Sendible's Smart Queues automate recurring reposting of evergreen content."
        },
        {
          "feature": "AI-assisted content or caption creation",
          "statuses": {
            "iconosquare": "available",
            "sendible": "not-documented",
            "vista-social": "available"
          }
        }
      ]
    },
    {
      "group": "Engagement and monitoring",
      "rows": [
        {
          "feature": "Unified inbox for comments and direct messages",
          "statuses": {
            "iconosquare": "available",
            "sendible": "available",
            "vista-social": "available"
          }
        },
        {
          "feature": "Social listening or brand mention tracking",
          "statuses": {
            "iconosquare": "limited",
            "sendible": "not-documented",
            "vista-social": "available"
          },
          "note": "Iconosquare tracks hashtags and mentions but is not framed as a full social-listening product the way Vista Social is."
        },
        {
          "feature": "Review management (e.g. Google Business Profile)",
          "statuses": {
            "iconosquare": "not-documented",
            "sendible": "not-documented",
            "vista-social": "available"
          }
        }
      ]
    },
    {
      "group": "Reporting and pricing access",
      "rows": [
        {
          "feature": "White-label client reporting",
          "statuses": {
            "iconosquare": "available",
            "sendible": "available",
            "vista-social": "limited"
          },
          "note": "Vista Social's white-labeling is gated to its higher-priced tiers rather than included broadly."
        },
        {
          "feature": "Permanently free plan",
          "statuses": {
            "iconosquare": "available",
            "sendible": "unavailable",
            "vista-social": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three has a free plan?",
      "answer": "Only Iconosquare offers a genuinely free tier (2 profiles, 10 scheduled posts each). Sendible starts at $29 per month with no free option, and Vista Social has no permanently free tier."
    },
    {
      "question": "Which is best for managing online reviews alongside social posts?",
      "answer": "Vista Social, which includes review management, including Google Business Profile, as part of its core feature set."
    },
    {
      "question": "Which tool automatically recycles evergreen content?",
      "answer": "Sendible's Smart Queues are built specifically to automatically recycle evergreen posts on a recurring schedule."
    },
    {
      "question": "How much do these cost at the high end for large agencies?",
      "answer": "Sendible's Enterprise tier can reach $750 to $891 per month, notably higher than Vista Social's top published Scale tier at $349 per month or Iconosquare's Excel tier at EUR 116 per month."
    },
    {
      "question": "Which platforms do these tools cover?",
      "answer": "All three cover the major networks (Instagram, Facebook, LinkedIn, X, TikTok), but Sendible additionally documents support for Threads and Bluesky, and Vista Social documents support for Reddit, Snapchat and Threads."
    },
    {
      "question": "Do any of these include AI writing assistance?",
      "answer": "Iconosquare and Vista Social both document AI-assisted content tools, AI caption writing and an AI Assistant with monthly credits respectively. Sendible's provided feature set does not mention AI writing assistance."
    }
  ]
};

export default iconosquareVsSendibleVsVistaSocialContent;

import type { GroupComparisonContent } from './types';

const iconosquareVsPublerVsZohoSocialContent: GroupComparisonContent = {
  "verdict": "Iconosquare, Publer and Zoho Social all schedule and analyze social content for small teams and agencies, but they optimize for different priorities: Iconosquare leads on analytics depth and white-label client reporting, Publer leads on price-to-feature value with a genuinely usable free plan, and Zoho Social leads on predictive scheduling and native CRM and helpdesk integration for agencies managing multiple client brands. No single one is best across the board; the right choice depends on whether reporting, affordability, or ecosystem tie-in matters most.",
  "bestFor": {
    "iconosquare": "Agencies and marketing teams whose main need is deep, granular analytics and competitor or hashtag benchmarking, plus polished white-label PDF or PowerPoint reports for client-facing reviews.",
    "publer": "Individual creators, small businesses and lean teams who want an affordable, full-featured scheduler with AI captions and a Canva integration built in, without paying agency-level prices.",
    "zoho-social": "Businesses already inside the Zoho ecosystem, or agencies managing several client brands, that want SmartQ predictive scheduling and native CRM or helpdesk integration tying social activity to sales and support."
  },
  "highlights": [
    {
      "title": "Iconosquare leads on analytics and agency reporting",
      "description": "Iconosquare tracks over 100 real-time metrics and offers dedicated white-label PDF and PowerPoint reporting on its Excel plan, reflecting its origins as an Instagram-analytics tool before it grew into full scheduling and publishing.",
      "toolSlugs": [
        "iconosquare"
      ]
    },
    {
      "title": "Publer has the strongest price-to-feature ratio",
      "description": "Publer's Professional plan starts at $12 per month for 3 accounts and already includes AI caption assistance and a Canva integration, undercutting Iconosquare's Launch plan (EUR 33 per month) and Zoho Social's Standard plan (about $15 per month).",
      "toolSlugs": [
        "publer"
      ]
    },
    {
      "title": "Only Zoho Social ties social activity to CRM and helpdesk data",
      "description": "Zoho Social natively connects to Zoho CRM and Zoho Desk, letting teams link social mentions and messages to leads and support tickets, a capability neither Iconosquare nor Publer documents.",
      "toolSlugs": [
        "zoho-social"
      ]
    },
    {
      "title": "Free plans all exist but cap different things",
      "description": "Iconosquare's free plan covers 2 social profiles, Publer's covers 3 accounts (excluding X), and Zoho Social's covers 1 brand across 6 channels, so the right free plan depends on how many accounts and channels you need to cover.",
      "toolSlugs": [
        "iconosquare",
        "publer",
        "zoho-social"
      ]
    },
    {
      "title": "Zoho Social has by far the highest ceiling price",
      "description": "Zoho Social's Agency Plus tier runs about $460 per month for agencies managing 20 brands, well above Iconosquare's top published Excel tier (EUR 116 per month) and Publer's Business tier ($21 per month baseline).",
      "toolSlugs": [
        "zoho-social",
        "iconosquare",
        "publer"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Scheduling and content creation",
      "rows": [
        {
          "feature": "Multi-platform scheduling and publishing",
          "statuses": {
            "iconosquare": "available",
            "publer": "available",
            "zoho-social": "available"
          }
        },
        {
          "feature": "AI-assisted caption writing",
          "statuses": {
            "iconosquare": "available",
            "publer": "available",
            "zoho-social": "not-documented"
          },
          "note": "Zoho Social's SmartQ feature addresses posting timing, not caption generation, in the provided data."
        }
      ]
    },
    {
      "group": "Analytics, timing and benchmarking",
      "rows": [
        {
          "feature": "AI-recommended best time to post",
          "statuses": {
            "iconosquare": "not-documented",
            "publer": "available",
            "zoho-social": "available"
          },
          "note": "Zoho Social's SmartQ and Publer's paid-tier recommendations both target optimal posting times; the data does not document an equivalent for Iconosquare."
        },
        {
          "feature": "Competitor benchmarking",
          "statuses": {
            "iconosquare": "available",
            "publer": "available",
            "zoho-social": "not-documented"
          }
        },
        {
          "feature": "Social listening or mention and hashtag tracking",
          "statuses": {
            "iconosquare": "available",
            "publer": "not-documented",
            "zoho-social": "available"
          }
        }
      ]
    },
    {
      "group": "Reporting, agency and CRM tools",
      "rows": [
        {
          "feature": "White-label or branded client reporting",
          "statuses": {
            "iconosquare": "available",
            "publer": "not-documented",
            "zoho-social": "available"
          },
          "note": "Available on Iconosquare's Excel plan and Zoho Social's Agency tiers."
        },
        {
          "feature": "Native CRM or helpdesk integration",
          "statuses": {
            "iconosquare": "not-documented",
            "publer": "not-documented",
            "zoho-social": "available"
          },
          "note": "Zoho Social connects natively to Zoho CRM and Zoho Desk."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of the three has the strongest analytics and reporting?",
      "answer": "Iconosquare, given its Instagram-analytics heritage tracking over 100 metrics and its dedicated white-label PDF and PowerPoint reporting."
    },
    {
      "question": "Which is cheapest for a small team just starting out?",
      "answer": "Publer, whose Professional plan starts at $12 per month for 3 accounts, undercutting Iconosquare's Launch plan (EUR 33 per month) and Zoho Social's Standard plan (about $15 per month), while its free plan also covers 3 accounts."
    },
    {
      "question": "Does any of these tie social activity to CRM or sales data?",
      "answer": "Only Zoho Social, through native integration with Zoho CRM and Zoho Desk."
    },
    {
      "question": "Which is built specifically for agencies managing multiple client brands?",
      "answer": "Zoho Social's Agency and Agency Plus tiers add client portals and branded logins, and Iconosquare's Excel tier adds white-label reporting with a dedicated account manager. Publer's provided data does not document a comparable multi-brand client portal."
    },
    {
      "question": "Do all three offer a genuine free plan?",
      "answer": "Yes. Iconosquare's free plan covers 2 profiles, Publer's covers 3 accounts (excluding X), and Zoho Social's covers 1 brand with 6 channels."
    },
    {
      "question": "Which of the three includes AI-assisted caption writing?",
      "answer": "Iconosquare and Publer both include AI caption writing; the provided data does not document an equivalent AI caption feature for Zoho Social."
    }
  ]
};

export default iconosquareVsPublerVsZohoSocialContent;

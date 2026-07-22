import type { GroupComparisonContent } from './types';

const circleVsDiscipleVsDiscourseContent: GroupComparisonContent = {
  "verdict": "Circle, Disciple, and Discourse take three distinct approaches to community software: Circle bundles community, courses, memberships, events, and payments into one branded product; Disciple focuses specifically on giving brands a fully independent, app-store-listed native app with zero platform transaction fees; and Discourse is the only one of the three that is open source and free to self-host. Pricing reflects that split, with Discourse startable for free, Circle starting at $89/month, and Disciple starting at $399/month. Which one is 'best' depends heavily on whether you value an owned native mobile app, a free self-hosted deployment, or the broadest all-in-one monetization toolkit.",
  "bestFor": {
    "circle": "Creators, educators, and brands who want to consolidate discussion spaces, courses, memberships, live events, and payments into one branded web and mobile experience without managing separate tools.",
    "disciple": "Brands and coaching businesses that want a fully independent, white-labeled app-store-listed iOS and Android app with 0% transaction fees on member and course revenue from day one.",
    "discourse": "Open-source projects, developer or product-support communities, and technically capable teams that want full control of their data through free self-hosting or a lower-cost hosted forum."
  },
  "highlights": [
    {
      "title": "Discourse is the only free, open-source option",
      "description": "Discourse can be self-hosted for free using Docker with no licensing fee, a deployment model neither Circle nor Disciple offers - both are subscription-only products with no permanent free tier.",
      "toolSlugs": [
        "discourse"
      ]
    },
    {
      "title": "Disciple bakes a branded native app and 0% fees into its entry tier",
      "description": "Every Disciple plan, starting at the entry Branded App tier, includes an app-store-listed iOS and Android app under the customer's own brand plus a 0% transaction fee policy on member and course revenue, features Circle only offers as a separate custom-priced add-on.",
      "toolSlugs": [
        "disciple"
      ]
    },
    {
      "title": "Circle offers the broadest all-in-one monetization suite at a lower entry price",
      "description": "Circle combines community spaces, courses, memberships, live events, and native payments starting at $89/month, well below Disciple's $399/month entry price, and is actively adding AI features like Co-Pilot and AI Agents.",
      "toolSlugs": [
        "circle"
      ]
    },
    {
      "title": "All three gate automation and API access behind higher tiers",
      "description": "Circle requires its Business tier for automation and API access, Disciple requires its Pro tier for API access, and Discourse requires its Pro hosted tier ($100/month) for API and webhook access - none include this on their absolute lowest offering.",
      "toolSlugs": [
        "circle",
        "disciple",
        "discourse"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Branding and mobile experience",
      "rows": [
        {
          "feature": "Native branded mobile app (iOS and Android)",
          "statuses": {
            "circle": "limited",
            "disciple": "available",
            "discourse": "not-documented"
          },
          "note": "Circle offers a branded app only through its separate, custom-priced Plus Branded App tier; Disciple includes it from its entry plan."
        },
        {
          "feature": "Live events and livestreaming",
          "statuses": {
            "circle": "available",
            "disciple": "available",
            "discourse": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Monetization",
      "rows": [
        {
          "feature": "Native paid courses",
          "statuses": {
            "circle": "available",
            "disciple": "limited",
            "discourse": "not-documented"
          },
          "note": "Disciple's entry tier includes only one non-monetizable course; monetizable courses require the Plus tier or above."
        },
        {
          "feature": "0% platform transaction fee policy",
          "statuses": {
            "circle": "not-documented",
            "disciple": "available",
            "discourse": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Extensibility",
      "rows": [
        {
          "feature": "AI-powered features (assistants, summarization, agents)",
          "statuses": {
            "circle": "available",
            "disciple": "not-documented",
            "discourse": "available"
          },
          "note": "Circle offers AI Agents and Co-Pilot; Discourse AI adds summarization, sentiment analysis, and moderation."
        },
        {
          "feature": "API access",
          "statuses": {
            "circle": "limited",
            "disciple": "limited",
            "discourse": "available"
          },
          "note": "Available on Circle's Business tier and above, Disciple's Pro tier and above, and Discourse's Pro hosted tier and above."
        },
        {
          "feature": "Automation and workflow tools",
          "statuses": {
            "circle": "limited",
            "disciple": "not-documented",
            "discourse": "available"
          }
        }
      ]
    },
    {
      "group": "Deployment and pricing model",
      "rows": [
        {
          "feature": "Free or open-source self-hosting option",
          "statuses": {
            "circle": "unavailable",
            "disciple": "unavailable",
            "discourse": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three can I self-host for free?",
      "answer": "Only Discourse can be self-hosted for free, using its officially supported Docker deployment. Circle and Disciple are both subscription-only products with no self-hosted or permanent free option."
    },
    {
      "question": "Which platform includes a branded native mobile app on its cheapest plan?",
      "answer": "Disciple includes a fully white-labeled, app-store-listed iOS and Android app starting on its entry Branded App plan. Circle only offers a branded native app through its separate, custom-priced Plus Branded App tier."
    },
    {
      "question": "Is there a genuinely free plan on any of these?",
      "answer": "Discourse offers both a free self-hosted option and a free hosted tier with limited resources. Circle and Disciple both only offer a 14-day free trial, with no permanent free plan."
    },
    {
      "question": "Which has the lowest entry price?",
      "answer": "Discourse is the cheapest to start with, since self-hosting is free and its hosted Pro tier starts at $100/month. Circle's Professional plan starts at $89/month, and Disciple's entry plan starts at $399/month."
    },
    {
      "question": "Which is better for selling online courses?",
      "answer": "Circle includes course creation as part of its base offering. Disciple also supports courses, but monetizable courses are only available starting on its Plus tier - its entry plan only allows one non-monetizable course."
    },
    {
      "question": "Does any of these charge a percentage transaction fee on membership or course revenue?",
      "answer": "Disciple explicitly advertises a 0% transaction fee policy across all its plans. Circle's and Discourse's documentation does not specify a transaction fee policy for member or course revenue."
    }
  ]
};

export default circleVsDiscipleVsDiscourseContent;

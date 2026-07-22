import type { GroupComparisonContent } from './types';

const aptabaseVsCountlyVsHitkeepContent: GroupComparisonContent = {
  "verdict": "Aptabase, Countly, and HitKeep are all privacy-first, cookie-free analytics platforms that can be self-hosted for free, but they optimize for different jobs: Aptabase is a lightweight event tracker built for mobile, desktop, and web apps; Countly bundles product analytics with crash reporting, push notifications, and A/B testing for teams willing to pay for its commercial cloud or enterprise tiers; and HitKeep is a single-binary web analytics tool built around funnels, ecommerce, and multi-client agency reporting. No single tool wins outright — the right pick depends on whether you're instrumenting an app, running a full product-engagement stack, or managing website analytics for clients.",
  "bestFor": {
    "aptabase": "Indie developers and small product teams who want free, anonymous event tracking across mobile, desktop, and web apps without managing infrastructure.",
    "countly": "Teams that need product analytics combined with engagement tools like push notifications, A/B testing, and crash reporting, and are willing to pay for a commercial private-cloud or self-hosted enterprise deployment.",
    "hitkeep": "Agencies and website owners who want free, single-binary self-hosted web analytics with built-in ecommerce, funnels, and multi-site client reporting."
  },
  "highlights": [
    {
      "title": "All three can be self-hosted for free",
      "description": "Aptabase and HitKeep are open source and free to self-host with no feature gating, and Countly offers a free, open-source Community Edition alongside its commercial tiers.",
      "toolSlugs": [
        "aptabase",
        "countly",
        "hitkeep"
      ]
    },
    {
      "title": "Countly is the only one with a built-in engagement suite",
      "description": "Push notifications, remote configuration, A/B testing, and crash reporting across iOS, Android, React Native, and more are unique to Countly among these three.",
      "toolSlugs": [
        "countly"
      ]
    },
    {
      "title": "HitKeep is built for agencies and ecommerce sites",
      "description": "Multi-client reporting for up to 50 sites, native ecommerce and funnel tracking, AI crawler detection, and Google Search Console integration are specific to HitKeep.",
      "toolSlugs": [
        "hitkeep"
      ]
    },
    {
      "title": "Aptabase has the broadest app-platform SDK coverage",
      "description": "More than 10 SDKs spanning iOS, Android, Flutter, Electron, Tauri, Unity, and Unreal Engine make Aptabase well suited to teams shipping across multiple app platforms.",
      "toolSlugs": [
        "aptabase"
      ]
    },
    {
      "title": "Pricing philosophy diverges sharply",
      "description": "Aptabase and HitKeep are free to self-host indefinitely, while Countly's commercial Flex plan starts at $175/month and its self-hosted Enterprise tier requires custom pricing.",
      "toolSlugs": [
        "countly",
        "aptabase",
        "hitkeep"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Data Ownership",
      "rows": [
        {
          "feature": "Free self-hosting option",
          "statuses": {
            "aptabase": "available",
            "countly": "available",
            "hitkeep": "available"
          },
          "note": "Countly's free self-hosted route is its separate Community Edition; the commercial product itself is paid."
        },
        {
          "feature": "Cookie-free, anonymous tracking",
          "statuses": {
            "aptabase": "available",
            "countly": "not-documented",
            "hitkeep": "available"
          }
        },
        {
          "feature": "Managed cloud hosting option",
          "statuses": {
            "aptabase": "available",
            "countly": "available",
            "hitkeep": "available"
          }
        }
      ]
    },
    {
      "group": "Core Analytics",
      "rows": [
        {
          "feature": "Custom event tracking",
          "statuses": {
            "aptabase": "available",
            "countly": "available",
            "hitkeep": "available"
          }
        },
        {
          "feature": "Funnels and ecommerce tracking",
          "statuses": {
            "aptabase": "not-documented",
            "countly": "not-documented",
            "hitkeep": "available"
          }
        },
        {
          "feature": "Real-time live dashboard",
          "statuses": {
            "aptabase": "available",
            "countly": "not-documented",
            "hitkeep": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Engagement and Growth Extras",
      "rows": [
        {
          "feature": "Push notifications and remote configuration",
          "statuses": {
            "aptabase": "unavailable",
            "countly": "available",
            "hitkeep": "unavailable"
          }
        },
        {
          "feature": "Crash and error reporting",
          "statuses": {
            "aptabase": "unavailable",
            "countly": "available",
            "hitkeep": "unavailable"
          }
        },
        {
          "feature": "AI crawler detection and Search Console integration",
          "statuses": {
            "aptabase": "unavailable",
            "countly": "unavailable",
            "hitkeep": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these is completely free to self-host?",
      "answer": "Aptabase and HitKeep are free to self-host indefinitely with no feature restrictions. Countly's Community Edition is also free and open source, but its advanced adaptivity and AI intelligence features are reserved for the paid Flex (from $175/month) or Enterprise self-hosted tiers."
    },
    {
      "question": "Which tool is best for tracking ecommerce and conversion funnels?",
      "answer": "HitKeep is the only one of the three that documents native ecommerce transaction revenue tracking and multi-step conversion funnels."
    },
    {
      "question": "Does any of these track mobile app crashes?",
      "answer": "Countly does, with crash and error reporting across iOS, Android, React Native, Flutter, Unity, and other platforms. Aptabase and HitKeep don't document this capability."
    },
    {
      "question": "Are these tools cookie-free and GDPR-friendly by default?",
      "answer": "Aptabase and HitKeep are cookie-free by design and avoid personal identifiers out of the box. Countly offers a Compliance Hub for consent management, but it isn't inherently cookie-free the way the other two are."
    },
    {
      "question": "Which has the most SDK coverage for mobile and desktop apps?",
      "answer": "Aptabase (10+ SDKs including Unity, Unreal Engine, Electron, and Tauri) and Countly (broad SDK support plus crash reporting) both target app developers, whereas HitKeep is focused on website analytics rather than native app instrumentation."
    },
    {
      "question": "Which tool is best for agencies managing multiple client websites?",
      "answer": "HitKeep, which supports multi-client reporting for up to 50 sites and 20 team members on its Business cloud tier."
    }
  ]
};

export default aptabaseVsCountlyVsHitkeepContent;

import type { GroupComparisonContent } from './types';

const ackeeVsRybbitVsSwetrixContent: GroupComparisonContent = {
  "verdict": "All three are cookie-free, self-hostable Google Analytics alternatives, but they diverge on how features are gated. Ackee stays deliberately minimal with no cloud option at all. Rybbit is the newest entrant, launched in 2025, yet stands out for shipping a genuinely feature-complete free self-hosted build that includes session replay and funnels other tools reserve for paid tiers. Swetrix goes furthest on product-analytics depth, adding error tracking and A/B testing on top of session replay, at the cost of gating its richest features behind higher-priced cloud plans.",
  "bestFor": {
    "ackee": "Developers who want the absolute simplest free, self-hosted, cookie-free tracker with no managed cloud distraction.",
    "rybbit": "Teams that want a feature-complete self-hosted build, including session replay and funnels, for free, or an affordable EU-hosted cloud option with a generous free tier.",
    "swetrix": "Teams that need web analytics plus error tracking and A/B testing in one platform, and are willing to pay for the higher tiers that unlock them."
  },
  "highlights": [
    {
      "title": "Feature-complete self-hosting",
      "description": "Rybbit's self-hosted build includes session replay and funnels for free, while Swetrix documents session replay and A/B testing as gated behind its paid Plus tier; Ackee is minimal by design rather than by gating.",
      "toolSlugs": [
        "rybbit",
        "swetrix"
      ]
    },
    {
      "title": "Company maturity",
      "description": "Rybbit launched publicly in 2025 and grew past 10,000 GitHub stars in its first year, Swetrix was founded in 2021, and Ackee has been maintained as a long-running minimalist project by developer studio Electerious.",
      "toolSlugs": [
        "ackee",
        "rybbit",
        "swetrix"
      ]
    },
    {
      "title": "Free tier generosity",
      "description": "Rybbit offers a free managed cloud tier covering 3,000 events per month, Ackee is fully free with no cloud tier at all, and Swetrix's free option is limited to its self-hosted Community Edition with no free cloud plan.",
      "toolSlugs": [
        "ackee",
        "rybbit",
        "swetrix"
      ]
    },
    {
      "title": "Product analytics extras",
      "description": "Swetrix adds error tracking and A/B testing with feature flags, Rybbit adds funnels and session replay, and Ackee sticks to pageviews and custom events.",
      "toolSlugs": [
        "ackee",
        "rybbit",
        "swetrix"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Tracking",
      "rows": [
        {
          "feature": "Cookie-free tracking",
          "statuses": {
            "ackee": "available",
            "rybbit": "available",
            "swetrix": "available"
          }
        }
      ]
    },
    {
      "group": "Self-Hosting",
      "rows": [
        {
          "feature": "Free self-hosted deployment",
          "statuses": {
            "ackee": "available",
            "rybbit": "available",
            "swetrix": "available"
          }
        },
        {
          "feature": "Self-hosted build is feature-complete (no gating)",
          "statuses": {
            "ackee": "available",
            "rybbit": "available",
            "swetrix": "limited"
          },
          "note": "Rybbit's self-hosted build includes session replay and funnels; Swetrix gates session replay and A/B testing to its paid Plus tier."
        }
      ]
    },
    {
      "group": "Cloud Pricing",
      "rows": [
        {
          "feature": "Free managed cloud tier",
          "statuses": {
            "ackee": "unavailable",
            "rybbit": "available",
            "swetrix": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Product Analytics",
      "rows": [
        {
          "feature": "Session replay",
          "statuses": {
            "ackee": "unavailable",
            "rybbit": "available",
            "swetrix": "available"
          }
        },
        {
          "feature": "Funnel analysis",
          "statuses": {
            "ackee": "unavailable",
            "rybbit": "available",
            "swetrix": "available"
          }
        },
        {
          "feature": "Error tracking",
          "statuses": {
            "ackee": "unavailable",
            "rybbit": "not-documented",
            "swetrix": "available"
          }
        },
        {
          "feature": "A/B testing",
          "statuses": {
            "ackee": "unavailable",
            "rybbit": "not-documented",
            "swetrix": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool is the newest?",
      "answer": "Rybbit is the newest, publicly launching in April 2025, compared with Swetrix's 2021 founding and Ackee's longer-running maintenance history."
    },
    {
      "question": "Does the free self-hosted version include the same features as paid plans?",
      "answer": "Rybbit's self-hosted build is reported to be feature-complete, including session replay and funnels; Swetrix's documented feature set gates session replay and A/B testing to its paid Plus tier; Ackee has no paid tier since its full self-hosted build is its only offering."
    },
    {
      "question": "Which has a free managed cloud tier I can use without self-hosting?",
      "answer": "Rybbit offers a free cloud tier covering 3,000 events per month on one site; Ackee and Swetrix don't offer a free managed cloud option, only free self-hosting."
    },
    {
      "question": "Which tool includes error tracking?",
      "answer": "Only Swetrix documents built-in error tracking among these three."
    },
    {
      "question": "Which is best for GDPR compliance out of the box?",
      "answer": "Rybbit's hosted cloud runs on EU (Germany) infrastructure for default GDPR alignment; Ackee and Swetrix are cookie-free by design, but self-hosted compliance posture depends on where you choose to deploy them."
    }
  ]
};

export default ackeeVsRybbitVsSwetrixContent;

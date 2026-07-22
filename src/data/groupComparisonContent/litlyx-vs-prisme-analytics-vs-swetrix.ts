import type { GroupComparisonContent } from './types';

const litlyxVsPrismeAnalyticsVsSwetrixContent: GroupComparisonContent = {
  "verdict": "Litlyx, Prisme Analytics, and Swetrix all promise cookie-free, GDPR-friendly analytics with a free self-hosted option, but each optimizes for something different. Litlyx bets on AI-generated, client-ready reports for agencies. Prisme Analytics bets on real-time, unlimited-retention infrastructure built on ClickHouse and Grafana with one flat-rate cloud plan. Swetrix bets on breadth, folding error tracking, A/B testing, and Core Web Vitals monitoring into the same product as core web analytics.",
  "bestFor": {
    "litlyx": "Agencies and solopreneurs who want AI-generated, client-ready performance reports and multi-workspace management for several sites.",
    "prisme-analytics": "Teams that want real-time, unlimited-retention analytics on transparent ClickHouse and Grafana infrastructure with one flat-rate hosted plan.",
    "swetrix": "Teams that need web analytics plus error tracking and A/B testing in one platform, and are willing to pay for the higher tiers that unlock them."
  },
  "highlights": [
    {
      "title": "AI vs product-analytics breadth",
      "description": "Litlyx focuses on AI report generation, Swetrix focuses on error tracking and A/B testing depth, and Prisme Analytics focuses on real-time, transparent infrastructure rather than either extra layer.",
      "toolSlugs": [
        "litlyx",
        "prisme-analytics",
        "swetrix"
      ]
    },
    {
      "title": "Pricing entry point",
      "description": "Litlyx's Mini plan and Prisme Analytics' single plan both start around EUR 8.99 per month, while Swetrix's Standard plan starts higher, near EUR 17 per month.",
      "toolSlugs": [
        "litlyx",
        "prisme-analytics",
        "swetrix"
      ]
    },
    {
      "title": "Data retention",
      "description": "Prisme Analytics explicitly never auto-deletes data, standing apart from Litlyx and Swetrix, which don't publish an explicit retention guarantee tied to their paid tiers.",
      "toolSlugs": [
        "prisme-analytics"
      ]
    },
    {
      "title": "Self-hosted completeness",
      "description": "Swetrix's Community Edition covers the full core analytics engine but documents session replay and A/B testing as gated to its paid Plus tier, while Litlyx's self-hosted Docker build and Prisme Analytics' fully open self-hosted codebase are each free.",
      "toolSlugs": [
        "litlyx",
        "prisme-analytics",
        "swetrix"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment",
      "rows": [
        {
          "feature": "Free self-hosted tier",
          "statuses": {
            "litlyx": "available",
            "prisme-analytics": "available",
            "swetrix": "available"
          }
        },
        {
          "feature": "Managed cloud hosting",
          "statuses": {
            "litlyx": "available",
            "prisme-analytics": "available",
            "swetrix": "available"
          }
        }
      ]
    },
    {
      "group": "Reporting and AI",
      "rows": [
        {
          "feature": "AI-generated reports or summaries",
          "statuses": {
            "litlyx": "available",
            "prisme-analytics": "unavailable",
            "swetrix": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Product Analytics Depth",
      "rows": [
        {
          "feature": "Session replay",
          "statuses": {
            "litlyx": "unavailable",
            "prisme-analytics": "unavailable",
            "swetrix": "available"
          }
        },
        {
          "feature": "Error tracking",
          "statuses": {
            "litlyx": "unavailable",
            "prisme-analytics": "unavailable",
            "swetrix": "available"
          }
        },
        {
          "feature": "A/B testing",
          "statuses": {
            "litlyx": "unavailable",
            "prisme-analytics": "unavailable",
            "swetrix": "available"
          }
        }
      ]
    },
    {
      "group": "Real-Time and API",
      "rows": [
        {
          "feature": "Real-time dashboard",
          "statuses": {
            "litlyx": "available",
            "prisme-analytics": "available",
            "swetrix": "available"
          }
        },
        {
          "feature": "SQL or raw query API",
          "statuses": {
            "litlyx": "not-documented",
            "prisme-analytics": "available",
            "swetrix": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which has AI-generated reports?",
      "answer": "Litlyx is the only one of the three offering one-click AI-generated performance reports."
    },
    {
      "question": "Which has error tracking and A/B testing?",
      "answer": "Only Swetrix documents built-in error tracking and A/B testing with feature flags among these three."
    },
    {
      "question": "Which keeps data the longest?",
      "answer": "Prisme Analytics explicitly never auto-deletes visitor data, giving it unlimited retention; Litlyx and Swetrix don't publish an explicit retention guarantee tied to their paid tiers."
    },
    {
      "question": "Which has the lowest starting price?",
      "answer": "Litlyx's Mini plan and Prisme Analytics' single cloud plan both start around EUR 8.99 per month, undercutting Swetrix's Standard plan at roughly EUR 17 per month."
    },
    {
      "question": "Can I self-host any of these for free?",
      "answer": "Yes: Litlyx via Docker, Prisme Analytics as the full open-source AGPL-3.0 codebase, and Swetrix via its AGPLv3 Community Edition, though Swetrix's session replay and A/B testing are documented as gated behind its paid Plus tier."
    }
  ]
};

export default litlyxVsPrismeAnalyticsVsSwetrixContent;

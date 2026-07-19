import type { GroupComparisonContent } from './types';

const ackeeVsPrismeAnalyticsVsSwetrixContent: GroupComparisonContent = {
  "verdict": "Three self-hosted, cookie-free alternatives to Google Analytics with very different scope. Ackee is the leanest, a minimalist GraphQL-driven dashboard with no managed cloud option at all. Prisme Analytics pairs ClickHouse and Grafana for real-time processing, unlimited data retention, and a single flat-rate hosted plan. Swetrix is the most full-featured, layering session replays, error tracking, A/B testing, and Core Web Vitals monitoring on top of core analytics, with its richer features sitting behind higher-priced plans.",
  "bestFor": {
    "ackee": "Developers who want a free, no-frills, self-hosted GraphQL analytics tool with zero interest in a managed cloud option.",
    "prisme-analytics": "Teams that want real-time, unlimited-retention analytics on a ClickHouse and Grafana stack with one simple flat-rate hosted plan instead of tiered limits.",
    "swetrix": "Teams that want web analytics combined with product-analytics features like session replay, error tracking, and A/B testing in a single tool."
  },
  "highlights": [
    {
      "title": "Real-time vs standard reporting",
      "description": "Prisme Analytics is explicitly built for real-time processing instead of a delayed reporting window, and Swetrix also shows a real-time dashboard, while Ackee does not make an explicit real-time claim.",
      "toolSlugs": [
        "prisme-analytics",
        "swetrix"
      ]
    },
    {
      "title": "Product analytics depth",
      "description": "Swetrix adds session replay, error tracking, and A/B testing on top of core analytics, Prisme Analytics focuses on custom events and dashboards, and Ackee stays limited to pageviews and custom events.",
      "toolSlugs": [
        "ackee",
        "prisme-analytics",
        "swetrix"
      ]
    },
    {
      "title": "Pricing structure",
      "description": "Ackee is free forever with no paid tier, Prisme Analytics offers one flat-rate hosted plan around EUR 8.99 per month covering unlimited sites, and Swetrix uses tiered cloud pricing starting near EUR 17 per month with richer features gated to higher tiers.",
      "toolSlugs": [
        "ackee",
        "prisme-analytics",
        "swetrix"
      ]
    },
    {
      "title": "Data retention and querying",
      "description": "Prisme Analytics explicitly never auto-deletes data and exposes a SQL query API, while Ackee offers a GraphQL API and Swetrix does not document a comparable raw query interface.",
      "toolSlugs": [
        "ackee",
        "prisme-analytics",
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
            "prisme-analytics": "available",
            "swetrix": "available"
          }
        },
        {
          "feature": "Real-time dashboard",
          "statuses": {
            "ackee": "not-documented",
            "prisme-analytics": "available",
            "swetrix": "available"
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
            "prisme-analytics": "unavailable",
            "swetrix": "available"
          },
          "note": "Swetrix gates session replay to its Plus and Enterprise cloud tiers."
        },
        {
          "feature": "Error tracking",
          "statuses": {
            "ackee": "unavailable",
            "prisme-analytics": "unavailable",
            "swetrix": "available"
          }
        },
        {
          "feature": "A/B testing",
          "statuses": {
            "ackee": "unavailable",
            "prisme-analytics": "unavailable",
            "swetrix": "available"
          }
        }
      ]
    },
    {
      "group": "Deployment and Pricing",
      "rows": [
        {
          "feature": "Free self-hosted tier",
          "statuses": {
            "ackee": "available",
            "prisme-analytics": "available",
            "swetrix": "available"
          }
        },
        {
          "feature": "Managed cloud hosting",
          "statuses": {
            "ackee": "unavailable",
            "prisme-analytics": "available",
            "swetrix": "available"
          }
        }
      ]
    },
    {
      "group": "API and Integrations",
      "rows": [
        {
          "feature": "Raw query or GraphQL API",
          "statuses": {
            "ackee": "available",
            "prisme-analytics": "available",
            "swetrix": "not-documented"
          },
          "note": "Ackee exposes a GraphQL API; Prisme Analytics exposes a SQL query API."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of the three offers session replay and error tracking?",
      "answer": "Only Swetrix documents session replay and error tracking among these three, with session replay reserved for its Plus and Enterprise cloud tiers."
    },
    {
      "question": "Which has the simplest, most predictable pricing?",
      "answer": "Prisme Analytics offers a single flat-rate hosted plan around EUR 8.99 per month covering unlimited sites and pageviews, compared with Swetrix's tiered per-feature pricing that starts near EUR 17 per month."
    },
    {
      "question": "Is there a completely free way to use any of these?",
      "answer": "Ackee is fully free with no paid tier at all, while Prisme Analytics and Swetrix both offer free self-hosted community editions alongside their paid cloud plans."
    },
    {
      "question": "Which tool retains data the longest?",
      "answer": "Prisme Analytics explicitly states that data is never auto-deleted, giving it unlimited retention; Ackee and Swetrix don't publish a retention cap either way for self-hosted deployments, since that depends on how the operator runs the software."
    },
    {
      "question": "Which is best for querying raw analytics data directly?",
      "answer": "Prisme Analytics offers a documented SQL query API and Ackee exposes a GraphQL API, while Swetrix does not document a comparable raw query interface in its public feature set."
    }
  ]
};

export default ackeeVsPrismeAnalyticsVsSwetrixContent;

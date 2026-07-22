import type { GroupComparisonContent } from './types';

const prismeAnalyticsVsRybbitVsSwetrixContent: GroupComparisonContent = {
  "verdict": "Prisme Analytics, Rybbit, and Swetrix are all open-source, cookieless, self-hostable web analytics platforms built as privacy-first alternatives to Google Analytics, making them genuinely comparable. The best pick depends on what you value most: Prisme leans into real-time ClickHouse-and-Grafana architecture with unlimited retention and flat pricing, Rybbit stands out for a fully feature-complete free self-hosted build, and Swetrix extends furthest beyond pageviews into product analytics like error tracking and A/B testing.",
  "bestFor": {
    "prisme-analytics": "Teams that want real-time (not delayed) reporting on a ClickHouse and Grafana foundation, unlimited data retention with no automatic deletion, and a single flat-rate hosted plan with no event-volume tiers.",
    "rybbit": "Budget-conscious teams and self-hosters who want a genuinely feature-complete free self-hosted deployment, including session replay and funnels, or a generous free cloud tier to start at zero cost.",
    "swetrix": "Teams that want to replace both their web analytics and a separate product-analytics stack, combining error tracking, A/B testing, feature flags, and Core Web Vitals monitoring alongside standard traffic analytics in one tool."
  },
  "highlights": [
    {
      "title": "Rybbit's self-hosted edition is uniquely feature-complete",
      "description": "Rybbit's free, self-hosted AGPL-3 build is explicitly documented as including session replay and funnels, features that many privacy analytics competitors reserve for paid cloud tiers.",
      "toolSlugs": [
        "rybbit"
      ]
    },
    {
      "title": "Swetrix goes beyond web analytics into product analytics",
      "description": "Swetrix combines core traffic analytics with error tracking, A and B testing, feature flags, and Core Web Vitals performance monitoring, a broader feature set than Prisme or Rybbit document.",
      "toolSlugs": [
        "swetrix"
      ]
    },
    {
      "title": "Prisme prioritizes real-time processing and unlimited retention",
      "description": "Built on ClickHouse and Grafana, Prisme is designed for real-time (not delayed) reporting and never automatically deletes visitor data, backed by a single flat hosted price of about EUR 8.99/month with no event caps.",
      "toolSlugs": [
        "prisme-analytics"
      ]
    },
    {
      "title": "Rybbit is the newest and smallest of the three",
      "description": "Rybbit launched in 2025 and is run by a very small team, versus Swetrix (founded 2021) and Prisme, both of which have a longer operating track record worth weighing if vendor maturity matters.",
      "toolSlugs": [
        "rybbit",
        "swetrix",
        "prisme-analytics"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Privacy and Compliance",
      "rows": [
        {
          "feature": "Cookieless tracking (no consent banner required)",
          "statuses": {
            "prisme-analytics": "available",
            "rybbit": "available",
            "swetrix": "available"
          }
        },
        {
          "feature": "Documented EU-based hosted cloud infrastructure",
          "statuses": {
            "prisme-analytics": "available",
            "rybbit": "available",
            "swetrix": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Analytics Depth",
      "rows": [
        {
          "feature": "Real-time dashboards",
          "statuses": {
            "prisme-analytics": "available",
            "rybbit": "available",
            "swetrix": "available"
          }
        },
        {
          "feature": "Session replay",
          "statuses": {
            "prisme-analytics": "unavailable",
            "rybbit": "available",
            "swetrix": "available"
          },
          "note": "On Swetrix, session replay is gated to the Plus and Enterprise cloud tiers."
        },
        {
          "feature": "Conversion funnel analysis",
          "statuses": {
            "prisme-analytics": "unavailable",
            "rybbit": "available",
            "swetrix": "available"
          }
        },
        {
          "feature": "Error tracking, A and B testing, and feature flags",
          "statuses": {
            "prisme-analytics": "unavailable",
            "rybbit": "unavailable",
            "swetrix": "available"
          }
        }
      ]
    },
    {
      "group": "Self-Hosting and Access",
      "rows": [
        {
          "feature": "Free self-hosted edition with full feature parity to paid cloud plans",
          "statuses": {
            "prisme-analytics": "not-documented",
            "rybbit": "available",
            "swetrix": "limited"
          },
          "note": "Rybbit's self-hosted build is explicitly described as feature-complete; Swetrix's self-hosted Community Edition does not list session replay or A/B testing among its included features."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is easiest to try for free?",
      "answer": "Rybbit's free cloud tier (3,000 events per month) and fully feature-complete self-hosted edition make it the easiest to start with at zero cost. Prisme offers a 30-day free cloud trial with no credit card required, and Swetrix's self-hosted Community Edition is also free, though its cloud plans start at a paid tier."
    },
    {
      "question": "Which tool includes session replay in its free self-hosted build?",
      "answer": "Only Rybbit's self-hosted edition is documented as including session replay and funnels for free. Prisme's data does not document session replay at all, and Swetrix reserves session replay for its paid Plus cloud tier."
    },
    {
      "question": "Which of the three offers built-in error tracking or A and B testing?",
      "answer": "Swetrix is the only one of the three whose documented feature set includes error tracking, A and B testing, and feature flags alongside standard web analytics."
    },
    {
      "question": "Are these tools GDPR-compliant without a cookie banner?",
      "answer": "Yes, all three use cookieless tracking designed to avoid the need for a cookie-consent banner. Prisme and Rybbit both specifically document EU-based hosted infrastructure for their cloud offerings."
    },
    {
      "question": "Which is best if I want unlimited event volume and data retention?",
      "answer": "Prisme's hosted cloud plan is a single flat rate (about EUR 8.99/month) with unlimited websites, pageviews, events, and dashboards, and it never automatically deletes data. Rybbit and Swetrix both cap event volume by pricing tier."
    },
    {
      "question": "How established are these three products?",
      "answer": "Prisme's founding date is not publicly disclosed, Swetrix was founded in 2021, and Rybbit is the newest, launched in 2025. This is worth factoring in if vendor longevity and track record matter to you."
    }
  ]
};

export default prismeAnalyticsVsRybbitVsSwetrixContent;

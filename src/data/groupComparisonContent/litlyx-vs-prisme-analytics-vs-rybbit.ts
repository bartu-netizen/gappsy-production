import type { GroupComparisonContent } from './types';

const litlyxVsPrismeAnalyticsVsRybbitContent: GroupComparisonContent = {
  "verdict": "All three are young, privacy-first Google Analytics alternatives with both free self-hosted and paid cloud options, but their standout feature differs. Litlyx leans hardest into AI, generating one-click summary reports across web, product, SEO, and marketing performance, aimed at agencies producing recurring client reports. Prisme Analytics is built around real-time ClickHouse and Grafana infrastructure with unlimited data retention and a single flat-rate cloud plan. Rybbit, the youngest of the three, differentiates itself by keeping its free self-hosted build fully feature-complete, including session replay and funnels.",
  "bestFor": {
    "litlyx": "Agencies and solopreneurs who want AI-generated, client-ready performance reports and multi-workspace management for several sites.",
    "prisme-analytics": "Teams that want real-time, unlimited-retention analytics on transparent ClickHouse and Grafana infrastructure with one flat-rate hosted plan.",
    "rybbit": "Teams that want a genuinely feature-complete free self-hosted build, or an affordable EU-hosted cloud option with a generous free tier."
  },
  "highlights": [
    {
      "title": "AI-generated reporting",
      "description": "Litlyx offers one-click AI-generated reports summarizing web, product, SEO, and marketing performance, a capability neither Prisme Analytics nor Rybbit documents.",
      "toolSlugs": [
        "litlyx"
      ]
    },
    {
      "title": "Pricing entry point",
      "description": "Litlyx's Mini plan and Prisme Analytics' single hosted plan both start around EUR 8.99 per month, while Rybbit's free cloud tier undercuts both at 3,000 events per month.",
      "toolSlugs": [
        "litlyx",
        "prisme-analytics",
        "rybbit"
      ]
    },
    {
      "title": "Founding stage",
      "description": "Litlyx was founded in October 2024, Rybbit publicly launched in 2025, and Prisme Analytics operates as a small EU-based team with an undisclosed founding date; all three are young relative to legacy analytics platforms.",
      "toolSlugs": [
        "litlyx",
        "prisme-analytics",
        "rybbit"
      ]
    },
    {
      "title": "Self-hosted completeness",
      "description": "Rybbit's self-hosted build ships session replay and funnels for free, Litlyx offers a free self-hosted Docker build focused on core tracking, and Prisme Analytics' self-hosted build is the full open-source codebase.",
      "toolSlugs": [
        "litlyx",
        "prisme-analytics",
        "rybbit"
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
            "rybbit": "available"
          }
        },
        {
          "feature": "Managed cloud hosting",
          "statuses": {
            "litlyx": "available",
            "prisme-analytics": "available",
            "rybbit": "available"
          }
        }
      ]
    },
    {
      "group": "AI and Reporting",
      "rows": [
        {
          "feature": "AI-generated reports or summaries",
          "statuses": {
            "litlyx": "available",
            "prisme-analytics": "unavailable",
            "rybbit": "unavailable"
          }
        },
        {
          "feature": "Multi-workspace or agency client reporting",
          "statuses": {
            "litlyx": "available",
            "prisme-analytics": "not-documented",
            "rybbit": "available"
          }
        }
      ]
    },
    {
      "group": "Analytics Depth",
      "rows": [
        {
          "feature": "Session replay",
          "statuses": {
            "litlyx": "unavailable",
            "prisme-analytics": "unavailable",
            "rybbit": "available"
          }
        },
        {
          "feature": "Funnel analysis",
          "statuses": {
            "litlyx": "available",
            "prisme-analytics": "unavailable",
            "rybbit": "available"
          }
        },
        {
          "feature": "Real-time dashboard",
          "statuses": {
            "litlyx": "available",
            "prisme-analytics": "available",
            "rybbit": "available"
          }
        }
      ]
    },
    {
      "group": "API Access",
      "rows": [
        {
          "feature": "SQL or raw query API",
          "statuses": {
            "litlyx": "not-documented",
            "prisme-analytics": "available",
            "rybbit": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool has AI-generated reports?",
      "answer": "Litlyx offers one-click AI-generated reports summarizing web, product, SEO, and marketing performance; Prisme Analytics and Rybbit do not document AI reporting features."
    },
    {
      "question": "Which is the youngest company?",
      "answer": "Rybbit, publicly launched in April 2025, is younger than Litlyx, founded in October 2024; Prisme Analytics' founding date isn't publicly disclosed, but it operates as a small EU-based team."
    },
    {
      "question": "Which has the simplest pricing to understand?",
      "answer": "Prisme Analytics' single flat rate cloud plan around EUR 8.99 per month covers unlimited sites and pageviews, compared with Litlyx's three pageview-tiered plans from EUR 8.99 to EUR 29.99 per month and Rybbit's event-based tiers."
    },
    {
      "question": "Which is best for agencies managing multiple client sites?",
      "answer": "Litlyx offers multi-domain workspaces and shareable branded client reports, Rybbit's Pro plan removes site and team caps entirely, and Prisme Analytics' single plan already includes unlimited websites but has no dedicated client-reporting feature documented."
    },
    {
      "question": "Can I self-host any of these for free?",
      "answer": "Yes, all three offer a free self-hosted option: Litlyx via Docker, Prisme Analytics as the full open-source AGPL-3.0 codebase, and Rybbit as a feature-complete AGPL-3 build including session replay and funnels."
    }
  ]
};

export default litlyxVsPrismeAnalyticsVsRybbitContent;

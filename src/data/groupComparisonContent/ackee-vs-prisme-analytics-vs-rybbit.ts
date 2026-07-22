import type { GroupComparisonContent } from './types';

const ackeeVsPrismeAnalyticsVsRybbitContent: GroupComparisonContent = {
  "verdict": "Ackee, Prisme Analytics, and Rybbit are all genuine cookie-free, privacy-first alternatives to Google Analytics that can be self-hosted for free, but they differ in depth and hosting flexibility. Ackee is the most minimal and self-hosted only; Prisme Analytics pairs a real-time ClickHouse and Grafana architecture with explicit GDPR, PECR, and Schrems II compliance and a single flat-rate cloud plan; and Rybbit is the newest and fastest-growing, offering funnels and session replay on both its free-tier cloud service and its feature-complete self-hosted build. No single option wins on every axis, so the right choice depends on whether a team wants simplicity, compliance-first architecture, or the deepest feature set.",
  "bestFor": {
    "ackee": "Developers who want the simplest possible free, self-hosted analytics setup with a GraphQL API and don't need a managed cloud option.",
    "prisme-analytics": "Teams that want real-time, compliance-first analytics built on GDPR, PECR, and Schrems II design principles, available as a flat-rate hosted plan or full ClickHouse and Grafana self-hosting.",
    "rybbit": "Teams that want a modern Google Analytics alternative with funnels and session replay, available through a generous free cloud tier or a fully feature-complete self-hosted deployment."
  },
  "highlights": [
    {
      "title": "Ackee is the minimalist, self-host-only option",
      "description": "Ackee is free and open source with a GraphQL API and multi-site dashboard, but it has no managed cloud version and a comparatively minimal feature set next to the other two tools.",
      "toolSlugs": [
        "ackee"
      ]
    },
    {
      "title": "Prisme Analytics is built for real-time, compliance-first reporting",
      "description": "Prisme Analytics runs on ClickHouse and Grafana to deliver real-time data instead of the 24 to 48 hour delay common with Google Analytics, and it is explicitly designed for GDPR, PECR, and Schrems II compliance with bot and scraper filtering built in.",
      "toolSlugs": [
        "prisme-analytics"
      ]
    },
    {
      "title": "Rybbit adds funnels and session replay other privacy tools skip",
      "description": "Rybbit documents funnel analysis and session replay, features not documented for Ackee or Prisme Analytics, and its self-hosted AGPL-3 build is reported as feature-complete rather than a stripped-down free tier.",
      "toolSlugs": [
        "rybbit"
      ]
    },
    {
      "title": "Cloud hosting costs and limits vary widely",
      "description": "Ackee has no managed cloud option at all; Prisme Analytics offers one flat-rate cloud plan around 8.99 euros per month for unlimited sites and pageviews; Rybbit's cloud plans range from a free 3,000-events-per-month tier up to 39 US dollars per month (26 US dollars annually) with event and site caps that scale by tier.",
      "toolSlugs": [
        "ackee",
        "prisme-analytics",
        "rybbit"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Privacy and Compliance",
      "rows": [
        {
          "feature": "Cookie-free tracking",
          "statuses": {
            "ackee": "available",
            "prisme-analytics": "available",
            "rybbit": "available"
          }
        },
        {
          "feature": "Explicit regulatory compliance design (GDPR/PECR/Schrems II)",
          "statuses": {
            "ackee": "limited",
            "prisme-analytics": "available",
            "rybbit": "limited"
          },
          "note": "Ackee anonymizes visitors and Rybbit hosts in the EU, but only Prisme Analytics explicitly documents GDPR, PECR, and Schrems II compliance."
        },
        {
          "feature": "Bot and scraper filtering",
          "statuses": {
            "ackee": "not-documented",
            "prisme-analytics": "available",
            "rybbit": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Analytics Capabilities",
      "rows": [
        {
          "feature": "Real-time data processing",
          "statuses": {
            "ackee": "not-documented",
            "prisme-analytics": "available",
            "rybbit": "available"
          }
        },
        {
          "feature": "Funnel analysis",
          "statuses": {
            "ackee": "not-documented",
            "prisme-analytics": "not-documented",
            "rybbit": "available"
          }
        },
        {
          "feature": "Session replay",
          "statuses": {
            "ackee": "not-documented",
            "prisme-analytics": "not-documented",
            "rybbit": "available"
          },
          "note": "Available on Rybbit's Pro cloud tier and included in its self-hosted build."
        }
      ]
    },
    {
      "group": "Hosting and Access",
      "rows": [
        {
          "feature": "Managed cloud hosting option",
          "statuses": {
            "ackee": "unavailable",
            "prisme-analytics": "available",
            "rybbit": "available"
          }
        },
        {
          "feature": "Query or developer API",
          "statuses": {
            "ackee": "available",
            "prisme-analytics": "available",
            "rybbit": "not-documented"
          },
          "note": "Ackee offers a GraphQL API and Prisme Analytics offers a SQL query API."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these can I use without self-hosting anything?",
      "answer": "Prisme Analytics and Rybbit both offer managed cloud hosting. Ackee is self-hosted only, with no managed cloud version available."
    },
    {
      "question": "Which has the most generous free tier?",
      "answer": "Rybbit's free cloud plan covers 3,000 events per month on one site. Ackee is entirely free but self-hosted only with no built-in event limits. Prisme Analytics's self-hosted edition is also free with no event caps."
    },
    {
      "question": "Which tool supports funnels or session replay?",
      "answer": "Rybbit is the only one of the three with documented funnel analysis and session replay, available on its Pro cloud tier and included in its feature-complete self-hosted build."
    },
    {
      "question": "Are these tools GDPR-compliant without a cookie banner?",
      "answer": "All three avoid cookies and are positioned to let sites skip a cookie-consent banner, with Prisme Analytics explicitly citing GDPR, PECR, and Schrems II compliance as a core design goal."
    },
    {
      "question": "Which of these three is the most established?",
      "answer": "Ackee and Prisme Analytics have longer track records as self-hosted open-source projects. Rybbit launched in 2025 and is the newest of the three, though it has grown quickly to over 10,000 GitHub stars in its first year."
    },
    {
      "question": "Do any of these offer a SQL or query API for custom analysis?",
      "answer": "Prisme Analytics documents a SQL query API and Ackee offers a GraphQL API. Rybbit's API access is not documented in available data."
    }
  ]
};

export default ackeeVsPrismeAnalyticsVsRybbitContent;

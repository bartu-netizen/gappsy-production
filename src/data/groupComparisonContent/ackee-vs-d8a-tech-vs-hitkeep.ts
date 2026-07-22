import type { GroupComparisonContent } from './types';

const ackeeVsD8aTechVsHitkeepContent: GroupComparisonContent = {
  "verdict": "Three self-hosted-first analytics options sit at very different points on the maturity spectrum. Ackee is the simplest true minimalist, a GraphQL-driven, MongoDB-backed dashboard with no managed cloud option at all. d8a.tech targets engineering and compliance teams that want GA4/Matomo-compatible ingestion writing straight into their own data warehouse rather than a built-in dashboard. HitKeep sits in between with the richest single-binary feature set, including funnels, ecommerce tracking, AI-crawler detection, and Search Console data, plus an actual paid cloud tier built for agencies.",
  "bestFor": {
    "ackee": "Developers who want the simplest possible free, self-hosted, cookie-free analytics setup without an external database to manage beyond MongoDB.",
    "d8a-tech": "Engineering and compliance teams in regulated industries who want GA4/Matomo-compatible ingestion feeding directly into their own data warehouse.",
    "hitkeep": "Agencies and site owners who want funnels, ecommerce tracking, and AI-crawler visibility out of the box, with an optional paid cloud tier for managing many client sites."
  },
  "highlights": [
    {
      "title": "Deployment simplicity",
      "description": "Ackee ships many one-click deploy targets (Docker, Heroku, Netlify, Vercel, and more), HitKeep runs as a single dependency-free binary, and d8a.tech requires standing up a destination warehouse like ClickHouse or BigQuery.",
      "toolSlugs": [
        "ackee",
        "d8a-tech",
        "hitkeep"
      ]
    },
    {
      "title": "Who owns the dashboard",
      "description": "Ackee and HitKeep each ship their own built-in dashboard, while d8a.tech is warehouse-native and leans on external BI tools or its own AI agent to visualize the data it ingests.",
      "toolSlugs": [
        "ackee",
        "d8a-tech",
        "hitkeep"
      ]
    },
    {
      "title": "Compliance and residency",
      "description": "d8a.tech is explicitly architected around HIPAA, GDPR, FedRAMP, and SOX-style data residency requirements with air-gapped self-hosting, a level of compliance framing Ackee and HitKeep do not document.",
      "toolSlugs": [
        "d8a-tech",
        "hitkeep"
      ]
    },
    {
      "title": "Beyond pageviews",
      "description": "HitKeep adds ecommerce revenue tracking and multi-step funnels on top of pageviews, d8a.tech focuses on server-side session stitching for accuracy, and Ackee keeps to pageviews and custom events.",
      "toolSlugs": [
        "ackee",
        "d8a-tech",
        "hitkeep"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Hosting",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "statuses": {
            "ackee": "available",
            "d8a-tech": "available",
            "hitkeep": "available"
          }
        },
        {
          "feature": "Managed cloud hosting",
          "statuses": {
            "ackee": "unavailable",
            "d8a-tech": "available",
            "hitkeep": "available"
          },
          "note": "d8a.tech's cloud tier is free (EU-hosted); HitKeep's cloud has both free and paid tiers."
        }
      ]
    },
    {
      "group": "Data and Privacy",
      "rows": [
        {
          "feature": "Cookie-free tracking",
          "statuses": {
            "ackee": "available",
            "d8a-tech": "available",
            "hitkeep": "available"
          }
        },
        {
          "feature": "Compliance-oriented architecture (HIPAA/FedRAMP)",
          "statuses": {
            "ackee": "not-documented",
            "d8a-tech": "available",
            "hitkeep": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Analytics Depth",
      "rows": [
        {
          "feature": "Funnel analysis",
          "statuses": {
            "ackee": "unavailable",
            "d8a-tech": "not-documented",
            "hitkeep": "available"
          }
        },
        {
          "feature": "Ecommerce revenue tracking",
          "statuses": {
            "ackee": "unavailable",
            "d8a-tech": "not-documented",
            "hitkeep": "available"
          }
        }
      ]
    },
    {
      "group": "API and AI",
      "rows": [
        {
          "feature": "Documented API access",
          "statuses": {
            "ackee": "available",
            "d8a-tech": "available",
            "hitkeep": "available"
          },
          "note": "Ackee: GraphQL API. d8a.tech: GA4/Matomo-compatible ingestion protocols. HitKeep: REST API and webhooks."
        },
        {
          "feature": "AI-powered features",
          "statuses": {
            "ackee": "unavailable",
            "d8a-tech": "available",
            "hitkeep": "available"
          },
          "note": "d8a.tech: natural-language query agent. HitKeep: AI crawler and bot detection."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does any of these three require a separate database to operate?",
      "answer": "Ackee needs a separately run MongoDB instance, d8a.tech writes into a warehouse you choose such as ClickHouse, BigQuery, or flat files that you must operate, and HitKeep bundles its own embedded DuckDB and NSQ inside a single binary so no external database is required."
    },
    {
      "question": "Which one is best suited to regulated industries like healthcare or finance?",
      "answer": "d8a.tech is explicitly built with HIPAA, GDPR, FedRAMP, and SOX-style data residency requirements in mind and supports fully air-gapped self-hosted deployments, making it the strongest fit among the three for regulated environments."
    },
    {
      "question": "Can I use any of these without paying anything?",
      "answer": "Yes, all three offer a free option: Ackee is free and open source with no paid tier at all, d8a.tech offers both a free self-hosted build and a free EU-hosted cloud tier, and HitKeep's self-hosted binary is free forever with paid cloud tiers reserved for agencies that want managed hosting."
    },
    {
      "question": "Which tool tracks ecommerce revenue and conversion funnels?",
      "answer": "Of the three, only HitKeep natively tracks ecommerce transaction revenue and multi-step conversion funnels; Ackee focuses on pageviews and custom events, and d8a.tech focuses on ingesting and warehousing events rather than building funnel reports itself."
    },
    {
      "question": "Do any of these come with a ready-made dashboard, or do I need my own BI tool?",
      "answer": "Ackee and HitKeep both ship their own dashboards out of the box. d8a.tech is warehouse-native by design, so it relies on external tools such as Metabase, Looker, or dbt-built dashboards to visualize the data it collects, though it also offers an EU-hosted AI agent for natural-language querying."
    },
    {
      "question": "Which is the newest and least established of the three?",
      "answer": "d8a.tech is the youngest as a company, registered in the UK in 2022, and its own native web tracker is still labeled beta; HitKeep's founding date and team size are not publicly disclosed, while Ackee has been maintained by developer studio Electerious for years as a mature, minimal project."
    }
  ]
};

export default ackeeVsD8aTechVsHitkeepContent;

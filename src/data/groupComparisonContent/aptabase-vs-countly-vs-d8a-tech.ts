import type { GroupComparisonContent } from './types';

const aptabaseVsCountlyVsD8aTechContent: GroupComparisonContent = {
  "verdict": "These three tools all promise privacy-respecting, self-hostable analytics, but they optimize for different buyers. Aptabase is the leanest option, built for indie developers who want anonymous event tracking across many mobile, desktop, and web SDKs without a lot of setup. Countly is the most feature-complete, bundling analytics, crash reporting, push notifications, and A/B testing into one platform, at the cost of commercial pricing that starts at $175 per month for the hosted Flex tier. d8a.tech takes a fundamentally different, warehouse-native approach, ingesting GA4- and Matomo-compatible events directly into a customer-owned ClickHouse, BigQuery, or object-storage warehouse, which suits engineering-led and compliance-heavy teams more than it suits marketers wanting a polished out-of-the-box dashboard.",
  "bestFor": {
    "aptabase": "Indie developers and small product teams who want simple, anonymous event analytics across mobile, desktop, and web apps with a generous free tier and no cookies or device fingerprinting.",
    "countly": "Product teams that want analytics, crash reporting, push notifications, and A/B testing bundled into a single platform and are willing to pay for a managed private-cloud or self-hosted Enterprise tier.",
    "d8a-tech": "Engineering-led teams in regulated industries like healthcare, finance, or government that already operate a data warehouse and want GA4/Matomo-compatible ingestion with full data ownership rather than a vendor-controlled dashboard."
  },
  "highlights": [
    {
      "title": "Aptabase optimizes for privacy and simplicity",
      "description": "Aptabase tracks events with no cookies, device fingerprints, or personal identifiers, and offers a free tier of up to 20,000 events per month with no overage fees, appealing to privacy-conscious indie and small-team developers.",
      "toolSlugs": [
        "aptabase"
      ]
    },
    {
      "title": "Countly is the most full-featured platform",
      "description": "Countly combines session and event analytics with crash reporting, push notifications, remote configuration, A/B testing, and a Compliance Hub for consent management, a broader feature set than either Aptabase or d8a.tech document.",
      "toolSlugs": [
        "countly"
      ]
    },
    {
      "title": "d8a.tech is warehouse-native, not dashboard-first",
      "description": "Unlike Aptabase and Countly, which ship their own analytics dashboards, d8a.tech writes a normalized schema directly into ClickHouse, BigQuery, or flat files, meaning value depends on connecting it to a separate BI tool like dbt, Looker, or Metabase.",
      "toolSlugs": [
        "d8a-tech"
      ]
    },
    {
      "title": "All three offer a genuinely free, self-hostable core",
      "description": "Aptabase, Countly (Community Edition), and d8a.tech (MIT-licensed) can all be self-hosted at no license cost, though only Aptabase and d8a.tech also offer a free managed cloud tier without any self-hosting required.",
      "toolSlugs": [
        "aptabase",
        "countly",
        "d8a-tech"
      ]
    },
    {
      "title": "Maturity varies significantly",
      "description": "Countly was founded in 2012 and reports processing data for more than 5 billion identities across roughly 17,000 applications, while Aptabase (2023) and d8a.tech (2022) are newer projects, and d8a.tech's native web tracker is explicitly still in beta.",
      "toolSlugs": [
        "countly",
        "aptabase",
        "d8a-tech"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Data Ownership",
      "rows": [
        {
          "feature": "Free self-hosted open-source edition",
          "statuses": {
            "aptabase": "available",
            "countly": "available",
            "d8a-tech": "available"
          }
        },
        {
          "feature": "Free hosted cloud tier (no self-hosting required)",
          "statuses": {
            "aptabase": "available",
            "countly": "unavailable",
            "d8a-tech": "available"
          },
          "note": "Countly's free option is the self-hosted Community Edition; its hosted Flex plan starts at $175/month with a 14-day trial rather than a permanent free tier."
        },
        {
          "feature": "Warehouse-native export (ClickHouse, BigQuery, S3, etc.)",
          "statuses": {
            "aptabase": "not-documented",
            "countly": "not-documented",
            "d8a-tech": "available"
          }
        }
      ]
    },
    {
      "group": "Analytics and Engagement Features",
      "rows": [
        {
          "feature": "Crash and error reporting",
          "statuses": {
            "aptabase": "unavailable",
            "countly": "available",
            "d8a-tech": "unavailable"
          }
        },
        {
          "feature": "Push notifications and A/B testing / remote config",
          "statuses": {
            "aptabase": "unavailable",
            "countly": "available",
            "d8a-tech": "unavailable"
          }
        },
        {
          "feature": "Real-time live event dashboard",
          "statuses": {
            "aptabase": "available",
            "countly": "not-documented",
            "d8a-tech": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Compatibility and AI",
      "rows": [
        {
          "feature": "GA4 / Matomo tracking-protocol compatibility",
          "statuses": {
            "aptabase": "unavailable",
            "countly": "unavailable",
            "d8a-tech": "available"
          },
          "note": "d8a.tech accepts existing gtag.js or Matomo tracking snippets with little to no code migration."
        },
        {
          "feature": "AI-assisted natural-language analysis",
          "statuses": {
            "aptabase": "unavailable",
            "countly": "available",
            "d8a-tech": "available"
          },
          "note": "Countly offers this as an Intelligence add-on; d8a.tech includes an EU-hosted AI agent over warehouse data."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is the cheapest for a solo developer just starting out?",
      "answer": "Aptabase, since it offers a free tier of up to 20,000 events per month with unlimited apps and no overage fees, aimed specifically at indie developers and small teams."
    },
    {
      "question": "Can I migrate my existing Google Analytics 4 setup to any of these?",
      "answer": "d8a.tech is purpose-built for this: it ingests events using the same GA4 Measurement Protocol and Matomo tracking API already in use, so existing tracking snippets can be redirected with minimal code changes."
    },
    {
      "question": "Which tool includes crash reporting and push notifications?",
      "answer": "Countly is the only one of the three that documents crash and error reporting alongside push notifications, remote configuration, and A/B testing."
    },
    {
      "question": "Do any of these require me to already run a data warehouse?",
      "answer": "d8a.tech does. Its core value depends on writing data into a warehouse like ClickHouse or BigQuery and then querying it with a separate BI or dashboard tool, whereas Aptabase and Countly both ship their own built-in dashboards."
    },
    {
      "question": "Which platform has the longest track record?",
      "answer": "Countly, founded in 2012, with a reported infrastructure processing data for more than 5 billion unique identities across roughly 17,000 applications. Aptabase (2023) and d8a.tech (2022) are considerably newer."
    },
    {
      "question": "Is any of these truly anonymous with no personal data collected?",
      "answer": "Aptabase is explicitly designed this way, with no cookies, device fingerprints, or personal identifiers used to track users. Countly and d8a.tech do not make the same anonymity-by-design claim in the available data."
    }
  ]
};

export default aptabaseVsCountlyVsD8aTechContent;

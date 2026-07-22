import type { GroupComparisonContent } from './types';

const aptabaseVsCountlyCommunityEditionVsD8aTechContent: GroupComparisonContent = {
  "verdict": "Aptabase, Countly Community Edition, and d8a.tech are all free, open-source analytics tools built around data ownership, but they take different architectural approaches. Aptabase is a lightweight, polished event tracker for apps; Countly Community Edition is the most feature-complete out of the box, with crash reporting, push notifications, and compliance tooling built in; and d8a.tech is a warehouse-native ingestion layer that writes GA4/Matomo-compatible events into your own ClickHouse, BigQuery, or object storage rather than shipping a full dashboard. The right choice depends on whether you want a ready-made dashboard or a data pipeline you'll connect to your own BI stack.",
  "bestFor": {
    "aptabase": "Developers who want a lightweight, privacy-first analytics SDK for mobile, desktop, or web apps with a polished built-in dashboard, plus a free managed tier if they'd rather not self-host at all.",
    "countly-community-edition": "Teams that want the richest self-hosted feature set out of the box — crash reporting, push notifications, and a Compliance Hub — without paying for Countly's commercial tiers.",
    "d8a-tech": "Engineering-led teams that already run, or want to run, a data warehouse and prioritize GA4/Matomo protocol compatibility and full data portability over a polished out-of-the-box dashboard."
  },
  "highlights": [
    {
      "title": "All three are free to self-host indefinitely",
      "description": "Aptabase, Countly Community Edition, and d8a.tech are each open source and can be run on your own infrastructure at no license cost.",
      "toolSlugs": [
        "aptabase",
        "countly-community-edition",
        "d8a-tech"
      ]
    },
    {
      "title": "Countly Community Edition ships the richest built-in feature set",
      "description": "Crash reporting, push notifications, remote configuration, in-app rating widgets, and a Compliance Hub are all included in the free self-hosted edition.",
      "toolSlugs": [
        "countly-community-edition"
      ]
    },
    {
      "title": "d8a.tech is built to fit in behind existing GA4 or Matomo tracking",
      "description": "Its ingestion pipeline accepts the GA4 Measurement Protocol and Matomo's tracking API directly, so teams can redirect existing tracking snippets with little to no code migration, then query the resulting schema with dbt, Looker, or Metabase.",
      "toolSlugs": [
        "d8a-tech"
      ]
    },
    {
      "title": "Aptabase offers the simplest path if you don't want to self-host",
      "description": "Its free managed tier covers up to 20,000 events per month in EU or US data centers, without requiring any infrastructure setup.",
      "toolSlugs": [
        "aptabase"
      ]
    },
    {
      "title": "d8a.tech has no built-in polished dashboard",
      "description": "Because it's positioned as a warehouse-native ingestion and storage layer, d8a.tech expects teams to connect their own BI or SQL dashboard tooling, unlike Aptabase and Countly Community Edition, which include a dashboard out of the box.",
      "toolSlugs": [
        "d8a-tech"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment",
      "rows": [
        {
          "feature": "Free self-hosting",
          "statuses": {
            "aptabase": "available",
            "countly-community-edition": "available",
            "d8a-tech": "available"
          }
        },
        {
          "feature": "Managed cloud option without self-hosting",
          "statuses": {
            "aptabase": "available",
            "countly-community-edition": "unavailable",
            "d8a-tech": "available"
          },
          "note": "Countly Community Edition is self-hosted only; a hosted route requires the separate commercial Countly product."
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
            "countly-community-edition": "available",
            "d8a-tech": "available"
          }
        },
        {
          "feature": "Built-in polished dashboard",
          "statuses": {
            "aptabase": "available",
            "countly-community-edition": "available",
            "d8a-tech": "limited"
          },
          "note": "d8a.tech's native web tracker and reporting layer are still in beta; it's designed to be paired with external BI tools."
        },
        {
          "feature": "GA4 / Matomo protocol compatibility",
          "statuses": {
            "aptabase": "unavailable",
            "countly-community-edition": "unavailable",
            "d8a-tech": "available"
          }
        }
      ]
    },
    {
      "group": "Engagement and Data Portability",
      "rows": [
        {
          "feature": "Crash and error reporting",
          "statuses": {
            "aptabase": "unavailable",
            "countly-community-edition": "available",
            "d8a-tech": "unavailable"
          }
        },
        {
          "feature": "Push notifications",
          "statuses": {
            "aptabase": "unavailable",
            "countly-community-edition": "available",
            "d8a-tech": "unavailable"
          }
        },
        {
          "feature": "Direct writes to a data warehouse (ClickHouse, BigQuery, S3/GCS)",
          "statuses": {
            "aptabase": "unavailable",
            "countly-community-edition": "not-documented",
            "d8a-tech": "available"
          },
          "note": "Aptabase offers CSV export rather than direct warehouse writes."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these requires the least infrastructure to self-host?",
      "answer": "Aptabase and Countly Community Edition ship as installable server applications with their own database, while d8a.tech expects you to bring a data warehouse such as ClickHouse or BigQuery plus optional object storage, making it the most infrastructure-intensive of the three."
    },
    {
      "question": "Which tool tracks app crashes and sends push notifications?",
      "answer": "Countly Community Edition is the only one of the three with built-in crash reporting and push notifications."
    },
    {
      "question": "Can I migrate my existing GA4 or Matomo tracking without recoding?",
      "answer": "d8a.tech is designed for this — it accepts events through the GA4 Measurement Protocol and Matomo's tracking API, so existing gtag.js or Matomo snippets can often be redirected with little to no code changes."
    },
    {
      "question": "Is there a free managed cloud option if I don't want to self-host?",
      "answer": "Aptabase offers a free managed tier up to 20,000 events per month, and d8a.tech offers a free EU-hosted cloud collector. Countly Community Edition itself is self-hosted only; a hosted option requires the separate commercial Countly product."
    },
    {
      "question": "Which is best suited for regulated industries with strict data residency needs?",
      "answer": "d8a.tech explicitly markets itself toward HIPAA, GDPR, FedRAMP, and SOX-sensitive deployments, including self-hosted and fully air-gapped configurations."
    },
    {
      "question": "Do I need a separate BI tool to use these?",
      "answer": "Aptabase and Countly Community Edition both include a built-in dashboard, so no extra tooling is required. d8a.tech is warehouse-native, so most teams will connect it to dbt, Looker, Metabase, or a similar tool for visualization."
    }
  ]
};

export default aptabaseVsCountlyCommunityEditionVsD8aTechContent;

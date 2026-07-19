import type { GroupComparisonContent } from './types';

const aivenVsCockroachdbVsElasticsearchContent: GroupComparisonContent = {
  "verdict": "Aiven, CockroachDB, and Elasticsearch all come up when engineering teams are architecting their core data infrastructure, but they answer different questions. Aiven is a multi-engine managed hosting platform that runs open-source databases and streaming tools like Postgres, Kafka, and OpenSearch across clouds; CockroachDB is a specific distributed, PostgreSQL-compatible SQL database built to survive node and regional outages; and Elasticsearch is a specific search and analytics engine at the core of the Elastic Stack. Choosing between them mostly comes down to whether the primary need is transactional SQL at scale, full-text search and analytics, or a single managed platform spanning many open-source engines at once.",
  "bestFor": {
    "aiven": "Engineering teams that want one managed platform to run multiple open-source data stores like Postgres, Kafka, and OpenSearch across clouds without deep operational overhead",
    "cockroachdb": "Teams needing a PostgreSQL-compatible, horizontally scalable SQL database that keeps serving reads and writes through node or regional outages",
    "elasticsearch": "Teams whose primary need is full-text search, log analytics and observability, or vector search for AI and retrieval-augmented generation applications"
  },
  "highlights": [
    {
      "title": "One platform, many open-source engines",
      "description": "Aiven's core value is running multiple open-source data tools, PostgreSQL, MySQL, Kafka, ClickHouse, OpenSearch, and more, under one API, console, and billing relationship across AWS, Google Cloud, Azure, and DigitalOcean.",
      "toolSlugs": [
        "aiven"
      ]
    },
    {
      "title": "Built-in multi-region survivability",
      "description": "CockroachDB automatically shards, replicates, and rebalances data using Raft consensus, so a cluster can keep serving reads and writes through a node or even a full regional outage while preserving ACID transaction guarantees.",
      "toolSlugs": [
        "cockroachdb"
      ]
    },
    {
      "title": "The deepest search and observability ecosystem",
      "description": "Elasticsearch anchors the broader Elastic Stack (Logstash, Kibana, Beats) and extends into dedicated Elastic Observability and Elastic Security solutions, plus vector search for AI use cases, going well beyond core database functionality.",
      "toolSlugs": [
        "elasticsearch"
      ]
    },
    {
      "title": "All three offer a genuinely free entry point",
      "description": "Aiven's free tier, CockroachDB's Basic serverless tier that scales to zero, and Elasticsearch's free self-managed license all let teams start testing without paying, though production workloads scale up in cost differently on each.",
      "toolSlugs": [
        "aiven",
        "cockroachdb",
        "elasticsearch"
      ]
    },
    {
      "title": "Different licensing philosophies",
      "description": "Elasticsearch returned to a recognized open-source AGPL license in 2024 after a controversial 2021 relicensing; CockroachDB uses a source-available license that charges companies above $10 million in revenue per CPU core for self-hosting; Aiven monetizes managed hosting of open-source engines rather than the engines' own licensing.",
      "toolSlugs": [
        "elasticsearch",
        "cockroachdb",
        "aiven"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Architecture",
      "rows": [
        {
          "feature": "Fully managed cloud hosting",
          "statuses": {
            "aiven": "available",
            "cockroachdb": "available",
            "elasticsearch": "available"
          },
          "note": "Aiven is itself a managed hosting platform; CockroachDB Cloud and Elastic Cloud are the vendors' own managed offerings"
        },
        {
          "feature": "Self-hosted or on-your-own-infrastructure option",
          "statuses": {
            "aiven": "unavailable",
            "cockroachdb": "available",
            "elasticsearch": "available"
          },
          "note": "Aiven's product is the managed platform itself rather than software you self-host"
        },
        {
          "feature": "Multi-cloud support across AWS, Google Cloud, and Azure",
          "statuses": {
            "aiven": "available",
            "cockroachdb": "available",
            "elasticsearch": "limited"
          },
          "note": "CockroachDB's Advanced tier covers AWS, GCP, and Azure; Elastic Cloud's availability varies by region and tier"
        }
      ]
    },
    {
      "group": "Primary Workload Fit",
      "rows": [
        {
          "feature": "Distributed transactional SQL database",
          "statuses": {
            "aiven": "available",
            "cockroachdb": "available",
            "elasticsearch": "unavailable"
          },
          "note": "Aiven offers this by hosting managed PostgreSQL, MySQL, and similar engines rather than providing its own database engine"
        },
        {
          "feature": "Full-text search and analytics engine",
          "statuses": {
            "aiven": "available",
            "cockroachdb": "unavailable",
            "elasticsearch": "available"
          },
          "note": "Aiven provides this via managed OpenSearch rather than Elasticsearch itself"
        },
        {
          "feature": "Vector search for AI/RAG workloads",
          "statuses": {
            "aiven": "not-documented",
            "cockroachdb": "available",
            "elasticsearch": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing and Licensing",
      "rows": [
        {
          "feature": "Free tier available without a credit card",
          "statuses": {
            "aiven": "available",
            "cockroachdb": "available",
            "elasticsearch": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Aiven offer Elasticsearch as one of its managed services?",
      "answer": "Aiven offers managed OpenSearch, the Apache-licensed fork of Elasticsearch created after Elastic's 2021 relicensing, rather than Elasticsearch itself."
    },
    {
      "question": "Is CockroachDB a drop-in replacement for PostgreSQL?",
      "answer": "It's wire-compatible with PostgreSQL, so most standard drivers, ORMs, and tools work as expected, but its distributed architecture and multi-region survivability model are fundamentally different from a single-node Postgres instance."
    },
    {
      "question": "Which of the three is free to self-host?",
      "answer": "Elasticsearch is free to self-manage under its AGPL, SSPL, or Elastic License options. CockroachDB is free to self-host for companies under $10 million in annual revenue, with per-CPU-core fees above that. Aiven isn't something you self-host; it's a managed platform for hosting the underlying open-source engines."
    },
    {
      "question": "Which is best for AI and retrieval-augmented generation (RAG) workloads?",
      "answer": "Both CockroachDB and Elasticsearch offer vector search capabilities, but Elasticsearch has invested more heavily and for longer in dense vector fields and approximate nearest-neighbor search as part of its core positioning as a vector database."
    },
    {
      "question": "Do Aiven, CockroachDB, and Elasticsearch actually compete head-to-head?",
      "answer": "Not directly in most cases. Aiven can host a Postgres or OpenSearch instance that competes with CockroachDB or Elasticsearch on specific dimensions, but the three are typically evaluated as different pieces of a data infrastructure decision rather than as interchangeable alternatives for the exact same job."
    }
  ]
};

export default aivenVsCockroachdbVsElasticsearchContent;

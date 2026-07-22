import type { ToolComparisonContent } from './types';

const hyperdxVsOpenobserveContent: ToolComparisonContent = {
  "verdict": "HyperDX is a ClickHouse-powered observability platform emphasizing fast search, correlated session replay, and automatic log pattern clustering, priced by flat storage tiers starting at $20/month, while OpenObserve is a broader unified observability platform using low-cost Parquet-based object storage with usage-based per-GB Cloud pricing and an AI Assistant for natural-language queries. Both are open source with free self-hosted tiers, but they optimize for different priorities: HyperDX for query speed and session-level debugging, OpenObserve for storage cost efficiency and AI-assisted analysis.",
  "bestForToolA": "Teams wanting ClickHouse-backed, terabyte-scale log and trace search with correlated session replay and automatic pattern clustering, on a flat monthly storage plan starting at $20/month with unlimited users.",
  "bestForToolB": "Teams wanting a unified logs/metrics/traces/RUM platform with AI-assisted natural-language queries and root-cause analysis, either self-hosted free up to 50 GB/day or on Cloud at usage-based per-GB pricing.",
  "whoNeedsBoth": "There isn't a strong case for running both together; they overlap almost entirely as open-source, OpenTelemetry-compatible, self-hostable observability platforms, so teams would typically standardize on one rather than split telemetry data across two competing systems.",
  "keyDifferences": [
    {
      "title": "Underlying Data Engine",
      "toolA": "HyperDX is explicitly ClickHouse-powered, built for searching terabytes of events in seconds, and was later acquired by ClickHouse itself.",
      "toolB": "OpenObserve uses Apache Parquet columnar compression on object storage, optimized for lower storage cost rather than a named high-speed query engine.",
      "whyItMatters": "Query engine choice affects both search speed at scale and storage cost trade-offs.",
      "benefitsWho": "Teams prioritizing fast search across huge event volumes benefit from HyperDX's ClickHouse foundation; teams prioritizing storage cost benefit from OpenObserve's Parquet compression."
    },
    {
      "title": "Log Pattern Analysis",
      "toolA": "HyperDX includes Automatic Pattern Clustering, condensing billions of log events into recognizable patterns.",
      "toolB": "OpenObserve does not document a comparable automatic log pattern clustering feature.",
      "whyItMatters": "Pattern clustering helps engineers quickly spot anomalies in massive log volumes without manual filtering.",
      "benefitsWho": "Teams triaging high-volume log noise benefit from HyperDX's pattern clustering."
    },
    {
      "title": "Pricing Model",
      "toolA": "HyperDX charges flat monthly tiers by storage volume, $20/month for 50 GB with unlimited users, plus $0.40/GB overage.",
      "toolB": "OpenObserve's Cloud plan charges per-GB for both ingestion ($0.50/GB) and query ($0.01/GB) separately.",
      "whyItMatters": "Flat storage-tier pricing with unlimited users is easier to budget for growing teams than combined ingestion-plus-query metering.",
      "benefitsWho": "Growing teams adding many users benefit from HyperDX's unlimited-user Starter plan; teams optimizing for low, predictable data volume benefit from OpenObserve's granular per-GB pricing."
    },
    {
      "title": "Ownership and Backing",
      "toolA": "HyperDX was built by Y Combinator-backed DeploySentinel, Inc. and later acquired by ClickHouse, adding stability and resources; it's headquartered in San Francisco.",
      "toolB": "OpenObserve does not document VC backing or acquisition history; it's headquartered in Menlo Park, California.",
      "whyItMatters": "Backing and ownership history can signal long-term product stability and investment.",
      "benefitsWho": "Buyers weighing vendor longevity may value HyperDX's documented YC backing and ClickHouse acquisition."
    },
    {
      "title": "AI-Assisted Querying",
      "toolA": "HyperDX does not document AI-powered querying or automated root-cause analysis features.",
      "toolB": "OpenObserve includes an AI Assistant and SRE Agent for natural-language queries and automated root-cause analysis on Cloud/Enterprise plans.",
      "whyItMatters": "AI-assisted querying can reduce the query-language expertise needed to investigate incidents.",
      "benefitsWho": "Teams without deep SQL/PromQL expertise benefit from OpenObserve's AI Assistant."
    }
  ],
  "featureMatrix": [
    {
      "group": "Data Collection & Search",
      "rows": [
        {
          "feature": "ClickHouse-powered query engine",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "End-to-end distributed tracing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Automatic log pattern clustering",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "No-query chart builder",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "OpenTelemetry support",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Session & User Monitoring",
      "rows": [
        {
          "feature": "Correlated session replay",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Real user monitoring (RUM)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Named alert integrations (Slack/email/PagerDuty)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Compliance",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "HyperDX: 3 GB/month, 3-day retention; OpenObserve: unlimited OSS, or 50 GB/day Enterprise free"
        },
        {
          "feature": "Paid starting price",
          "toolA": "available",
          "toolB": "available",
          "note": "HyperDX: $20/month for 50GB; OpenObserve: $0.50/GB ingestion"
        },
        {
          "feature": "AI-assisted querying",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "SOC 2 certification",
          "toolA": "available",
          "toolB": "available",
          "note": "HyperDX: Type II; OpenObserve: Type II + ISO 27001"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which platform uses ClickHouse?",
      "answer": "HyperDX is explicitly ClickHouse-powered and was later acquired by ClickHouse. OpenObserve uses its own Parquet-based object storage approach and isn't documented as ClickHouse-based."
    },
    {
      "question": "Which is cheaper for low-volume use?",
      "answer": "HyperDX's free tier gives 3 GB/month with 3-day retention. OpenObserve's Open Source Edition is free with unlimited usage if self-hosted, though its Cloud plan starts at $0.50/GB ingestion."
    },
    {
      "question": "Does either tool offer AI-assisted querying?",
      "answer": "OpenObserve documents an AI Assistant and SRE Agent for natural-language queries and root-cause analysis on Cloud/Enterprise plans. This isn't a documented HyperDX feature."
    },
    {
      "question": "Are both tools open source?",
      "answer": "Yes, both HyperDX and OpenObserve are open source with self-hosted options."
    },
    {
      "question": "Who owns or backs these companies?",
      "answer": "HyperDX was built by Y Combinator-backed DeploySentinel and later acquired by ClickHouse. OpenObserve's ownership and backing aren't documented; it's headquartered in Menlo Park, California."
    },
    {
      "question": "Which tool has automatic log pattern clustering?",
      "answer": "HyperDX documents this explicitly, condensing billions of log events into recognizable patterns. This isn't a documented OpenObserve feature."
    }
  ]
};

export default hyperdxVsOpenobserveContent;

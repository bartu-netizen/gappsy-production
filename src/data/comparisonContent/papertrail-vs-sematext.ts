import type { ToolComparisonContent } from './types';

const papertrailVsSematextContent: ToolComparisonContent = {
  "verdict": "Papertrail, backed by SolarWinds, is a focused log aggregation tool with a single volume-tiered pricing ladder and a permanent (if limited) free tier. Sematext is a broader observability platform spanning logs, infrastructure, tracing, RUM, and synthetic monitoring, priced pay-as-you-go per product with a 14-day trial instead of a permanent free tier. The tradeoff is simplicity and predictability versus breadth and per-product flexibility.",
  "bestForToolA": "Teams that just need centralized log aggregation and live search with a simple, transparent volume-based price ladder, and want a permanent (if limited) free tier.",
  "bestForToolB": "Teams that want logs, infrastructure/Kubernetes monitoring, distributed tracing, RUM, and synthetic/uptime checks under one vendor with pay-as-you-go, no-contract pricing, even if that means configuring several separate product plans.",
  "whoNeedsBoth": "Teams that already rely on Papertrail for simple log search may add Sematext's infrastructure or Kubernetes monitoring products specifically if they need container-level visibility that Papertrail's facts don't document.",
  "keyDifferences": [
    {
      "title": "Product scope",
      "toolA": "Focused solely on real-time log aggregation, search, and alert integrations.",
      "toolB": "Bundles log monitoring, infrastructure/container/Kubernetes monitoring, distributed tracing, real user & synthetic monitoring, and uptime/API/SSL checks.",
      "whyItMatters": "A broader platform can replace multiple point tools, but requires evaluating and pricing several products instead of one.",
      "benefitsWho": "Teams wanting one vendor for logs plus infrastructure and tracing versus teams that only need log search."
    },
    {
      "title": "Free tier vs. free trial",
      "toolA": "Includes a permanent free tier covering 50MB/month of logs with 48-hour retention.",
      "toolB": "No permanent free tier; instead offers a 14-day free trial across all products with no credit card required.",
      "whyItMatters": "A permanent free tier suits ongoing low-volume use, while a trial suits full evaluation before a paid commitment.",
      "benefitsWho": "Hobbyists and small projects (Papertrail's permanent free tier) versus teams doing a time-boxed proof-of-concept (Sematext's trial)."
    },
    {
      "title": "Pricing structure",
      "toolA": "Single volume-tiered ladder: Free, Small $7/month (1GB), Medium $40/month (10GB), Large $230/month (100GB), Enterprise custom.",
      "toolB": "Each product is priced and billed separately: Logs Basic $5/month, Infrastructure Basic $2.80/month per host, Service Monitoring Basic $8.64/month per agent, Tracing Basic $19/month, User Experience Startup $9/month, Synthetic pay-as-you-go per monitor.",
      "whyItMatters": "A single price ladder is simpler to forecast; per-product pricing offers more granular control but requires configuring multiple line items to estimate total cost.",
      "benefitsWho": "Finance/budget owners wanting one predictable line item versus technical buyers who want to pay only for the specific products they use."
    },
    {
      "title": "Data retention",
      "toolA": "Free tier retention is limited to 48 hours; paid tier retention scales with plan (not itemized beyond volume tiers).",
      "toolB": "Basic-tier retention varies by product: 7-day for logs, 1-day for infrastructure/service monitoring/tracing, 30-day for synthetic monitoring.",
      "whyItMatters": "Retention length determines how far back a team can search logs or traces when investigating an incident.",
      "benefitsWho": "Teams needing to search recent history quickly after an incident is reported days later."
    },
    {
      "title": "Infrastructure/Kubernetes monitoring",
      "toolA": "Not documented in the facts reviewed; Papertrail's features are log-aggregation only.",
      "toolB": "Explicit server, container, Kubernetes, and process-level infrastructure monitoring.",
      "whyItMatters": "Container and Kubernetes visibility is essential for teams running containerized workloads, not just log search.",
      "benefitsWho": "DevOps/platform teams running Kubernetes or containerized infrastructure."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Logging",
      "rows": [
        {
          "feature": "Real-time log aggregation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Live search and filtering",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Alert integrations (Slack, PagerDuty)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Observability Beyond Logs",
      "rows": [
        {
          "feature": "Infrastructure/container/Kubernetes monitoring",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Distributed tracing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "OpenTelemetry-supported."
        },
        {
          "feature": "Real user & synthetic monitoring",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Uptime/API/SSL monitoring",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Status pages & incident management",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Permanent free tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Sematext offers a 14-day trial instead."
        },
        {
          "feature": "Pay-as-you-go, no contract pricing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Unlimited users on plans",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is there a free Papertrail plan?",
      "answer": "Yes, a free tier covering 50MB/month of logs with 48-hour retention."
    },
    {
      "question": "Does Sematext offer a free trial?",
      "answer": "Yes, a 14-day free trial is available across all its products with no credit card required, though there is no permanent free tier."
    },
    {
      "question": "What's the cheapest paid Papertrail plan?",
      "answer": "Plans start around $7/month for 1GB of monthly log volume."
    },
    {
      "question": "How is Sematext priced?",
      "answer": "Pay-as-you-go, based on data volume, with logs, infrastructure, tracing, RUM, and synthetic monitoring billed as separate products with no contracts."
    },
    {
      "question": "Who owns Papertrail?",
      "answer": "Papertrail is owned and operated by SolarWinds."
    },
    {
      "question": "Does Sematext support Kubernetes?",
      "answer": "Yes, its infrastructure and container monitoring includes Kubernetes support; this is not documented for Papertrail."
    }
  ]
};

export default papertrailVsSematextContent;

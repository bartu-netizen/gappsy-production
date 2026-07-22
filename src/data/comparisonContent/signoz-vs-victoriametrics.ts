import type { ToolComparisonContent } from './types';

const signozVsVictoriametricsContent: ToolComparisonContent = {
  "verdict": "SigNoz is a unified, OpenTelemetry-native observability platform with its own UI for traces, metrics, logs, and LLM observability. VictoriaMetrics is primarily a high-performance, Prometheus-compatible time series database for metrics, extended by companion products VictoriaLogs and VictoriaTraces rather than a single integrated front-end. Teams choosing between them are often choosing between an all-in-one observability UI (SigNoz) and a best-in-class metrics storage engine that plugs into existing PromQL tooling (VictoriaMetrics).",
  "bestForToolA": "Teams that want an integrated observability UI covering traces, logs, metrics, and LLM/AI observability out of the box, with agent-native MCP integration for tools like Claude Code and Cursor.",
  "bestForToolB": "Teams already invested in Prometheus/PromQL who need a drop-in, high-performance replacement that scales from a single Raspberry Pi to thousand-core clusters, used at scale by organizations like CERN, Adidas, Spotify, and Grammarly.",
  "whoNeedsBoth": "A platform team already running Prometheus-compatible infrastructure could use VictoriaMetrics as the underlying high-performance metrics storage and query engine at scale while layering SigNoz on top for its integrated tracing/log UI and LLM observability features, though this would require custom integration since the facts don't document a direct SigNoz-VictoriaMetrics integration.",
  "keyDifferences": [
    {
      "title": "Product Scope",
      "toolA": "SigNoz is a unified observability platform (traces, metrics, logs, LLM observability) with its own integrated UI and dashboards.",
      "toolB": "VictoriaMetrics is primarily a high-performance time series database, extended by separate companion products VictoriaLogs (logs) and VictoriaTraces (traces) rather than a single integrated UI-first platform.",
      "whyItMatters": "An all-in-one platform reduces the number of tools to operate, while a best-of-breed database can be paired with whatever front-end a team prefers.",
      "benefitsWho": "Teams that want one UI (SigNoz) versus teams building a custom observability stack around a high-performance storage engine (VictoriaMetrics)."
    },
    {
      "title": "Prometheus Compatibility",
      "toolA": "SigNoz's facts don't document Prometheus/PromQL compatibility, positioning it as OpenTelemetry-native instead.",
      "toolB": "VictoriaMetrics is built as a drop-in replacement for Prometheus, supporting existing PromQL-based dashboards and alerting rules for easy migration.",
      "whyItMatters": "Teams with existing Prometheus/PromQL dashboards and alerts want a migration path that doesn't require rewriting them.",
      "benefitsWho": "Organizations with an existing Prometheus deployment looking to scale without rebuilding dashboards."
    },
    {
      "title": "Scale and Named Adoption",
      "toolA": "SigNoz cites 25,000+ GitHub stars and 140+ contributors, without naming specific large enterprise customers in the facts.",
      "toolB": "VictoriaMetrics cites large-scale users including CERN, Adidas, Spotify, and Grammarly, with 17K+ GitHub stars and over 1 billion Docker pulls.",
      "whyItMatters": "Named large-scale production usage is a useful signal for teams evaluating whether a tool holds up at high data volumes.",
      "benefitsWho": "Infrastructure teams at large-scale organizations that want proof of production usage at similar scale."
    },
    {
      "title": "AI and LLM Capabilities",
      "toolA": "SigNoz documents LLM/AI observability (tracking LLM calls and usage) plus an AI teammate (Noz) and agent-native integration with Claude Code and Cursor via MCP.",
      "toolB": "VictoriaMetrics's AI-related capability is limited to Enterprise-tier anomaly detection on top of the core metrics database, without LLM-specific observability or MCP-based agent integration documented.",
      "whyItMatters": "Teams building LLM-powered applications need observability tooling that understands model calls specifically, not just infrastructure metrics.",
      "benefitsWho": "Teams shipping LLM features that want call-level observability (SigNoz) versus teams that primarily need anomaly detection on metrics (VictoriaMetrics)."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "SigNoz publishes concrete Cloud pricing: a $49/month usage credit, $0.30/GB for traces/logs, $0.10 per million metric samples, plus a $19/month Startup Program.",
      "toolB": "VictoriaMetrics's Enterprise and Cloud tiers are both listed as custom/contact sales, with no published starting price.",
      "whyItMatters": "Published pricing lets teams estimate cost before engaging sales, while custom pricing requires a sales conversation.",
      "benefitsWho": "Smaller teams and startups that want to estimate observability costs upfront (favors SigNoz)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Data Types & Compatibility",
      "rows": [
        {
          "feature": "Metrics storage/querying",
          "toolA": "available",
          "toolB": "available",
          "note": "VictoriaMetrics: core product"
        },
        {
          "feature": "Distributed tracing",
          "toolA": "available",
          "toolB": "available",
          "note": "SigNoz: integrated; VictoriaMetrics: via VictoriaTraces"
        },
        {
          "feature": "Log management",
          "toolA": "available",
          "toolB": "available",
          "note": "SigNoz: integrated; VictoriaMetrics: via VictoriaLogs"
        },
        {
          "feature": "Prometheus/PromQL compatibility",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "VictoriaMetrics: drop-in replacement"
        }
      ]
    },
    {
      "group": "Scale & Deployment",
      "rows": [
        {
          "feature": "Self-hosted free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "SigNoz: Community Edition; VictoriaMetrics: Open Source"
        },
        {
          "feature": "Kubernetes operator",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Elastic scalability (single node to distributed clusters)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "VictoriaMetrics: Raspberry Pi to thousand-core clusters"
        },
        {
          "feature": "Managed cloud offering",
          "toolA": "available",
          "toolB": "available",
          "note": "SigNoz: from $49/month; VictoriaMetrics: custom pricing"
        }
      ]
    },
    {
      "group": "AI & Pricing",
      "rows": [
        {
          "feature": "LLM/AI observability",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "AI-based anomaly detection",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "VictoriaMetrics: Enterprise tier"
        },
        {
          "feature": "Agent-native MCP integration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "SigNoz: Claude Code, Cursor"
        },
        {
          "feature": "Published starting price for paid tiers",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "SigNoz: $49/month Teams"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is VictoriaMetrics a replacement for Prometheus?",
      "answer": "Yes, VictoriaMetrics is designed as a drop-in replacement for Prometheus and supports existing PromQL-based dashboards and alerting rules."
    },
    {
      "question": "Does SigNoz support PromQL?",
      "answer": "SigNoz's facts don't document PromQL compatibility; it's positioned as OpenTelemetry-native instead."
    },
    {
      "question": "Are both SigNoz and VictoriaMetrics free to self-host?",
      "answer": "Yes, both offer a free, open-source self-hosted option: SigNoz's Community Edition and VictoriaMetrics's Open Source edition."
    },
    {
      "question": "Does VictoriaMetrics include LLM observability?",
      "answer": "No, VictoriaMetrics's facts don't document LLM-specific observability; its AI-related capability is Enterprise-tier anomaly detection on the core metrics database."
    },
    {
      "question": "How is SigNoz Cloud priced compared to VictoriaMetrics Cloud?",
      "answer": "SigNoz publishes concrete usage-based pricing ($49/month credit, then per-GB and per-sample rates). VictoriaMetrics's Cloud and Enterprise tiers are both listed as custom pricing requiring a sales contact."
    },
    {
      "question": "What companion products does VictoriaMetrics offer besides the metrics database?",
      "answer": "VictoriaMetrics's ecosystem also includes VictoriaLogs for log storage and VictoriaTraces for distributed tracing."
    }
  ]
};

export default signozVsVictoriametricsContent;

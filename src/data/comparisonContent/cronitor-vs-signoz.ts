import type { ToolComparisonContent } from './types';

const cronitorVsSignozContent: ToolComparisonContent = {
  "verdict": "Cronitor is a monitoring platform focused on cron/background job monitoring, uptime checks, and heartbeats. SigNoz is a full open-source observability platform unifying distributed tracing, log management, metrics dashboards, and LLM/AI observability. Cronitor tells you whether a scheduled process or site is up; SigNoz shows you what's happening inside your application's requests, logs, and metrics, including LLM calls.",
  "bestForToolA": "Teams that specifically need to monitor cron jobs, background tasks, and heartbeats alongside basic uptime checks, on usage-based pricing at $2/monitor/month.",
  "bestForToolB": "Engineering teams that need integrated distributed tracing, log management, and metrics dashboards, especially those building LLM-powered applications who want dedicated LLM/AI observability and agent-native integration with Claude Code and Cursor via MCP.",
  "whoNeedsBoth": "An engineering team could use SigNoz for deep application observability, tracing, logs, metrics, and LLM call monitoring across their services, while using Cronitor specifically for cron/background job monitoring and heartbeat checks that SigNoz's facts don't document, covering both application internals and scheduled job reliability.",
  "keyDifferences": [
    {
      "title": "Observability Scope",
      "toolA": "Cronitor is a monitoring platform focused on cron/background job monitoring, uptime checks, and heartbeats, without documented tracing or log management features.",
      "toolB": "SigNoz is a full observability platform covering distributed tracing, application performance monitoring, and log management alongside metrics dashboards, in one integrated system.",
      "whyItMatters": "Teams debugging application-level performance issues need tracing and logs, not just uptime pings.",
      "benefitsWho": "Backend engineering teams that need to trace requests across microservices, versus ops teams that just need to know jobs ran."
    },
    {
      "title": "Self-Hosting Availability",
      "toolA": "Cronitor's facts document no self-hosted or open-source option; it's a hosted SaaS product only.",
      "toolB": "SigNoz offers a free, open-source, self-hosted Community Edition with full access to core observability features.",
      "whyItMatters": "Self-hosting matters for teams with data residency requirements or that want to avoid usage-based cloud billing.",
      "benefitsWho": "Teams that need to keep telemetry data on their own infrastructure."
    },
    {
      "title": "LLM and AI-Native Observability",
      "toolA": "Cronitor's facts don't document any LLM-specific monitoring capability.",
      "toolB": "SigNoz documents dedicated LLM/AI observability (tracking LLM calls, performance, usage) and agent-native observability integrating with Claude Code and Cursor via OpenTelemetry and MCP.",
      "whyItMatters": "Teams building AI/LLM features need visibility into model call latency, cost, and usage patterns specifically.",
      "benefitsWho": "Teams shipping LLM-powered features that need to monitor model calls alongside standard application telemetry."
    },
    {
      "title": "Pricing Model",
      "toolA": "Cronitor's Business plan is priced per monitor at $2/monitor/month, plus per-user add-ons at $5/month each.",
      "toolB": "SigNoz Cloud uses usage-based pricing: a $49/month credit, then $0.30/GB for traces/logs and $0.10 per million metric samples, with no per-monitor or per-user fees.",
      "whyItMatters": "Per-monitor pricing scales with the number of checks, while usage-based data pricing scales with telemetry volume, which suits different workload shapes.",
      "benefitsWho": "Teams with many small monitors versus teams generating high-volume trace/log/metric data."
    },
    {
      "title": "Compliance and Enterprise Tiers",
      "toolA": "Cronitor's Enterprise plan starts at $6,000/year and includes a dedicated engineer, but no SOC2/HIPAA compliance is documented.",
      "toolB": "SigNoz's Cloud plan is documented as SOC 2 Type II and HIPAA compliant, with US, EU, and India regions; Enterprise starts at $4,000/month.",
      "whyItMatters": "Regulated industries (healthcare, finance) often require SOC2/HIPAA compliance from observability vendors.",
      "benefitsWho": "Compliance teams at healthcare or regulated companies evaluating observability vendors."
    }
  ],
  "featureMatrix": [
    {
      "group": "Observability Coverage",
      "rows": [
        {
          "feature": "Distributed tracing",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Log management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Cron/background job monitoring",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Heartbeat monitoring",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Uptime/website monitoring",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Cronitor: 12+ locations"
        },
        {
          "feature": "Metrics dashboards",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & AI",
      "rows": [
        {
          "feature": "Self-hosted/open-source option",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SigNoz Community Edition, free"
        },
        {
          "feature": "LLM/AI observability",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI teammate/assistant",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SigNoz: Noz, MCP Server (Teams plan)"
        },
        {
          "feature": "Agent-native (Claude Code/Cursor via OTel+MCP)",
          "toolA": "not-documented",
          "toolB": "available"
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
          "note": "Cronitor: Hacker plan, 5 monitors; SigNoz: Community Edition"
        },
        {
          "feature": "Pricing model",
          "toolA": "available",
          "toolB": "available",
          "note": "Cronitor: per-monitor; SigNoz: usage-based"
        },
        {
          "feature": "Startup discount program",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SigNoz: $19/month"
        },
        {
          "feature": "SOC2/HIPAA compliance",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SigNoz Cloud"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is SigNoz an alternative to Cronitor?",
      "answer": "Only partially. SigNoz is a full observability platform (tracing, logs, metrics), while Cronitor is focused on cron/background job monitoring, uptime, and heartbeats. Teams needing both application observability and job monitoring may need both."
    },
    {
      "question": "Does Cronitor offer a self-hosted option?",
      "answer": "Cronitor's facts don't document a self-hosted or open-source option; it's offered as a hosted SaaS product."
    },
    {
      "question": "Does SigNoz monitor cron jobs?",
      "answer": "SigNoz's facts don't document cron job monitoring; it's focused on distributed tracing, log management, metrics, and LLM observability."
    },
    {
      "question": "How is SigNoz Cloud priced compared to Cronitor Business?",
      "answer": "SigNoz Cloud uses usage-based pricing ($49/month credit, then $0.30/GB for traces/logs and $0.10 per million metric samples), while Cronitor's Business plan charges $2/monitor/month plus $5/month per additional user."
    },
    {
      "question": "Does either tool include LLM observability?",
      "answer": "Yes, SigNoz documents dedicated LLM/AI observability for tracking LLM calls, performance, and usage. Cronitor's facts don't document this capability."
    },
    {
      "question": "Which tool is free to self-host?",
      "answer": "SigNoz offers a free, open-source, self-hosted Community Edition. Cronitor's facts don't document a self-hosted option."
    }
  ]
};

export default cronitorVsSignozContent;

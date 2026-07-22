import type { ToolComparisonContent } from './types';

const honeycombVsUptraceContent: ToolComparisonContent = {
  "verdict": "Honeycomb and Uptrace are both OpenTelemetry-native observability platforms, but differ sharply in pricing philosophy and deployment flexibility: Honeycomb offers a generous hosted free tier (up to 20M events/month) and a $150/month Pro plan, with strengths in automated anomaly analysis (BubbleUp) and AI/LLM workflow debugging. Uptrace is built on a ClickHouse backend with a free, unlimited self-hosted Community Edition plus transparent per-GB Cloud pricing starting at $0.075/GB, emphasizing deployment flexibility (Cloud, self-hosted, Kubernetes, Ansible, Docker) and OTel Arrow compression claimed at 15-30x.",
  "bestForToolA": "Honeycomb fits teams that want a fully managed, hosted platform with a large free tier, automated root-cause analysis via BubbleUp, and dedicated Agent Timeline / LLM Observability views for debugging AI-powered applications.",
  "bestForToolB": "Uptrace fits teams that want the option to self-host for free with unlimited usage via its open-source Community Edition, or pay transparent per-GB Cloud pricing from $0.075/GB with no seat or host-count charges, and that need flexible deployment across Kubernetes, Ansible, or Docker.",
  "whoNeedsBoth": "There's no clear complementary use case here — both are OpenTelemetry-native observability backends competing directly for the same traces/metrics/logs pipeline, so a team would choose one as its primary telemetry backend rather than run both.",
  "keyDifferences": [
    {
      "title": "Self-Hosting Option",
      "toolA": "Honeycomb does not document a self-hosted or open-source deployment option; it is a hosted SaaS platform.",
      "toolB": "Uptrace offers a free, unlimited, open-source Community Edition that can be self-hosted, alongside Cloud, Kubernetes, Ansible, and Docker deployment options.",
      "whyItMatters": "Teams with data residency requirements or a preference to avoid vendor lock-in can self-host with Uptrace but not with Honeycomb.",
      "benefitsWho": "Organizations that require full control over where telemetry data is stored."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Honeycomb uses tiered plans: free up to 20M events/100M metrics data points per month, then $150/month for the Pro plan (up to 750M events/month), then custom Enterprise pricing.",
      "toolB": "Uptrace uses transparent per-GB pricing on Cloud starting at $0.075/GB for traces and logs, with no seat or host-count charges, plus a free Cloud tier of 50GB storage and 5,000 timeseries/month.",
      "whyItMatters": "Uptrace's per-GB model scales without penalizing team size or number of hosts, while Honeycomb's tiers are based on event/data-point volume.",
      "benefitsWho": "Teams with many hosts or services that want to avoid per-seat or per-host pricing penalties."
    },
    {
      "title": "Backend Architecture",
      "toolA": "Honeycomb's backend architecture is not detailed in the available facts beyond its OpenTelemetry-native design.",
      "toolB": "Uptrace is explicitly built on a ClickHouse backend and uses the OTel Arrow protocol, claimed to deliver 15-30x compression over raw telemetry data.",
      "whyItMatters": "Uptrace's documented compression technology is a specific, named efficiency claim that directly affects storage cost at scale.",
      "benefitsWho": "Engineering teams evaluating storage efficiency and cost at high telemetry volumes."
    },
    {
      "title": "AI-Assisted Debugging",
      "toolA": "Honeycomb offers Honeycomb Intelligence (Canvas AI copilot, MCP integration) plus a dedicated Agent Timeline and LLM Observability view for debugging AI agent workflows.",
      "toolB": "Uptrace supports AI Assistant Integration, letting users query telemetry data via MCP-compatible AI assistants such as Claude Code, Cursor, and GitHub Copilot.",
      "whyItMatters": "Honeycomb's AI tooling is purpose-built with a dedicated UI (Agent Timeline) for LLM workflow debugging, while Uptrace's AI integration is about querying existing telemetry through external MCP-compatible assistants.",
      "benefitsWho": "Teams debugging AI-agent-powered applications who want either a dedicated visualization (Honeycomb) or MCP-based querying from their existing coding assistant (Uptrace)."
    },
    {
      "title": "SSO and Enterprise Access Control",
      "toolA": "Honeycomb's SSO and Agent Timeline require the paid Pro tier or above.",
      "toolB": "Uptrace documents SAML/OIDC single sign-on as a feature without specifying which tier it requires.",
      "whyItMatters": "Enterprise buyers need to confirm whether SSO is gated behind a paid tier before assuming it's included.",
      "benefitsWho": "IT and security teams enforcing single sign-on across observability tooling."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Observability",
      "rows": [
        {
          "feature": "Distributed tracing",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Metrics",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Logs",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Service map / dependency visualization",
          "toolA": "available",
          "toolB": "available",
          "note": "Honeycomb: Service Map. Uptrace: Service Graph & APM."
        },
        {
          "feature": "Auto-instrumentation across languages",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Uptrace: 11+ languages."
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "Automated root-cause/anomaly analysis",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Honeycomb's BubbleUp."
        },
        {
          "feature": "AI assistant / MCP integration",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Dedicated LLM/agent debugging view",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Honeycomb's Agent Timeline."
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Honeycomb: 20M events/month. Uptrace Cloud: 50GB + 5,000 timeseries/month."
        },
        {
          "feature": "Self-hosted / open source edition",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Uptrace Community Edition, free and unlimited."
        },
        {
          "feature": "SSO",
          "toolA": "limited",
          "toolB": "available",
          "note": "Honeycomb SSO requires Pro tier or above."
        },
        {
          "feature": "Kubernetes/Ansible/Docker deployment",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can Uptrace be self-hosted for free?",
      "answer": "Yes, Uptrace offers a free, unlimited, open-source Community Edition that can be self-hosted. Honeycomb does not document a self-hosted option and is hosted SaaS only."
    },
    {
      "question": "How does pricing compare between Honeycomb and Uptrace?",
      "answer": "Honeycomb uses tiered plans based on event volume: free up to 20M events/month, then $150/month for Pro. Uptrace Cloud uses transparent per-GB pricing starting at $0.075/GB for traces and logs, with a free tier of 50GB storage and 5,000 timeseries/month, plus a completely free self-hosted Community Edition."
    },
    {
      "question": "What is Uptrace's OTel Arrow compression?",
      "answer": "Uptrace uses the OTel Arrow protocol, which it claims delivers 15-30x compression over raw telemetry data, helping reduce storage costs at scale."
    },
    {
      "question": "Does Honeycomb support AI coding assistants like Claude Code?",
      "answer": "Honeycomb offers MCP integration as part of Honeycomb Intelligence. Uptrace explicitly documents support for querying telemetry via MCP-compatible AI assistants such as Claude Code, Cursor, and GitHub Copilot."
    },
    {
      "question": "What is BubbleUp and does Uptrace have an equivalent?",
      "answer": "BubbleUp is Honeycomb's automated root cause analysis feature that highlights dimensions most correlated with an anomaly. Uptrace does not document a directly equivalent automated anomaly-correlation feature."
    },
    {
      "question": "Which platform offers more deployment flexibility?",
      "answer": "Uptrace offers Cloud, self-hosted, Kubernetes, Ansible, and Docker deployment options. Honeycomb's deployment model is not documented beyond its hosted SaaS platform."
    }
  ]
};

export default honeycombVsUptraceContent;

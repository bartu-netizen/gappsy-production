import type { ToolComparisonContent } from './types';

const netdataVsVictoriametricsContent: ToolComparisonContent = {
  "verdict": "Netdata is a full monitoring platform — an agent-based system that collects, visualizes, and analyzes infrastructure metrics with AI-powered anomaly detection built in. VictoriaMetrics is an open-source time series database designed to store and query metrics (and, via companion products, logs and traces) at scale, typically feeding a separate visualization layer like Grafana. Netdata suits teams that want an out-of-the-box dashboard and alerting experience per node; VictoriaMetrics suits teams that need a high-performance, Prometheus-compatible storage backend they can scale independently.",
  "bestForToolA": "Teams that want per-second, zero-configuration monitoring with 800+ auto-discovered integrations and built-in AI anomaly detection, without assembling a separate metrics-storage-plus-dashboard stack.",
  "bestForToolB": "Teams already running Prometheus/PromQL-based dashboards and alerting who need a drop-in, higher-performance storage backend that scales from a single Raspberry Pi to thousand-core clusters, plus companion log (VictoriaLogs) and trace (VictoriaTraces) storage.",
  "whoNeedsBoth": "A platform team could run Netdata agents on every node for real-time per-second visibility and AI-driven anomaly alerts, while remote-writing that same metric data into VictoriaMetrics for long-term, cost-efficient retention and centralized PromQL querying across the fleet.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "Netdata is a full monitoring platform combining an agent, dashboards, alerting, and AI-powered troubleshooting.",
      "toolB": "VictoriaMetrics is a time series database and query engine, often paired with a separate visualization layer.",
      "whyItMatters": "Buyers evaluating 'which tool to deploy' need to know whether they're picking an end-to-end platform or a storage component.",
      "benefitsWho": "Teams that don't already have a monitoring stack benefit from Netdata's completeness; teams with existing Prometheus dashboards benefit from VictoriaMetrics's focused role."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Netdata publishes exact numbers: free Community tier (up to 5 nodes), $90/year Homelab (unlimited non-commercial nodes), and $4.50/node/month Business.",
      "toolB": "VictoriaMetrics's open-source core is free with no licensing fees, but Enterprise and Cloud pricing are custom and require contacting sales.",
      "whyItMatters": "Predictable per-node pricing is easier to budget for than sales-quote pricing.",
      "benefitsWho": "Small-to-mid teams who want to model costs upfront benefit from Netdata's published rates; large deployments negotiating custom terms may prefer VictoriaMetrics's sales-led Enterprise track."
    },
    {
      "title": "AI-Powered Features",
      "toolA": "Netdata includes ML anomaly detection and automated root cause/blast-radius analysis as part of its core AI-powered troubleshooting.",
      "toolB": "VictoriaMetrics's Enterprise edition adds AI/ML-based anomaly detection on top of the free core database — it's not in the open-source version.",
      "whyItMatters": "Whether AI-driven investigation is included by default or gated behind a paid Enterprise tier changes the effective cost of getting it.",
      "benefitsWho": "Teams wanting AI analysis without a custom Enterprise negotiation benefit from Netdata's Business-tier inclusion."
    },
    {
      "title": "Elastic Scalability",
      "toolA": "Netdata's agent is lightweight, designed to run on roughly 5% CPU and 150MB RAM per node.",
      "toolB": "VictoriaMetrics is explicitly built to scale from a single Raspberry Pi to thousand-core distributed clusters, with an official Kubernetes operator.",
      "whyItMatters": "Organizations with very large or highly variable fleets need a storage engine proven at extreme scale.",
      "benefitsWho": "Platform engineering teams running large Kubernetes clusters benefit most from VictoriaMetrics's documented scale range."
    },
    {
      "title": "Data Type Breadth",
      "toolA": "Netdata natively covers metrics, logs, alerts, network topology (NetFlow, SNMP), and OpenTelemetry data through 800+ zero-configuration integrations.",
      "toolB": "VictoriaMetrics's core is metrics; logs and traces are handled by separate companion products, VictoriaLogs and VictoriaTraces.",
      "whyItMatters": "Some teams want one integrated product; others prefer composable, purpose-built components they can mix and match.",
      "benefitsWho": "Teams wanting a single unified agent benefit from Netdata; teams building a modular, best-of-breed observability stack benefit from VictoriaMetrics's companion-product approach."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Monitoring & Data Types",
      "rows": [
        {
          "feature": "Real-time per-second metrics collection",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Native log storage",
          "toolA": "available",
          "toolB": "available",
          "note": "VictoriaMetrics via VictoriaLogs companion product"
        },
        {
          "feature": "Distributed tracing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "VictoriaMetrics via VictoriaTraces companion product"
        },
        {
          "feature": "Prometheus/PromQL compatibility",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Drop-in Prometheus replacement"
        },
        {
          "feature": "AI-based anomaly detection",
          "toolA": "available",
          "toolB": "limited",
          "note": "VictoriaMetrics: Enterprise edition only"
        }
      ]
    },
    {
      "group": "Deployment & Scalability",
      "rows": [
        {
          "feature": "Self-hosted / on-prem deployment",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Edge-native local data retention",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Kubernetes-native operator",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Lightweight agent footprint",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "~5% CPU / 150MB RAM per node"
        },
        {
          "feature": "Managed cloud offering",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "VictoriaMetrics Cloud, custom pricing"
        }
      ]
    },
    {
      "group": "Pricing & Support",
      "rows": [
        {
          "feature": "Ongoing free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Netdata: 5 nodes; VictoriaMetrics: full open-source core"
        },
        {
          "feature": "Published per-unit pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "$4.50/node/month vs. custom quote"
        },
        {
          "feature": "SOC 2 certification",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Enterprise support SLA",
          "toolA": "available",
          "toolB": "available",
          "note": "Netdata: min 200 nodes; VictoriaMetrics: SLA for CVE fixes"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Netdata and VictoriaMetrics direct competitors?",
      "answer": "Not exactly — Netdata is a full monitoring platform with its own agent, dashboards, and alerting, while VictoriaMetrics is a time series database that typically needs a separate visualization layer. Teams sometimes use VictoriaMetrics purely as storage without Netdata's agent."
    },
    {
      "question": "Does VictoriaMetrics include AI anomaly detection?",
      "answer": "Only in the paid Enterprise edition — anomaly detection is documented as an Enterprise-only add-on, unlike Netdata, where AI-powered anomaly detection is part of the Business plan."
    },
    {
      "question": "Which tool has clearer pricing for a small team?",
      "answer": "Netdata publishes concrete numbers: a free Community tier for up to 5 nodes, $90/year for the Homelab plan, and $4.50/node/month for Business. VictoriaMetrics's open-source core is free, but Enterprise and Cloud pricing require contacting sales."
    },
    {
      "question": "Can VictoriaMetrics store logs and traces, not just metrics?",
      "answer": "Yes, through companion products — VictoriaLogs for log storage and VictoriaTraces for distributed tracing — extending the core time series database."
    },
    {
      "question": "Is Netdata compatible with Prometheus?",
      "answer": "The available facts on Netdata don't document PromQL or Prometheus compatibility; VictoriaMetrics, by contrast, is explicitly built as a drop-in Prometheus replacement."
    },
    {
      "question": "How does deployment scale differ between the two?",
      "answer": "VictoriaMetrics is described as deployable from a single Raspberry Pi up to thousand-core distributed clusters with a Kubernetes operator, while Netdata's scaling story centers on its lightweight per-node agent and Enterprise On-Premise licensing starting at 200 nodes."
    }
  ]
};

export default netdataVsVictoriametricsContent;

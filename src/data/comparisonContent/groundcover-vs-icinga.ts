import type { ToolComparisonContent } from './types';

const groundcoverVsIcingaContent: ToolComparisonContent = {
  "verdict": "Groundcover is a cloud-native, eBPF-based observability platform purpose-built for Kubernetes environments that deploys inside the customer's own cloud (BYOC) and adds AI-driven investigation via its Agent Mode, while Icinga is a traditional, config-driven infrastructure monitoring platform for hybrid IT (servers, networks, VMware, Windows) with a forever-free core and modular paid subscriptions. They represent different monitoring philosophies: Groundcover automates data collection via eBPF sensors with no code changes, while Icinga relies on explicit host/service configuration via API, Ansible, Puppet, and Terraform.",
  "bestForToolA": "Kubernetes-native teams that want zero-instrumentation observability, logs, traces, metrics, RUM, and LLM/agent monitoring, deployed inside their own cloud VPC via BYOC, starting at $30/host/month on the Pro plan.",
  "bestForToolB": "IT teams monitoring traditional hybrid infrastructure, servers, networks, VMware, and Windows, who want a forever-free core with unlimited hosts and services and prefer configuring monitoring via Ansible, Puppet, Terraform, or Git workflows rather than eBPF auto-instrumentation.",
  "whoNeedsBoth": "A platform team running both Kubernetes workloads and traditional VMware/Windows infrastructure could use Groundcover's eBPF-based observability for its containerized, cloud-native services while relying on Icinga to monitor legacy servers, network devices, and VMware hosts that fall outside Groundcover's Kubernetes-centric pricing model.",
  "keyDifferences": [
    {
      "title": "Data Collection Method",
      "toolA": "Groundcover uses eBPF sensors to gather telemetry across infrastructure, applications, and AI workloads without any code changes.",
      "toolB": "Icinga relies on host/service checks and plugins configured via API, Git workflows, Ansible, Puppet, and Terraform, requiring explicit monitoring target configuration.",
      "whyItMatters": "Zero-instrumentation collection reduces setup effort but requires an eBPF-compatible (typically Kubernetes) environment, while config-driven checks work across any infrastructure but require setup work.",
      "benefitsWho": "Fast-moving Kubernetes teams benefit from Groundcover's zero-instrumentation approach; teams with established IaC pipelines benefit from Icinga's explicit configuration model."
    },
    {
      "title": "Data Residency and Deployment",
      "toolA": "Groundcover's BYOC architecture deploys entirely inside the customer's own cloud VPC, with a fully self-hosted On Premise tier at $50/host/month.",
      "toolB": "Icinga is deployed on-premise or hybrid but doesn't document a BYOC-style cloud-VPC deployment model.",
      "whyItMatters": "Data sovereignty requirements often dictate where telemetry is stored and processed.",
      "benefitsWho": "Organizations with strict data residency requirements benefit from Groundcover's BYOC or On Premise options."
    },
    {
      "title": "AI-Driven Capabilities",
      "toolA": "Groundcover offers dedicated AI observability for LLM calls and agent pipelines, plus an Agent Mode AI agent that investigates issues and can execute remediation tasks.",
      "toolB": "Icinga does not document any AI-based features.",
      "whyItMatters": "Teams running AI/LLM workloads need observability tools that understand those specific workload patterns.",
      "benefitsWho": "Teams building or operating AI agents and LLM pipelines benefit from Groundcover's AI observability."
    },
    {
      "title": "Pricing Model",
      "toolA": "Groundcover prices per Kubernetes host/node, from $30/host/month (Pro) to $50/host/month (On Premise), requiring a Kubernetes-based environment.",
      "toolB": "Icinga's core is free for unlimited hosts and services, with separate add-on subscriptions (Repository from $3,500/year, Module from $1,400/year, Support from $15,000/year) priced by region rather than per host.",
      "whyItMatters": "Per-host pricing scales predictably with cluster size, while Icinga's free core plus optional subscriptions can be cheaper for large host counts that don't need enterprise add-ons.",
      "benefitsWho": "Large non-Kubernetes environments benefit from Icinga's free core; Kubernetes teams with moderate host counts benefit from Groundcover's predictable per-host pricing."
    },
    {
      "title": "Observability Scope",
      "toolA": "Groundcover unifies logs, traces, metrics, events, and real user monitoring (RUM) in one eBPF-driven platform.",
      "toolB": "Icinga focuses on infrastructure monitoring (servers, networks, Kubernetes, databases, applications, Windows, VMware) with log monitoring/analysis, but doesn't document distributed tracing or RUM.",
      "whyItMatters": "Teams debugging application-level performance issues need tracing and RUM, not just infrastructure health checks.",
      "benefitsWho": "Application engineering teams benefit from Groundcover's tracing and RUM; infrastructure/ops teams benefit from Icinga's host-centric monitoring."
    }
  ],
  "featureMatrix": [
    {
      "group": "Data Collection",
      "rows": [
        {
          "feature": "eBPF-based zero-instrumentation collection",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Configuration-as-code (Ansible/Puppet/Terraform)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Distributed tracing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Real user monitoring (RUM)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI-powered observability / LLM monitoring",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "AI agent for automated investigation/remediation",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Groundcover's Agent Mode"
        },
        {
          "feature": "Migration tools from legacy platforms",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "BYOC (customer's own cloud VPC)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Fully self-hosted / on-premise option",
          "toolA": "available",
          "toolB": "available",
          "note": "Groundcover: On Premise $50/host/month; Icinga: core is self-hosted"
        },
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Groundcover: 12-hour retention; Icinga: unlimited hosts/services, forever free"
        },
        {
          "feature": "Per-host pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Icinga's paid add-ons are subscription-based, not per-host"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Groundcover require installing agents or instrumenting application code?",
      "answer": "No, Groundcover uses eBPF sensors to collect telemetry across infrastructure, applications, and AI workloads without code changes."
    },
    {
      "question": "Is Icinga's core really free for unlimited hosts?",
      "answer": "Yes, Icinga's forever-free core edition supports unlimited hosts and services monitoring with no subscription required."
    },
    {
      "question": "Does Groundcover keep data outside the customer's own cloud?",
      "answer": "No, Groundcover's BYOC architecture deploys entirely within the customer's own cloud VPC, and an On Premise tier ($50/host/month) offers a fully self-hosted data plane and UI."
    },
    {
      "question": "Does Icinga have AI-powered features?",
      "answer": "This isn't documented as an Icinga feature, unlike Groundcover's AI observability and Agent Mode."
    },
    {
      "question": "How is Groundcover priced compared to Icinga?",
      "answer": "Groundcover charges per Kubernetes host/node, from $30/host/month (Pro) to $50/host/month (On Premise). Icinga's core is free with unlimited hosts, with separate paid subscriptions from $1,400-$15,000/year depending on the add-on and region."
    },
    {
      "question": "Which tool is built specifically for Kubernetes environments?",
      "answer": "Groundcover, whose pricing is based on Kubernetes node counts and requires a Kubernetes-based environment. Icinga instead covers a broader range of infrastructure including Windows, VMware, and traditional servers."
    }
  ]
};

export default groundcoverVsIcingaContent;

import type { ToolComparisonContent } from './types';

const logzIoVsNagiosXiContent: ToolComparisonContent = {
  "verdict": "Logz.io is a cloud-based observability platform that unifies log management, infrastructure monitoring, and distributed tracing under a consumption-based pricing model, with an OrionIQ AI agent for root cause analysis. Nagios XI is an on-premises infrastructure monitoring platform sold under perpetual, node-based licensing, with event-driven remediation and no cloud dependency. They target overlapping but distinct needs: Logz.io for unified, cloud-hosted observability across logs/metrics/traces, Nagios XI for on-prem infrastructure monitoring with full data control.",
  "bestForToolA": "Teams that want a managed, cloud-hosted alternative to self-hosting ELK and Prometheus, with logs, metrics, and traces unified in one Open 360 dashboard and an AI agent (OrionIQ) for natural-language investigation.",
  "bestForToolB": "Organizations that require on-premises deployment with no cloud dependency, perpetual licensing instead of recurring fees, and event-driven remediation scripts for infrastructure like VMware, Hyper-V, and Windows/Linux servers.",
  "whoNeedsBoth": "A team running Nagios XI for on-prem infrastructure and network device monitoring could still route application log data to Logz.io for centralized log search and OrionIQ-driven root cause analysis that a pure infrastructure monitor doesn't provide.",
  "keyDifferences": [
    {
      "title": "Deployment Model",
      "toolA": "Logz.io is a cloud-based SaaS platform.",
      "toolB": "Nagios XI runs entirely on-premises on a Linux-hosted server with no cloud dependency.",
      "whyItMatters": "Data residency, air-gapped requirements, and IT policy often dictate whether a cloud or on-prem tool is even eligible for consideration.",
      "benefitsWho": "Regulated or air-gapped environments benefit from Nagios XI; teams wanting zero infrastructure to manage benefit from Logz.io."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Logz.io is consumption-based: $0.92/GB per day for logs, $0.40 per 1,000 time-series metrics per day, and $0.16 per 1M spans per day, with a 1.2x monthly billing multiplier and 1.4x overage rate.",
      "toolB": "Nagios XI uses perpetual per-node licensing, from $2,595 for 100 nodes (Standard) up to $17,090+ for 1000+ nodes (Enterprise), with no usage-based billing.",
      "whyItMatters": "Consumption pricing scales directly with data volume and can spike unpredictably, while perpetual licensing is capped and predictable once purchased.",
      "benefitsWho": "Teams with volatile or growing log volumes should model Logz.io's consumption costs carefully; teams wanting fixed, predictable costs benefit from Nagios XI's licensing."
    },
    {
      "title": "Data Types Covered",
      "toolA": "Logz.io unifies logs, metrics, and distributed tracing in one Open 360 dashboard.",
      "toolB": "Nagios XI focuses on infrastructure and service monitoring with dashboards, remediation, and SLA reporting (Enterprise); distributed tracing is not part of its documented feature set.",
      "whyItMatters": "Teams needing request-level tracing across microservices need a tool that explicitly supports it.",
      "benefitsWho": "Microservices teams debugging cross-service latency benefit from Logz.io's tracing; teams monitoring servers, network devices, and VMs benefit from Nagios XI's infrastructure focus."
    },
    {
      "title": "AI-Driven Investigation",
      "toolA": "Logz.io's OrionIQ AI agent automates root cause analysis and answers questions in natural language.",
      "toolB": "Nagios XI's automation is event-driven remediation — automatically executing scripts on problem detection with escalation policies — rather than AI-driven investigation.",
      "whyItMatters": "AI-assisted natural-language querying speeds up investigation for less experienced responders, while scripted remediation offers deterministic, rule-based fixes.",
      "benefitsWho": "Teams wanting conversational incident investigation benefit from Logz.io's OrionIQ; teams with well-defined runbooks benefit from Nagios XI's scripted remediation."
    },
    {
      "title": "Free Access",
      "toolA": "Logz.io offers a 14-day free trial with no credit card required.",
      "toolB": "Nagios XI offers an ongoing free tier capped at 7 nodes or 100 services, with no included support.",
      "whyItMatters": "A time-boxed trial suits short evaluations, while an ongoing free tier suits small permanent deployments.",
      "benefitsWho": "Small teams wanting a permanently free small deployment benefit from Nagios XI's free tier; teams wanting to fully evaluate a cloud platform before buying benefit from Logz.io's trial."
    }
  ],
  "featureMatrix": [
    {
      "group": "Data & Observability Coverage",
      "rows": [
        {
          "feature": "Log management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Logz.io: $0.92/GB/day, managed alternative to ELK"
        },
        {
          "feature": "Infrastructure/metrics monitoring",
          "toolA": "available",
          "toolB": "available",
          "note": "Logz.io: $0.40/1,000 series/day; Nagios: core product"
        },
        {
          "feature": "Distributed tracing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Logz.io: $0.16/1M spans/day"
        },
        {
          "feature": "SLA / capacity planning reporting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Nagios XI Enterprise tier"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI-driven root cause analysis",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Logz.io OrionIQ"
        },
        {
          "feature": "Natural language querying",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Event-driven remediation scripts",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multi-channel alert routing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Nagios: email/SMS/Slack/Teams/Discord"
        }
      ]
    },
    {
      "group": "Pricing & Deployment",
      "rows": [
        {
          "feature": "Cloud-based SaaS deployment",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "On-premises deployment",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Consumption-based pricing",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Free trial (time-boxed)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Logz.io: 14 days, no credit card"
        },
        {
          "feature": "Ongoing free tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Up to 7 nodes/100 services"
        },
        {
          "feature": "Published integration count",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Logz.io: 300+"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Logz.io cloud-based or self-hosted?",
      "answer": "Logz.io is a cloud-based SaaS platform, unlike Nagios XI, which runs entirely on-premises with no cloud dependency."
    },
    {
      "question": "How is each tool priced?",
      "answer": "Logz.io is consumption-based: $0.92/GB per day for logs, $0.40 per 1,000 time-series metrics per day, and $0.16 per 1M spans per day. Nagios XI uses a perpetual per-node license starting at $2,595 for 100 nodes on the Standard tier."
    },
    {
      "question": "Does Nagios XI do distributed tracing?",
      "answer": "Tracing isn't documented among Nagios XI's features; Logz.io explicitly offers distributed tracing at $0.16 per 1M spans per day."
    },
    {
      "question": "Does Logz.io have an AI agent?",
      "answer": "Yes, OrionIQ automates root cause analysis and lets users query data in natural language — a capability not documented for Nagios XI, whose automation centers on event-driven remediation scripts."
    },
    {
      "question": "Which has a free option?",
      "answer": "Logz.io offers a 14-day free trial with no credit card required; Nagios XI offers an ongoing free tier for up to 7 nodes or 100 services, though without included support."
    },
    {
      "question": "Can Nagios XI monitor cloud infrastructure alongside on-prem?",
      "answer": "Yes — despite being deployed on-premises itself, Nagios XI monitors AWS, Azure, and Google Cloud resources alongside on-prem Windows, Linux, VMware, and Hyper-V systems."
    }
  ]
};

export default logzIoVsNagiosXiContent;

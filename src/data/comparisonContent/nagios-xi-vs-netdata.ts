import type { ToolComparisonContent } from './types';

const nagiosXiVsNetdataContent: ToolComparisonContent = {
  "verdict": "Nagios XI is an on-premises enterprise monitoring platform sold under perpetual, node-based licensing, with event-driven remediation and deep support for legacy infrastructure like VMware and Hyper-V. Netdata is a cloud-connected, edge-native monitoring platform billed as a recurring per-node subscription, built around a lightweight agent and AI-powered anomaly detection rather than scripted remediation. The choice largely comes down to licensing preference — one-time perpetual versus recurring subscription — and whether AI-driven troubleshooting or rule-based auto-remediation matters more.",
  "bestForToolA": "Organizations that want a fully on-premises monitoring server with no cloud dependency, event-driven remediation scripts, and a one-time perpetual license — for example, regulated environments running VMware, Hyper-V, or legacy Windows/Linux estates.",
  "bestForToolB": "Teams that want zero-configuration, per-second monitoring across 800+ integrations with a lightweight agent and built-in AI anomaly detection, and are comfortable with a recurring per-node subscription instead of a perpetual license.",
  "whoNeedsBoth": "A large enterprise could keep Nagios XI as its on-premises system of record for compliance-driven infrastructure checks and event-driven remediation scripts, while deploying Netdata agents alongside it on the same nodes for real-time per-second dashboards and AI anomaly detection.",
  "keyDifferences": [
    {
      "title": "Licensing Model",
      "toolA": "Nagios XI Standard costs $2,595 for a 100-node perpetual license, scaling to $14,995+ for 1000+ nodes, with maintenance and support sold separately.",
      "toolB": "Netdata Business is a recurring subscription at $4.50/node/month, with a free Community tier for up to 5 nodes.",
      "whyItMatters": "Perpetual licensing front-loads cost but avoids ongoing fees, while subscription pricing spreads cost but compounds over time at scale.",
      "benefitsWho": "Organizations with capital budgets for software purchases benefit from Nagios XI's perpetual model; teams preferring predictable operating expenses benefit from Netdata's subscription."
    },
    {
      "title": "Deployment Architecture",
      "toolA": "Nagios XI runs entirely on-premises on a Linux-hosted server with no cloud dependency.",
      "toolB": "Netdata is edge-native, keeping raw data on-premises but streaming metadata to the cloud, with an agent using roughly 5% CPU and 150MB RAM per node.",
      "whyItMatters": "Fully air-gapped or no-cloud requirements rule out any tool with a cloud metadata component.",
      "benefitsWho": "Air-gapped or strict data-residency environments benefit from Nagios XI's pure on-prem design."
    },
    {
      "title": "Remediation Approach",
      "toolA": "Nagios XI features event-driven remediation that automatically executes scripts on problem detection, with configurable escalation policies.",
      "toolB": "Netdata's differentiator is AI-powered anomaly detection and automated root cause/blast-radius analysis rather than scripted auto-remediation.",
      "whyItMatters": "Teams that want automatic fixes need scripted remediation; teams that want faster diagnosis need AI-driven analysis.",
      "benefitsWho": "Ops teams with mature runbooks benefit from Nagios XI's scripted remediation; SRE teams triaging novel incidents benefit from Netdata's AI analysis."
    },
    {
      "title": "Setup and Integration Breadth",
      "toolA": "Nagios XI provides 70+ configuration wizards to guide manual setup across Windows, Linux, VMware, Hyper-V, AWS, Azure, Google Cloud, and databases like MySQL, PostgreSQL, MongoDB, and MSSQL.",
      "toolB": "Netdata offers 800+ zero-configuration, auto-discovered integrations across infrastructure, applications, networks, and logs.",
      "whyItMatters": "Setup speed and ongoing configuration effort directly affect time-to-value for large, heterogeneous fleets.",
      "benefitsWho": "Teams wanting fast, hands-off onboarding across many services benefit from Netdata's auto-discovery."
    },
    {
      "title": "Free Tier Limits",
      "toolA": "Nagios XI's free tier caps out at 7 nodes or 100 services with no included support.",
      "toolB": "Netdata's free Community tier covers up to 5 active connected nodes for non-commercial use.",
      "whyItMatters": "Free-tier ceilings determine how far a team can evaluate or run small deployments before paying.",
      "benefitsWho": "Very small teams or homelabs testing either product benefit from knowing these caps upfront."
    }
  ],
  "featureMatrix": [
    {
      "group": "Infrastructure Monitoring Coverage",
      "rows": [
        {
          "feature": "Windows/Linux/VMware/Hyper-V monitoring",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Cloud platform monitoring (AWS/Azure/GCP)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Network topology / NetFlow / SNMP",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Database monitoring (MySQL/PostgreSQL/MongoDB/MSSQL)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Automation & Intelligence",
      "rows": [
        {
          "feature": "Event-driven remediation scripts",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI-powered anomaly detection",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Automated root cause / blast radius analysis",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multi-channel alert routing (Slack/Teams/Discord/SMS/email)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Deployment & Licensing",
      "rows": [
        {
          "feature": "On-premises deployment",
          "toolA": "available",
          "toolB": "available",
          "note": "Netdata: edge-native, metadata streamed to cloud"
        },
        {
          "feature": "Perpetual (one-time) licensing",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Recurring per-node subscription",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "$4.50/node/month"
        },
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Nagios: 7 nodes/100 services; Netdata: 5 nodes"
        },
        {
          "feature": "SSO / 2FA / LDAP / Active Directory",
          "toolA": "available",
          "toolB": "available",
          "note": "Netdata: Business plan RBAC/SSO/SCIM"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Nagios XI a one-time purchase or a subscription?",
      "answer": "It's a perpetual license based on node count, starting at $2,595 for 100 nodes on the Standard tier, with optional annual maintenance and support sold separately — unlike Netdata's recurring $4.50/node/month Business subscription."
    },
    {
      "question": "Does Netdata require cloud connectivity?",
      "answer": "Netdata's edge-native architecture keeps raw data on-premises and streams only metadata to the cloud, unlike Nagios XI, which runs entirely on-premises with no cloud dependency."
    },
    {
      "question": "Which tool includes AI features?",
      "answer": "Netdata includes AI-powered anomaly detection and automated root cause analysis; the documented facts on Nagios XI describe event-driven scripted remediation rather than AI-driven analysis."
    },
    {
      "question": "How do the free tiers compare?",
      "answer": "Nagios XI's free tier supports up to 7 nodes or 100 services with no included support; Netdata's Community tier covers up to 5 active connected nodes for non-commercial use."
    },
    {
      "question": "Which is more expensive at large scale?",
      "answer": "Nagios XI Enterprise reaches $17,090+ for 1000+ nodes as a perpetual license; Netdata Business at $4.50/node/month works out to roughly $4,500/month for 1000 nodes — a recurring cost that compounds over time versus a one-time license fee."
    },
    {
      "question": "Does Nagios XI support modern cloud infrastructure?",
      "answer": "Yes — it explicitly monitors AWS, Azure, and Google Cloud alongside VMware, Hyper-V, and traditional Windows/Linux servers."
    }
  ]
};

export default nagiosXiVsNetdataContent;

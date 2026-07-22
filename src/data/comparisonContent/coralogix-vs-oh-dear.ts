import type { ToolComparisonContent } from './types';

const coralogixVsOhDearContent: ToolComparisonContent = {
  "verdict": "Coralogix and Oh Dear both monitor systems, but at very different scope and scale: Coralogix is an AI-native, full observability platform for logs, traces, and metrics with index-free querying, infinite retention in customer-owned S3 storage, and consumption-based pricing starting at $0.42/GB for logs. Oh Dear is a focused website health monitor covering uptime, SSL, DNS, broken links, cron jobs, and performance, with every feature included on every plan starting at €13/month. One is built for engineering teams debugging distributed systems; the other is built for teams that just need to know a website is up, secure, and performing well.",
  "bestForToolA": "Coralogix fits engineering and platform teams running distributed applications or AI systems that need deep observability — index-free querying, infinite retention, and dedicated AI observability modules (Discovery, Guardrails, cost tracking) — plus compliance certifications like SOC 2, PCI DSS, ISO 27001, and HIPAA.",
  "bestForToolB": "Oh Dear fits agencies, freelancers, and small teams that need straightforward website health monitoring — uptime, SSL expiry, broken links, DNS, and cron job checks — with every feature bundled at every price point and built-in monthly client reporting.",
  "whoNeedsBoth": "An agency managing client websites could use Oh Dear for simple uptime/SSL/cron monitoring and branded client status pages, while the underlying application's engineering team uses Coralogix separately for deep log, trace, and metric observability when debugging backend issues that Oh Dear's surface-level checks wouldn't catch.",
  "keyDifferences": [
    {
      "title": "Monitoring Depth",
      "toolA": "Coralogix provides index-free querying across logs, traces, and metrics with a DataPrime engine for cross-signal correlation.",
      "toolB": "Oh Dear checks uptime, SSL certificates, DNS records, broken links, cron jobs, and Lighthouse performance scores.",
      "whyItMatters": "Coralogix is built for debugging why a distributed system is failing; Oh Dear is built for confirming whether a website is reachable and healthy at a surface level.",
      "benefitsWho": "Engineering teams needing root-cause analysis versus site owners needing simple health checks."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Coralogix uses unit-based, consumption pricing: $0.42/GB for logs, $0.16/GB for traces, $0.05/GB for metrics, and $1.50 per 1M tokens for AI usage.",
      "toolB": "Oh Dear uses flat monthly tiers scaled by number of monitored sites — €13/month for up to 5 sites up to €201/month for up to 200 sites — with every feature on every plan.",
      "whyItMatters": "Coralogix cost scales with data volume, which is harder to predict but efficient at low volume; Oh Dear's flat-tier pricing is predictable and simple to budget.",
      "benefitsWho": "Finance and engineering leads forecasting monitoring spend for very different scales of system."
    },
    {
      "title": "Data Retention",
      "toolA": "Coralogix offers infinite retention by storing data in the customer's own S3 bucket.",
      "toolB": "Oh Dear does not document long-term data retention as a differentiator; its focus is real-time and historical uptime/SSL/performance checks rather than log/trace archiving.",
      "whyItMatters": "Teams with compliance or forensic requirements needing years of historical telemetry need Coralogix's retention model, not a website monitor.",
      "benefitsWho": "Compliance-driven engineering organizations that must retain telemetry data long-term."
    },
    {
      "title": "AI Observability",
      "toolA": "Coralogix includes dedicated AI observability modules (Discovery, Guardrails, cost tracking, session explorer) plus Olly, a conversational AI interface, and MCP support.",
      "toolB": "Oh Dear lists 'AI-powered checks' among its monitoring capabilities without the depth of dedicated AI system observability.",
      "whyItMatters": "Teams operating AI/LLM-powered products need Coralogix's purpose-built AI observability tooling to monitor model behavior and cost, which Oh Dear does not offer.",
      "benefitsWho": "Teams building and operating AI-powered applications in production."
    },
    {
      "title": "Client-Facing Reporting",
      "toolA": "Coralogix does not document branded client status pages or agency-style monthly reporting.",
      "toolB": "Oh Dear includes branded client status pages with automated monthly reporting, explicitly suited to agencies managing multiple client sites.",
      "whyItMatters": "Agencies that need to hand polished uptime/health reports to clients get that natively from Oh Dear, not from Coralogix.",
      "benefitsWho": "Web agencies and freelancers managing monitoring for multiple client websites."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Monitoring",
      "rows": [
        {
          "feature": "Uptime monitoring",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Oh Dear checks from multiple global locations as often as every minute."
        },
        {
          "feature": "Log management",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Coralogix: $0.42/GB."
        },
        {
          "feature": "Distributed tracing",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "SSL certificate monitoring",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Broken link / mixed content scanning",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Cron job monitoring",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Advanced Capabilities",
      "rows": [
        {
          "feature": "AI observability modules",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Coralogix: Discovery, Guardrails, cost tracking, session explorer."
        },
        {
          "feature": "Conversational AI interface",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Coralogix's Olly."
        },
        {
          "feature": "Security (SIEM/MDR)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Infinite data retention (customer S3)",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Pricing & Trust",
      "rows": [
        {
          "feature": "Flat, all-features-included pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Every Oh Dear plan includes every feature."
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Coralogix: 14 days; Oh Dear: 10 days, no card required."
        },
        {
          "feature": "Compliance certifications",
          "toolA": "available",
          "toolB": "limited",
          "note": "Coralogix: SOC 2, PCI DSS, ISO 27001, GDPR, HIPAA. Oh Dear: EU-hosted, GDPR-friendly with DPA."
        },
        {
          "feature": "Money-back guarantee",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Oh Dear offers 30-day money-back guarantee."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Coralogix a replacement for Oh Dear?",
      "answer": "Not really. Coralogix is a full observability platform for logs, traces, and metrics aimed at engineering teams, while Oh Dear is a focused website health monitor for uptime, SSL, DNS, and cron jobs. They address different layers of monitoring."
    },
    {
      "question": "Which is cheaper for a small website?",
      "answer": "For simple website health monitoring, Oh Dear's flat €13/month Mini plan (up to 5 sites, all features included) is more predictable than Coralogix's consumption-based pricing, which is built for data-volume-driven observability rather than simple site checks."
    },
    {
      "question": "Does Oh Dear monitor logs and traces like Coralogix?",
      "answer": "No, Oh Dear's documented features focus on uptime, SSL, DNS, broken links, cron jobs, and Lighthouse performance — it does not offer log or trace management."
    },
    {
      "question": "Does Coralogix offer client-facing status pages like Oh Dear?",
      "answer": "This is not documented for Coralogix. Oh Dear explicitly includes branded client status pages with automated monthly reporting, which is suited to agencies."
    },
    {
      "question": "Do both tools offer a free trial?",
      "answer": "Yes. Coralogix offers a 14-day free trial with full feature access and no credit card required. Oh Dear offers a 10-day free trial, also with no credit card required."
    },
    {
      "question": "Which tool has stronger compliance credentials?",
      "answer": "Coralogix documents SOC 2, PCI DSS, ISO 27001, GDPR, and HIPAA compliance. Oh Dear is EU-hosted with GDPR-friendly terms and a DPA available, but does not list SOC 2, PCI DSS, or HIPAA certifications."
    }
  ]
};

export default coralogixVsOhDearContent;

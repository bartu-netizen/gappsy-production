import type { ToolComparisonContent } from './types';

const coralogixVsHoneycombContent: ToolComparisonContent = {
  "verdict": "Coralogix and Honeycomb are both full observability platforms, but they differ in pricing model and depth of retention/security features: Coralogix uses unit-based consumption pricing with infinite retention in customer-owned S3 storage and dedicated AI observability and security (SIEM/MDR) modules, while Honeycomb uses a generous free tier (up to 20M events/month) plus a $150/month Pro plan, with a strong focus on distributed tracing, automated root-cause analysis (BubbleUp), and AI/LLM workflow debugging via Honeycomb Intelligence.",
  "bestForToolA": "Coralogix fits teams that want to pay only for data volume actually consumed, need infinite retention in their own S3 bucket, and want built-in security capabilities (SIEM/MDR) alongside observability, backed by SOC 2, PCI DSS, ISO 27001, GDPR, and HIPAA compliance.",
  "bestForToolB": "Honeycomb fits engineering teams that want to start free (up to 20M events and 100M metrics data points per month) and need strong distributed tracing with automated anomaly analysis via BubbleUp, plus purpose-built tooling for debugging AI agent and LLM workflows.",
  "whoNeedsBoth": "Realistically a team would pick one primary observability backend rather than run both simultaneously, since they overlap directly on core logs/traces/metrics use cases; there's no clear complementary scenario documented by the facts here.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "Coralogix charges by unit consumed: $0.42/GB for logs, $0.16/GB for traces, $0.05/GB for metrics, and $1.50 per 1M AI tokens.",
      "toolB": "Honeycomb offers a free tier (up to 20M events and 100M metrics data points/month), then a flat $150/month Pro plan (up to 750M events/month), with custom Enterprise pricing above that.",
      "whyItMatters": "Coralogix's per-GB pricing scales precisely with data volume, while Honeycomb's tiered model gives a generous free allotment before a flat jump to $150/month.",
      "benefitsWho": "Cost-sensitive teams comparing predictable flat tiers (Honeycomb) against granular consumption billing (Coralogix)."
    },
    {
      "title": "Data Retention",
      "toolA": "Coralogix offers infinite retention by storing data in the customer's own S3 bucket.",
      "toolB": "Honeycomb's retention is not detailed beyond its event/data-point volume limits per plan.",
      "whyItMatters": "Teams with long-term compliance or forensic needs get a documented infinite-retention path with Coralogix that isn't specified for Honeycomb.",
      "benefitsWho": "Regulated organizations needing long historical telemetry retention."
    },
    {
      "title": "Root Cause Analysis Tooling",
      "toolA": "Coralogix offers the DataPrime engine for cross-signal correlation and unified data exploration.",
      "toolB": "Honeycomb offers BubbleUp, automated root cause analysis that surfaces the dimensions most correlated with an anomaly.",
      "whyItMatters": "Both tools aim to speed up incident investigation, but Honeycomb's BubbleUp is a specifically named, automated anomaly-correlation feature.",
      "benefitsWho": "On-call engineers and SREs trying to reduce mean time to resolution during incidents."
    },
    {
      "title": "AI/LLM Observability",
      "toolA": "Coralogix has dedicated AI observability modules — Discovery, Guardrails, cost tracking, and session explorer — plus Olly, a conversational AI interface, and MCP support.",
      "toolB": "Honeycomb offers Honeycomb Intelligence (Canvas AI copilot, MCP integration) and a purpose-built Agent Timeline and LLM Observability view for debugging AI agent workflows.",
      "whyItMatters": "Both platforms have invested specifically in AI/LLM debugging, but Coralogix frames it around cost/guardrails while Honeycomb frames it around agent timeline visualization.",
      "benefitsWho": "Teams building and operating LLM-powered applications who need visibility into agent behavior and cost."
    },
    {
      "title": "Security Capabilities",
      "toolA": "Coralogix includes SIEM and managed detection and response (MDR) functionality alongside observability.",
      "toolB": "Honeycomb does not document SIEM or MDR capabilities; its focus stays on observability and SLO tracking.",
      "whyItMatters": "Teams that want to consolidate security monitoring and observability in one platform have that option with Coralogix but not Honeycomb.",
      "benefitsWho": "Security and platform teams looking to reduce the number of separate monitoring tools."
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
          "feature": "Log management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Metrics",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Automated root cause / anomaly analysis",
          "toolA": "limited",
          "toolB": "available",
          "note": "Honeycomb's named BubbleUp feature; Coralogix offers DataPrime cross-signal correlation."
        },
        {
          "feature": "SLO tracking",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI observability modules",
          "toolA": "available",
          "toolB": "available",
          "note": "Coralogix: Discovery, Guardrails, cost tracking. Honeycomb: Agent Timeline, LLM Observability."
        },
        {
          "feature": "Conversational AI copilot",
          "toolA": "available",
          "toolB": "available",
          "note": "Coralogix: Olly. Honeycomb: Canvas."
        },
        {
          "feature": "MCP integration",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Security",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Honeycomb free up to 20M events/month; Coralogix offers a 14-day trial instead."
        },
        {
          "feature": "Infinite retention (customer-owned storage)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SIEM / MDR security",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "SSO",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Honeycomb SSO requires the Pro tier or above."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Honeycomb have a free plan like Coralogix?",
      "answer": "Honeycomb has a documented free tier supporting up to 20M events and 100M metrics data points per month. Coralogix does not offer a free tier but provides a 14-day free trial with full feature access instead."
    },
    {
      "question": "Which platform offers infinite data retention?",
      "answer": "Coralogix documents infinite retention by storing data in the customer's own S3 bucket. Honeycomb's retention policy beyond plan volume limits is not detailed in the available facts."
    },
    {
      "question": "Do both tools support debugging AI/LLM workflows?",
      "answer": "Yes. Coralogix has dedicated AI observability modules (Discovery, Guardrails, cost tracking, session explorer) and Olly conversational AI. Honeycomb has purpose-built Agent Timeline and LLM Observability views plus a Canvas AI copilot."
    },
    {
      "question": "How is pricing different between the two?",
      "answer": "Coralogix bills per unit of data consumed ($0.42/GB for logs, $0.16/GB for traces, $0.05/GB for metrics). Honeycomb uses tiered plans: free up to certain volume limits, then a flat $150/month Pro plan, then custom Enterprise pricing."
    },
    {
      "question": "Does Coralogix include security monitoring beyond observability?",
      "answer": "Yes, Coralogix includes SIEM and managed detection and response (MDR) functionality. This is not documented as a Honeycomb capability."
    },
    {
      "question": "What is BubbleUp?",
      "answer": "BubbleUp is Honeycomb's automated root cause analysis feature that highlights the dimensions most correlated with an anomaly. Coralogix's closest documented equivalent is the DataPrime engine for cross-signal correlation."
    }
  ]
};

export default coralogixVsHoneycombContent;

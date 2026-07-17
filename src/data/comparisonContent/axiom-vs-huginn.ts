import type { ToolComparisonContent } from './types';

const axiomVsHuginnContent: ToolComparisonContent = {
  "verdict": "Axiom and Huginn both let you monitor data streams and react to them, but they were built for different jobs. Axiom is a fully managed, schema-less log and event data platform for petabyte-scale observability, with a free Personal plan (500GB/month data loading, 25GB storage, 30-day retention) and usage-based Axiom Cloud pricing from $25/month. Huginn is a free, open-source, self-hosted agent framework where chainable agents monitor the web and act, positioned as a self-hosted alternative to IFTTT or Zapier rather than an observability platform.",
  "bestForToolA": "Axiom fits engineering teams that need to ingest, query, and alert on large volumes of logs, traces, metrics, and events at scale, using its APL query language and native OpenTelemetry, Vector, Fluent Bit, and AWS Kinesis Firehose integrations.",
  "bestForToolB": "Huginn fits individuals and technical hobbyists who want to build chainable, self-hosted automation agents that monitor websites and other online sources and trigger actions, without depending on a hosted SaaS platform.",
  "whoNeedsBoth": "A technical team could run Axiom to centralize and query application logs and metrics at scale while separately running self-hosted Huginn agents for lightweight, chained personal or team automations (like monitoring a webpage for changes and posting an alert), since the two tools serve genuinely different monitoring granularities and neither documents the other's core capability.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Axiom is an observability platform for ingesting and querying petabyte-scale log, trace, metric, and event data with a piped APL query language.",
      "toolB": "Huginn is a general-purpose agent automation framework where chainable agents monitor the web and take action, more akin to a self-hosted IFTTT or Zapier.",
      "whyItMatters": "Observability platforms and automation agent frameworks solve different problems even though both involve 'watching' data and reacting to it.",
      "benefitsWho": "Engineering and SRE teams needing to query structured event data at scale benefit from Axiom; individuals wanting simple chained web-monitoring automations benefit from Huginn."
    },
    {
      "title": "Hosting Model",
      "toolA": "Axiom is a fully managed cloud platform; there's no self-hosted option documented.",
      "toolB": "Huginn is self-hosted, running entirely on infrastructure the user controls.",
      "whyItMatters": "Self-hosting versus managed SaaS changes who is responsible for uptime, scaling, and data storage costs.",
      "benefitsWho": "Teams wanting zero infrastructure overhead benefit from Axiom's managed service; privacy-conscious or budget-constrained users benefit from Huginn's self-hosted model."
    },
    {
      "title": "Pricing",
      "toolA": "Axiom has a permanent free Personal plan (500GB/month data loading, 25GB storage, 30-day retention, no credit card required) and a paid Axiom Cloud plan at $25/month plus usage, with automatic volume discounts.",
      "toolB": "Huginn's core platform is free and open source, with no documented paid tier since it must be self-hosted rather than purchased as a service.",
      "whyItMatters": "A usage-priced managed service scales cost with data volume, while a self-hosted open-source tool's main cost is the infrastructure and time to run it.",
      "benefitsWho": "High-volume data teams benefit from Axiom's managed scaling with predictable volume discounts; cost-sensitive individual users benefit from Huginn having no licensing cost at all."
    },
    {
      "title": "AI and Query Capabilities",
      "toolA": "Axiom offers native MCP support so AI agents can query observability data directly using APL, plus a dedicated Splunk integration for running APL queries from within Splunk.",
      "toolB": "Huginn's documented feature set centers on chainable agents rather than a dedicated query language or AI-agent data access protocol.",
      "whyItMatters": "Native MCP support lets AI agents interact with observability data using the same query primitives engineers use, which is a fairly specific and modern capability.",
      "benefitsWho": "Teams building AI-agent-driven monitoring or incident response benefit from Axiom's native MCP support, which has no Huginn equivalent."
    },
    {
      "title": "Enterprise Access Controls",
      "toolA": "Axiom's enterprise features like SSO, RBAC, audit log, and directory sync are paid add-ons even on the Cloud plan.",
      "toolB": "Huginn's documented features do not include enterprise access controls like SSO or RBAC, consistent with it being a self-hosted, individually-run tool.",
      "whyItMatters": "Whether access controls are available (even as paid add-ons) versus entirely absent affects whether a tool fits an organizational deployment with multiple users.",
      "benefitsWho": "Organizations needing governed multi-user access benefit from Axiom's (paid) enterprise add-ons; individual self-hosters running Huginn on their own don't need those controls."
    }
  ],
  "featureMatrix": [
    {
      "group": "Data Ingestion & Querying",
      "rows": [
        {
          "feature": "Schema-less log/event ingestion",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Dedicated query language",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Axiom's APL"
        },
        {
          "feature": "Dashboards, alerts, and metrics",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Chainable automation agents",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "One Huginn agent's output can trigger another"
        }
      ]
    },
    {
      "group": "Integrations & AI",
      "rows": [
        {
          "feature": "OpenTelemetry / Vector / Fluent Bit integrations",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Splunk integration",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Native MCP support for AI agents",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Web monitoring / IFTTT-style triggers",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Deployment",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Axiom Personal (500GB/month loading); Huginn is entirely free/open-source"
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Usage-based paid plan",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Axiom Cloud: $25/month + usage"
        },
        {
          "feature": "Enterprise access controls (SSO, RBAC)",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Axiom: paid add-ons even on Cloud plan"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Axiom the same kind of tool as Huginn?",
      "answer": "Not exactly: Axiom is a managed observability platform for logs, traces, metrics, and events at scale, while Huginn is a self-hosted automation agent framework for monitoring the web and triggering actions, closer to a self-hosted IFTTT or Zapier."
    },
    {
      "question": "Can Huginn ingest and query logs at Axiom's scale?",
      "answer": "Huginn's documented features don't include schema-less log ingestion or a dedicated query language like Axiom's APL; it's built around chainable web-monitoring agents rather than large-scale observability data."
    },
    {
      "question": "Is Huginn free?",
      "answer": "Yes, Huginn is free and open source and runs entirely on infrastructure you control; Axiom also has a permanent free Personal plan (500GB/month data loading, 30-day retention) but its paid Axiom Cloud tier starts at $25/month plus usage."
    },
    {
      "question": "Does Axiom require self-hosting like Huginn?",
      "answer": "No, Axiom is a fully managed cloud platform with no self-hosted option documented, while Huginn is designed specifically to be self-hosted."
    },
    {
      "question": "Can AI agents query data in either platform?",
      "answer": "Axiom has native MCP support so AI agents can query observability data using APL; Huginn's documented feature set doesn't include a comparable AI-agent query protocol, though its own agents can be chained together to build automations."
    },
    {
      "question": "Which tool is better for monitoring website changes and triggering alerts?",
      "answer": "Huginn is explicitly designed for that use case as a self-hosted alternative to IFTTT/Zapier with chainable agents; Axiom is built for ingesting and alerting on structured log and event data rather than general web monitoring."
    }
  ]
};

export default axiomVsHuginnContent;

import type { ToolComparisonContent } from './types';

const activepiecesVsJaegerContent: ToolComparisonContent = {
  "verdict": "activepieces is a paid workflow automation platform ($5/month per active flow) for connecting business apps and processes, deployable in the cloud or self-hosted. Jaeger is a free, CNCF-graduated, open-source distributed tracing tool that maps request flow across microservices to help engineering teams find performance bottlenecks and root-cause errors. One automates business processes, the other traces engineering system behavior — different buyers, different budgets, different teams entirely.",
  "bestForToolA": "Business operations, marketing, sales, HR, and finance teams that want to automate repetitive multi-app workflows without heavy engineering involvement, paying $5/month per active flow.",
  "bestForToolB": "Engineering and SRE teams running microservices who need to trace requests across distributed systems, identify bottlenecks, and analyze service dependencies, for free since Jaeger is 100% open source with no paid tier documented.",
  "whoNeedsBoth": "A platform engineering team could use Jaeger to trace and debug microservice performance issues, while a separate ops or business team uses activepieces to automate unrelated workflow tasks like HR or marketing processes — both could coexist in an organization's stack without directly integrating.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "activepieces automates business workflows across HR, finance, marketing, and sales.",
      "toolB": "Jaeger provides distributed request tracing for microservices, including root cause analysis and service dependency mapping.",
      "whyItMatters": "These are fundamentally different tool categories serving different teams inside an organization.",
      "benefitsWho": "Business/ops teams need activepieces; backend/SRE teams need Jaeger."
    },
    {
      "title": "Pricing",
      "toolA": "activepieces starts at $5/month per active flow (Standard), with custom Ultimate pricing for larger deployments.",
      "toolB": "Jaeger has no pricing at all — it is entirely free and open source with no documented paid tier.",
      "whyItMatters": "Budget planning differs completely: one is a recurring usage-based SaaS cost, the other has zero licensing cost.",
      "benefitsWho": "Cost-conscious engineering teams wanting zero-cost tracing benefit from Jaeger; teams needing a paid, managed automation product need activepieces."
    },
    {
      "title": "Deployment Model",
      "toolA": "activepieces offers both self-hosted and cloud deployment.",
      "toolB": "Jaeger is self-hosted only, with no managed cloud offering mentioned, and requires setting up a separate storage backend such as ClickHouse, Elasticsearch, or Cassandra.",
      "whyItMatters": "Jaeger's self-hosted-only nature adds operational overhead that activepieces' cloud option avoids.",
      "benefitsWho": "Teams wanting a hands-off cloud option benefit from activepieces; teams comfortable operating their own tracing infrastructure and storage backend benefit from Jaeger."
    },
    {
      "title": "Governance & Backing",
      "toolA": "activepieces' governance model is not documented in available facts.",
      "toolB": "Jaeger is a CNCF graduated project with open governance, mentorship programs, and maintainer pathways.",
      "whyItMatters": "CNCF graduation signals a mature, vendor-neutral governance process that many enterprises require before adopting infrastructure tooling.",
      "benefitsWho": "Enterprises with vendor-neutrality or open-governance requirements for infrastructure software benefit from Jaeger's documented CNCF status."
    },
    {
      "title": "Scope of Functionality",
      "toolA": "activepieces focuses on workflow execution and app integrations (\"pieces\") such as Gmail.",
      "toolB": "Jaeger is focused on distributed tracing only, with no built-in metrics or log collection per its documented cons.",
      "whyItMatters": "Neither tool is a full platform on its own, so buyers should know what's explicitly out of scope.",
      "benefitsWho": "Teams needing only tracing (not full observability) should know Jaeger doesn't include metrics/logs; teams needing more than workflow automation should know activepieces doesn't cover monitoring."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Workflow/business process automation",
          "toolA": "available",
          "toolB": "unavailable",
          "note": null
        },
        {
          "feature": "Distributed request tracing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": null
        },
        {
          "feature": "Root cause / service dependency analysis",
          "toolA": "not-documented",
          "toolB": "available",
          "note": null
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free to use",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "activepieces starts at $5/active flow; Jaeger is 100% free"
        },
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "available",
          "note": "Jaeger's only option"
        },
        {
          "feature": "Cloud-hosted option",
          "toolA": "available",
          "toolB": "unavailable",
          "note": null
        }
      ]
    },
    {
      "group": "Ecosystem & Standards",
      "rows": [
        {
          "feature": "App integrations (\"pieces\")",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "e.g. Gmail"
        },
        {
          "feature": "OpenTelemetry (OTLP) support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "native as of Jaeger v1.35"
        },
        {
          "feature": "Storage backend options",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "ClickHouse (v2.18.0+), Elasticsearch, Cassandra"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do activepieces and Jaeger compete with each other?",
      "answer": "No — activepieces automates business workflows across apps like HR, finance, and marketing tools, while Jaeger traces requests across microservices for engineering teams. They address entirely different problems."
    },
    {
      "question": "Is Jaeger really free, unlike activepieces?",
      "answer": "Yes. Jaeger is 100% open source and free with no documented paid tier, while activepieces is a paid product starting at $5/month per active flow."
    },
    {
      "question": "Can I run either one in the cloud without managing servers?",
      "answer": "activepieces documents an explicit cloud deployment option alongside self-hosted. Jaeger has no managed cloud offering mentioned — it is self-hosted only and requires you to also stand up a separate storage backend like ClickHouse or Elasticsearch."
    },
    {
      "question": "Does Jaeger include metrics and log monitoring too?",
      "answer": "No — per its documented cons, Jaeger is focused on distributed tracing only and does not include built-in metrics or log collection."
    },
    {
      "question": "Is Jaeger backed by a major open-source foundation?",
      "answer": "Yes, Jaeger is a Cloud Native Computing Foundation (CNCF) graduated project with open governance and maintainer pathways."
    },
    {
      "question": "What kind of team would choose activepieces over Jaeger?",
      "answer": "Business operations, marketing, sales, HR, or finance teams wanting to automate multi-app workflows without engineering involvement, not engineering teams needing to debug microservices."
    }
  ]
};

export default activepiecesVsJaegerContent;

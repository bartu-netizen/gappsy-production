import type { ToolComparisonContent } from './types';

const appsignalVsScoutApmContent: ToolComparisonContent = {
  "verdict": "AppSignal publishes transparent free and paid pricing plus explicit EU/GDPR compliance and bundled uptime/host monitoring, while Scout APM emphasizes code-level query analysis and fast setup but doesn't publish verified pricing and covers a narrower set of languages without Java, Go, or .NET.",
  "bestForToolA": "Teams that need published pricing, EU data residency and GDPR compliance, and uptime/host monitoring bundled with APM.",
  "bestForToolB": "Ruby, Python, PHP, Elixir, or Node.js teams that want fast npx-based setup and code-level query/N+1 detection, and are willing to request a quote since pricing isn't published.",
  "whoNeedsBoth": "Engineering organizations running AppSignal for company-wide error, uptime, and host monitoring while a specific Rails or Django team also uses Scout APM's query analysis for database performance tuning.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "Publishes an exact free tier (50K requests/month) and paid price (€219/year, ~€18.25/month billed annually).",
      "toolB": "Official pricing tiers and starting price are not published on a page that could be directly verified.",
      "whyItMatters": "Teams comparing total cost of ownership can plan around AppSignal's published rate but need a sales conversation to know Scout APM's actual cost.",
      "benefitsWho": "Budget-conscious teams and solo developers evaluating tools without a sales call."
    },
    {
      "title": "Native language coverage",
      "toolA": "Natively supports Ruby, Elixir, Node.js, JavaScript, and Python, plus any OpenTelemetry-compatible language.",
      "toolB": "Supports Ruby, Python, PHP, Elixir, and Node.js, with no stated support for Java, Go, or .NET.",
      "whyItMatters": "Teams using Java, Go, or .NET have a documented OpenTelemetry path with AppSignal but no stated path with Scout APM.",
      "benefitsWho": "Polyglot teams or those on JVM/.NET/Go stacks."
    },
    {
      "title": "Monitoring scope",
      "toolA": "Bundles error tracking, performance monitoring, log management, anomaly detection, and uptime/host monitoring in one plan.",
      "toolB": "Covers app traces, error monitoring, log management, app metrics, and query analysis, without stated uptime or host-level monitoring.",
      "whyItMatters": "Teams wanting infrastructure-level uptime/host checks alongside APM get it natively with AppSignal.",
      "benefitsWho": "Small teams that want to avoid running a separate uptime-monitoring tool."
    },
    {
      "title": "Compliance and regional basing",
      "toolA": "EU-based (Amsterdam, Netherlands), GDPR compliant, and SOC2 certified.",
      "toolB": "No compliance certifications or headquarters are stated.",
      "whyItMatters": "Teams with EU data-residency or GDPR obligations have documented assurance with AppSignal that isn't available for Scout APM in the facts.",
      "benefitsWho": "EU-based companies or any team with GDPR compliance requirements."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Error tracking",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Performance monitoring / APM",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Log management",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Uptime and host monitoring",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Query / N+1 analysis",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Distributed tracing",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "AppSignal's distributed tracing is still in beta."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Published paid pricing",
          "toolA": "available",
          "toolB": "limited"
        }
      ]
    },
    {
      "group": "Compliance & AI",
      "rows": [
        {
          "feature": "GDPR / SOC2 compliance stated",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "MCP server for AI coding agents",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does AppSignal have a free plan?",
      "answer": "Yes, a free plan covering 50,000 requests/month with 5-day retention and no credit card required."
    },
    {
      "question": "What languages does AppSignal support natively?",
      "answer": "Ruby, Elixir, Node.js, JavaScript and Python, plus any OpenTelemetry-compatible language."
    },
    {
      "question": "Where is AppSignal based?",
      "answer": "Amsterdam, Netherlands; the company was founded in 2012."
    },
    {
      "question": "What languages does Scout APM support?",
      "answer": "Ruby, Python, PHP, Elixir and Node.js, across frameworks like Rails, Django, Laravel, Phoenix and Express."
    },
    {
      "question": "Can Scout APM connect to AI coding assistants?",
      "answer": "Yes, via an MCP server, CLI and API for tools like Claude Code and Cursor."
    },
    {
      "question": "Is there a free trial for Scout APM?",
      "answer": "Yes, Scout APM offers a free trial with setup via a one-line installer command."
    }
  ]
};

export default appsignalVsScoutApmContent;

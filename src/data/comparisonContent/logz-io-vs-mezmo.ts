import type { ToolComparisonContent } from './types';

const logzIoVsMezmoContent: ToolComparisonContent = {
  "verdict": "Logz.io is a destination observability platform where teams view and query unified logs, metrics, and traces through its Open 360 dashboard, backed by the OrionIQ AI agent. Mezmo is positioned as a telemetry pipeline that ingests, transforms, and routes logs, metrics, and traces before they reach downstream observability tools, paired with the AURA AI agent for infrastructure root cause analysis. They can be complementary layers rather than strict substitutes: one focused on reducing and shaping data upstream, the other on unified analysis downstream.",
  "bestForToolA": "Teams that want a single cloud dashboard unifying logs, metrics, and distributed tracing, with published consumption-based pricing and an AI agent (OrionIQ) for natural-language investigation.",
  "bestForToolB": "Teams looking to control telemetry costs and volume before data reaches other tools, using features like tail-based sampling, data profiling, and pipeline-as-code, with an included AI agent (AURA) for root cause analysis at no extra metered charge.",
  "whoNeedsBoth": "A team could use Mezmo's Active Telemetry pipeline to filter, sample, and reduce log and metric volume before it reaches billed destinations, then send the reduced-volume stream into Logz.io's Open 360 dashboard for unified search, alerting, and OrionIQ-driven investigation.",
  "keyDifferences": [
    {
      "title": "Core Positioning",
      "toolA": "Logz.io is a destination observability platform with a unified dashboard (Open 360) for viewing and querying logs, metrics, and traces.",
      "toolB": "Mezmo is a telemetry pipeline that filters, transforms, and routes data before it reaches downstream tools — one customer used it to cut Datadog costs by 52%.",
      "whyItMatters": "Deciding whether a tool is meant to be your primary observability destination or a cost-control layer in front of other tools changes how it fits your stack.",
      "benefitsWho": "Teams wanting one place to view all telemetry benefit from Logz.io; teams trying to reduce spend on existing tools benefit from Mezmo's pipeline approach."
    },
    {
      "title": "AI Agent Cost Model",
      "toolA": "Logz.io's Agentic Observability (OrionIQ workflows) is billed separately at $10 per 1M tokens.",
      "toolB": "Mezmo states its AURA AI agent is included in the platform license with no separate metered query charges.",
      "whyItMatters": "Metered AI pricing can become unpredictable at scale, while flat-license inclusion offers cost certainty.",
      "benefitsWho": "Teams with heavy, frequent AI-agent usage benefit from Mezmo's included-license model; occasional users may not mind Logz.io's per-token metering."
    },
    {
      "title": "AI Agent Openness",
      "toolA": "OrionIQ is a proprietary agent embedded in Logz.io's platform, with no open-source claim documented.",
      "toolB": "Mezmo's AURA is described as open source, with human-in-the-loop review required before risky automated actions.",
      "whyItMatters": "Open-source AI tooling allows inspection, self-hosting of components, and community contribution in ways proprietary agents don't.",
      "benefitsWho": "Engineering teams wanting transparency or customization of the AI agent's behavior benefit from Mezmo's open-source AURA."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Logz.io publishes specific consumption rates: $0.92/GB per day for logs, $0.40 per 1,000 time-series metrics per day, and $0.16 per 1M spans per day.",
      "toolB": "Mezmo does not publish specific pricing tiers or a starting price, requiring direct contact.",
      "whyItMatters": "Published pricing lets buyers estimate costs without a sales call; opaque pricing requires more upfront sales engagement.",
      "benefitsWho": "Budget-conscious teams wanting self-service cost estimates benefit from Logz.io's transparency."
    },
    {
      "title": "Free Access",
      "toolA": "Logz.io offers a 14-day free trial with no credit card required.",
      "toolB": "Mezmo's pricing model is also listed as Free Trial, though its own documented cons note free access is limited to a trial rather than an ongoing free tier.",
      "whyItMatters": "Neither offers a persistent free tier, so evaluation windows and trial terms matter for proof-of-concept planning.",
      "benefitsWho": "Teams running short evaluations benefit equally from either trial; teams wanting a permanent free option will need to look elsewhere for either product."
    }
  ],
  "featureMatrix": [
    {
      "group": "Telemetry Pipeline & Data Handling",
      "rows": [
        {
          "feature": "Log/metric/trace ingestion and unification",
          "toolA": "available",
          "toolB": "available",
          "note": "Logz.io: Open 360; Mezmo: Active Telemetry pipeline"
        },
        {
          "feature": "Pre-destination data transformation/filtering",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Tail-based sampling",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Pipeline-as-code (CI/CD)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Cardinality management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Live tail and replay",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI-Driven Investigation",
      "rows": [
        {
          "feature": "AI root cause analysis agent",
          "toolA": "available",
          "toolB": "available",
          "note": "OrionIQ vs. AURA"
        },
        {
          "feature": "Natural language querying",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Human-in-the-loop review of automated actions",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Open-source AI agent component",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "AURA is open source"
        },
        {
          "feature": "Separate metered charge for AI usage",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Logz.io: $10/1M tokens; Mezmo: included in license"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Published consumption pricing",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Ongoing free tier",
          "toolA": "not-documented",
          "toolB": "not-documented"
        },
        {
          "feature": "300+ pre-built integrations",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the core difference between Logz.io and Mezmo?",
      "answer": "Logz.io is a destination observability platform where you view and query unified logs, metrics, and traces via its Open 360 dashboard; Mezmo is positioned as a telemetry pipeline that filters and transforms data before it reaches downstream tools."
    },
    {
      "question": "Does either charge extra for AI features?",
      "answer": "Logz.io's Agentic Observability is billed separately at $10 per 1M tokens; Mezmo states its AURA AI agent is included in the platform license with no separate metered query charges."
    },
    {
      "question": "Is Mezmo's AI agent open source?",
      "answer": "Yes, AURA is described as an open-source agentic harness with human-in-the-loop review before risky actions; Logz.io's OrionIQ agent is not documented as open source."
    },
    {
      "question": "Which tool has published pricing?",
      "answer": "Logz.io publishes specific consumption rates (e.g., $0.92/GB per day for log management); Mezmo does not publish specific pricing tiers or a starting price on its site."
    },
    {
      "question": "Can Mezmo reduce costs from other observability tools?",
      "answer": "Mezmo documents a case where a customer used its pipeline to cut Datadog costs by 52% through pre-destination filtering and transformation."
    },
    {
      "question": "Do both offer free trials?",
      "answer": "Yes — Logz.io offers a 14-day free trial with no credit card required, and Mezmo's pricing model is also listed as Free Trial, though neither documents an ongoing free tier."
    }
  ]
};

export default logzIoVsMezmoContent;

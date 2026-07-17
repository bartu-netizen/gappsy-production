import type { ToolComparisonContent } from './types';

const pipedreamVsWorkatoContent: ToolComparisonContent = {
  "verdict": "Pipedream and Workato both let teams connect apps and build AI agents/workflows, but they come from different starting points: Pipedream is a developer-first platform combining a large integration catalog with code-level control (Node.js/Python) and was acquired by Workday in November 2025, while Workato is an enterprise iPaaS with API management, RPA, and prebuilt AI agents for functions like IT, Sales, HR, and Support, positioned for large-scale enterprise governance.",
  "bestForToolA": "Developers who want to mix no-code workflow building with custom code steps, need a very large integration catalog (3,000+ apps, 10,000+ pre-built tools), or want an AI Agent Builder that deploys agents by prompting in seconds.",
  "bestForToolB": "Enterprises needing API management, robotic process automation, and pre-built AI 'Genie' agents for specific business functions (IT, Sales, HR, Support), along with a Model Context Protocol gateway and regional data hosting across multiple geographies.",
  "whoNeedsBoth": "A large organization might use Workato for governed, enterprise-wide integration and API management while individual engineering teams use Pipedream for developer-driven, code-level automations and rapid AI agent prototyping — the two serve different layers of the same integration strategy.",
  "keyDifferences": [
    {
      "title": "Ownership and positioning",
      "toolA": "Pipedream was acquired by Workday in November 2025, which the facts note could shift roadmap priorities for standalone use.",
      "toolB": "Workato's facts don't document any acquisition; it's recognized as a Leader multiple times in Gartner's Magic Quadrant for iPaaS.",
      "whyItMatters": "A recent acquisition introduces uncertainty about long-term independent product direction, which matters for teams making a multi-year platform bet.",
      "benefitsWho": "Enterprise buyers doing vendor risk assessment on platform stability and roadmap continuity."
    },
    {
      "title": "Code-level control",
      "toolA": "Pipedream supports writing custom Node.js/Python steps alongside no-code steps.",
      "toolB": "Workato's facts describe low-code apps and RPA rather than open custom-code steps.",
      "whyItMatters": "Direct code access lets developers handle edge cases that visual builders can't express.",
      "benefitsWho": "Engineering teams building complex, custom integration logic beyond what visual connectors support."
    },
    {
      "title": "Pricing transparency",
      "toolA": "Pipedream's current pricing plans and tiers could not be verified from the official pricing page during this research.",
      "toolB": "Workato doesn't publish pricing either, but describes a 'Predictable Pricing Commitment' and requires contacting sales.",
      "whyItMatters": "Neither platform has fully transparent self-serve pricing in the facts, so buyers should expect a sales conversation either way.",
      "benefitsWho": "Budget planners who need to factor in a sales cycle for either platform."
    },
    {
      "title": "Prebuilt AI agents for business functions",
      "toolA": "Pipedream's AI Agent Builder focuses on creating and deploying custom agents quickly.",
      "toolB": "Workato offers pre-built 'Genies' — packaged AI agents for IT, Sales, HR, and Support functions — alongside its Agent Studio.",
      "whyItMatters": "Prebuilt, function-specific agents can get a team to a working solution faster than building an agent from scratch.",
      "benefitsWho": "Business teams (IT, Sales, HR, Support) wanting ready-made AI agents rather than custom-building one."
    },
    {
      "title": "Compliance and regional hosting",
      "toolA": "Pipedream lists SOC 2 Type II, HIPAA, and GDPR compliance.",
      "toolB": "Workato offers regional hosting across the US, Europe, Singapore, Japan, Korea, Australia, and Israel.",
      "whyItMatters": "Regional hosting can be a hard requirement for data residency regulations, distinct from general compliance certifications.",
      "benefitsWho": "Multinational enterprises with data residency requirements in specific regions."
    }
  ],
  "featureMatrix": [
    {
      "group": "Integration & Automation",
      "rows": [
        {
          "feature": "App/tool integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Pipedream lists 3,000+ apps and 10,000+ pre-built tools; Workato has no documented count."
        },
        {
          "feature": "Visual workflow builder",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Custom code steps (Node.js/Python)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "RPA / low-code internal apps",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI Agents",
      "rows": [
        {
          "feature": "AI agent builder",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Prebuilt function-specific agents",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Workato's 'Genies' for IT, Sales, HR, Support."
        },
        {
          "feature": "MCP support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Workato has a dedicated MCP gateway."
        }
      ]
    },
    {
      "group": "Governance & Compliance",
      "rows": [
        {
          "feature": "API management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Compliance certifications",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Pipedream lists SOC 2 Type II, HIPAA, and GDPR."
        },
        {
          "feature": "Regional data hosting",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Company",
      "rows": [
        {
          "feature": "Published self-serve pricing",
          "toolA": "unavailable",
          "toolB": "unavailable"
        },
        {
          "feature": "Headquarters",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Pipedream is headquartered in San Francisco, California."
        },
        {
          "feature": "Free trial",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Workato's free trial is available by request through the website."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Pipedream still an independent company?",
      "answer": "No, Pipedream was acquired by Workday in November 2025 and now operates under Workday."
    },
    {
      "question": "Does Workato publish its pricing?",
      "answer": "No, Workato describes a 'Predictable Pricing Commitment' but requires contacting sales for an actual quote."
    },
    {
      "question": "What are Workato's 'Genies'?",
      "answer": "Genies are Workato's pre-built AI agents for specific functions like IT, Sales, HR, and Support."
    },
    {
      "question": "Can Pipedream be used for custom code, not just no-code workflows?",
      "answer": "Yes, Pipedream supports writing custom Node.js/Python steps alongside no-code steps."
    },
    {
      "question": "Which platform offers regional data hosting?",
      "answer": "Workato offers regional hosting across the US, Europe, Singapore, Japan, Korea, Australia, and Israel; this isn't documented for Pipedream."
    },
    {
      "question": "How many integrations does each platform support?",
      "answer": "Pipedream lists 3,000+ integrated apps and 10,000+ pre-built tools; Workato's facts don't give a specific integration count."
    }
  ]
};

export default pipedreamVsWorkatoContent;

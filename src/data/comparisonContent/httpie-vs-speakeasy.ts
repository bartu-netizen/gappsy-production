import type { ToolComparisonContent } from './types';

const httpieVsSpeakeasyContent: ToolComparisonContent = {
  "verdict": "HTTPie is a client for manually sending, inspecting, and debugging HTTP requests across CLI, desktop, and web interfaces. Speakeasy generates production client SDKs and Model Context Protocol (MCP) servers directly from OpenAPI specs, plus a separate AI Control Plane for governing AI agent access to company systems. They sit at different points in the API lifecycle — HTTPie for exploring and testing an API by hand, Speakeasy for producing the code artifacts developers and AI agents consume afterward.",
  "bestForToolA": "Developers who want a fast, expressive, human-readable client for exploring and debugging HTTP requests, available as a free open-source CLI, a public-beta desktop app, and a web app.",
  "bestForToolB": "API teams that want to auto-generate and publish client SDKs and MCP servers from an OpenAPI spec, and organizations that need to govern how AI agents like Claude or ChatGPT access internal systems, starting with a free tier of 250 operations per language.",
  "whoNeedsBoth": "An API team could use HTTPie to manually explore and debug an API's endpoints while designing it, then use Speakeasy to auto-generate and publish client SDKs and an MCP server from the finalized OpenAPI spec for downstream consumers and AI agents.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "HTTPie is a tool for manually sending and inspecting HTTP requests during development and debugging.",
      "toolB": "Speakeasy generates production client SDKs and MCP servers directly from OpenAPI specs for developers to consume an API.",
      "whyItMatters": "One is an interactive testing tool; the other produces shippable code artifacts — they solve different problems in the API lifecycle.",
      "benefitsWho": "Individual developers testing endpoints benefit from HTTPie; API providers distributing client libraries benefit from Speakeasy."
    },
    {
      "title": "Pricing Structure",
      "toolA": "HTTPie's CLI is free and open source with no public pricing page for paid tiers.",
      "toolB": "Speakeasy publishes an explicit tiered structure: a Free tier (250 operations per language, single language license) and a Business plan at $720/month ($600/month billed annually) priced per licensed programming language.",
      "whyItMatters": "Transparent, published tiers let buyers estimate cost without a sales call.",
      "benefitsWho": "Teams budgeting for SDK generation across multiple languages benefit from Speakeasy's published per-language Business pricing."
    },
    {
      "title": "AI Scope",
      "toolA": "HTTPie's AI angle is 'AI-assisted work' for the person using the tool, in its desktop app and a separate HTTPie AI product.",
      "toolB": "Speakeasy's AI Control Plane is a governance layer that inspects and polices AI agent traffic against company systems, blocking PII, secrets, and prompt-injection attempts.",
      "whyItMatters": "AI assistance for a human user is a very different capability from AI agent governance for an organization's systems.",
      "benefitsWho": "Individual developers benefit from HTTPie's AI-assisted requests; security and platform teams governing AI agent access benefit from Speakeasy's Control Plane."
    },
    {
      "title": "Compliance & Enterprise Readiness",
      "toolA": "No compliance certifications or enterprise-specific controls are documented for HTTPie.",
      "toolB": "Speakeasy is SOC 2 Type II and ISO 27001 certified, with an Enterprise tier offering SSO and audit logs.",
      "whyItMatters": "Regulated enterprises often require formal compliance certifications before adopting a vendor.",
      "benefitsWho": "Enterprise buyers with compliance requirements benefit from Speakeasy's documented certifications."
    },
    {
      "title": "Output Artifact",
      "toolA": "HTTPie is an interactive client you use directly against APIs (CLI, desktop, web).",
      "toolB": "Speakeasy produces artifacts — SDKs, MCP servers, auto-published packages — that other developers or AI agents integrate into their own code, and customers retain ownership of already-generated code even after cancelling.",
      "whyItMatters": "Whether a tool's output is a session you run or a codebase you ship changes how it fits into a release pipeline.",
      "benefitsWho": "API providers wanting to distribute maintained client libraries benefit from Speakeasy's generated, ownable code artifacts."
    }
  ],
  "featureMatrix": [
    {
      "group": "Primary Use Case",
      "rows": [
        {
          "feature": "Manual API request testing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SDK generation from OpenAPI",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "MCP server generation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Auto-publish to package managers",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI Capabilities",
      "rows": [
        {
          "feature": "AI-assisted request building (for the user)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI agent governance / control plane",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Enterprise, tailored pricing"
        },
        {
          "feature": "PII/secrets/prompt-injection blocking",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "MCP-based agent support (Claude/ChatGPT/Cursor/Copilot)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Compliance",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Speakeasy: 250 operations/language"
        },
        {
          "feature": "Published paid tier pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "$720/month, or $600/month annual, per language"
        },
        {
          "feature": "Compliance certification",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SOC 2 Type II, ISO 27001"
        },
        {
          "feature": "Code/asset ownership after cancellation",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do HTTPie and Speakeasy do the same job?",
      "answer": "No — HTTPie is a client for manually testing and debugging HTTP requests; Speakeasy generates production SDKs and MCP servers from an OpenAPI spec for other developers or AI agents to consume."
    },
    {
      "question": "What does Speakeasy's free tier include?",
      "answer": "SDK and MCP generation with 250 operations per language, auto-publishing, OpenAPI toolchain access, and community Slack support, under a single language license."
    },
    {
      "question": "How much is Speakeasy's Business plan?",
      "answer": "$720/month billed monthly, or $600/month billed annually, priced per licensed programming language."
    },
    {
      "question": "Is HTTPie's pricing public?",
      "answer": "No public pricing page was found for HTTPie, so any paid tier costs are unclear; Speakeasy, by contrast, publishes explicit Free and Business tier pricing."
    },
    {
      "question": "Does Speakeasy support AI agents like Claude?",
      "answer": "Yes, Speakeasy supports MCP-based agents including Claude, ChatGPT, Cursor, and GitHub Copilot, and its AI Control Plane blocks PII, secrets, and prompt-injection attempts in AI agent traffic."
    },
    {
      "question": "What happens to Speakeasy-generated code if I stop paying?",
      "answer": "Speakeasy states customers own 100% of code already generated, though new code can no longer be generated without an active plan."
    }
  ]
};

export default httpieVsSpeakeasyContent;

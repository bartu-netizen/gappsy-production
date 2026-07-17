import type { ToolComparisonContent } from './types';

const beeceptorVsReadmeContent: ToolComparisonContent = {
  "verdict": "Beeceptor and ReadMe are both API tools, but they serve opposite ends of the API lifecycle: Beeceptor lets developers instantly create mock REST, GraphQL, SOAP, and gRPC API servers without writing backend code, useful for testing and development before a real API exists, while ReadMe is an API documentation platform with a WYSIWYG editor, interactive API reference, and AI-assisted doc writing for APIs that are already built and need to be explained to external developers.",
  "bestForToolA": "Beeceptor fits developers who need to mock an API quickly for testing, debugging webhooks, or simulating failure conditions (latency, timeouts, errors), especially with its free forever plan and AI-powered mock generation from OpenAPI, WSDL, GraphQL SDL, or proto files.",
  "bestForToolB": "ReadMe fits teams that have a live API and need to publish interactive, testable documentation for external or internal developers, particularly with its free Starter plan offering bi-directional Git sync and an interactive API reference, and companies like NVIDIA, Amazon, and PagerDuty using it at scale.",
  "whoNeedsBoth": "A team building a new API would naturally use Beeceptor to mock the API and let frontend or partner developers integrate against it before the backend is finished, then use ReadMe to publish the finished API's interactive documentation and reference once the real endpoints are live.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Beeceptor creates mock API servers for REST, GraphQL, SOAP, and gRPC without writing backend code.",
      "toolB": "ReadMe publishes interactive, testable API documentation from an OpenAPI spec with a WYSIWYG editor.",
      "whyItMatters": "One tool simulates an API that doesn't exist yet; the other documents an API that already exists — they solve different stages of the API lifecycle.",
      "benefitsWho": "API developers and technical writers who need to know which stage of development they're solving for."
    },
    {
      "title": "Free Plan Depth",
      "toolA": "Beeceptor's free forever plan is limited to 50 requests/day and 3 mock rules, with no signup barrier.",
      "toolB": "ReadMe's free Starter plan includes a custom domain, bi-directional Git sync, and a full interactive API reference with no documented request-count limit.",
      "whyItMatters": "ReadMe's free tier is more feature-complete for publishing documentation, while Beeceptor's free tier is intentionally capped to push heavier mock usage to paid plans.",
      "benefitsWho": "Small teams or solo developers deciding how far they can get without paying."
    },
    {
      "title": "AI Feature Focus",
      "toolA": "Beeceptor's AI-powered mock generation builds mock servers directly from API specs (OpenAPI, WSDL, GraphQL SDL, proto files).",
      "toolB": "ReadMe's AI Writer analyzes pull requests and drafts documentation updates automatically, and its AI Linter enforces a custom style guide across pages.",
      "whyItMatters": "Beeceptor's AI accelerates creating test infrastructure, while ReadMe's AI accelerates keeping documentation in sync with code changes.",
      "benefitsWho": "Engineering teams (Beeceptor) versus API documentation/technical writing teams (ReadMe)."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Beeceptor's paid plans start at $10/month (Individual) rising to $99/month (Scale) with per-million-request overage fees, plus a custom Enterprise tier.",
      "toolB": "ReadMe's Pro plan costs $250/month billed annually, with a separate Ask AI add-on at $150/month, and Enterprise starting at $3,000+/month.",
      "whyItMatters": "ReadMe's paid tiers are priced for teams and companies documenting production APIs, at a materially higher price point than Beeceptor's developer-tool pricing.",
      "benefitsWho": "Budget planners comparing an individual developer tool's cost against an enterprise documentation platform's cost."
    },
    {
      "title": "Failure and Network Simulation",
      "toolA": "Beeceptor supports network condition simulation — latency, timeouts, and errors — for failure testing.",
      "toolB": "ReadMe does not document network simulation features; its focus is documentation authoring and publishing.",
      "whyItMatters": "Only Beeceptor lets developers proactively test how their application handles degraded or failing API responses.",
      "benefitsWho": "QA and backend engineers testing resilience against unreliable third-party or internal APIs."
    }
  ],
  "featureMatrix": [
    {
      "group": "API Mocking & Testing",
      "rows": [
        {
          "feature": "Mock server generation (REST/GraphQL/SOAP/gRPC)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Network condition simulation (latency/errors)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Real-time request inspection",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Proxy and record mode",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Documentation & Publishing",
      "rows": [
        {
          "feature": "WYSIWYG documentation editor",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Interactive/testable API reference",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Bi-directional Git sync (GitHub/GitLab)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Branch-based review workflow",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Requires ReadMe Pro plan."
        }
      ]
    },
    {
      "group": "AI & Pricing",
      "rows": [
        {
          "feature": "AI-assisted spec-to-output generation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Beeceptor generates mocks from OpenAPI/WSDL/GraphQL SDL/proto files."
        },
        {
          "feature": "AI-assisted content drafting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "ReadMe's AI Writer drafts doc updates from pull requests."
        },
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Beeceptor: 50 req/day, 3 rules. ReadMe Starter: full interactive reference."
        },
        {
          "feature": "Entry-level paid price",
          "toolA": "available",
          "toolB": "available",
          "note": "Beeceptor: $10/month. ReadMe: $250/month (annual)."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Beeceptor and ReadMe direct competitors?",
      "answer": "No, they address different needs: Beeceptor mocks APIs for testing before or during development, while ReadMe documents live APIs for developers to consume. They're often used at different stages of the same project."
    },
    {
      "question": "Which tool is cheaper to start with?",
      "answer": "Both have free plans. Beeceptor's free forever plan is capped at 50 requests/day and 3 mock rules. ReadMe's free Starter plan includes a custom domain, bi-directional Git sync, and a full interactive API reference with no documented request limit."
    },
    {
      "question": "Does ReadMe let me mock an API like Beeceptor?",
      "answer": "No, ReadMe's documented features focus on documentation authoring, an interactive API reference from an OpenAPI spec, and AI-assisted doc writing — it does not create mock API servers."
    },
    {
      "question": "Does Beeceptor generate documentation like ReadMe?",
      "answer": "No, Beeceptor's purpose is mock server generation, request inspection, and failure simulation. It does not offer a documentation authoring or publishing feature set."
    },
    {
      "question": "How much does ReadMe's Pro plan cost compared to Beeceptor's paid plans?",
      "answer": "ReadMe's Pro plan is $250/month billed annually, considerably higher than Beeceptor's paid tiers, which range from $10/month (Individual) to $99/month (Scale) before a custom Enterprise tier."
    },
    {
      "question": "Can either tool simulate network failures for testing?",
      "answer": "Yes, Beeceptor supports network condition simulation for latency, timeouts, and errors. ReadMe does not document any equivalent network simulation feature."
    }
  ]
};

export default beeceptorVsReadmeContent;

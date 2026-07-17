import type { ToolComparisonContent } from './types';

const scalarVsYaakContent: ToolComparisonContent = {
  "verdict": "Scalar is a broader API platform combining hosted OpenAPI documentation, an open-source API client, multi-language SDK generation, and an API registry, while Yaak is purely a local-first, offline desktop API client for sending HTTP, GraphQL, gRPC, WebSocket, and SSE requests. Choosing between them is really a choice between an all-in-one hosted API workflow (Scalar) and a lightweight, privacy-focused request tool (Yaak).",
  "bestForToolA": "Scalar suits teams that need hosted OpenAPI documentation with Git sync, SDK generation across six languages, and hosted MCP servers on the $72/month Pro plan, not just a request client.",
  "bestForToolB": "Yaak suits individual developers or small teams who want a zero-telemetry, local-only client for HTTP, GraphQL, gRPC, WebSocket, and SSE requests without needing a hosted documentation platform, for $79/year commercial use.",
  "whoNeedsBoth": "A team could use Scalar to host public API documentation and generate SDKs while individual engineers use Yaak locally for day-to-day request debugging, since Scalar's bundled API Client is built around OpenAPI standards and doesn't document gRPC or WebSocket support the way Yaak does.",
  "keyDifferences": [
    {
      "title": "Product Scope",
      "toolA": "Scalar bundles hosted docs, an open-source API client, SDK generation, and an API registry into one platform.",
      "toolB": "Yaak is a single-purpose desktop API client with no documentation hosting or SDK generation.",
      "whyItMatters": "Teams need to know whether they're buying a full API platform or just a request-testing tool.",
      "benefitsWho": "Teams wanting to consolidate tooling benefit from Scalar's bundled scope; teams wanting a focused tool benefit from Yaak's simplicity."
    },
    {
      "title": "Protocol Support",
      "toolA": "Scalar's API Client is built on OpenAPI standards, with no documented support for GraphQL, gRPC, or WebSocket.",
      "toolB": "Yaak explicitly supports HTTP, GraphQL, gRPC, WebSocket, and SSE requests.",
      "whyItMatters": "Teams working across mixed protocol stacks need broader request-type coverage.",
      "benefitsWho": "Teams testing GraphQL or gRPC services benefit from Yaak's explicit multi-protocol support."
    },
    {
      "title": "Hosted Documentation",
      "toolA": "Scalar offers hosted OpenAPI docs with two-way Git sync, AI/MCP chat, and custom domains on the $72/month Pro plan.",
      "toolB": "Yaak has no documented hosted documentation feature.",
      "whyItMatters": "Teams that need to publish public-facing API reference docs need a platform that hosts them.",
      "benefitsWho": "API providers publishing external developer documentation benefit from Scalar's hosting."
    },
    {
      "title": "SDK Generation",
      "toolA": "Scalar generates type-safe SDKs in TypeScript, Python, Golang, PHP, Java, and Ruby, with additional languages costing $100/month each on Pro.",
      "toolB": "Yaak does not document SDK generation.",
      "whyItMatters": "Teams distributing client libraries to customers need automated SDK generation from their API spec.",
      "benefitsWho": "API providers who ship SDKs to external developers benefit from Scalar's generation capability."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Scalar's Free plan is $0 with 1 editor seat and 50 Agent Scalar credits; Pro is a flat $72/month.",
      "toolB": "Yaak's Free plan is personal-use only; commercial use is $79/year (Individual Annual), $349 lifetime, or $149/user/year (Business).",
      "whyItMatters": "Flat-fee versus per-user pricing scales differently as teams grow.",
      "benefitsWho": "Larger teams may prefer Scalar's flat Pro fee, while solo developers may prefer Yaak's lower per-user annual cost."
    }
  ],
  "featureMatrix": [
    {
      "group": "API Documentation & Hosting",
      "rows": [
        {
          "feature": "Hosted OpenAPI docs",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Scalar Free plan includes hosted docs"
        },
        {
          "feature": "Git-based doc sync",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Scalar Pro, two-way Git sync"
        },
        {
          "feature": "Custom domains for docs",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Scalar Pro $72/month"
        },
        {
          "feature": "AI/MCP chat in docs",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "SDK generation",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Scalar: 6 languages, $100/mo per extra language"
        }
      ]
    },
    {
      "group": "API Client Capabilities",
      "rows": [
        {
          "feature": "HTTP requests",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "GraphQL requests",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "gRPC requests",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "WebSocket / SSE requests",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Offline/local-first storage",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Built-in Git collaboration on requests",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Scalar: $0, 1 editor seat; Yaak: $0, personal use"
        },
        {
          "feature": "Entry paid plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Scalar Pro $72/month; Yaak Individual $79/year"
        },
        {
          "feature": "Lifetime license",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Yaak: $349 one-time"
        },
        {
          "feature": "Enterprise SSO/RBAC",
          "toolA": "available",
          "toolB": "available",
          "note": "Scalar Enterprise (custom); Yaak Business $149/user/year"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Scalar's Free plan include an API client?",
      "answer": "Yes, Scalar's Free plan ($0) includes a built-in, offline-first API client alongside hosted OpenAPI docs and unlimited viewer seats."
    },
    {
      "question": "Can Yaak host API documentation?",
      "answer": "No, Yaak's documented features are focused entirely on being a desktop API request client; it does not offer documentation hosting."
    },
    {
      "question": "Which tool supports gRPC requests?",
      "answer": "Yaak explicitly documents gRPC support alongside HTTP, GraphQL, WebSocket, and SSE. Scalar's API Client is OpenAPI-standard-based with no documented gRPC support."
    },
    {
      "question": "How much do the entry-level paid plans cost?",
      "answer": "Scalar's Pro plan is a flat $72/month. Yaak's Individual commercial license is $79/year, or $349 for a lifetime license."
    },
    {
      "question": "Is Scalar's API Client the same product as Yaak?",
      "answer": "No. Scalar's API Client is one component of a larger platform that also includes hosted docs, SDK generation, and an API registry. Yaak is a standalone, dedicated desktop API client."
    },
    {
      "question": "Does Yaak generate SDKs from an API spec?",
      "answer": "No, SDK generation is not documented among Yaak's features. Scalar generates SDKs in six languages on its Pro and Enterprise plans."
    }
  ]
};

export default scalarVsYaakContent;

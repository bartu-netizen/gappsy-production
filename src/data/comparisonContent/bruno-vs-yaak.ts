import type { ToolComparisonContent } from './types';

const brunoVsYaakContent: ToolComparisonContent = {
  "verdict": "Bruno and Yaak are both open-source, local-first, Git-native API clients built as alternatives to Postman and Insomnia, but they emphasize different priorities. Bruno stores collections as plain-text files with no login required and is SOC 2 Type I certified for teams that need governance, while Yaak (built by Insomnia's original creator) supports a broader protocol range spanning HTTP, GraphQL, gRPC, WebSocket, and SSE, and separates its MIT-licensed source from paid commercial licensing of its prebuilt binaries.",
  "bestForToolA": "Bruno fits teams that want a fully open-source, Git-native REST/OpenAPI workflow with SOC 2 Type I certification and enterprise permissions inherited from existing Git access controls, with Pro starting at $6/user/month.",
  "bestForToolB": "Yaak fits developers who need one client across HTTP, GraphQL, gRPC, WebSocket, and SSE protocols and want a local-first, zero-telemetry tool, with commercial licensing available at $79/year or $349 lifetime.",
  "whoNeedsBoth": "A platform team evaluating Postman alternatives might trial both concurrently, since both import existing Postman/Insomnia collections, using Bruno for Git-heavy CI-integrated REST projects and Yaak for ad hoc multi-protocol testing like gRPC or WebSocket before standardizing on one.",
  "keyDifferences": [
    {
      "title": "Protocol Coverage",
      "toolA": "Bruno's documented features center on Git-native storage and OpenAPI syncs, with no explicit mention of GraphQL, gRPC, or WebSocket support.",
      "toolB": "Yaak explicitly supports HTTP, GraphQL, gRPC, WebSocket, and SSE requests in one app.",
      "whyItMatters": "Teams working with modern API stacks beyond REST need a client that natively handles those protocols.",
      "benefitsWho": "Teams building or consuming GraphQL and gRPC services benefit from Yaak's broader protocol support."
    },
    {
      "title": "Licensing & Commercial Cost",
      "toolA": "Bruno's Open Source tier is free ($0); Pro is $6/user/month and Ultimate is $11/user/month, both billed annually.",
      "toolB": "Yaak's source is MIT-licensed and free to self-build, but commercial use of the prebuilt binaries requires a paid license: $79/year (Individual Annual), $349 one-time (Lifetime), or $149/user/year (Business).",
      "whyItMatters": "The cost structure differs meaningfully for businesses versus individuals building from source.",
      "benefitsWho": "Cost-sensitive individual developers benefit from Yaak's lifetime license option; teams standardizing on per-seat billing benefit from Bruno's per-user/month pricing."
    },
    {
      "title": "Compliance Certification",
      "toolA": "Bruno is SOC 2 Type I certified, with a stated policy of no AI training on user data.",
      "toolB": "Yaak does not document a SOC 2 or similar compliance certification in its available facts.",
      "whyItMatters": "Regulated or enterprise buyers often require vendor compliance attestations before adoption.",
      "benefitsWho": "Security and procurement teams at larger organizations benefit from Bruno's documented SOC 2 Type I status."
    },
    {
      "title": "Team Management on Paid Tiers",
      "toolA": "Bruno's paid tiers add unlimited workspaces, private Git providers, and on Ultimate, SSO & SCIM with unlimited license admins.",
      "toolB": "Yaak's Business plan ($149/user/year) adds SSO, user provisioning, and transferable licenses.",
      "whyItMatters": "Growing teams need centralized license and access management, not just individual licenses.",
      "benefitsWho": "IT admins managing API client access across a growing engineering org benefit from either tool's SSO tier."
    },
    {
      "title": "AI/Agent Connectivity",
      "toolA": "Bruno's feature list does not document AI or MCP agent connectivity.",
      "toolB": "Yaak explicitly supports connecting your own AI agents via its CLI or an MCP server, though it has no native AI features itself.",
      "whyItMatters": "Teams building AI-agent-driven testing or automation workflows need a client that exposes an agent-accessible interface.",
      "benefitsWho": "Developers wiring AI coding assistants into their API testing workflow benefit from Yaak's MCP server support."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core API Client",
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
          "feature": "Import from Postman/Insomnia/OpenAPI/cURL",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Yaak explicitly lists import from Postman, Insomnia, OpenAPI, cURL, and Swagger"
        },
        {
          "feature": "AI/MCP agent connectivity",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Collaboration & Storage",
      "rows": [
        {
          "feature": "Local-first plain-text storage",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Built-in Git version control",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "No login/account required",
          "toolA": "available",
          "toolB": "available",
          "note": "personal use only for Yaak"
        },
        {
          "feature": "SSO / SCIM",
          "toolA": "available",
          "toolB": "available",
          "note": "Bruno Ultimate ($11/user/mo); Yaak Business ($149/user/year)"
        },
        {
          "feature": "SOC 2 certification",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Bruno: SOC 2 Type I"
        }
      ]
    },
    {
      "group": "Pricing & Licensing",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Bruno Open Source $0; Yaak Free (personal use)"
        },
        {
          "feature": "Entry paid plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Bruno Pro $6/user/month; Yaak Individual $79/year"
        },
        {
          "feature": "Lifetime license option",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Yaak Lifetime $349 one-time"
        },
        {
          "feature": "Free trial of paid tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Bruno: 14-day Ultimate trial; Yaak: 30-day commercial evaluation trial"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Bruno or Yaak completely free?",
      "answer": "Both have free tiers: Bruno's Open Source tier is $0 (2 workspaces, public Git providers only), and Yaak is free for personal use with no account required. Commercial use of either requires a paid plan."
    },
    {
      "question": "Does Yaak support GraphQL and gRPC while Bruno doesn't?",
      "answer": "Yaak's documented features explicitly list HTTP, GraphQL, gRPC, WebSocket, and SSE support. Bruno's documented features focus on Git-native storage and OpenAPI syncs without mentioning GraphQL or gRPC."
    },
    {
      "question": "Which tool has SOC 2 certification?",
      "answer": "Bruno is SOC 2 Type I certified. Yaak does not document a SOC 2 certification in the available facts."
    },
    {
      "question": "Can I import my existing Postman collections?",
      "answer": "Yaak documents explicit import support for Postman, Insomnia, OpenAPI, cURL, and Swagger collections. Bruno's import capabilities for Postman collections are not documented in the available facts."
    },
    {
      "question": "What does commercial use cost for each tool?",
      "answer": "Bruno's Pro plan is $6/user/month and Ultimate is $11/user/month, both billed annually. Yaak's commercial license is $79/year (Individual Annual), $349 one-time (Lifetime), or $149/user/year (Business)."
    },
    {
      "question": "Who makes Yaak?",
      "answer": "Yaak is made by Mountain Loop Labs, founded by Greg, the creator of Insomnia (sold in 2019). Yaak launched in January 2024."
    }
  ]
};

export default brunoVsYaakContent;

import type { ToolComparisonContent } from './types';

const fernVsMintlifyContent: ToolComparisonContent = {
  "verdict": "Fern leans into a git-based 'docs as code' workflow with SDK generation across four spec formats (OpenAPI, GraphQL, AsyncAPI, gRPC) and a self-hosting option, operating today as 'a Postman company' following acquisition, while Mintlify emphasizes a web-based editing experience with agent-readiness scoring (Agent Score) for teams that prefer editing docs in-browser rather than via code.",
  "bestForToolA": "Fern suits engineering teams that want git-based docs alongside SDK generation from OpenAPI, GraphQL, AsyncAPI, or gRPC specs, with a free-forever Hobby plan covering 2 team members and 250 AI credits per month.",
  "bestForToolB": "Mintlify suits teams wanting a browser-based documentation editor with agent-readiness tooling, backed by a free Starter plan offering 10,000 AI credits per month, used by companies including Anthropic and Coinbase.",
  "whoNeedsBoth": "This is unlikely in practice — both are full documentation platforms serving the same core job of hosting and generating API docs, so most teams pick one rather than running both in production; a team might trial both briefly during a documentation platform migration or acquisition-driven consolidation.",
  "keyDifferences": [
    {
      "title": "SDK Generation",
      "toolA": "Fern generates client libraries from OpenAPI, GraphQL, AsyncAPI, and gRPC specifications.",
      "toolB": "Mintlify's documented feature set does not include SDK generation.",
      "whyItMatters": "API providers distributing typed client libraries to developers need this built into their docs platform.",
      "benefitsWho": "Teams shipping multi-language SDKs to external developers benefit from Fern's generation capability."
    },
    {
      "title": "Self-Hosting",
      "toolA": "Fern's Enterprise plan offers a documented self-hosting option in addition to Fern's cloud.",
      "toolB": "Mintlify does not document a self-hosting option.",
      "whyItMatters": "Regulated industries or companies with strict data-residency requirements may need to host documentation infrastructure themselves.",
      "benefitsWho": "Enterprises with compliance or data-residency requirements benefit from Fern's self-hosting option."
    },
    {
      "title": "Team Size Limits on Paid Tier",
      "toolA": "Fern's Team plan ($150/month, or $112.50/month billed annually) caps at 5 members before requiring Enterprise.",
      "toolB": "Mintlify's Pro plan team size and price are not publicly documented.",
      "whyItMatters": "Growing teams need to know when they'll outgrow a plan and face a pricing jump.",
      "benefitsWho": "Teams planning headcount growth benefit from Fern's disclosed 5-member cap for budgeting purposes."
    },
    {
      "title": "AI Credit Allowance on Free Tier",
      "toolA": "Fern's free Hobby plan includes 250 AI credits per month; Team adds 1,000 AI credits per month.",
      "toolB": "Mintlify's free Starter plan includes 10,000 AI credits per month, with $0.01 per credit for overages.",
      "whyItMatters": "AI credit limits affect how much AI chat/assistant usage a team can support without paying.",
      "benefitsWho": "Teams expecting heavy AI-assistant usage from documentation readers benefit from Mintlify's larger free credit allowance."
    },
    {
      "title": "Corporate Backing",
      "toolA": "Fern operates as 'a Postman company' following an acquisition by Postman.",
      "toolB": "Mintlify is used by companies including Anthropic, Amazon, AT&T, and Coinbase, with no documented acquisition or parent company.",
      "whyItMatters": "Ownership changes can affect long-term product roadmap and independence.",
      "benefitsWho": "Teams already invested in the Postman ecosystem may value Fern's integration with Postman's collection tooling."
    }
  ],
  "featureMatrix": [
    {
      "group": "Documentation & Workflow",
      "rows": [
        {
          "feature": "Docs-as-code / git-based workflow",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Web-based editor",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multi-source aggregation across repos",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Self-hosting option",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Fern Enterprise"
        },
        {
          "feature": "Custom domain on free tier",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "SDK & Developer Tooling",
      "rows": [
        {
          "feature": "SDK generation",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Fern: OpenAPI, GraphQL, AsyncAPI, gRPC"
        },
        {
          "feature": "MCP server",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "llms.txt generation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Postman collection publishing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "API Playground",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & AI Credits",
      "rows": [
        {
          "feature": "Free plan AI credits",
          "toolA": "available",
          "toolB": "available",
          "note": "Fern: 250/month; Mintlify: 10,000/month"
        },
        {
          "feature": "Entry paid plan price",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Fern Team: $150/mo ($112.50 annual); Mintlify Pro price not public"
        },
        {
          "feature": "Enterprise SSO/RBAC",
          "toolA": "available",
          "toolB": "available",
          "note": "Mintlify adds SCIM too"
        },
        {
          "feature": "Paid team member cap",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Fern Team: 5 members"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Fern generate SDKs while Mintlify doesn't?",
      "answer": "Yes. Fern documents SDK generation from OpenAPI, GraphQL, AsyncAPI, and gRPC specs. Mintlify's feature list does not include SDK generation."
    },
    {
      "question": "How many AI credits come free with each platform?",
      "answer": "Fern's free Hobby plan includes 250 AI credits per month. Mintlify's free Starter plan includes 10,000 AI credits per month, with $0.01/credit overage charges beyond that."
    },
    {
      "question": "Is Fern's paid plan pricing public?",
      "answer": "Yes, Fern's Team plan is listed at $150/month ($112.50/month billed annually) for up to 5 members. Mintlify's Pro plan price is not publicly listed."
    },
    {
      "question": "Does either platform support self-hosting?",
      "answer": "Fern documents a self-hosting option on its Enterprise plan. Mintlify does not document self-hosting as a feature."
    },
    {
      "question": "Who owns Fern now?",
      "answer": "Fern's site describes it as 'a Postman company' following an acquisition by Postman."
    },
    {
      "question": "Which companies use Mintlify?",
      "answer": "Mintlify reports over 20,000 companies as users, including Anthropic, Amazon, AT&T, and Coinbase, and states 99.99% uptime across its services."
    }
  ]
};

export default fernVsMintlifyContent;

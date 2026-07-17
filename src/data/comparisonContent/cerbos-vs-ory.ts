import type { ToolComparisonContent } from './types';

const cerbosVsOryContent: ToolComparisonContent = {
  "verdict": "Cerbos and Ory solve adjacent but distinct problems: Cerbos is a dedicated authorization/policy engine for deciding what an authenticated user or AI agent can do (RBAC/ABAC/ReBAC/PBAC), while Ory is an identity and authentication platform for handling who a user is (login, SSO, B2B/M2M identity). They're often deployed together rather than as substitutes for each other.",
  "bestForToolA": "Teams needing fine-grained, auditable authorization decisions, including AI agent tool-access governance via MCP, separate from their identity provider, with policies deployable on-premise or air-gapped.",
  "bestForToolB": "Teams needing customer, B2B, and machine identity (login, SSO, SCIM) with a free Developer tier and a clear path to a $770/year Production plan.",
  "whoNeedsBoth": "A team building a B2B SaaS product could use Ory for customer login, SSO, and B2B identity management, then use Cerbos as the separate policy engine that decides what each authenticated Ory user or organization is allowed to do inside the application — pairing authentication with authorization is a common real-world architecture.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Cerbos is an authorization/policy-decision engine supporting RBAC, ABAC, ReBAC, and PBAC via a YAML-based policy language.",
      "toolB": "Ory is an identity and authentication platform handling customer identity (CIAM), B2B SSO/SCIM, and machine-to-machine login.",
      "whyItMatters": "Confusing authentication and authorization leads teams to pick the wrong tool for the job, or assume one covers the other.",
      "benefitsWho": "Architects designing an identity and access stack benefit from understanding this split clearly."
    },
    {
      "title": "Pricing Entry Point",
      "toolA": "Cerbos's open-source core is free with unlimited monthly active principals; paid Development starts at $25/month, and Production starts at $933/month.",
      "toolB": "Ory's free Developer tier leads to Production at $770/year and Growth at $9,350/year.",
      "whyItMatters": "The jump from free to production-grade pricing differs significantly between the two, affecting budget planning.",
      "benefitsWho": "Budget-conscious teams comparing total cost of ownership benefit from seeing both pricing ladders side by side."
    },
    {
      "title": "AI Agent Features",
      "toolA": "Cerbos offers explicit AI agent guardrails with Model Context Protocol (MCP) integration for governing and revoking agent tool access in seconds.",
      "toolB": "Ory documents machine-to-machine authentication for services and agents but doesn't detail MCP-specific tool-access governance.",
      "whyItMatters": "As AI agents get more autonomy, dedicated tool-access governance becomes a distinct requirement from basic authentication.",
      "benefitsWho": "Teams deploying AI agents that call internal tools benefit from Cerbos's MCP-specific guardrails."
    },
    {
      "title": "Deployment Flexibility",
      "toolA": "Cerbos can run in Cerbos Hub (cloud), self-hosted, on-premise, or fully air-gapped environments.",
      "toolB": "Ory offers self-hosted deployment, an Ory Enterprise License, or the fully managed Ory Network.",
      "whyItMatters": "Regulated or high-security environments often require air-gapped or on-premise deployment options.",
      "benefitsWho": "Regulated industries with strict infrastructure requirements benefit from Cerbos's explicit air-gapped support."
    },
    {
      "title": "Decision Latency Focus",
      "toolA": "Cerbos's Policy Decision Points are purpose-built for sub-millisecond authorization decisions at high volume.",
      "toolB": "Ory emphasizes stateless horizontal scaling and observability (metrics, trace-level logging) for identity operations rather than policy-decision latency specifically.",
      "whyItMatters": "Applications making authorization checks on every request need low-latency decisions in the request path.",
      "benefitsWho": "High-traffic applications with per-request authorization checks benefit from Cerbos's latency-focused design."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Function",
      "rows": [
        {
          "feature": "Authorization / permissions engine",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Authentication / login (SSO, CIAM)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "B2B SSO / SCIM",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "RBAC / ABAC / ReBAC / PBAC policy models",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI & Advanced Features",
      "rows": [
        {
          "feature": "AI agent guardrails / MCP integration",
          "toolA": "available",
          "toolB": "limited",
          "note": "Ory documents M2M auth, not MCP specifically"
        },
        {
          "feature": "Sub-millisecond decision latency",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Audit-ready decision logging",
          "toolA": "available",
          "toolB": "available",
          "note": "Ory offers observability/trace-level logging"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Free open-source self-hosted option",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Air-gapped deployment",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Fully managed cloud service",
          "toolA": "available",
          "toolB": "available",
          "note": "Cerbos Hub; Ory Network"
        },
        {
          "feature": "Entry-level paid tier price",
          "toolA": "limited",
          "toolB": "limited",
          "note": "Cerbos Dev $25/mo; Ory Production $770/yr"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Cerbos and Ory do the same thing?",
      "answer": "No. Cerbos handles authorization — deciding what an authenticated user or agent can do. Ory handles authentication and identity — login, SSO, and B2B/M2M identity."
    },
    {
      "question": "Can Cerbos and Ory be used together?",
      "answer": "Yes, in principle: Ory could authenticate users while Cerbos decides what those authenticated users or agents are permitted to do. This isn't a documented official integration, but the two tools address complementary layers of the stack."
    },
    {
      "question": "Which tool is free to self-host?",
      "answer": "Both offer free self-hosted paths. Cerbos's open-source core has unlimited monthly active principals, and Ory's Developer tier is free with 2 development environments."
    },
    {
      "question": "Does Ory support authorization models like RBAC or ABAC?",
      "answer": "Ory's documented features center on identity and authentication (SSO, B2B, M2M) rather than a dedicated multi-model policy engine like Cerbos's RBAC/ABAC/ReBAC/PBAC support."
    },
    {
      "question": "Which is cheaper to reach a production-grade plan?",
      "answer": "Ory's Production plan costs $770/year. Cerbos's Production tier starts much higher, at $933/month."
    },
    {
      "question": "Does Cerbos support AI agent authorization?",
      "answer": "Yes, Cerbos offers explicit AI agent guardrails, including integration with the Model Context Protocol (MCP), to govern and revoke agent tool access."
    }
  ]
};

export default cerbosVsOryContent;

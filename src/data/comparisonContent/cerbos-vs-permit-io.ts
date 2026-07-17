import type { ToolComparisonContent } from './types';

const cerbosVsPermitIoContent: ToolComparisonContent = {
  "verdict": "Both Cerbos and Permit.io are dedicated authorization/policy platforms supporting RBAC, ABAC, and ReBAC with AI agent authorization features, making them direct competitors rather than complementary tools. They differ mainly in policy foundation — Cerbos's own YAML-based language versus Permit.io's build on the open-source OPA and OPAL projects — and in how their free-to-paid pricing scales.",
  "bestForToolA": "Teams wanting a YAML-based policy engine with explicit air-gapped and on-premise deployment support, plus unlimited monthly active principals in the free open-source version.",
  "bestForToolB": "Teams wanting a UI-driven policy platform built on the established OPA/OPAL open-source projects, with a dedicated MCP Gateway and Guardian Agents for AI monitoring, and a lower-cost paid entry point starting at $5/month.",
  "whoNeedsBoth": "Unlikely — both are largely substitutable authorization engines solving the same problem, so most teams would pick one rather than run both in production, though an organization migrating between vendors might run them in parallel temporarily during evaluation.",
  "keyDifferences": [
    {
      "title": "Policy Foundation",
      "toolA": "Cerbos defines policies using its own YAML-based policy language across RBAC, ABAC, ReBAC, or PBAC models.",
      "toolB": "Permit.io is built on the open-source Open Policy Agent (OPA) and OPAL projects as its policy engine foundation.",
      "whyItMatters": "Teams already invested in OPA tooling may prefer building on that ecosystem rather than learning a new proprietary policy language.",
      "benefitsWho": "Teams with existing OPA/OPAL experience benefit from Permit.io's foundation; teams wanting a purpose-built language may prefer Cerbos."
    },
    {
      "title": "Free Tier Limits",
      "toolA": "Cerbos's open-source core has unlimited monthly active principals, but its free cloud Proof of Concept tier caps at 100 MAPs.",
      "toolB": "Permit.io's free Community plan covers up to 1,000 monthly active users with unlimited authorization microservices.",
      "whyItMatters": "The size of a usable free tier affects how long a team can build and test before needing to pay.",
      "benefitsWho": "Early-stage teams testing at moderate scale benefit from Permit.io's higher free MAU cap in its managed tier."
    },
    {
      "title": "Paid Entry Pricing",
      "toolA": "Cerbos's Development tier starts at $25/month, with a steep jump to $933/month for the Production tier.",
      "toolB": "Permit.io's Startup tier starts at $5/month and Pro at $25/month, offering a more gradual price ramp.",
      "whyItMatters": "A steep price jump between tiers can force a team into a large budget increase sooner than expected.",
      "benefitsWho": "Growing startups on tight budgets benefit from Permit.io's more gradual pricing ladder."
    },
    {
      "title": "AI Agent Tooling",
      "toolA": "Cerbos offers AI agent guardrails with MCP support for governing and revoking agent tool access in seconds.",
      "toolB": "Permit.io offers a dedicated MCP Gateway plus Guardian Agents that monitor for anomalous access behavior and recommend policy changes.",
      "whyItMatters": "Both platforms treat AI agent authorization as a first-class concern, but Permit.io adds proactive anomaly monitoring on top.",
      "benefitsWho": "Teams operating autonomous AI agents at scale benefit from Permit.io's added Guardian Agents monitoring layer."
    },
    {
      "title": "SSO Access Cost",
      "toolA": "Cerbos requires moving to custom Enterprise pricing to get SSO support.",
      "toolB": "Permit.io requires an additional cost for SSO even on its paid Pro plan.",
      "whyItMatters": "Enterprises requiring SSO for internal tooling should budget for it as an add-on cost with either vendor.",
      "benefitsWho": "Enterprise buyers evaluating total cost of ownership benefit from knowing SSO isn't bundled into either platform's mid tier."
    }
  ],
  "featureMatrix": [
    {
      "group": "Policy Engine & Models",
      "rows": [
        {
          "feature": "RBAC / ABAC / ReBAC support",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "PBAC support",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Policy language",
          "toolA": "available",
          "toolB": "available",
          "note": "Cerbos: own YAML language; Permit.io: built on OPA/OPAL"
        },
        {
          "feature": "Sub-millisecond decision latency",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI Agent Authorization",
      "rows": [
        {
          "feature": "MCP integration for AI agent tool access",
          "toolA": "available",
          "toolB": "available",
          "note": "Permit.io: dedicated MCP Gateway"
        },
        {
          "feature": "AI anomaly monitoring",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Permit.io: Guardian Agents"
        },
        {
          "feature": "Audit logs / decision traces",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Deployment",
      "rows": [
        {
          "feature": "Free open-source / community tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Cerbos: unlimited MAPs OSS; Permit.io: 1,000 MAU"
        },
        {
          "feature": "Entry paid plan price",
          "toolA": "limited",
          "toolB": "limited",
          "note": "Cerbos $25/mo; Permit.io $5/mo"
        },
        {
          "feature": "SSO included on mid-tier plan",
          "toolA": "unavailable",
          "toolB": "limited",
          "note": "Both require extra cost/Enterprise for SSO"
        },
        {
          "feature": "On-premise / air-gapped deployment",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Cerbos and Permit.io built on the same technology?",
      "answer": "No. Cerbos uses its own YAML-based policy language, while Permit.io is built on the open-source OPA and OPAL projects."
    },
    {
      "question": "Which has AI agent authorization features?",
      "answer": "Both do. Cerbos offers AI agent guardrails with MCP integration, and Permit.io offers an MCP Gateway plus Guardian Agents for anomaly monitoring."
    },
    {
      "question": "Which is cheaper to start with a paid plan?",
      "answer": "Permit.io's Startup plan starts at $5/month, compared to Cerbos's Development tier at $25/month."
    },
    {
      "question": "Does either support SSO on lower-tier plans?",
      "answer": "No. Permit.io requires an additional cost for SSO even on its Pro plan, and Cerbos requires custom Enterprise pricing for SSO."
    },
    {
      "question": "Can both be self-hosted or run on-premise?",
      "answer": "Yes. Cerbos supports self-hosted, on-premise, and air-gapped deployment, and Permit.io offers both managed cloud and self-hosted/on-premises deployment."
    },
    {
      "question": "How big is the jump to Cerbos's Production tier?",
      "answer": "Cerbos's Production plan starts at $933/month for the first 5,000 monthly active principals, a much bigger jump than its $25/month Development tier."
    }
  ]
};

export default cerbosVsPermitIoContent;

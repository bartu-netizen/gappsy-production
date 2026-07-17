import type { ToolComparisonContent } from './types';

const descopeVsWorkosContent: ToolComparisonContent = {
  "verdict": "Descope centers on a no-code visual workflow builder (Descope Flows) plus fine-grained RBAC/ReBAC/ABAC authorization and dedicated AI agent/MCP server security, with paid plans starting at $249/month for Pro. WorkOS is an API-first platform anchored by AuthKit, free for the first 1 million MAU, with enterprise SSO and Directory Sync billed per connection starting at $125. Descope is oriented toward teams that want to visually configure complex auth logic and secure AI-agent access; WorkOS is oriented toward teams that want broad enterprise IdP coverage with a very high free-usage ceiling before paying anything.",
  "bestForToolA": "Teams building products with complex, evolving authentication logic or AI-agent/MCP integrations benefit from Descope's visual Flows builder and its RBAC/ReBAC/ABAC authorization models and dedicated MCP security features.",
  "bestForToolB": "B2B SaaS companies that want to scale to a large free user base before paying (AuthKit free to 1M MAU) and need coverage across 20+ enterprise identity providers are better served by WorkOS.",
  "whoNeedsBoth": "These are competing CIAM platforms rather than complementary tools, so most teams pick one for a given application. A possible exception is a company running WorkOS for its primary product's enterprise SSO while a separate team pilots Descope specifically for an AI-agent-facing product that needs Descope's MCP server security, but that means two distinct systems rather than one integrated stack.",
  "keyDifferences": [
    {
      "title": "No-Code Flow Builder",
      "toolA": "Descope Flows is a visual, drag-and-drop workflow builder for designing authentication and identity journeys without hand-coding custom auth logic.",
      "toolB": "WorkOS offers AuthKit, a customizable prebuilt authentication UI, but a visual no-code flow/workflow builder is not documented.",
      "whyItMatters": "Teams that need to iterate on auth logic (conditional MFA, step-up verification, custom journeys) without engineering cycles benefit from a visual builder.",
      "benefitsWho": "Product and growth teams that want to adjust authentication flows without redeploying code."
    },
    {
      "title": "Authorization Model Depth",
      "toolA": "Descope supports role-based (RBAC), relationship-based (ReBAC), and attribute-based (ABAC) access control models.",
      "toolB": "WorkOS documents role-based access control (RBAC) for defining permissions across users and organizations; ReBAC and ABAC are not documented.",
      "whyItMatters": "Complex B2B products with nested resource permissions often need authorization models beyond simple roles.",
      "benefitsWho": "Products with fine-grained resource-level permissions, such as multi-tenant platforms with shared workspaces."
    },
    {
      "title": "AI Agent / MCP Server Security",
      "toolA": "Descope has a dedicated feature for AI agent and MCP server security, covering authorization, scope-based access control, consent, token management, and Dynamic Client Registration.",
      "toolB": "WorkOS does not document an MCP-specific security feature; its identity coverage is oriented around human user and machine SDK authentication.",
      "whyItMatters": "As products expose functionality to AI agents, securing agent-to-service access requires purpose-built controls beyond standard user login.",
      "benefitsWho": "Teams building AI-agent-facing products or exposing MCP servers that need scoped, consent-based access control."
    },
    {
      "title": "Free Tier Ceiling",
      "toolA": "Descope's Free Forever plan includes 7,500 MAUs, 10 tenants, and 3 SSO connections with no time limit.",
      "toolB": "WorkOS's AuthKit is free for the first 1 million monthly active users in production, though SSO connections are billed separately starting at $125 each.",
      "whyItMatters": "The free-tier user ceiling determines how long a growing product can avoid paying for core identity infrastructure.",
      "benefitsWho": "Early-stage startups trying to minimize fixed identity costs while scaling users."
    },
    {
      "title": "Bot/Fraud Protection Availability",
      "toolA": "Descope's bot protection requires the Growth tier at $799/month or higher.",
      "toolB": "WorkOS includes Radar fraud/bot protection with the first 1,000 checks free each month across all tiers.",
      "whyItMatters": "Whether fraud protection is included from day one or gated behind a higher-priced plan affects total cost for high-signup-volume products.",
      "benefitsWho": "Consumer-facing apps or high-volume signup flows concerned about bot abuse."
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Tier & Pricing",
      "rows": [
        {
          "feature": "Free plan MAU ceiling",
          "toolA": "available",
          "toolB": "available",
          "note": "Descope 7,500 MAUs vs. WorkOS 1,000,000 MAU"
        },
        {
          "feature": "SSO connections included free",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Descope includes 3 free; WorkOS bills from $125/connection"
        },
        {
          "feature": "Fixed entry paid plan price",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Descope Pro $249/month; WorkOS pricing is per-connection, not flat"
        }
      ]
    },
    {
      "group": "Authorization & Identity Features",
      "rows": [
        {
          "feature": "No-code visual flow builder",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Descope Flows"
        },
        {
          "feature": "Role-based access control (RBAC)",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Relationship-based/attribute-based access (ReBAC/ABAC)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Adaptive, risk-based MFA",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "AI Agent / MCP & Enterprise",
      "rows": [
        {
          "feature": "MCP server security",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Bot/fraud protection",
          "toolA": "available",
          "toolB": "available",
          "note": "Descope requires Growth tier ($799/mo); WorkOS Radar free 1,000 checks/mo"
        },
        {
          "feature": "SCIM provisioning",
          "toolA": "available",
          "toolB": "available",
          "note": "Descope Growth tier; WorkOS via Directory Sync"
        },
        {
          "feature": "Directory/HR system sync",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "WorkOS Directory Sync, e.g., BambooHR"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which has a bigger free tier, Descope or WorkOS?",
      "answer": "WorkOS, by user count: AuthKit is free up to 1 million MAU, while Descope's Free Forever plan caps at 7,500 MAUs, 10 tenants, and 3 SSO connections."
    },
    {
      "question": "Which supports more advanced authorization models?",
      "answer": "Descope, which supports RBAC, ReBAC, and ABAC. WorkOS documents RBAC only."
    },
    {
      "question": "Does either platform secure AI agents or MCP servers?",
      "answer": "Descope has a dedicated AI agent and MCP server security feature covering authorization, scope-based access, consent, and token management. WorkOS does not document an equivalent feature."
    },
    {
      "question": "How does Descope's no-code builder differ from WorkOS's AuthKit?",
      "answer": "Descope Flows is a drag-and-drop visual builder for designing entire auth journeys. WorkOS's AuthKit is a customizable prebuilt login UI, not a visual workflow builder."
    },
    {
      "question": "Which includes fraud/bot protection without an extra paid tier?",
      "answer": "WorkOS, via Radar, includes the first 1,000 fraud/bot checks free each month on all tiers. Descope's bot protection requires the $799/month Growth tier or higher."
    },
    {
      "question": "How much does Descope's Pro plan cost?",
      "answer": "Descope's Pro plan starts at $249/month, billed annually, and includes 10,000 MAUs and 5 SSO connections."
    }
  ]
};

export default descopeVsWorkosContent;

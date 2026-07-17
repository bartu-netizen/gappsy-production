import type { ToolComparisonContent } from './types';

const openfgaVsStytchContent: ToolComparisonContent = {
  "verdict": "OpenFGA is a dedicated, self-hosted authorization engine for modeling fine-grained relationship-based permissions, while Stytch is a broader identity platform combining authentication (passkeys, magic links, SSO/SCIM), basic authorization (RBAC), and fraud/bot protection as a managed API service. They overlap only on the authorization slice of Stytch's platform.",
  "bestForToolA": "Engineering teams needing deep, Zanzibar-style relationship-based permission modeling — for example, resource- or document-level sharing rules — who are willing to self-host at no licensing cost.",
  "bestForToolB": "Teams needing a managed platform that combines authentication (passkeys, magic links, SSO/SCIM), basic RBAC, machine-to-machine/AI agent auth, and fraud/bot protection in one API, free up to 10,000 monthly active users or AI agents.",
  "whoNeedsBoth": "A team could use Stytch to handle authentication, SSO/SCIM, and fraud protection for its application, then layer OpenFGA on top as the dedicated policy engine for fine-grained relationship-based decisions, such as document- or resource-level sharing permissions, that go beyond Stytch's built-in RBAC.",
  "keyDifferences": [
    {
      "title": "Product Scope",
      "toolA": "OpenFGA is a single-purpose authorization/permissions engine.",
      "toolB": "Stytch is a full identity platform spanning authentication, basic authorization (RBAC), multi-tenancy, and fraud/bot protection.",
      "whyItMatters": "Teams need to know whether they're comparing a narrow point solution against a broader platform before evaluating either on price or features.",
      "benefitsWho": "Architects scoping their identity/access stack benefit from understanding this scope difference upfront."
    },
    {
      "title": "Pricing Model",
      "toolA": "OpenFGA is entirely free and open source with no paid plans.",
      "toolB": "Stytch is freemium, free up to 10,000 monthly active users/AI agents with usage-based overages and no hard pricing cliffs.",
      "whyItMatters": "A zero-cost self-hosted tool versus a managed freemium API changes both upfront cost and ongoing operational responsibility.",
      "benefitsWho": "Cost-sensitive teams with self-hosting capacity benefit from OpenFGA; teams wanting managed infrastructure benefit from Stytch's generous free tier."
    },
    {
      "title": "Authorization Depth",
      "toolA": "OpenFGA offers deep Zanzibar-inspired relationship-based access control with Check, Read, Expand, and ListObjects operations.",
      "toolB": "Stytch documents RBAC in its base tier but doesn't detail ReBAC-style relationship modeling.",
      "whyItMatters": "Complex sharing and permission models (e.g., nested groups, resource hierarchies) need relationship-based authorization, not just role checks.",
      "benefitsWho": "Products with complex, resource-level sharing permissions benefit from OpenFGA's deeper ReBAC modeling."
    },
    {
      "title": "Hosting",
      "toolA": "OpenFGA must be self-hosted, for example via Docker, with no managed offering.",
      "toolB": "Stytch is a managed API/platform service, not self-hosted.",
      "whyItMatters": "Self-hosting gives full infrastructure control but requires ops capacity; a managed API removes that burden but ties a team to the vendor's infrastructure.",
      "benefitsWho": "Teams without dedicated infrastructure staff benefit from Stytch's fully managed model."
    },
    {
      "title": "Fraud and Bot Protection",
      "toolA": "OpenFGA does not offer fraud or bot detection, as it's scoped purely to authorization decisions.",
      "toolB": "Stytch includes device fingerprinting and intelligent rate limiting, described as achieving 99.99% bot detection accuracy, with 10,000 free fingerprints per month.",
      "whyItMatters": "Consumer-facing applications often need fraud/bot protection as part of their identity stack, not as a separate purchase.",
      "benefitsWho": "Consumer-facing products worried about bot abuse or account takeover benefit from Stytch's built-in fraud protection."
    }
  ],
  "featureMatrix": [
    {
      "group": "Authorization Depth",
      "rows": [
        {
          "feature": "Zanzibar-inspired ReBAC modeling",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "RBAC support",
          "toolA": "limited",
          "toolB": "available",
          "note": "OpenFGA can model RBAC within its ReBAC system"
        },
        {
          "feature": "Millisecond authorization checks",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Authentication & Identity",
      "rows": [
        {
          "feature": "Passwordless login (passkeys, magic links, OTP)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Enterprise SSO / SCIM",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "First 5 connections free"
        },
        {
          "feature": "Machine-to-machine / AI agent authentication",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Fraud / bot protection",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "99.99% reported bot detection accuracy"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Managed API / hosted service",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "limited",
          "note": "Stytch free up to 10,000 MAUs/agents"
        },
        {
          "feature": "Multi-language SDKs",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "OpenFGA: Node.js, Go, .NET, Python, Java"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do OpenFGA and Stytch compete directly?",
      "answer": "Only partially. OpenFGA is purely an authorization/permissions engine, while Stytch bundles authentication, basic RBAC, and fraud protection into one platform."
    },
    {
      "question": "Is OpenFGA free?",
      "answer": "Yes, it's fully free and open source, and must be self-hosted."
    },
    {
      "question": "Does Stytch have a free tier?",
      "answer": "Yes, free up to 10,000 monthly active users/AI agents, 5 SSO/SCIM connections, and 1,000 M2M tokens."
    },
    {
      "question": "Which tool supports AI agent authentication?",
      "answer": "Stytch explicitly supports machine-to-machine authentication for AI agents in its free tier. OpenFGA doesn't document AI-agent-specific authentication, though its authorization checks could still govern agent permissions once authenticated."
    },
    {
      "question": "Does Stytch offer relationship-based access control like OpenFGA?",
      "answer": "This isn't documented. Stytch's features list RBAC but don't describe Zanzibar-style relationship-based access control the way OpenFGA does."
    },
    {
      "question": "Can OpenFGA be used for fraud or bot protection?",
      "answer": "No, this isn't part of OpenFGA's documented feature set. Stytch offers dedicated fraud/bot protection with device fingerprinting and rate limiting."
    }
  ]
};

export default openfgaVsStytchContent;

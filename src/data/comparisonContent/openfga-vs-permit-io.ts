import type { ToolComparisonContent } from './types';

const openfgaVsPermitIoContent: ToolComparisonContent = {
  "verdict": "OpenFGA is a free, fully open-source, self-hosted-only authorization engine focused on Zanzibar-style relationship-based access control, while Permit.io is a commercial freemium platform built on OPA/OPAL offering both managed cloud and self-hosted deployment, a UI-driven policy workflow, and dedicated AI agent features. The choice hinges on whether a team wants to operate its own authorization server for free or pay for a managed layer with more tooling.",
  "bestForToolA": "Engineering teams comfortable self-hosting and operating their own OpenFGA server, for example via Docker, who want a free, CNCF-governed, Zanzibar-style relationship-based authorization engine with no licensing cost.",
  "bestForToolB": "Teams that want a managed option out of the box, a UI for building RBAC/ABAC/ReBAC/PBAC policies and approval workflows, plus AI-specific features like the MCP Gateway and Guardian Agents, with a free Community plan up to 1,000 monthly active users.",
  "whoNeedsBoth": "Unlikely as parallel production deployments since both solve the same authorization problem, but a team might prototype quickly on OpenFGA's free self-hosted server before evaluating whether Permit.io's managed layer and UI tooling justify moving to a paid plan.",
  "keyDifferences": [
    {
      "title": "Hosting Model",
      "toolA": "OpenFGA has no managed hosted offering documented on openfga.dev and must be self-hosted, for example via Docker.",
      "toolB": "Permit.io offers both a managed cloud service and self-hosted/on-premises deployment.",
      "whyItMatters": "Teams without ops capacity for running their own authorization server need a managed option available out of the box.",
      "benefitsWho": "Teams without dedicated infrastructure staff benefit from Permit.io's managed cloud option."
    },
    {
      "title": "Commercial Support",
      "toolA": "OpenFGA is community-supported only; formal commercial support is not part of its core open-source offering.",
      "toolB": "Permit.io offers paid tiers with dedicated Slack support (Pro) and a dedicated customer success representative (Enterprise).",
      "whyItMatters": "Production systems handling authorization decisions often need a vendor support relationship for incident response.",
      "benefitsWho": "Enterprises needing contractual support SLAs benefit from Permit.io's paid support tiers."
    },
    {
      "title": "Policy Model Foundation",
      "toolA": "OpenFGA uses its own Zanzibar-inspired authorization modeling language for relationship-based access control.",
      "toolB": "Permit.io is built on the open-source OPA and OPAL projects and supports RBAC, ABAC, ReBAC, and PBAC through a UI and API.",
      "whyItMatters": "The underlying policy model affects how much of a learning curve a team faces and what existing tooling it can reuse.",
      "benefitsWho": "Teams already familiar with Google's Zanzibar paper benefit from OpenFGA's direct implementation of those concepts."
    },
    {
      "title": "AI-Specific Tooling",
      "toolA": "OpenFGA does not document AI-agent-specific features.",
      "toolB": "Permit.io provides a dedicated MCP Gateway and Guardian Agents for AI agent authorization and anomaly monitoring.",
      "whyItMatters": "Teams building AI agent products need explicit tool-access governance, not just general-purpose authorization checks.",
      "benefitsWho": "Teams deploying AI agents that call internal tools benefit from Permit.io's dedicated AI features."
    },
    {
      "title": "Pricing",
      "toolA": "OpenFGA is entirely free with no paid plans at all.",
      "toolB": "Permit.io is freemium, with a free Community plan up to 1,000 MAU and paid Startup ($5/month) and Pro ($25/month) tiers.",
      "whyItMatters": "A zero-cost open-source tool versus a freemium SaaS with paid tiers changes long-term budget planning.",
      "benefitsWho": "Cost-sensitive teams with strong self-hosting capacity benefit from OpenFGA's zero-cost model."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment & Hosting",
      "rows": [
        {
          "feature": "Managed cloud hosting",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Self-hosted server (e.g., Docker)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Free tier / free forever",
          "toolA": "available",
          "toolB": "available",
          "note": "OpenFGA fully free; Permit.io Community up to 1,000 MAU"
        }
      ]
    },
    {
      "group": "Policy Model & Tooling",
      "rows": [
        {
          "feature": "Zanzibar-inspired ReBAC modeling",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "RBAC / ABAC / ReBAC / PBAC support",
          "toolA": "limited",
          "toolB": "available",
          "note": "OpenFGA covers RBAC/ABAC/ReBAC; Permit.io adds PBAC"
        },
        {
          "feature": "UI for policy management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multi-language SDKs",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "OpenFGA: Node.js, Go, .NET, Python, Java"
        }
      ]
    },
    {
      "group": "AI Agent Features",
      "rows": [
        {
          "feature": "MCP Gateway / AI agent access governance",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI anomaly monitoring",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Permit.io: Guardian Agents"
        },
        {
          "feature": "Commercial vendor support",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is OpenFGA completely free?",
      "answer": "Yes, it's free and open source with no licensing cost, self-hosted via Docker or similar."
    },
    {
      "question": "Does OpenFGA offer a managed cloud version?",
      "answer": "No, openfga.dev does not document a managed hosted offering."
    },
    {
      "question": "Is Permit.io free to use?",
      "answer": "Yes, its Community plan is free forever for up to 1,000 monthly active users."
    },
    {
      "question": "Which tool has dedicated AI agent authorization features?",
      "answer": "Permit.io, via its MCP Gateway and Guardian Agents. OpenFGA doesn't document AI-agent-specific tooling."
    },
    {
      "question": "What authorization models do they support?",
      "answer": "OpenFGA supports RBAC, ABAC, and ReBAC via Zanzibar-inspired modeling. Permit.io supports RBAC, ABAC, ReBAC, and PBAC via a UI, API, and infrastructure-as-code workflows."
    },
    {
      "question": "Who maintains OpenFGA?",
      "answer": "OpenFGA is a CNCF incubating project, originally created by Auth0/Okta and now maintained by a broader community including engineers from Grafana Labs and Gitpod."
    }
  ]
};

export default openfgaVsPermitIoContent;

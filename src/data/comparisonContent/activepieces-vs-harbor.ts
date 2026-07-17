import type { ToolComparisonContent } from './types';

const activepiecesVsHarborContent: ToolComparisonContent = {
  "verdict": "activepieces is a paid, usage-based workflow automation platform for connecting business apps, while Harbor is a completely free, CNCF-graduated open-source container registry with built-in vulnerability scanning and RBAC. The two tools operate in unrelated categories - business process automation versus container image storage and security - so this comparison centers on licensing, cost, and deployment model rather than feature overlap.",
  "bestForToolA": "Operations and business teams that need to automate cross-app workflows with a large integrations library ('pieces' like Gmail), paying $5 per active flow/month or negotiating a custom Ultimate contract.",
  "bestForToolB": "Platform and security engineering teams needing a free, self-hosted container registry with built-in vulnerability scanning, content signing, multi-tenant RBAC, and cross-registry replication for HA/DR - Harbor is adopted by large enterprises like JD.com and China Mobile.",
  "whoNeedsBoth": "An engineering organization might run Harbor as its container registry for storing and scanning Docker images across its Kubernetes clusters, while a separate business operations team uses activepieces to automate unrelated workflows like lead routing or HR onboarding - both tools could exist in the same company without any functional overlap.",
  "keyDifferences": [
    {
      "title": "Cost Structure",
      "toolA": "Paid, usage-based pricing starting at $5 per active flow/month.",
      "toolB": "Entirely free and open source, with no pricing plans documented at all.",
      "whyItMatters": "Harbor carries zero licensing cost regardless of scale, while activepieces' cost grows with the number of active automations.",
      "benefitsWho": "Benefits infrastructure teams that can adopt Harbor without any software spend, versus automation teams budgeting for activepieces' per-flow pricing."
    },
    {
      "title": "Governance Status",
      "toolA": "Not documented as belonging to a foundation; positioned as an open-source product with commercial plans.",
      "toolB": "A CNCF (Cloud Native Computing Foundation) Graduated project, the foundation's highest maturity designation.",
      "whyItMatters": "CNCF Graduated status signals long-term project stability and broad community governance, which matters for infrastructure teams making multi-year bets.",
      "benefitsWho": "Benefits enterprises wanting assurance of a project's longevity and governance before adopting it as core infrastructure."
    },
    {
      "title": "Security-Specific Functionality",
      "toolA": "Not documented as offering vulnerability scanning or artifact signing.",
      "toolB": "Includes built-in vulnerability scanning and content signing/validation to ensure container image integrity.",
      "whyItMatters": "Teams shipping containers to production need image security scanning as part of their supply chain, which is core to Harbor's purpose.",
      "benefitsWho": "Benefits security and platform teams responsible for container supply-chain integrity."
    },
    {
      "title": "Hosting Requirement",
      "toolA": "Offers both cloud-hosted and self-hosted deployment.",
      "toolB": "Requires self-hosting on Kubernetes or Docker; no official managed hosted tier from the project.",
      "whyItMatters": "Teams without infrastructure capacity have a managed path with activepieces, but must self-operate Harbor.",
      "benefitsWho": "Benefits teams with existing Kubernetes/Docker operational capacity who are comfortable self-hosting Harbor."
    },
    {
      "title": "Support Channel",
      "toolA": "Not detailed in depth, though the Ultimate plan implies contract-based support.",
      "toolB": "No commercial support channel is documented on the official site, relying instead on open-source community support.",
      "whyItMatters": "Enterprises needing guaranteed SLA-backed support should confirm what's available before committing to production use.",
      "benefitsWho": "Benefits enterprises weighing self-supported open source (Harbor) against a vendor relationship (activepieces)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Function",
      "rows": [
        {
          "feature": "Business process/workflow automation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Container image registry",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Vulnerability scanning",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Cross-registry image replication",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access Control",
      "rows": [
        {
          "feature": "Role-based access control",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Multi-tenant RBAC with identity integration"
        },
        {
          "feature": "Enterprise governance controls",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Content signing and image integrity validation",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Cost & Deployment",
      "rows": [
        {
          "feature": "Pricing model",
          "toolA": "available",
          "toolB": "available",
          "note": "activepieces: $5/active flow/month; Harbor: completely free"
        },
        {
          "feature": "Cloud-hosted vendor option",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Harbor is self-host only with no managed tier"
        },
        {
          "feature": "Open-source availability",
          "toolA": "available",
          "toolB": "available",
          "note": "Harbor is a CNCF Graduated open-source project"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Harbor really free, unlike activepieces?",
      "answer": "Yes, Harbor is free and open source with no pricing plans documented, while activepieces charges $5 per active flow/month on its Standard plan (or a custom Ultimate contract)."
    },
    {
      "question": "Does activepieces scan container images for vulnerabilities?",
      "answer": "No, that's not an activepieces feature - vulnerability scanning is a core built-in capability of Harbor."
    },
    {
      "question": "What does CNCF Graduated mean for Harbor?",
      "answer": "It's the Cloud Native Computing Foundation's highest project maturity status, signaling broad adoption, stable governance, and long-term viability for infrastructure teams evaluating Harbor."
    },
    {
      "question": "Can Harbor be used as a managed/hosted service?",
      "answer": "No official managed hosted tier is documented - Harbor requires self-hosting on Kubernetes or a Docker-capable system, unlike activepieces, which offers a cloud-hosted option."
    },
    {
      "question": "Are activepieces and Harbor used by the same teams?",
      "answer": "Typically not directly - Harbor is adopted by platform and security engineering teams managing container registries, while activepieces is used by operations and business teams automating workflows; they can coexist without overlapping."
    }
  ]
};

export default activepiecesVsHarborContent;

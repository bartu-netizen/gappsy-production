import type { ToolComparisonContent } from './types';

const activepiecesVsPortainerContent: ToolComparisonContent = {
  "verdict": "activepieces is a workflow-automation platform connecting business apps and processes, while Portainer is a management UI for Docker and Kubernetes container environments. They address different problems - process automation versus container and cluster operations - so the meaningful comparison is around deployment flexibility, pricing structure, and target user rather than overlapping features.",
  "bestForToolA": "Business teams in HR, finance, marketing, and sales building app-to-app automations, paying $5 per active flow/month with the option to self-host or use activepieces' cloud.",
  "bestForToolB": "DevOps and platform teams managing Docker and multiple Kubernetes distributions (EKS, AKS, GKE, Rancher, K3s, OpenShift, Talos) who want a free-forever option for small deployments - Portainer's Business Edition is free for up to 3 nodes.",
  "whoNeedsBoth": "A platform team might run Portainer to manage the Kubernetes or Docker clusters hosting their internal tools, while activepieces, potentially deployed as one of those containerized services, handles business-process automation on top - the two would operate at different layers of the same technical estate.",
  "keyDifferences": [
    {
      "title": "What Each Tool Manages",
      "toolA": "Manages business workflows and app integrations.",
      "toolB": "Manages container and Kubernetes cluster infrastructure - deployments, nodes, and GitOps workflows.",
      "whyItMatters": "Mismatched expectations about what a tool does waste evaluation time.",
      "benefitsWho": "Benefits buyers scoping infrastructure-management needs (Portainer) separately from automation needs (activepieces)."
    },
    {
      "title": "Free Tier Depth",
      "toolA": "No free tier is documented; the Standard plan starts at $5 per active flow/month.",
      "toolB": "Business Edition is free forever for up to 3 nodes with full feature access and no credit card required.",
      "whyItMatters": "Small teams can run Portainer at zero cost indefinitely at small scale, while activepieces charges from the first active flow.",
      "benefitsWho": "Benefits small infrastructure teams using Portainer's free 3-node tier versus automation teams needing activepieces' usage-based flexibility."
    },
    {
      "title": "Pricing Beyond Free Tier",
      "toolA": "Usage-based per active flow ($5/month), scaling to a custom Ultimate annual contract.",
      "toolB": "Node-based tiers - Starter at $105/month (5-15 nodes), Scale at $209/month (5-35 nodes), and a custom Enterprise quote (32+ vCPUs, dedicated support).",
      "whyItMatters": "Portainer's cost scales with infrastructure footprint (nodes), while activepieces' cost scales with automation usage (active flows) - a fundamentally different cost driver.",
      "benefitsWho": "Benefits finance and procurement teams modeling cost against the metric that actually matches their usage pattern."
    },
    {
      "title": "Identity and Access Integration",
      "toolA": "Not documented in detail beyond general enterprise governance controls.",
      "toolB": "Supports SSO, LDAP, and OIDC for centralized enterprise identity integration.",
      "whyItMatters": "Enterprises with existing identity providers need native SSO, LDAP, and OIDC support to avoid managing separate credentials.",
      "benefitsWho": "Benefits enterprise IT teams standardizing access control across tools."
    },
    {
      "title": "Non-Commercial / Student Access",
      "toolA": "No student or non-commercial plan is documented.",
      "toolB": "Offers a dedicated Home & Student plan at $155/year for non-commercial use on up to 15 nodes.",
      "whyItMatters": "Individuals learning container orchestration outside a company context have a low-cost path with Portainer that activepieces doesn't document.",
      "benefitsWho": "Benefits students and hobbyists learning Kubernetes/Docker management."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Function",
      "rows": [
        {
          "feature": "Business workflow automation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Docker container management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Kubernetes multi-cluster fleet management",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "GitOps deployment workflows",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Access",
      "rows": [
        {
          "feature": "Free tier for small-scale use",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Portainer Business Edition, up to 3 nodes"
        },
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Cloud-hosted vendor option",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Enterprise identity integration (SSO/LDAP/OIDC)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing Structure",
      "rows": [
        {
          "feature": "Usage-based pricing metric",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "$5/active flow/month"
        },
        {
          "feature": "Node-based pricing tiers",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "$105-$209/month"
        },
        {
          "feature": "Custom enterprise contract",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Non-commercial/student pricing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "$155/year"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Portainer free like activepieces?",
      "answer": "Portainer's Business Edition is free forever for up to 3 nodes; activepieces has no documented free tier and starts at $5 per active flow/month on its Standard plan."
    },
    {
      "question": "Does activepieces manage Docker or Kubernetes environments?",
      "answer": "No, that's not documented as an activepieces capability - Portainer is purpose-built for managing Docker and multiple Kubernetes distributions."
    },
    {
      "question": "How does Portainer's pricing scale?",
      "answer": "By node count - $105/month for the Starter plan (5-15 nodes) up to $209/month for Scale (5-35 nodes), with custom Enterprise pricing beyond that."
    },
    {
      "question": "How does activepieces' pricing scale?",
      "answer": "By active flow usage at $5 per active flow/month on the Standard plan, or a custom annual contract on the Ultimate plan."
    },
    {
      "question": "Is there a low-cost option for students or hobbyists?",
      "answer": "Portainer offers a dedicated Home & Student plan at $155/year for non-commercial use on up to 15 nodes; no equivalent plan is documented for activepieces."
    }
  ]
};

export default activepiecesVsPortainerContent;

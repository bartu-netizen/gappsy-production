import type { ToolComparisonContent } from './types';

const koyebVsQoveryContent: ToolComparisonContent = {
  "verdict": "Koyeb and Qovery sit at very different price points and serve different jobs: Koyeb is a serverless hosting platform for apps, APIs, and GPU-backed AI workloads starting at $29/month, while Qovery is a governance and orchestration layer unifying CI/CD, Kubernetes, Terraform, and secrets management — with explicit RBAC for AI agents — starting at $899/month for larger, often regulated organizations.",
  "bestForToolA": "Teams wanting affordable serverless hosting with GPU access, scale-to-zero autoscaling, sub-200ms cold starts, and deployment across 50+ global locations.",
  "bestForToolB": "Larger engineering organizations, especially in regulated industries (per its SOC 2 Type II, HIPAA, GDPR, and DORA compliance), needing a governed API layer over existing multi-cloud Kubernetes and Terraform infrastructure with audit trails and rollback.",
  "whoNeedsBoth": "An enterprise could deploy application and GPU workloads on Koyeb for cost-efficient serverless hosting while using Qovery as the governance layer managing CI/CD, secrets, and audit trails across its broader multi-cloud Kubernetes estate.",
  "keyDifferences": [
    {
      "title": "Entry pricing and scale",
      "toolA": "Pro plan starts at $29/month with 10 users and 100 services.",
      "toolB": "Team plan starts at $899/month with 10 users plus 10 AI agent seats.",
      "whyItMatters": "The roughly 30x difference in entry price reflects very different target budgets and organization sizes.",
      "benefitsWho": "Early-stage teams and solo developers favor Koyeb's price point; funded enterprises can absorb Qovery's cost for its governance features."
    },
    {
      "title": "AI agent governance",
      "toolA": "No mention of RBAC or governance specifically for AI agents operating infrastructure.",
      "toolB": "Provides RBAC and governance policies that apply to both human users and AI agents, plus a native MCP Server and AI Skills for Claude, Cursor, Codex, and Gemini CLI.",
      "whyItMatters": "As AI coding agents gain infrastructure access, teams need controls over what those agents can change.",
      "benefitsWho": "Platform and security teams giving AI agents provisioning access."
    },
    {
      "title": "Compliance certifications",
      "toolA": "No SOC 2, HIPAA, or GDPR certifications documented.",
      "toolB": "SOC 2 Type II, HIPAA, GDPR, and DORA compliant, explicitly marketed to financial services, healthcare, and insurtech companies.",
      "whyItMatters": "Regulated industries require documented compliance certifications before adopting infrastructure tooling.",
      "benefitsWho": "Compliance and risk teams at financial services, healthcare, and insurance companies."
    },
    {
      "title": "GPU/accelerator access",
      "toolA": "Offers pay-as-you-go GPUs (RTX-4000-SFF-ADA, L4, RTX-A6000, L40S, A100, H100) with sub-200ms cold starts and scale-to-zero.",
      "toolB": "Integrates with cloud providers' own Kubernetes services (EKS/GKE/AKS/Scaleway) rather than offering a direct GPU catalog.",
      "whyItMatters": "Teams running inference or training workloads need direct, billed-by-the-hour GPU access.",
      "benefitsWho": "ML/AI engineering teams needing on-demand accelerators."
    },
    {
      "title": "What the platform actually is",
      "toolA": "A hosting platform that runs the application itself.",
      "toolB": "An API and control layer over a team's existing Kubernetes clusters across AWS, GCP, Azure, Scaleway, or on-premise.",
      "whyItMatters": "Teams that already operate their own Kubernetes infrastructure need orchestration and governance, not another place to host apps.",
      "benefitsWho": "Platform/infra engineers running their own clusters vs. application developers wanting a managed host."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Platform",
      "rows": [
        {
          "feature": "GPU/accelerator access",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Scale-to-zero with sub-200ms cold starts",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-cloud Kubernetes orchestration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "AWS EKS, GCP GKE, Azure AKS, Scaleway, on-premise."
        },
        {
          "feature": "AI-agent RBAC and MCP integration",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Managed serverless Postgres",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Includes pgvector support and a free 5-hour tier."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Entry paid plan",
          "toolA": "available",
          "toolB": "available",
          "note": "$29/month (Koyeb Pro) vs $899/month (Qovery Team)."
        },
        {
          "feature": "Free tier for general app hosting",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Koyeb's only free offering is a 5-hour serverless Postgres tier."
        },
        {
          "feature": "Custom/Enterprise plan",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Compliance & Governance",
      "rows": [
        {
          "feature": "SOC 2 Type II",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "HIPAA compliance",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "GDPR / DORA compliance",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Audit trails and rollback",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Koyeb have a free plan?",
      "answer": "Koyeb offers a free 5-hour serverless Postgres tier, but general app hosting plans start at $29/month for the Pro tier."
    },
    {
      "question": "How much does Qovery cost?",
      "answer": "The Team plan starts at $899/month, Business starts at $1,999/month, and Enterprise is custom-priced."
    },
    {
      "question": "Does Qovery support AI coding agents?",
      "answer": "Yes, Qovery includes an MCP Server and AI Skills so AI coding agents can provision and manage infrastructure under the same RBAC controls as humans."
    },
    {
      "question": "What GPUs does Koyeb support?",
      "answer": "Koyeb offers GPU options including RTX-4000-SFF-ADA, L4, RTX-A6000, L40S, A100, and H100 on a pay-as-you-go basis."
    },
    {
      "question": "Is Qovery suitable for regulated industries?",
      "answer": "Yes, Qovery is SOC 2 Type II, HIPAA, GDPR, and DORA compliant and is marketed to financial services, healthcare, and insurtech companies."
    },
    {
      "question": "What clouds does Qovery support?",
      "answer": "AWS EKS, GCP GKE, Azure AKS, Scaleway, and on-premise Kubernetes."
    }
  ]
};

export default koyebVsQoveryContent;

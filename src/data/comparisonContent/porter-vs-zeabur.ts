import type { ToolComparisonContent } from './types';

const porterVsZeaburContent: ToolComparisonContent = {
  "verdict": "Porter and Zeabur both automate Git-based deployment, but Porter runs applications inside the customer's own AWS, GCP, or Azure account with usage-based per-resource pricing and SOC 2/HIPAA compliance, while Zeabur deploys via its own multi-cloud-backed compute with a free starter tier, low-cost tiered plans, and an AI Agent for natural-language infrastructure management.",
  "bestForToolA": "Teams that need apps running inside their own cloud account — for cost control, compliance, or existing cloud commitments — and want SOC 2 Type II or one-click HIPAA compliance with per-PR preview environments and zero-downtime Kubernetes upgrades.",
  "bestForToolB": "Smaller teams or solo developers wanting a free tier to start, low-cost tiered plans ($5–$79/month), automatic language/framework detection, and natural-language infrastructure management via the Zeabur Agent.",
  "whoNeedsBoth": "A startup might prototype quickly on Zeabur's free or Dev tier, then migrate production, compliance-sensitive workloads to Porter once it needs to run inside its own AWS, GCP, or Azure account with SOC 2/HIPAA coverage.",
  "keyDifferences": [
    {
      "title": "Where applications run",
      "toolA": "Deploys applications inside the customer's own AWS, GCP, or Azure account.",
      "toolB": "Deploys dedicated compute across providers including AWS, Hetzner, and Linode, without stating apps run in the customer's own account.",
      "whyItMatters": "Organizations with existing cloud commitments or data-residency requirements tied to their own account need that specific deployment model.",
      "benefitsWho": "Enterprises consolidating billing and compliance under their existing cloud provider contract."
    },
    {
      "title": "Compliance certification",
      "toolA": "SOC 2 Type II certified, with a one-click HIPAA compliance option.",
      "toolB": "No SOC 2 or HIPAA certification is documented.",
      "whyItMatters": "Regulated industries need documented platform-level certifications.",
      "benefitsWho": "Healthcare and fintech teams with compliance requirements."
    },
    {
      "title": "Pricing model",
      "toolA": "Usage-based per-resource fees ($6/month per GB RAM + $13/month per vCPU) on top of underlying cloud costs, with no general free tier (only a startup program offering 6 months free for eligible companies).",
      "toolB": "Offers a genuine $0 Free plan plus flat tiered plans at $5, $19, and $79 per month.",
      "whyItMatters": "Cost-sensitive early-stage teams need a way to start at zero cost.",
      "benefitsWho": "Bootstrapped startups and solo developers wanting to start free."
    },
    {
      "title": "AI-driven infrastructure management",
      "toolA": "No natural-language AI agent for infrastructure management is documented.",
      "toolB": "Includes the Zeabur Agent, which turns natural-language requests into infrastructure actions like renting servers or deploying services, with full access on the Pro plan ($19/month) or higher.",
      "whyItMatters": "Non-expert users benefit from conversational infrastructure control instead of manual configuration.",
      "benefitsWho": "Smaller teams without dedicated DevOps staff."
    },
    {
      "title": "Preview environments",
      "toolA": "Automatically generates isolated preview environments for every pull request.",
      "toolB": "No per-PR preview environment feature is documented.",
      "whyItMatters": "Teams with active PR-based review workflows benefit from automatic, isolated preview deployments.",
      "benefitsWho": "Engineering teams doing frequent code review before merge."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment & Infrastructure",
      "rows": [
        {
          "feature": "Runs inside customer's own cloud account",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Zeabur deploys via its own multi-provider compute."
        },
        {
          "feature": "Preview environments per pull request",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Zero-downtime deploys with automatic cluster upgrades",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Multi-cloud provider deployment",
          "toolA": "available",
          "toolB": "available",
          "note": "Porter: AWS/GCP/Azure; Zeabur: AWS/Hetzner/Linode."
        },
        {
          "feature": "Natural-language AI infrastructure agent",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zeabur Agent; full access requires Pro plan or higher."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Porter offers only a startup program (6 months free for eligible companies); Zeabur has a standing Free plan."
        },
        {
          "feature": "Entry paid price",
          "toolA": "available",
          "toolB": "available",
          "note": "Porter: $6/GB RAM + $13/vCPU per month, usage-based; Zeabur: $5/month Dev plan."
        },
        {
          "feature": "Team collaboration features",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zeabur Team plan at $79/month."
        }
      ]
    },
    {
      "group": "Compliance & Extras",
      "rows": [
        {
          "feature": "SOC 2 Type II certification",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "One-click HIPAA option",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Built-in email service",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI model access hub",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zeabur's AI Hub."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Where does Porter run applications?",
      "answer": "Inside the customer's own AWS, GCP, or Azure cloud account, not a shared Porter-hosted environment."
    },
    {
      "question": "How is Porter priced?",
      "answer": "Usage-based: $6/month per GB of RAM and $13/month per vCPU, on the Standard plan, plus underlying cloud provider costs."
    },
    {
      "question": "Does Porter support HIPAA compliance?",
      "answer": "Yes, it offers a one-click HIPAA compliance option alongside SOC 2 Type II certification."
    },
    {
      "question": "Does Zeabur have a free plan?",
      "answer": "Yes, Zeabur offers a Free plan with one manageable server, community support, and 48-hour log retention."
    },
    {
      "question": "What is the Zeabur AI Agent?",
      "answer": "It turns natural-language instructions into infrastructure actions such as renting servers, deploying services, or accessing AI models; full access requires the Pro plan."
    },
    {
      "question": "Can I deploy across multiple cloud providers with Zeabur?",
      "answer": "Yes, Zeabur supports dedicated compute across providers including AWS, Hetzner, and Linode."
    }
  ]
};

export default porterVsZeaburContent;

import type { ToolComparisonContent } from './types';

const flyIoVsNorthflankContent: ToolComparisonContent = {
  "verdict": "Fly.io and Northflank both target developers deploying containerized apps, but Fly.io is a single-network platform built around Fly Machines (VMs deployed close to users) with pure usage-based billing and no free tier left, while Northflank is a multi-cloud/BYOC deployment platform with a free Sandbox tier, built-in GPU/AI inference, and SOC 2 Type 2 plus HIPAA certification.",
  "bestForToolA": "Teams that want to deploy VMs directly in regions close to their users with straightforward per-Machine, per-GB usage billing, and don't need multi-cloud or GPU support.",
  "bestForToolB": "Teams that need to deploy across AWS, GCP, Azure, or other clouds (including bring-your-own-cloud), want a free Sandbox tier to start, or need GPU-backed AI inference and formal SOC 2/HIPAA certification.",
  "whoNeedsBoth": "An organization already running edge-proximate VMs on Fly.io for latency-sensitive services might separately pilot Northflank for GPU/AI inference workloads or multi-cloud projects it can't run on Fly's own network.",
  "keyDifferences": [
    {
      "title": "Free tier availability",
      "toolA": "Legacy free allowances (shared-cpu VMs, storage) have been discontinued; billing is now pay-as-you-go from the start.",
      "toolB": "Offers a free Sandbox tier with 2 services, 1 database, and 2 cron jobs before any paid plan is needed.",
      "whyItMatters": "Determines whether a team can prototype or run small workloads at zero cost before committing to a paid plan.",
      "benefitsWho": "Solo developers and early-stage teams testing an idea before spending money."
    },
    {
      "title": "Multi-cloud / bring-your-own-cloud support",
      "toolA": "Deploys apps as Fly Machines on Fly's own global VM network only.",
      "toolB": "Deploys services, jobs, and databases across AWS, GCP, Azure, Oracle Cloud, CoreWeave, or Civo, including bring-your-own-cloud setups.",
      "whyItMatters": "Organizations with existing cloud contracts or data-residency requirements need to deploy inside a specific cloud account rather than a vendor's own network.",
      "benefitsWho": "Enterprises with an existing multi-cloud strategy or committed cloud spend."
    },
    {
      "title": "GPU and AI inference workloads",
      "toolA": "No GPU or AI inference capability is documented in Fly.io's feature set.",
      "toolB": "Runs GPU-backed workloads and model inference, including open-source models like Llama4 and Deepseek, on NVIDIA L4/A100/H100 instances.",
      "whyItMatters": "Teams running AI/ML inference need direct access to GPU hardware from their deployment platform.",
      "benefitsWho": "AI and ML engineering teams."
    },
    {
      "title": "Compliance certification",
      "toolA": "Offers a paid HIPAA Compliance Package ($99/month) providing BAAs and SOC2 documentation, but no stated SOC 2 certification.",
      "toolB": "Is SOC 2 Type 2 and HIPAA certified as a platform-level attribute.",
      "whyItMatters": "Regulated industries often require the platform itself to hold current certifications, not just optional compliance add-ons.",
      "benefitsWho": "Healthcare and fintech teams with compliance requirements."
    },
    {
      "title": "Pricing structure clarity",
      "toolA": "Single usage-based model billed per Machine hour, stopped-Machine storage, volumes, snapshots, and data transfer.",
      "toolB": "Compute pricing is split into multiple named plan tiers (e.g. nf-compute-10), which Northflank's own facts note can be confusing to compare.",
      "whyItMatters": "Predictable, easy-to-compare pricing matters for budgeting and procurement.",
      "benefitsWho": "Finance and budget-conscious technical teams sizing costs in advance."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Platform",
      "rows": [
        {
          "feature": "Multi-cloud deployment",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Fly.io runs only on its own global VM network."
        },
        {
          "feature": "GPU / AI inference support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Northflank supports NVIDIA L4, A100, H100 instances."
        },
        {
          "feature": "Managed Postgres",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Kubernetes",
          "toolA": "available",
          "toolB": "available",
          "note": "Fly Kubernetes (FKS) vs Northflank's Kubernetes automation."
        },
        {
          "feature": "Built-in CI/CD and GitOps",
          "toolA": "not-documented",
          "toolB": "available"
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
          "note": "Northflank Sandbox: 2 services, 1 database, 2 cron jobs."
        },
        {
          "feature": "Entry-level paid pricing",
          "toolA": "available",
          "toolB": "available",
          "note": "Fly.io usage-based from $0.0028/hour per Machine; Northflank from $2.70/month (nf-compute-10)."
        },
        {
          "feature": "Custom/Enterprise plan",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Northflank offers a quote-based Enterprise tier with SLAs and 24/7 support."
        }
      ]
    },
    {
      "group": "Compliance & Support",
      "rows": [
        {
          "feature": "HIPAA support",
          "toolA": "available",
          "toolB": "available",
          "note": "Fly.io: $99/month add-on package; Northflank: certified."
        },
        {
          "feature": "SOC 2 certification",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SOC 2 Type 2."
        },
        {
          "feature": "Paid dedicated support tier",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Fly.io's Serious Support plan is $29/month for dedicated engineers."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Fly.io have a free tier?",
      "answer": "No — previous free allowances (e.g. 3 shared-cpu-1x VMs, 3GB storage) have been discontinued, and pricing is now pay-as-you-go."
    },
    {
      "question": "Does Northflank have a free plan?",
      "answer": "Yes, the Sandbox tier is free and includes 2 services, 1 database, and 2 cron jobs."
    },
    {
      "question": "Can I run GPU workloads on Fly.io or Northflank?",
      "answer": "Northflank offers GPU options including NVIDIA L4, A100, and H100 instances billed hourly; Fly.io's documented feature set does not mention GPU support."
    },
    {
      "question": "What clouds does Northflank support?",
      "answer": "AWS, GCP, Azure, Oracle Cloud, CoreWeave, and Civo, plus bring-your-own-cloud deployments."
    },
    {
      "question": "Does Fly.io offer paid support plans?",
      "answer": "Yes, a 'Serious Support' plan starting at $29/month gives access to dedicated engineers."
    },
    {
      "question": "Is Northflank certified for regulated workloads?",
      "answer": "Yes, Northflank is SOC 2 Type 2 and HIPAA certified."
    }
  ]
};

export default flyIoVsNorthflankContent;

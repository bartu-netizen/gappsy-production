import type { ToolComparisonContent } from './types';

const cleverCloudVsNorthflankContent: ToolComparisonContent = {
  "verdict": "Clever Cloud and Northflank are both developer-focused cloud platforms, but they solve different problems: Clever Cloud is a sovereign, compliance-heavy PaaS built around per-second billing and EU data residency, while Northflank is a multi-cloud/BYOC deployment platform built around named compute tiers and GPU/AI inference workloads. Teams choosing between them should weigh EU compliance and billing simplicity against cloud portability and GPU support rather than expect one to strictly outperform the other.",
  "bestForToolA": "Clever Cloud fits teams that need EU data residency and heavy compliance documentation (ISO 27001, HDS health-data hosting, GDPR, and an optional SecNumCloud zone) along with straightforward per-second, pay-as-you-go billing and a broad set of managed databases (PostgreSQL, MySQL, MongoDB, Redis, Elasticsearch, Cassandra) without committing to named plan tiers.",
  "bestForToolB": "Northflank fits teams that need to deploy across multiple clouds (AWS, GCP, Azure, Oracle Cloud, CoreWeave, Civo) or bring their own cloud account, run GPU-backed inference workloads (including open-source models like Llama4 and Deepseek), or want built-in CI/CD/GitOps pipelines and a free Sandbox tier to start.",
  "whoNeedsBoth": "Organizations running both EU-regulated workloads and GPU/AI inference pipelines might use Clever Cloud for compliance-sensitive hosting (e.g., health data under HDS) and Northflank for GPU-backed model inference or multi-cloud redundancy, rather than consolidating everything on one platform.",
  "keyDifferences": [
    {
      "title": "Billing model",
      "toolA": "Per-second billing tied to actual usage with a user-set spend cap; no fixed pricing plans are published, so costs are estimated via a calculator or sales.",
      "toolB": "Named compute plan tiers (e.g., Pay-as-you-go from $2.70/month for nf-compute-10) with a free Sandbox tier and custom Enterprise pricing.",
      "whyItMatters": "Per-second billing can be harder to predict upfront but scales precisely with usage, while named tiers give a clearer starting price but can be confusing to compare across tiers.",
      "benefitsWho": "Finance teams and solo developers who want predictable, easy-to-quote starting costs benefit from Northflank's published tiers; teams comfortable estimating usage benefit from Clever Cloud's granular per-second model."
    },
    {
      "title": "Multi-cloud and BYOC support",
      "toolA": "Not documented as multi-cloud; positioned as a single sovereign PaaS operated from Nantes, France.",
      "toolB": "Explicitly supports deploying across AWS, GCP, Azure, Oracle Cloud, CoreWeave, and Civo, including bring-your-own-cloud setups.",
      "whyItMatters": "Teams needing to avoid single-cloud lock-in or deploy into a specific customer's cloud account need multi-cloud/BYOC capability.",
      "benefitsWho": "Platform teams serving enterprise customers with existing cloud commitments, or teams wanting cloud-provider redundancy."
    },
    {
      "title": "GPU and AI inference workloads",
      "toolA": "Offers 'Clever AI', a platform aggregating LLMs with prompt orchestration, but does not document dedicated GPU infrastructure.",
      "toolB": "Runs GPU-backed workloads and model inference directly, including open-source models like Llama4 and Deepseek, with GPU options such as NVIDIA L4, A100, and H100 billed hourly.",
      "whyItMatters": "Teams self-hosting or fine-tuning open-source models need raw GPU compute, not just LLM API aggregation.",
      "benefitsWho": "ML engineering teams running inference or training workloads."
    },
    {
      "title": "Compliance certifications",
      "toolA": "ISO/IEC 27001:2022 certified, HDS (Health Data Hosting) and GDPR compliant, with an optional SecNumCloud zone for French/EU sovereignty requirements.",
      "toolB": "SOC 2 Type 2 and HIPAA certified.",
      "whyItMatters": "The two platforms target different regulatory regimes -- Clever Cloud toward EU health-data and sovereignty rules, Northflank toward US-style SOC 2/HIPAA compliance.",
      "benefitsWho": "EU healthcare or public-sector teams need Clever Cloud's certifications; US healthcare or SaaS teams needing HIPAA/SOC 2 attestation need Northflank's."
    },
    {
      "title": "Free tier",
      "toolA": "Free trial credits granted at signup with no payment card required, rather than a permanent free plan.",
      "toolB": "A permanent free Sandbox tier including 2 services, 1 database, and 2 cron jobs.",
      "whyItMatters": "A permanent free tier supports long-running side projects, while trial credits are meant for time-boxed evaluation.",
      "benefitsWho": "Hobbyists and small side-project builders who want an always-free tier benefit from Northflank; teams evaluating a platform short-term benefit from Clever Cloud's credit trial."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment & Infrastructure",
      "rows": [
        {
          "feature": "Multi-cloud / bring-your-own-cloud deployment",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Northflank explicitly supports AWS, GCP, Azure, Oracle Cloud, CoreWeave, Civo, and BYOC."
        },
        {
          "feature": "GPU-backed workloads",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Northflank offers NVIDIA L4/A100/H100 GPU instances billed hourly."
        },
        {
          "feature": "CI/CD and GitOps pipelines",
          "toolA": "limited",
          "toolB": "available",
          "note": "Clever Cloud offers automated Git-based deployment with language auto-detection; explicit CI/CD/GitOps pipelines aren't documented."
        },
        {
          "feature": "Managed databases",
          "toolA": "available",
          "toolB": "available",
          "note": "Clever Cloud lists PostgreSQL, MySQL, MongoDB, Redis, Elasticsearch, Cassandra plus proprietary Materia; Northflank confirms general database hosting without itemizing specific engines."
        },
        {
          "feature": "Object storage",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Clever Cloud offers Cellar Object Storage, File System Buckets, and Pulsar messaging."
        }
      ]
    },
    {
      "group": "Compliance & Security",
      "rows": [
        {
          "feature": "ISO 27001 certification",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "SOC 2 certification",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SOC 2 Type 2."
        },
        {
          "feature": "HIPAA certification",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "GDPR compliance",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Sovereign/EU data zone",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Clever Cloud offers an optional SecNumCloud zone."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Permanent free plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Northflank's Sandbox tier is free and ongoing; Clever Cloud offers time-boxed trial credits instead."
        },
        {
          "feature": "Published fixed-price plans",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Northflank's Pay-as-you-go tier starts from $2.70/month; Clever Cloud requires a cost calculator or sales contact."
        },
        {
          "feature": "Custom/Enterprise plan",
          "toolA": "limited",
          "toolB": "available",
          "note": "Northflank has a named Enterprise plan with SLAs and 24/7 support; Clever Cloud's custom quoting is implied but not a named plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How is Clever Cloud billed compared to Northflank?",
      "answer": "Clever Cloud bills by the second based on actual usage with a user-set spend cap, while Northflank uses named compute plan tiers such as Pay-as-you-go starting from $2.70/month (nf-compute-10)."
    },
    {
      "question": "Does either platform have a free plan?",
      "answer": "Northflank offers a permanent free Sandbox tier with 2 services, 1 database, and 2 cron jobs. Clever Cloud instead offers free trial credits at signup with no payment card required."
    },
    {
      "question": "Which platform supports GPU workloads?",
      "answer": "Northflank supports GPU-backed workloads and model inference, including NVIDIA L4, A100, and H100 instances billed hourly, and open-source models like Llama4 and Deepseek. Clever Cloud offers Clever AI, a platform for aggregating LLMs with prompt orchestration, but does not document dedicated GPU infrastructure."
    },
    {
      "question": "Which clouds can I deploy to?",
      "answer": "Northflank supports AWS, GCP, Azure, Oracle Cloud, CoreWeave, and Civo, plus bring-your-own-cloud deployments. Clever Cloud operates as its own sovereign PaaS and does not document multi-cloud deployment."
    },
    {
      "question": "What compliance certifications does each hold?",
      "answer": "Clever Cloud is ISO/IEC 27001:2022 certified, HDS and GDPR compliant, with an optional SecNumCloud zone. Northflank is SOC 2 Type 2 and HIPAA certified."
    },
    {
      "question": "When were these companies founded?",
      "answer": "Clever Cloud was founded in 2010 in Nantes, France. Northflank was founded in 2019 in London, United Kingdom."
    }
  ]
};

export default cleverCloudVsNorthflankContent;

import type { ToolComparisonContent } from './types';

const activepiecesVsHarvesterContent: ToolComparisonContent = {
  "verdict": "Activepieces and Harvester solve entirely different problems: Activepieces automates business processes across HR, finance, marketing, and sales using prebuilt integrations (\"pieces\") on a usage-based pricing model, while Harvester is hyperconverged infrastructure (HCI) software for running VMs and Kubernetes workloads on bare-metal servers. They appear together mainly because both are open-source, self-hostable platforms rather than because they compete for the same buying decision.",
  "bestForToolA": "Teams that want to automate workflows across business tools (like Gmail) with a flat per-flow cost starting at $5/month and the flexibility to deploy in the cloud or self-hosted.",
  "bestForToolB": "Organizations running bare-metal datacenter or edge infrastructure that need a free, unified platform for VMs and Kubernetes workloads, especially those already using Rancher, Elemental, or Fleet.",
  "whoNeedsBoth": "An IT/platform team could run Harvester as the bare-metal HCI layer hosting a self-hosted Activepieces instance alongside other internal apps and Kubernetes workloads — Harvester as the infrastructure, Activepieces as the automation layer running on top of it.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "Activepieces is a workflow/business-process automation platform spanning HR, finance, marketing, and sales.",
      "toolB": "Harvester is a hyperconverged infrastructure (HCI) platform for running VMs and cloud-native workloads on bare metal.",
      "whyItMatters": "They solve different problems, so choosing between them depends on whether you need automation software or infrastructure virtualization.",
      "benefitsWho": "IT and operations teams evaluating which category actually addresses their gap."
    },
    {
      "title": "Pricing Model",
      "toolA": "Charges $5/month on the Standard plan billed per active flow, with a documented \"$0 per execution\" model, plus a custom-priced Ultimate plan on an annual contract.",
      "toolB": "Entirely free with no licensing fees documented for the core platform.",
      "whyItMatters": "One is usage-based SaaS-style software pricing, the other is free infrastructure software (hardware and operational costs still apply).",
      "benefitsWho": "Budget owners comparing recurring software spend against free tooling with hardware/ops overhead."
    },
    {
      "title": "Deployment Model",
      "toolA": "Supports both Cloud and Self-Hosted deployment (\"Deploy your way. Pay fairly.\").",
      "toolB": "Deployed on bare-metal hardware only, requiring infrastructure expertise to set up.",
      "whyItMatters": "Activepieces offers a hosted option for teams that don't want to manage servers, while Harvester assumes you already run physical hardware.",
      "benefitsWho": "Teams without dedicated infrastructure staff benefit from Activepieces Cloud; data-center and edge operators benefit from Harvester."
    },
    {
      "title": "Core Technology",
      "toolA": "Built around a library of prebuilt integrations (\"pieces\"), such as Gmail, for automating tasks.",
      "toolB": "Built on Linux, KVM, Kubernetes, KubeVirt, and Longhorn for unified VM and container management.",
      "whyItMatters": "The underlying technology stack determines what skills and staff are required to operate each tool.",
      "benefitsWho": "Automation/ops teams benefit from Activepieces' integration library; virtualization and platform engineers benefit from Harvester's stack."
    },
    {
      "title": "Governance & Enterprise Fit",
      "toolA": "Documents enterprise governance controls for larger organizations on top of its integrations library.",
      "toolB": "Enterprise support terms are not detailed on the homepage, though the project is maintained by SUSE/Rancher.",
      "whyItMatters": "Buyers needing formal governance or compliance features should check what's documented versus what requires a sales conversation.",
      "benefitsWho": "Larger organizations vetting governance maturity before purchase."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment & Licensing",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Cloud/managed hosting",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Harvester requires bare-metal hardware; no managed cloud documented"
        },
        {
          "feature": "Open source",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Free tier",
          "toolA": "limited",
          "toolB": "available",
          "note": "Activepieces starts at $5/active flow/month; Harvester has no licensing fees"
        }
      ]
    },
    {
      "group": "Automation & Workflow Capabilities",
      "rows": [
        {
          "feature": "Prebuilt app integrations (\"pieces\")",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "e.g. Gmail"
        },
        {
          "feature": "Usage-based per-execution pricing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "\"$0 per execution\" model"
        },
        {
          "feature": "Enterprise governance controls",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Infrastructure & Virtualization",
      "rows": [
        {
          "feature": "Virtual machine management",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Kubernetes-in-VM support",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Bare-metal hardware support",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Rancher ecosystem integration (Elemental, Fleet)",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Activepieces and Harvester competitors?",
      "answer": "No — Activepieces automates business workflows across apps like Gmail, while Harvester is infrastructure software for running VMs and Kubernetes on bare metal; they occupy different layers of the stack."
    },
    {
      "question": "How much does Activepieces cost compared to Harvester?",
      "answer": "Activepieces starts at $5/month per active flow on its Standard plan (with a custom-priced Ultimate tier); Harvester has no licensing fees and is free to download and deploy."
    },
    {
      "question": "Can Harvester run Activepieces?",
      "answer": "This isn't documented as an official integration between the two. Harvester runs VMs and Kubernetes workloads on bare metal, and Activepieces supports self-hosted deployment, so a self-hosted Activepieces instance could in principle run on Harvester-managed infrastructure, but the facts don't describe this specific pairing."
    },
    {
      "question": "Is either tool open source?",
      "answer": "Both are — Activepieces lists an \"Open Source\" option alongside its Cloud and paid plans, and Harvester is described as 100% open source with no licensing fees."
    },
    {
      "question": "Who maintains Harvester?",
      "answer": "SUSE/Rancher maintains Harvester as part of its broader Rancher ecosystem, alongside Elemental and Fleet."
    },
    {
      "question": "Does Activepieces charge per execution?",
      "answer": "No — Activepieces advertises \"$0 per execution — run millions, pay the same,\" charging instead per active flow starting at $5/month on the Standard plan."
    }
  ]
};

export default activepiecesVsHarvesterContent;

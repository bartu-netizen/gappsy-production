import type { ToolComparisonContent } from './types';

const activepiecesVsFluxContent: ToolComparisonContent = {
  "verdict": "Activepieces is a paid workflow automation platform that connects SaaS apps like Gmail for HR, finance, marketing, and sales teams, priced at $5 per active flow per month. Flux is a free, CNCF Graduated GitOps tool that continuously syncs Kubernetes cluster state with what's declared in Git, built for platform engineering teams. They automate entirely different layers of a business — human/business processes versus infrastructure deployment — so the choice usually isn't between them but about which layer needs automating.",
  "bestForToolA": "Ops, RevOps, or IT teams that want to connect SaaS tools such as Gmail into automated workflows without engineering effort, paying per active flow starting at $5/month.",
  "bestForToolB": "Platform engineering teams running Kubernetes who want cluster state declared in Git and continuously reconciled, with CNCF-Graduated governance and a pull-based security model that avoids exposing cluster credentials to CI systems.",
  "whoNeedsBoth": "A platform team could use Flux to continuously deploy the Kubernetes infrastructure that hosts internal tools, while a separate operations team uses Activepieces to automate business workflows like HR onboarding or lead routing across SaaS apps — the two tools operate at completely different layers of the same organization.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "Paid, usage-based: the Standard plan is $5 per active flow/month, with a custom-priced Ultimate plan billed on an annual contract.",
      "toolB": "Fully free and open source, with no pricing plans or paid tiers documented.",
      "whyItMatters": "One has an ongoing per-flow cost that scales with usage, the other has zero licensing cost regardless of scale.",
      "benefitsWho": "Budget-conscious infrastructure teams that want to avoid recurring software fees benefit from Flux's free model."
    },
    {
      "title": "Deployment Options",
      "toolA": "Offers both cloud-hosted and self-hosted deployment, described as \"deploy your way, pay fairly.\"",
      "toolB": "No official managed or hosted offering exists — teams must operate Flux themselves inside their own Kubernetes clusters.",
      "whyItMatters": "Teams that don't want to run their own infrastructure need a vendor-hosted option, which only one of these tools provides.",
      "benefitsWho": "Teams without dedicated platform engineers benefit from Activepieces' cloud option; teams that already run Kubernetes self-manage Flux anyway."
    },
    {
      "title": "Core Automation Target",
      "toolA": "Automates SaaS and business workflows through a library of prebuilt integrations called \"pieces,\" including Gmail.",
      "toolB": "Automates Kubernetes manifest reconciliation from Git, working with Kustomize, Helm, GitHub, GitLab, and Slack notifications.",
      "whyItMatters": "The two tools automate fundamentally different artifacts — application workflow steps versus infrastructure state.",
      "benefitsWho": "Business operations staff benefit from Activepieces' app-level automation; DevOps/SRE teams benefit from Flux's infrastructure-level automation."
    },
    {
      "title": "Security Model",
      "toolA": "Provides enterprise governance controls aimed at management and oversight for larger organizations on the Ultimate plan.",
      "toolB": "Uses a pull-based architecture with RBAC and least-privilege principles, avoiding the need to expose cluster credentials to external CI systems.",
      "whyItMatters": "Security-sensitive infrastructure teams specifically care about credential exposure, which Flux's architecture is designed to minimize.",
      "benefitsWho": "Security and platform teams managing production Kubernetes clusters benefit most from Flux's pull-based model."
    },
    {
      "title": "Progressive Delivery",
      "toolA": "No canary release or progressive rollout capability is documented for Activepieces.",
      "toolB": "Integrates with Flagger, a separate project in the Flux ecosystem, to enable canary releases and A/B testing on top of GitOps-managed deployments.",
      "whyItMatters": "Teams doing gradual, risk-managed application rollouts need progressive delivery tooling that Activepieces simply doesn't offer.",
      "benefitsWho": "Kubernetes teams shipping frequent releases benefit from Flux plus Flagger's canary and A/B testing support."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment & Hosting",
      "rows": [
        {
          "feature": "Cloud-hosted option",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Flux has no official managed/hosted offering"
        },
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "available",
          "note": "Flux is self-operated only"
        },
        {
          "feature": "Kubernetes-native GitOps sync",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Flux's core purpose"
        }
      ]
    },
    {
      "group": "Pricing & Licensing",
      "rows": [
        {
          "feature": "Free to use",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "AP starts at $5/active flow/month"
        },
        {
          "feature": "Usage-based pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "$0 per execution, $5/active flow/month"
        },
        {
          "feature": "Custom enterprise contract",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Ultimate plan, annual contract"
        }
      ]
    },
    {
      "group": "Automation & Integrations",
      "rows": [
        {
          "feature": "Prebuilt SaaS app integrations",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "\"pieces\" library, e.g. Gmail"
        },
        {
          "feature": "Progressive delivery (canary/A-B testing)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Via Flagger integration"
        },
        {
          "feature": "Multi-cluster management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "CNCF governance status",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "CNCF Graduated project"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Activepieces free?",
      "answer": "No. Activepieces is paid, starting at $5 per active flow/month on the Standard plan, with a custom-priced Ultimate plan for larger organizations."
    },
    {
      "question": "Is Flux free?",
      "answer": "Yes, Flux is fully open source with no pricing plans documented — there is no paid tier."
    },
    {
      "question": "Can Flux automate business workflows like Activepieces?",
      "answer": "No. Flux is purpose-built to sync Kubernetes cluster state with Git; it has no SaaS-app integration layer comparable to Activepieces' \"pieces.\""
    },
    {
      "question": "Does Activepieces support Kubernetes-native deployment?",
      "answer": "This isn't documented. Activepieces advertises cloud and self-hosted deployment, not Kubernetes-specific GitOps synchronization."
    },
    {
      "question": "Does Flux offer a hosted or managed version?",
      "answer": "No. Per its documented cons, there is no official managed/hosted offering — teams operate Flux themselves."
    },
    {
      "question": "How does Flux handle progressive delivery?",
      "answer": "Through integration with Flagger, a separate project in the Flux ecosystem, which enables canary releases and A/B testing."
    }
  ]
};

export default activepiecesVsFluxContent;

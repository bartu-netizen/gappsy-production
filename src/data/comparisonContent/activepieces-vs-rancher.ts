import type { ToolComparisonContent } from './types';

const activepiecesVsRancherContent: ToolComparisonContent = {
  "verdict": "Activepieces automates business workflows across SaaS apps for non-technical teams, priced per active flow. Rancher is SUSE's open-source platform for managing Kubernetes clusters across cloud, on-premises, and edge infrastructure, used by 30,000+ teams per SUSE's own figures. They serve entirely different audiences at different layers of the technology stack, so the comparison is really about which layer needs automating rather than which product wins.",
  "bestForToolA": "Business operations teams wanting no-code/low-code automation across SaaS apps, paying per active flow starting at $5/month.",
  "bestForToolB": "Platform engineering teams managing Kubernetes fleets across cloud, on-prem, and edge environments who want a free open-source core, with an optional paid Rancher Prime tier for enterprise support and certified distributions.",
  "whoNeedsBoth": "A platform team could run Rancher to manage the Kubernetes clusters hosting internal services, while a business operations team separately uses Activepieces to automate SaaS workflows — the two would coexist in the same company serving unrelated layers.",
  "keyDifferences": [
    {
      "title": "Category",
      "toolA": "SaaS/business workflow automation platform.",
      "toolB": "Multi-cluster Kubernetes management platform.",
      "whyItMatters": "These tools don't compete for the same buying decision; they're evaluated by different teams entirely.",
      "benefitsWho": "Clarifies which product fits a given team's actual problem."
    },
    {
      "title": "Pricing Model",
      "toolA": "Transparent usage-based pricing: $5/active flow/month (Standard), custom Ultimate plan.",
      "toolB": "Open-source core is free; Rancher Prime enterprise pricing is unpublished and requires contacting sales.",
      "whyItMatters": "Buyers wanting an upfront number get one from Activepieces but not from Rancher Prime.",
      "benefitsWho": "Procurement-driven teams benefit from Activepieces' published pricing."
    },
    {
      "title": "Deployment Scope",
      "toolA": "Deploys as a cloud-hosted or self-hosted application.",
      "toolB": "Manages Kubernetes clusters across cloud, on-premises, and edge infrastructure from a unified control plane.",
      "whyItMatters": "Rancher operates at the infrastructure-fleet level, a fundamentally different scope than a single app deployment.",
      "benefitsWho": "Enterprises with distributed, multi-environment Kubernetes footprints benefit from Rancher's unified management."
    },
    {
      "title": "Governance Features",
      "toolA": "Offers \"enterprise governance controls\" on its Ultimate plan.",
      "toolB": "Offers zero-trust security policies and certified Kubernetes distributions as part of its security and governance story.",
      "whyItMatters": "Governance needs differ sharply between app-workflow oversight and cluster-level security policy enforcement.",
      "benefitsWho": "Security teams securing container workloads benefit from Rancher's zero-trust policies and certified distributions."
    },
    {
      "title": "Adoption Signal",
      "toolA": "No comparable adoption figures are documented in the facts available.",
      "toolB": "Cites 30,000+ teams using Rancher and is cited by SUSE as a Leader in the 2025 Gartner Magic Quadrant for Container Management.",
      "whyItMatters": "Independent adoption and analyst recognition can be a proxy for maturity and community support at scale.",
      "benefitsWho": "Enterprise buyers wanting analyst validation benefit from Rancher's cited Gartner recognition."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "SaaS/business workflow automation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Multi-cluster Kubernetes management",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Edge infrastructure management",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Licensing",
      "rows": [
        {
          "feature": "Free open-source core",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Published pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Rancher Prime is contact-sales"
        },
        {
          "feature": "Usage-based pricing",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Governance & Deployment",
      "rows": [
        {
          "feature": "Zero-trust security policies",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Enterprise governance controls",
          "toolA": "available",
          "toolB": "available",
          "note": "AP Ultimate / Rancher Prime"
        },
        {
          "feature": "Cloud + self-hosted/on-prem/edge deployment",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Rancher free?",
      "answer": "Yes, the open-source version is free. SUSE also sells Rancher Prime, a paid enterprise edition with support, at unpublished pricing."
    },
    {
      "question": "Is Activepieces free?",
      "answer": "No, plans start at $5 per active flow/month."
    },
    {
      "question": "Who owns Rancher?",
      "answer": "Rancher is developed by SUSE."
    },
    {
      "question": "How many teams use Rancher?",
      "answer": "SUSE states more than 30,000 teams use Rancher."
    },
    {
      "question": "Does Activepieces manage Kubernetes clusters?",
      "answer": "This isn't documented. Activepieces' deployment options are cloud-hosted or self-hosted app deployment, not Kubernetes fleet management like Rancher."
    },
    {
      "question": "Does Rancher work across multiple clouds?",
      "answer": "Yes, it manages Kubernetes clusters across cloud, on-premises, and edge environments from a unified platform."
    }
  ]
};

export default activepiecesVsRancherContent;

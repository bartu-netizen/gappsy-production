import type { ToolComparisonContent } from './types';

const activepiecesVsNomadContent: ToolComparisonContent = {
  "verdict": "Activepieces automates business and SaaS workflows across apps like Gmail. Nomad is HashiCorp's scheduler and orchestrator for deploying and running containerized and non-containerized workloads across cloud and on-prem infrastructure. They operate at different layers entirely — application workflow automation versus infrastructure workload orchestration.",
  "bestForToolA": "Business teams wanting to automate processes across SaaS apps without managing infrastructure, paying per active flow starting at $5/month.",
  "bestForToolB": "Platform/infrastructure teams needing to schedule and orchestrate a mix of containerized and non-containerized workloads such as binaries and batch jobs across hybrid cloud and on-prem environments, especially those already using Consul and Vault.",
  "whoNeedsBoth": "An infrastructure team could use Nomad to orchestrate the services that power internal tooling, while a separate business team uses Activepieces to automate SaaS-app workflows on top — unrelated concerns that could plausibly coexist in the same organization.",
  "keyDifferences": [
    {
      "title": "Category",
      "toolA": "Business/SaaS workflow automation.",
      "toolB": "Workload scheduler and orchestrator.",
      "whyItMatters": "These serve different teams solving different problems, not competing use cases.",
      "benefitsWho": "Clarifies which product actually matches a team's need."
    },
    {
      "title": "Workload Scope",
      "toolA": "Automates workflow steps across SaaS apps via prebuilt \"pieces,\" such as Gmail.",
      "toolB": "Explicitly documents support for both containerized and non-containerized workloads, including binaries and batch jobs.",
      "whyItMatters": "Nomad handles infrastructure-level workload execution, not app-to-app process automation.",
      "benefitsWho": "Infrastructure teams running mixed container and non-container workloads benefit from Nomad's scheduler flexibility."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Publishes pricing: $5/active flow/month (Standard), custom Ultimate plan.",
      "toolB": "Nomad Enterprise pricing is quote-based and not publicly listed; no pricing plans are documented for the open-source edition either.",
      "whyItMatters": "Activepieces gives a self-service starting price, while Nomad requires a sales conversation for enterprise features.",
      "benefitsWho": "Teams wanting fast, self-service pricing benefit from Activepieces' published rates."
    },
    {
      "title": "Ecosystem Integration",
      "toolA": "Integrates via its \"pieces\" library of prebuilt SaaS integrations, e.g. Gmail.",
      "toolB": "Integrates natively with Consul for service discovery and Vault for secrets management as part of the HashiCorp ecosystem.",
      "whyItMatters": "Teams already invested in HashiCorp tooling get tighter native integration from Nomad.",
      "benefitsWho": "Organizations already running Consul and Vault benefit from Nomad's native HashiCorp ecosystem integration."
    },
    {
      "title": "Governance",
      "toolA": "Gates \"enterprise governance controls\" behind the Ultimate plan, with Standard pricing published but Ultimate pricing custom.",
      "toolB": "Gates \"additional access controls and governance policies\" behind the Enterprise edition, with pricing entirely quote-based.",
      "whyItMatters": "Both tools reserve advanced governance for their top paid tier, but neither fully publishes what that tier costs.",
      "benefitsWho": "Larger organizations needing governance controls benefit from either tool's Enterprise/Ultimate offering, once pricing is negotiated."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Business/SaaS workflow automation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Container orchestration",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Non-containerized workload scheduling",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Binaries, batch jobs"
        }
      ]
    },
    {
      "group": "Pricing & Licensing",
      "rows": [
        {
          "feature": "Free/open-source edition",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Nomad Community edition"
        },
        {
          "feature": "Published entry pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Nomad Enterprise is quote-based"
        },
        {
          "feature": "Usage-based pricing",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Ecosystem & Governance",
      "rows": [
        {
          "feature": "HashiCorp ecosystem integration (Consul, Vault)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Prebuilt SaaS app integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "\"pieces\" e.g. Gmail"
        },
        {
          "feature": "Enterprise governance controls",
          "toolA": "available",
          "toolB": "available",
          "note": "AP Ultimate / Nomad Enterprise"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Nomad free?",
      "answer": "An open-source Community edition is available for free; HashiCorp also offers a paid Enterprise edition with additional governance features at quote-based pricing."
    },
    {
      "question": "Is Activepieces free?",
      "answer": "No, it's paid starting at $5 per active flow/month."
    },
    {
      "question": "What does Nomad orchestrate?",
      "answer": "Containers, binaries, and batch jobs across cloud and on-premises infrastructure."
    },
    {
      "question": "Does Nomad integrate with other HashiCorp tools?",
      "answer": "Yes, with Consul for service discovery and Vault for secrets management."
    },
    {
      "question": "Can Activepieces schedule infrastructure workloads like Nomad?",
      "answer": "No — the facts document Activepieces as a SaaS/business workflow automation tool with a \"pieces\" integration library, not a job scheduler or orchestrator."
    },
    {
      "question": "What does Nomad Enterprise add over the Community edition?",
      "answer": "Additional access controls and governance policies, per HashiCorp's documentation; exact pricing is not publicly listed."
    }
  ]
};

export default activepiecesVsNomadContent;

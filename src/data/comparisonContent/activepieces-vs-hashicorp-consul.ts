import type { ToolComparisonContent } from './types';

const activepiecesVsHashicorpConsulContent: ToolComparisonContent = {
  "verdict": "Activepieces automates business workflows across SaaS apps for operations teams. HashiCorp Consul is a service networking platform providing service discovery, service mesh, and secure service-to-service communication across VM and Kubernetes runtimes. They sit at completely different layers — app-level workflow automation versus network-level service communication infrastructure.",
  "bestForToolA": "Business/ops teams automating SaaS-app processes, paying per active flow starting at $5/month.",
  "bestForToolB": "Platform/infrastructure teams that need service discovery, a service mesh, and secure service-to-service communication across VM and Kubernetes runtimes in on-prem, hybrid, or multi-cloud environments, with an optional managed HCP Consul option.",
  "whoNeedsBoth": "A platform team could run Consul to manage service-to-service networking for microservices, while a business team separately uses Activepieces to automate SaaS workflows — the two would coexist without any documented direct integration.",
  "keyDifferences": [
    {
      "title": "Category",
      "toolA": "SaaS/business workflow automation.",
      "toolB": "Service discovery and service mesh platform.",
      "whyItMatters": "These serve entirely different technical needs and buyer personas.",
      "benefitsWho": "Clarifies which product actually addresses a given team's problem."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Publishes entry pricing: $5/active flow/month.",
      "toolB": "Enterprise pricing is quote-based and unpublished; no pricing plans are documented for either edition.",
      "whyItMatters": "Activepieces buyers get a self-service starting price, while Consul Enterprise requires a sales conversation.",
      "benefitsWho": "Teams wanting fast budgeting benefit from Activepieces' published rate."
    },
    {
      "title": "Runtime Scope",
      "toolA": "Deploys as a cloud-hosted or self-hosted app, with no runtime-level networking capability documented.",
      "toolB": "Explicitly supports both VM and Kubernetes runtimes for service networking.",
      "whyItMatters": "Consul's cross-runtime support matters for organizations running mixed VM and container infrastructure.",
      "benefitsWho": "Infrastructure teams with hybrid VM/Kubernetes environments benefit from Consul's dual-runtime support."
    },
    {
      "title": "Security Model",
      "toolA": "Documents \"enterprise governance controls\" for organizational management rather than network-level access enforcement.",
      "toolB": "Enforces service-to-service access via \"intentions\" and access controls, plus multi-tenant admin partitions and namespaces.",
      "whyItMatters": "Network-level access control is a distinct security concern from organizational workflow governance.",
      "benefitsWho": "Security teams isolating microservice traffic benefit from Consul's intentions-based access model."
    },
    {
      "title": "Observability",
      "toolA": "No observability or tracing features are documented in the facts available.",
      "toolB": "Documents built-in metrics, logs, and distributed tracing for service traffic.",
      "whyItMatters": "Teams debugging microservice communication need traffic-level observability, which only Consul documents.",
      "benefitsWho": "SRE and platform teams troubleshooting service-to-service issues benefit from Consul's observability tooling."
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
          "feature": "Service discovery",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Service mesh",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Deployment",
      "rows": [
        {
          "feature": "Published entry pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Consul Enterprise is quote-based"
        },
        {
          "feature": "Managed cloud option",
          "toolA": "available",
          "toolB": "available",
          "note": "HCP Consul"
        },
        {
          "feature": "Free/community edition",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Networking & Governance",
      "rows": [
        {
          "feature": "L7 traffic management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multi-tenancy (admin partitions/namespaces)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Observability (metrics/logs/tracing)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Enterprise governance controls",
          "toolA": "available",
          "toolB": "available",
          "note": "AP Ultimate / Consul Enterprise"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Consul free?",
      "answer": "Consul has a free Community edition; Enterprise and a managed HCP Consul option are also available at unpublished pricing."
    },
    {
      "question": "Is Activepieces free?",
      "answer": "No, it's paid starting at $5 per active flow/month."
    },
    {
      "question": "What does Consul do?",
      "answer": "Provides service discovery, service mesh, and secure network connectivity between services."
    },
    {
      "question": "Does Consul work with Kubernetes?",
      "answer": "Yes, it supports both virtual machine and Kubernetes runtimes."
    },
    {
      "question": "What is HCP Consul?",
      "answer": "HashiCorp's managed cloud version of Consul."
    },
    {
      "question": "Can Activepieces provide service discovery or a service mesh like Consul?",
      "answer": "No — the facts don't document any networking, service discovery, or service mesh capability for Activepieces."
    }
  ]
};

export default activepiecesVsHashicorpConsulContent;

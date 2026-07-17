import type { ToolComparisonContent } from './types';

const falcoVsScalekitContent: ToolComparisonContent = {
  "verdict": "Falco and Scalekit sit in adjacent but distinct layers of modern cloud/AI infrastructure security — Falco is a free, open-source, CNCF-graduated runtime security tool that uses eBPF to detect abnormal behavior across hosts, containers, Kubernetes, and cloud services, while Scalekit is a commercial platform providing authentication and authorization specifically for AI agents, handling delegated OAuth, token vaulting, and per-tool-call permission scoping. Falco answers whether something is behaving abnormally right now; Scalekit answers whether an agent is authorized to act on a user's behalf.",
  "bestForToolA": "Falco fits platform and security teams running Kubernetes or containerized workloads who want free, open-source, low-overhead runtime threat detection with 50+ integrations to existing SIEM/data lake tooling.",
  "bestForToolB": "Scalekit fits engineering teams building AI agents that need delegated OAuth, an encrypted token vault, and per-tool-call permission scoping across 500+ pre-built connectors, with native integrations for Claude, OpenAI, and LangChain.",
  "whoNeedsBoth": "A company building and deploying autonomous AI agents on Kubernetes infrastructure could use Scalekit to handle delegated OAuth and scoped permissions for what the agents are authorized to do, while running Falco alongside it to detect abnormal runtime behavior in the underlying containers and hosts that serve those agents — one secures the agent's authorization, the other secures the infrastructure it runs on.",
  "keyDifferences": [
    {
      "title": "Security Layer Addressed",
      "toolA": "Runtime behavioral detection of abnormal process/file/network activity via eBPF.",
      "toolB": "Authentication/authorization for AI agents acting on behalf of users, including delegated OAuth and scoped tool-call permissions.",
      "whyItMatters": "These solve fundamentally different problems: detecting bad behavior vs. controlling what's authorized to happen in the first place.",
      "benefitsWho": "Benefits security/platform teams (Falco) vs. AI engineering teams building agent products (Scalekit)."
    },
    {
      "title": "Pricing",
      "toolA": "Fully free and open source with no licensing fees.",
      "toolB": "Freemium: free tier includes 5,000 tool calls/month, Growth plan is $99/month for 100,000 tool calls with $0.50/1,000 overage.",
      "whyItMatters": "Budget planning differs completely — Falco has zero licensing cost but requires self-hosting effort, while Scalekit has a metered commercial model.",
      "benefitsWho": "Benefits cost-sensitive open-source-first teams (Falco) vs. teams wanting a managed commercial service (Scalekit)."
    },
    {
      "title": "Deployment Model",
      "toolA": "Self-hosted via an official Helm chart on Kubernetes distributions (GKE, EKS, AKS); no official managed offering from the project itself.",
      "toolB": "Managed SaaS platform with a free tier, paid Growth tier, and Enterprise VPC/on-premises option.",
      "whyItMatters": "Teams wanting a fully managed service vs. those comfortable operating their own infrastructure need different options.",
      "benefitsWho": "Benefits teams without dedicated ops resources for self-hosting (Scalekit's managed model) vs. teams wanting full infrastructure control (Falco)."
    },
    {
      "title": "AI Framework Integration",
      "toolA": "Not documented as integrating with AI agent frameworks; general-purpose runtime security.",
      "toolB": "Native integrations with Anthropic Claude, OpenAI, LangChain, Google ADK, Vercel AI, and Mastra.",
      "whyItMatters": "Teams building specifically on AI agent frameworks need Scalekit's native connectors, which Falco doesn't offer.",
      "benefitsWho": "Benefits AI product teams building agentic applications."
    },
    {
      "title": "Compliance & Governance",
      "toolA": "CNCF-graduated project governance under The Linux Foundation; no formal compliance certifications documented.",
      "toolB": "SOC 2 and ISO 27001 certified, with multi-region (US/EU) deployment and an EU data residency add-on.",
      "whyItMatters": "Enterprise buyers with compliance checklists need documented certifications, which Scalekit provides and Falco does not, being a self-hosted open-source project.",
      "benefitsWho": "Benefits enterprise procurement and security teams requiring formal certifications."
    }
  ],
  "featureMatrix": [
    {
      "group": "Security Focus",
      "rows": [
        {
          "feature": "Runtime behavior/anomaly detection",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "eBPF-based monitoring",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Delegated OAuth for AI agents",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Token vaulting (encrypted)",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "AES-256 encrypted token vault"
        },
        {
          "feature": "Per-tool-call permission scoping",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Access",
      "rows": [
        {
          "feature": "Kubernetes-native deployment (Helm)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Managed/hosted SaaS offering",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Falco requires self-hosting"
        },
        {
          "feature": "Pre-built connectors to SaaS tools",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "500+ connectors"
        },
        {
          "feature": "Multi-architecture support (x64/ARM)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Commercial & Compliance",
      "rows": [
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "available",
          "note": "Falco: fully free; Scalekit: free tier, 5,000 tool calls/mo"
        },
        {
          "feature": "Published paid pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Scalekit Growth: $99/month"
        },
        {
          "feature": "SOC 2 / ISO 27001 certification",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI agent framework integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Claude, OpenAI, LangChain, and more"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Falco and Scalekit compete with each other?",
      "answer": "No — Falco does runtime security/behavior detection, while Scalekit handles authentication and authorization for AI agents; they address different problems."
    },
    {
      "question": "Is Falco really free?",
      "answer": "Yes, Falco is fully open source with no licensing fees, though it requires self-hosting and operational setup."
    },
    {
      "question": "Does Scalekit have a free tier?",
      "answer": "Yes, the Free plan includes 5,000 tool calls per month with unlimited connected accounts; it auto-upgrades to the paid $99/month Growth plan beyond that."
    },
    {
      "question": "Which integrates with AI frameworks like Claude or LangChain?",
      "answer": "Scalekit offers native integrations with Anthropic Claude, OpenAI, LangChain, Google ADK, Vercel AI, and Mastra; this isn't documented for Falco."
    },
    {
      "question": "Which is Kubernetes-native?",
      "answer": "Falco deploys via an official Helm chart across GKE, EKS, AKS, and other distributions; Scalekit's Kubernetes deployment isn't documented, though it offers VPC/on-premises deployment on its Enterprise tier."
    },
    {
      "question": "Which has formal security certifications?",
      "answer": "Scalekit is SOC 2 and ISO 27001 certified; Falco doesn't document formal certifications, being a self-hosted open-source project."
    }
  ]
};

export default falcoVsScalekitContent;

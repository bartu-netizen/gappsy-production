import type { ToolComparisonContent } from './types';

const teleportVsTwingateContent: ToolComparisonContent = {
  "verdict": "Teleport and Twingate both replace legacy access models, but for different layers — Teleport eliminates standing credentials across servers, Kubernetes, databases, and even AI agents using hardware-rooted cryptographic identity and FedRAMP/FIPS 140-2 compliance, while Twingate is a Zero Trust Network Access product replacing VPNs with least-privilege, device-checked network access, published per-user pricing, and native apps across six platforms.",
  "bestForToolA": "Organizations that need a single identity model spanning infrastructure resources (servers, Kubernetes, databases) and AI agents/MCP tools, with FedRAMP/FIPS 140-2 requirements.",
  "bestForToolB": "Teams that want a VPN replacement with transparent per-user pricing, broad native client support, and infrastructure-as-code deployment via Terraform/Pulumi.",
  "whoNeedsBoth": "Organizations often deploy Twingate for general network-level remote access to private resources while using Teleport specifically for privileged, credential-free access to servers, Kubernetes clusters, and databases that need audit trails and compliance-grade controls.",
  "keyDifferences": [
    {
      "title": "Scope of identity coverage",
      "toolA": "Unifies identity across servers, Kubernetes, databases, applications, and explicitly extends to AI agents and MCP tools.",
      "toolB": "Focused on network-layer Zero Trust access to private resources, office networks, and cloud VPCs; no AI-agent-specific access control documented.",
      "whyItMatters": "Teams securing AI agent access alongside infrastructure need a documented feature for that specifically.",
      "benefitsWho": "Platform teams managing AI agent access to infrastructure (Teleport)."
    },
    {
      "title": "Credential model",
      "toolA": "Eliminates standing/shareable secrets via cryptographic, hardware-rooted identity (HSM, TPM, biometric support).",
      "toolB": "Provides identity-based least-privilege network access; hardware-rooted credential elimination is not documented.",
      "whyItMatters": "Hardware-rooted identity is a stronger documented guarantee against credential theft.",
      "benefitsWho": "Security teams eliminating shared secrets across infrastructure (Teleport)."
    },
    {
      "title": "Pricing transparency",
      "toolA": "No published pricing tiers; requires submitting a form or downloading a pricing guide.",
      "toolB": "Publishes explicit per-user pricing: Free Starter (up to 5 users), $5/user/month Teams, $10/user/month Business, custom Enterprise.",
      "whyItMatters": "Teams needing to budget without a sales conversation benefit from published pricing.",
      "benefitsWho": "Smaller teams and procurement-sensitive buyers (Twingate)."
    },
    {
      "title": "Named compliance certifications",
      "toolA": "Explicitly supports FedRAMP and FIPS 140-2.",
      "toolB": "No specific compliance certifications stated in the facts.",
      "whyItMatters": "Regulated industries or government-adjacent buyers need documented compliance support.",
      "benefitsWho": "Government contractors and regulated enterprises (Teleport)."
    },
    {
      "title": "Client platform support",
      "toolA": "Not detailed in the available facts.",
      "toolB": "Native apps for macOS, Windows, Linux, Chrome OS, iOS, and Android.",
      "whyItMatters": "Broad native client coverage matters for distributed, BYOD-heavy workforces.",
      "benefitsWho": "Organizations with diverse device fleets needing remote access (Twingate)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Access Model",
      "rows": [
        {
          "feature": "Zero standing privileges / ephemeral just-in-time access",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Hardware-rooted cryptographic identity",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Device posture checks",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "AI agent / MCP access control",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Platforms & Deployment",
      "rows": [
        {
          "feature": "Native client apps (desktop/mobile)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Infrastructure-as-code deployment (Terraform/Pulumi/API)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Coverage across servers, Kubernetes, and databases",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Compliance & Trust",
      "rows": [
        {
          "feature": "FedRAMP support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "FIPS 140-2 support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Open-source community presence",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Teleport: 20K+ GitHub stars"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Published per-user pricing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Free tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Twingate Starter: up to 5 users"
        },
        {
          "feature": "Free trial",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What does each platform replace?",
      "answer": "Teleport replaces standing credentials with cryptographic, just-in-time access across servers, Kubernetes, databases, and applications, including AI agents; Twingate replaces traditional VPNs with identity-based, least-privilege Zero Trust access to private resources."
    },
    {
      "question": "Is pricing public for either tool?",
      "answer": "Twingate publishes clear per-user pricing — $5/user/month for Teams (up to 100 users) and $10/user/month for Business (up to 500 users); Teleport does not publish pricing tiers and requires submitting a form or downloading a pricing guide."
    },
    {
      "question": "Does either offer a free plan or trial?",
      "answer": "Twingate's Starter plan is free for up to 5 users; Teleport offers a free trial according to its site, though it does not have a documented free-forever tier."
    },
    {
      "question": "What compliance standards does each support?",
      "answer": "Teleport supports FedRAMP and FIPS 140-2; Twingate's facts don't state specific compliance certifications."
    },
    {
      "question": "What platforms does each support?",
      "answer": "Twingate has native clients for macOS, Windows, Linux, Chrome OS, iOS, and Android; Teleport's facts don't detail specific client operating system support."
    }
  ]
};

export default teleportVsTwingateContent;

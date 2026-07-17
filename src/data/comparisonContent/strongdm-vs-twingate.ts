import type { ToolComparisonContent } from './types';

const strongdmVsTwingateContent: ToolComparisonContent = {
  "verdict": "StrongDM and Twingate both replace legacy access models, but at different layers — StrongDM is a Privileged Access Management platform with live session control and credential elimination across databases, Kubernetes, network devices, and servers under one all-inclusive per-user SKU (price not published), while Twingate is a Zero Trust Network Access product replacing VPNs with published per-user pricing, device posture checks, and broad native client support.",
  "bestForToolA": "Organizations needing session-level privileged access control (live visibility, recording, credential elimination) across databases, Kubernetes, and network devices, with named compliance frameworks like FedRAMP and PCI DSS 4.0.",
  "bestForToolB": "Teams that want straightforward, published per-user pricing for general Zero Trust network access replacing a VPN, with device posture checks and wide native client support.",
  "whoNeedsBoth": "Teams sometimes deploy Twingate for general Zero Trust network connectivity to private resources while layering StrongDM on top for privileged, session-recorded access to sensitive databases and infrastructure requiring compliance-grade audit trails.",
  "keyDifferences": [
    {
      "title": "Product category",
      "toolA": "Privileged Access Management (PAM) for infrastructure resources (databases, Kubernetes, network devices, cloud, servers) with live session recording/control.",
      "toolB": "Zero Trust Network Access (VPN replacement) for private resources, office networks, and cloud VPCs.",
      "whyItMatters": "PAM and ZTNA address adjacent but distinct problems — privileged session control vs. general network connectivity.",
      "benefitsWho": "Security teams managing privileged infrastructure access (StrongDM) vs. IT teams replacing VPNs for general remote access (Twingate)."
    },
    {
      "title": "Session visibility and control",
      "toolA": "Provides live session control with real-time visibility into user actions during active sessions.",
      "toolB": "No session recording or live control documented.",
      "whyItMatters": "Real-time session oversight is critical for auditing privileged actions on sensitive systems.",
      "benefitsWho": "Compliance and security teams needing detailed audit trails of privileged sessions (StrongDM)."
    },
    {
      "title": "Credential model",
      "toolA": "Credential Elimination removes standing credentials entirely as a named feature.",
      "toolB": "Provides least-privilege network access controls, not framed as credential elimination.",
      "whyItMatters": "Eliminating standing credentials reduces theft and lateral-movement risk more directly than access-scoping alone.",
      "benefitsWho": "Security teams reducing credential-based attack surface (StrongDM)."
    },
    {
      "title": "Pricing model",
      "toolA": "Single SKU, per-user pricing with all features included and no separate charges by protocol or resource — actual figure not published.",
      "toolB": "Publishes tiered per-user prices ($5-$10/user/month) with different feature sets per tier, plus a free Starter plan.",
      "whyItMatters": "All-inclusive single-SKU pricing simplifies procurement once a quote is obtained; published tiers let buyers self-serve budgeting immediately.",
      "benefitsWho": "Buyers wanting pricing simplicity after a quote (StrongDM) vs. buyers wanting upfront transparency (Twingate)."
    },
    {
      "title": "Named compliance frameworks",
      "toolA": "Explicitly supports NIST 800-53, FedRAMP, HIPAA, SOC 2, PCI DSS 4.0, and ISO 27001.",
      "toolB": "No specific compliance certifications stated in the facts.",
      "whyItMatters": "Regulated organizations need documented framework support to shortlist vendors.",
      "benefitsWho": "Enterprises in regulated industries (StrongDM)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Access & Session Control",
      "rows": [
        {
          "feature": "Live/real-time session visibility & control",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Standing credential elimination",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Least-privilege network access controls",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Device posture checks",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Resource Coverage",
      "rows": [
        {
          "feature": "Database access coverage",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Kubernetes access coverage",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Network device coverage",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "General private resource / VPN replacement",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Compliance & Trust",
      "rows": [
        {
          "feature": "Named compliance frameworks",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "StrongDM: NIST 800-53, FedRAMP, HIPAA, SOC 2, PCI DSS 4.0, ISO 27001"
        },
        {
          "feature": "Corporate ownership/acquisition disclosed",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "StrongDM acquired by Delinea"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Published per-user price",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "All-inclusive single-SKU pricing (no add-on fees)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Free tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Twingate Starter: up to 5 users"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "How does each price its product?",
      "answer": "StrongDM uses a single SKU, per-user pricing model with all features included and no separate charges by protocol or resource type, though exact prices require contacting sales; Twingate publishes tiered per-user pricing from free up to $10/user/month for its Business plan, plus custom Enterprise pricing."
    },
    {
      "question": "What resources does each cover?",
      "answer": "StrongDM supports Kubernetes, databases, network devices, cloud services, and servers under one access model with live session control; Twingate provides Zero Trust access to office networks, cloud VPCs, and private resources without naming specific database or Kubernetes coverage."
    },
    {
      "question": "Does either eliminate standing credentials?",
      "answer": "StrongDM's Credential Elimination feature removes standing credentials to reduce theft and lateral-movement risk; Twingate's facts describe least-privilege, network-layer access controls rather than credential elimination specifically."
    },
    {
      "question": "What compliance frameworks does StrongDM support?",
      "answer": "StrongDM supports NIST 800-53, FedRAMP, HIPAA, SOC 2, PCI DSS 4.0, and ISO 27001; Twingate's facts don't list specific compliance certifications."
    },
    {
      "question": "Who owns StrongDM?",
      "answer": "StrongDM was recently acquired by Delinea to expand capabilities around agentic AI and context-aware authorization; Twingate's facts don't mention any ownership changes."
    }
  ]
};

export default strongdmVsTwingateContent;

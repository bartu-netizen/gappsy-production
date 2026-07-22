import type { ToolComparisonContent } from './types';

const permifyVsVantaContent: ToolComparisonContent = {
  "verdict": "Permify is an open-source, Zanzibar-inspired authorization engine that developers embed into applications to enforce fine-grained RBAC, ABAC, and ReBAC access control. Vanta is a compliance automation platform that continuously monitors security controls and streamlines audits across frameworks like SOC 2, ISO 27001, and HIPAA. They sit in adjacent but distinct categories: Permify answers \"who can access what inside our application,\" while Vanta answers \"can we prove to auditors that our organization's security controls work.\"",
  "bestForToolA": "Permify fits engineering teams building an application that needs a dedicated, self-hostable authorization service supporting RBAC, ABAC, and ReBAC in one schema, with access checks reported as fast as 10ms and either a free AGPL-3.0 Community edition or managed Permify Cloud.",
  "bestForToolB": "Vanta fits security and compliance teams that need to continuously monitor controls, automate audit evidence collection, and respond to security questionnaires across 20+ frameworks including SOC 2, ISO 27001, HIPAA, GDPR, and FedRAMP, backed by 16,000+ customers and 400+ integrations.",
  "whoNeedsBoth": "A growing SaaS company could use Permify to enforce fine-grained authorization inside its own product while using Vanta to continuously monitor and prove its overall security posture — including access-control practices — to auditors and enterprise customers pursuing SOC 2 or ISO 27001.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "Permify is an authorization engine — infrastructure developers integrate into their own applications to centralize permission logic instead of hardcoding it per app.",
      "toolB": "Vanta is a compliance automation platform for continuously monitoring security controls and preparing for third-party audits.",
      "whyItMatters": "These tools solve different problems for different teams and are not interchangeable, despite both being security-adjacent.",
      "benefitsWho": "Application engineering teams benefit from Permify; security/GRC teams benefit from Vanta."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Permify's Community edition is free and self-hosted under AGPL-3.0; Permify Cloud is custom, usage-based pricing.",
      "toolB": "All four Vanta tiers — Essentials, Plus, Professional, and Enterprise — are quote-based with no published pricing, requiring a sales conversation to compare plans.",
      "whyItMatters": "A free, self-hostable tier lets teams start using Permify at zero cost, while Vanta buyers must engage sales before knowing what any tier costs.",
      "benefitsWho": "Budget-conscious engineering teams benefit from Permify's free Community edition; enterprises comfortable with a sales-led buying process work within Vanta's model."
    },
    {
      "title": "Deployment Options",
      "toolA": "Permify can be fully self-hosted (Community, AGPL-3.0) or run as Permify Cloud, a managed offering with SOC2 and GDPR compliance across AWS, GCP, and Azure.",
      "toolB": "Vanta is a SaaS platform with no self-hosting option documented.",
      "whyItMatters": "Self-hosting matters for teams with strict data-residency or infrastructure-control requirements, which isn't a choice Vanta offers.",
      "benefitsWho": "Teams needing infrastructure control benefit from Permify's self-hosted option; teams wanting a fully managed compliance tool benefit from Vanta's SaaS model."
    },
    {
      "title": "AI Features",
      "toolA": "Permify does not document any AI features.",
      "toolB": "Vanta includes a Vanta AI Agent for drafting policies, completing security questionnaires, and flagging compliance issues, plus AI-powered questionnaire automation (25 questionnaires per year on the Plus plan).",
      "whyItMatters": "AI-assisted questionnaire responses can significantly cut the manual effort compliance teams spend on vendor security reviews.",
      "benefitsWho": "Security/compliance teams handling frequent questionnaires benefit from Vanta's AI Agent; this isn't a feature category Permify competes in."
    },
    {
      "title": "Company Backing and Scale",
      "toolA": "Permify was acquired by FusionAuth in November 2025, which committed to keeping it open source, with a unified pricing model planned for 2026.",
      "toolB": "Vanta was founded in 2018, is headquartered in San Francisco, and states it is used by 16,000+ customers with 400+ tool integrations.",
      "whyItMatters": "Vendor stability and scale of adoption affect long-term risk when choosing infrastructure a business depends on.",
      "benefitsWho": "Enterprises wanting a proven, large-scale vendor benefit from evaluating Vanta's stated customer base; teams comfortable with a recently-acquired open-source project benefit from Permify's continued open-source commitment."
    }
  ],
  "featureMatrix": [
    {
      "group": "Access Control vs Compliance Scope",
      "rows": [
        {
          "feature": "Fine-grained authorization (RBAC/ABAC/ReBAC)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Compliance framework monitoring (SOC2, ISO27001, HIPAA, etc.)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Vanta: 20+ frameworks including FedRAMP and CMMC"
        },
        {
          "feature": "Audit evidence automation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Third-party/vendor risk management",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Schema-as-code permission modeling",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI assistant/agent",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Vanta AI Agent"
        },
        {
          "feature": "AI-powered security questionnaire responses",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "25/year on Plus plan"
        },
        {
          "feature": "Sub-20ms access-check latency",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Permify docs report checks as fast as 10ms"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Permify Community, AGPL-3.0, free"
        },
        {
          "feature": "Managed cloud option",
          "toolA": "available",
          "toolB": "available",
          "note": "Permify Cloud (custom usage-based); Vanta all tiers quote-based"
        },
        {
          "feature": "Published self-serve pricing",
          "toolA": "limited",
          "toolB": "unavailable",
          "note": "Permify Community is free; both companies' paid tiers are quote-based"
        },
        {
          "feature": "Multi-tenant support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Integration ecosystem size",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Vanta: 400+ integrations"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Permify and Vanta direct competitors?",
      "answer": "No. Permify is an authorization engine developers embed into applications for access control (RBAC/ABAC/ReBAC). Vanta is a compliance automation platform for monitoring security controls and preparing audits. They address different problems within the broader security space."
    },
    {
      "question": "Is Permify free to use?",
      "answer": "Yes, Permify's core Community edition is open source under AGPL-3.0 and can be self-hosted for free. A managed Permify Cloud option with custom, usage-based pricing is also available."
    },
    {
      "question": "Does Vanta publish its pricing?",
      "answer": "No. All four Vanta plans — Essentials, Plus, Professional, and Enterprise — are quote-based, and comparing them requires contacting sales for a demo."
    },
    {
      "question": "Which tool has AI features?",
      "answer": "Vanta has a documented Vanta AI Agent for drafting policies, completing questionnaires, and flagging compliance issues, plus AI-powered questionnaire automation. Permify does not document any AI features."
    },
    {
      "question": "Can Permify and Vanta be used together?",
      "answer": "Yes — a company could use Permify to enforce fine-grained authorization inside its product while using Vanta to continuously monitor and document its broader security and compliance posture for auditors."
    },
    {
      "question": "Who maintains Permify now?",
      "answer": "Permify was acquired by FusionAuth in November 2025. FusionAuth has stated Permify remains open source and continues to be developed as a standalone authorization engine, with a unified pricing model planned for 2026."
    }
  ]
};

export default permifyVsVantaContent;

import type { ToolComparisonContent } from './types';

const kissflowVsProcessStreetContent: ToolComparisonContent = {
  "verdict": "Kissflow and Process Street are both enterprise-grade, quote-priced platforms with AI features, but they answer different questions: Kissflow is a broader low-code/no-code platform for building custom business applications, forms, and external portals with AI app generation, while Process Street is purpose-built for compliance operations — policy documentation, audit-ready records, and a dedicated AI risk agent named Cora. Neither publishes full self-serve pricing, so the choice depends on whether the priority is building applications or maintaining compliance documentation.",
  "bestForToolA": "Organizations that need to build custom business applications, forms, and client-facing portals with AI-assisted app generation, and that value Kissflow's published review scores (G2 4.3/5, Capterra 4.2/5) and long operating history dating to 2003.",
  "bestForToolB": "Organizations whose core need is compliance documentation and audit-ready workflows against standards like ISO 9001, SOC 2, SOX, or FDA requirements, backed by formal certifications (ISO 27001, SOC 2 Type II, HIPAA, GDPR) and a 14-day free trial on the Pro plan.",
  "whoNeedsBoth": "A company could use Kissflow to build its general internal applications and portals while relying on Process Street specifically for regulated, audit-driven processes such as SOC 2 evidence collection, since the two overlap on 'workflow automation' but not on named compliance standards or app-building scope.",
  "keyDifferences": [
    {
      "title": "Platform scope",
      "toolA": "A low-code/no-code platform for building custom business applications, forms, and external-facing portals, in addition to workflow orchestration.",
      "toolB": "Focused on workflow automation, policy documentation, and audit-ready record-keeping rather than general custom app or portal building.",
      "whyItMatters": "Teams needing to build bespoke internal or client-facing applications need a platform with app-building tools, not just workflow automation.",
      "benefitsWho": "Teams building custom apps and portals benefit from Kissflow's App Builder and External Portals features."
    },
    {
      "title": "Compliance standard coverage",
      "toolA": "Governance Tools cover data policies, app/user monitoring, role-based access, and audit logs, but no specific compliance standards are named.",
      "toolB": "Docs are explicitly built for standards like ISO 9001, SOC 2, SOX, and FDA, and the platform holds ISO 27001, SOC 2 Type II, HIPAA, and GDPR certifications.",
      "whyItMatters": "Named compliance-standard support and formal certifications matter for regulated industries that must prove adherence to specific frameworks.",
      "benefitsWho": "Compliance and quality teams in regulated industries benefit most from Process Street's named standards and certifications."
    },
    {
      "title": "AI focus",
      "toolA": "Kissflow AI generates complete apps or app-building blocks from a prompt in seconds.",
      "toolB": "Process AI generates workflows from a description, and a separate Cora AI agent monitors regulations and flags compliance risks.",
      "whyItMatters": "The AI features target different outputs — full applications vs. workflows plus ongoing risk monitoring.",
      "benefitsWho": "Teams wanting AI-generated applications benefit from Kissflow AI; compliance teams wanting proactive risk monitoring benefit from Process Street's Cora agent."
    },
    {
      "title": "Free trial availability",
      "toolA": "No self-serve or free plan is advertised; pricing requires a sales consultation.",
      "toolB": "Offers a 14-day free trial on the Pro plan with no credit card required.",
      "whyItMatters": "A free trial lets teams evaluate the product hands-on before a sales conversation, while a consultation-only model requires committing to a sales process first.",
      "benefitsWho": "Teams that prefer to self-evaluate before talking to sales benefit from Process Street's free trial."
    },
    {
      "title": "Published track record and reviews",
      "toolA": "Cites 195+ named customers (Motorola Solutions, NBC Universal, University of Michigan) with explicit G2 (4.3/5) and Capterra (4.2/5) ratings.",
      "toolB": "Cites 3,000+ companies and over 1 million users (including Salesforce, Cisco, and Slack), without a published review-score aggregate in the facts.",
      "whyItMatters": "Explicit review scores give buyers a quick quality signal beyond customer logos alone.",
      "benefitsWho": "Buyers who weigh third-party review scores in their evaluation benefit from Kissflow's published G2/Capterra ratings."
    }
  ],
  "featureMatrix": [
    {
      "group": "Platform Scope & AI",
      "rows": [
        {
          "feature": "Custom app builder (forms, apps, portals)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI workflow/app generation from a prompt",
          "toolA": "available",
          "toolB": "available",
          "note": "Kissflow AI generates apps; Process AI generates workflows."
        },
        {
          "feature": "Dedicated compliance/risk AI agent",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Process Street's Cora AI agent."
        },
        {
          "feature": "Decision tables / logic automation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "External client-facing portals",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Compliance & Governance",
      "rows": [
        {
          "feature": "Named compliance-standard support (ISO 9001, SOC 2, SOX, FDA)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Formal security certifications (ISO 27001, SOC 2 Type II, HIPAA, GDPR)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Audit trail / audit-ready records",
          "toolA": "available",
          "toolB": "available",
          "note": "Kissflow: Governance Tools with audit logs. Process Street: described as maintaining 'audit-ready records.'"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Self-serve free trial",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Process Street's Pro plan includes a 14-day free trial, no credit card required."
        },
        {
          "feature": "Published plan feature limits (even if price is quote-only)",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Process Street publishes plan names and limits (e.g., 100 automation actions/month on Startup)."
        },
        {
          "feature": "No AI/API usage surcharges on enterprise agreements",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Kissflow have a free plan?",
      "answer": "No, Kissflow doesn't advertise a self-serve or free plan; pricing requires a sales consultation."
    },
    {
      "question": "Does Process Street offer a free trial?",
      "answer": "Yes, the Pro plan includes a 14-day free trial with no credit card required."
    },
    {
      "question": "What compliance standards does each platform support?",
      "answer": "Process Street's Docs are built for ISO 9001, SOC 2, SOX, and FDA standards, and it holds ISO 27001, SOC 2 Type II, HIPAA, and GDPR certifications. Kissflow's Governance Tools include data policies and audit logs but don't name specific compliance standards."
    },
    {
      "question": "What is Cora?",
      "answer": "Cora is Process Street's AI compliance and risk agent that monitors regulations and flags risks."
    },
    {
      "question": "Does Kissflow use AI?",
      "answer": "Yes, Kissflow AI can generate complete apps or app-building blocks from a prompt."
    },
    {
      "question": "How large is each company's customer base?",
      "answer": "Kissflow cites 195+ customers including Motorola Solutions, NBC Universal, and University of Michigan. Process Street cites 3,000+ companies and over 1 million users, including Salesforce, Cisco, and Slack."
    }
  ]
};

export default kissflowVsProcessStreetContent;

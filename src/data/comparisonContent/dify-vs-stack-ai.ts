import type { ToolComparisonContent } from './types';

const difyVsStackAiContent: ToolComparisonContent = {
  "verdict": "Dify and Stack AI are both no-code/low-code platforms for building and deploying AI agents and workflows, but they differ in openness and pricing structure: Dify is open source with a self-hostable Community Edition and a modified Apache 2.0 license, while Stack AI is a closed platform offering flexible cloud, VPC, or on-premise deployment without a documented open-source option. Dify's Cloud pricing is tiered and published (Sandbox, Professional $590/year, Team $1,590/year), whereas Stack AI publishes only a Free plan (500 runs/month) before jumping straight to custom Enterprise pricing.",
  "bestForToolA": "Dify fits developers and teams who want an open-source, self-hostable AI workflow platform (149K+ GitHub stars) with a visual Workflow Studio, RAG knowledge pipelines, and MCP-compatible deployment options, starting with a free Sandbox tier or self-hosted Community Edition.",
  "bestForToolB": "Stack AI fits business teams wanting a fully no-code agent builder with industry-specific templates for finance, legal, healthcare, customer service, and IT, plus governance controls like audit logs and human-in-the-loop review, deployable on multi-tenant cloud, VPC, or on-premise.",
  "whoNeedsBoth": "A vendor building AI products for multiple client verticals could prototype quickly in Stack AI using its industry-specific templates and governance controls for business stakeholders, while an engineering team separately self-hosts Dify's open-source Community Edition to build and customize lower-level RAG pipelines and custom plugins that Stack AI's templates don't cover.",
  "keyDifferences": [
    {
      "title": "Open Source & Licensing",
      "toolA": "Dify's Community Edition is open source and self-hostable via Docker Compose at no cost, released under a modified Apache 2.0 license that requires a commercial license only for offering Dify as multi-tenant SaaS.",
      "toolB": "Stack AI does not document an open-source or self-hosted-free option; its deployment flexibility (VPC, on-premise) is offered as part of its commercial Enterprise tier rather than a free open-source release.",
      "whyItMatters": "Open-source availability lets developers inspect, modify, and self-host at zero licensing cost, which matters for teams wanting full control or avoiding vendor lock-in.",
      "benefitsWho": "Engineering-led teams and developers wanting to customize or audit the underlying code benefit from Dify's open-source model."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Dify publishes tiered Cloud pricing: Sandbox (free, 200 message credits), Professional ($590/year, 5,000 message credits/month), and Team ($1,590/year, 10,000 message credits/month), plus a free self-hosted Community Edition.",
      "toolB": "Stack AI publishes only a Free plan (500 runs/month, 2 projects, 1 seat) with no documented mid-tier — pricing jumps straight to custom Enterprise.",
      "whyItMatters": "A published mid-tier lets growing teams predict costs as usage scales, while a straight jump to custom Enterprise pricing means budget conversations require a sales call earlier.",
      "benefitsWho": "Growing teams wanting predictable, self-serve scaling benefit from Dify's published Professional/Team tiers."
    },
    {
      "title": "Industry-Specific Templates",
      "toolA": "Dify's Marketplace provides access to model providers, tools, data sources, and MCP-compatible integrations, but does not document dedicated vertical-industry templates.",
      "toolB": "Stack AI offers pre-built workflows specifically for finance, legal, healthcare, customer service, and IT.",
      "whyItMatters": "Ready-made vertical templates reduce time-to-value for business teams that don't want to build agent logic from scratch.",
      "benefitsWho": "Business teams in regulated or specialized industries (finance, legal, healthcare) benefit from Stack AI's pre-built vertical templates."
    },
    {
      "title": "Knowledge/RAG Pipeline Depth",
      "toolA": "Dify includes a dedicated Knowledge pipeline for document processing and indexing to build retrieval-augmented generation (RAG) knowledge bases, with storage tiers up to 20GB on the Team plan.",
      "toolB": "Stack AI documents 100+ integrations for connecting to existing business systems but does not detail a dedicated RAG/knowledge-indexing pipeline in its feature list.",
      "whyItMatters": "A dedicated knowledge pipeline with documented storage limits matters for teams building agents that need to reason over large internal document sets.",
      "benefitsWho": "Teams building document-heavy RAG applications benefit from Dify's explicit Knowledge pipeline and storage tiers."
    },
    {
      "title": "Compliance Certifications",
      "toolA": "Dify's Enterprise tier offers SOC 2 Type II and ISO 27001 compliance plus SSO/SAML and RBAC.",
      "toolB": "Stack AI documents broader compliance across all its tiers: SOC 2 Type II, HIPAA, ISO 27001, and GDPR.",
      "whyItMatters": "HIPAA compliance specifically matters for any team processing healthcare data, and GDPR matters for EU data handling.",
      "benefitsWho": "Healthcare and EU-regulated teams benefit from Stack AI's documented HIPAA and GDPR compliance."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "No-code visual builder",
          "toolA": "available",
          "toolB": "available",
          "note": "Dify: Workflow Studio; Stack AI: drag-and-drop builder"
        },
        {
          "feature": "Multi-LLM/model-agnostic support",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "RAG knowledge pipeline",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Industry-specific templates",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Stack AI: finance, legal, healthcare, customer service, IT"
        },
        {
          "feature": "Plugin/custom tool development",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Dify includes a difyctl CLI for CI/CD"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Dify Sandbox: 200 credits; Stack AI Free: 500 runs/month"
        },
        {
          "feature": "Published mid-tier pricing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Dify: Professional $590/year, Team $1,590/year"
        },
        {
          "feature": "Self-hosted free option",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Dify Community Edition"
        },
        {
          "feature": "Custom Enterprise plan",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Governance",
      "rows": [
        {
          "feature": "VPC / on-premise deployment",
          "toolA": "available",
          "toolB": "available",
          "note": "Both offer Enterprise-tier private deployment"
        },
        {
          "feature": "Audit logs / human-in-the-loop review",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SSO/SAML and RBAC",
          "toolA": "available",
          "toolB": "available",
          "note": "Both on Enterprise tier"
        },
        {
          "feature": "HIPAA compliance",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Dify or Stack AI open source?",
      "answer": "Dify is open source — its Community Edition can be self-hosted for free via Docker Compose under a modified Apache 2.0 license. Stack AI does not document an open-source release; its deployment flexibility (cloud, VPC, on-premise) is delivered as a commercial product."
    },
    {
      "question": "Which tool has a published mid-tier price?",
      "answer": "Dify does: Cloud's Professional plan is $590/year and Team is $1,590/year. Stack AI publishes only a Free plan (500 runs/month); beyond that, pricing is custom Enterprise with no documented mid-tier."
    },
    {
      "question": "Does either tool offer industry-specific templates?",
      "answer": "Stack AI does — it provides pre-built workflows for finance, legal, healthcare, customer service, and IT. Dify's Marketplace offers model providers, tools, and integrations, but dedicated vertical-industry templates are not documented."
    },
    {
      "question": "Which tool supports more LLM providers?",
      "answer": "Stack AI is documented as LLM-agnostic, working with multiple AI models. Dify's multi-model support specifics are not detailed in its feature list, though its Marketplace does provide access to model providers."
    },
    {
      "question": "What compliance certifications does each tool have?",
      "answer": "Stack AI documents SOC 2 Type II, HIPAA, ISO 27001, and GDPR compliance. Dify's Enterprise tier offers SOC 2 Type II and ISO 27001 compliance plus SSO/SAML and RBAC, but HIPAA and GDPR are not specifically listed for Dify."
    },
    {
      "question": "Can both tools be deployed on-premise?",
      "answer": "Yes. Dify offers a self-hosted Community Edition plus an Enterprise self-hosted/VPC option, and Stack AI is available as multi-tenant cloud, VPC, or on-premise installation."
    }
  ]
};

export default difyVsStackAiContent;

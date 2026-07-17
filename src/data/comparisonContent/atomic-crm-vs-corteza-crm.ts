import type { ToolComparisonContent } from './types';

const atomicCrmVsCortezaCrmContent: ToolComparisonContent = {
  "verdict": "Atomic CRM is a focused, open-source CRM toolkit by Marmelab built on React, Shadcn UI, and Supabase, designed to be self-hosted or run on Marmelab's managed plans. Corteza is a broader open-source, low-code platform under Apache 2.0 where CRM is just one module alongside a Unified Workspace and Enterprise Messaging. Atomic CRM is a CRM you can modify; Corteza is a platform for building CRM-plus-collaboration apps.",
  "bestForToolA": "Teams that want a modern, focused sales CRM (Kanban pipeline, contacts, tasks) built on a well-documented stack, with the option of Marmelab's managed hosting starting at €25/month for up to 1,000 contacts.",
  "bestForToolB": "Organizations that want to build a broader set of low-code business apps beyond CRM, including internal messaging and a unified workspace, under an Apache 2.0 license managed by the Commons Conservancy Software Foundation.",
  "whoNeedsBoth": "Running both simultaneously in production would be redundant since they compete directly as self-hosted CRM options; a technical team might instead pilot both side by side, Atomic CRM if they already run Supabase, or Corteza if they want a broader low-code platform, before standardizing on one.",
  "keyDifferences": [
    {
      "title": "Platform Scope",
      "toolA": "Atomic CRM is a focused CRM toolkit: sales pipeline, contacts, tasks, and data import/export.",
      "toolB": "Corteza is a low-code platform where CRM is one module among a Unified Workspace, Enterprise Messaging, and a general-purpose low-code app builder for records-based business apps.",
      "whyItMatters": "A broader platform can replace more tools at once, but a focused CRM is often simpler to deploy and maintain.",
      "benefitsWho": "Teams that want only a CRM benefit from Atomic CRM's focus; teams wanting to consolidate multiple internal tools benefit from Corteza's breadth."
    },
    {
      "title": "Managed Hosting Availability",
      "toolA": "Atomic CRM offers first-party managed plans from Marmelab: Starter at €25/month (1,000 contacts, 1GB storage) and Team at €50/month (10,000 contacts, 10GB storage), in addition to free self-hosting.",
      "toolB": "Corteza has no first-party managed-cloud pricing page; hosted instances are offered only by third parties such as Planet Crust.",
      "whyItMatters": "Teams without infrastructure resources need a first-party managed option rather than relying on third-party hosts.",
      "benefitsWho": "Non-technical teams that want a managed SaaS-style experience without a third-party host."
    },
    {
      "title": "AI Assistant Integration",
      "toolA": "Atomic CRM includes an MCP Server out of the box for connecting AI assistants to CRM data.",
      "toolB": "Corteza's facts don't document an MCP server or AI integration.",
      "whyItMatters": "MCP support lets AI assistants query and act on CRM data directly, a growing requirement for AI-augmented workflows.",
      "benefitsWho": "Teams building AI-assisted sales workflows on top of their CRM data."
    },
    {
      "title": "Governance Model",
      "toolA": "Atomic CRM is maintained by Marmelab as the primary maintainer, without a foundation structure documented.",
      "toolB": "Corteza's code is contributed to the Commons Conservancy Software Foundation, so access cannot be revoked by a single vendor, under the Apache 2.0 license.",
      "whyItMatters": "Foundation governance reduces single-vendor lock-in risk for organizations planning long-term deployments.",
      "benefitsWho": "Organizations with long-horizon open-source procurement policies that value foundation-backed governance."
    },
    {
      "title": "Technology Stack",
      "toolA": "Atomic CRM is built on React, TypeScript, Shadcn UI, and Supabase (Postgres-based backend).",
      "toolB": "Corteza's stack details aren't specified beyond being deployable via Docker.",
      "whyItMatters": "Teams that want to extend or self-host the code need to know what stack they'll be working in.",
      "benefitsWho": "Engineering teams already using React/Supabase who want to extend Atomic CRM directly."
    }
  ],
  "featureMatrix": [
    {
      "group": "CRM Capabilities",
      "rows": [
        {
          "feature": "Sales pipeline / Kanban board",
          "toolA": "available",
          "toolB": "available",
          "note": "Corteza: 360-degree lead/account overview"
        },
        {
          "feature": "Contact & activity management",
          "toolA": "available",
          "toolB": "available",
          "note": "Atomic CRM: avatars, notes, email-to-note"
        },
        {
          "feature": "Task management with reminders",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Data import/export",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Platform Scope",
      "rows": [
        {
          "feature": "Low-code app builder beyond CRM",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Built-in team messaging",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Corteza: Enterprise Messaging"
        },
        {
          "feature": "Unified workspace/collaboration suite",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Mobile app",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Deployment & Support",
      "rows": [
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "available",
          "note": "Corteza: via Docker"
        },
        {
          "feature": "First-party managed cloud plans",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Atomic CRM: €25-€50/month"
        },
        {
          "feature": "SSO",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Atomic CRM: Google, Azure, Keycloak, Auth0"
        },
        {
          "feature": "MCP Server / AI integration",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Corteza more than just a CRM?",
      "answer": "Yes, Corteza is a broader low-code platform that includes a CRM module alongside a Unified Workspace and Enterprise Messaging, plus a general-purpose low-code app builder."
    },
    {
      "question": "Are both Atomic CRM and Corteza free to self-host?",
      "answer": "Yes, both are open source and free to self-host on your own infrastructure."
    },
    {
      "question": "Does Atomic CRM offer managed hosting?",
      "answer": "Yes, Marmelab offers managed plans starting at €25/month for up to 1,000 contacts and 1GB storage."
    },
    {
      "question": "Does Corteza offer managed hosting?",
      "answer": "Corteza has no first-party managed-cloud pricing; hosted instances are offered only by third parties such as Planet Crust."
    },
    {
      "question": "Which one has AI assistant integration?",
      "answer": "Atomic CRM includes an MCP Server for connecting AI assistants to CRM data; Corteza's facts don't document a comparable feature."
    },
    {
      "question": "What license governs Corteza?",
      "answer": "Corteza is released under the Apache License 2.0, with its code contributed to the Commons Conservancy Software Foundation."
    }
  ]
};

export default atomicCrmVsCortezaCrmContent;

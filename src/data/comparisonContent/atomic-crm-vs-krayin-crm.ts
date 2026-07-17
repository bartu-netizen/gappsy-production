import type { ToolComparisonContent } from './types';

const atomicCrmVsKrayinCrmContent: ToolComparisonContent = {
  "verdict": "Atomic CRM is a focused, open-source sales CRM built on React, Shadcn UI, and Supabase, with an optional managed hosting plan from its maintainer Marmelab. Krayin CRM is a free, MIT-licensed CRM built on Laravel/PHP that bundles marketing automation and customer support (VoIP, live chat) alongside sales tracking. Both are self-hostable, but they're built on different stacks and cover different scope beyond core sales tracking.",
  "bestForToolA": "Teams on a modern JavaScript/Supabase stack that want a focused sales pipeline CRM with SSO (Google, Azure, Keycloak, Auth0) and an MCP Server for AI assistant integration, with the option of managed hosting from €25/month.",
  "bestForToolB": "Organizations that already run PHP/Laravel infrastructure and want marketing automation (campaigns, email marketing, segmentation) and customer support (VoIP, live chat) bundled into the same free, self-hosted CRM.",
  "whoNeedsBoth": "Running both in production would be redundant since they overlap heavily as self-hosted CRM alternatives; a technical team might instead pilot both (Atomic CRM if they run Supabase, Krayin if they run Laravel/PHP) before standardizing on one platform.",
  "keyDifferences": [
    {
      "title": "Technology Stack",
      "toolA": "Atomic CRM is built on React, TypeScript, Shadcn UI, and Supabase (Postgres-based backend).",
      "toolB": "Krayin CRM is built on Laravel (PHP), maintained by Webkul.",
      "whyItMatters": "Self-hosting either tool requires infrastructure and skills matching its stack, which affects setup and maintenance cost.",
      "benefitsWho": "Teams with existing React/Supabase expertise (Atomic CRM) or PHP/Laravel expertise (Krayin)."
    },
    {
      "title": "Built-In Marketing and Support Modules",
      "toolA": "Atomic CRM's documented features focus on sales pipeline, contacts, and tasks, without built-in marketing automation or a support/VoIP module.",
      "toolB": "Krayin bundles marketing automation (campaign management, email marketing, customer segmentation) and customer support (VoIP, live chat, multi-channel feedback) directly into the CRM.",
      "whyItMatters": "A CRM with built-in marketing and support tooling can reduce the number of separate systems a small team needs to run.",
      "benefitsWho": "Small businesses that want sales, marketing, and support consolidated into one free tool (Krayin)."
    },
    {
      "title": "Managed Hosting",
      "toolA": "Atomic CRM offers first-party managed plans directly from Marmelab: Starter at €25/month and Team at €50/month.",
      "toolB": "Krayin has no first-party managed-cloud pricing page; Webkul's separate Cloudkul service and third-party hosts offer managed setups instead.",
      "whyItMatters": "A first-party managed option simplifies procurement and support compared to going through a separate hosting vendor.",
      "benefitsWho": "Teams that want a single vendor relationship for both software and hosting."
    },
    {
      "title": "AI and MCP Integration",
      "toolA": "Atomic CRM includes an MCP Server for connecting AI assistants to CRM data.",
      "toolB": "Krayin's facts don't document AI or MCP features.",
      "whyItMatters": "MCP support is increasingly relevant for teams building AI-assisted workflows on top of CRM data.",
      "benefitsWho": "Teams that want to connect AI assistants directly to their CRM records."
    },
    {
      "title": "Community Scale and Extensions",
      "toolA": "Atomic CRM's facts don't cite a specific GitHub star count or extension ecosystem.",
      "toolB": "Krayin has a large GitHub community (23,000+ stars) with official extensions for VoIP, multi-tenant SaaS, and Google Workspace sync.",
      "whyItMatters": "A larger open-source community and extension catalog can mean more available integrations and faster bug fixes.",
      "benefitsWho": "Teams that value a large, active open-source ecosystem when picking a self-hosted CRM."
    }
  ],
  "featureMatrix": [
    {
      "group": "CRM Core",
      "rows": [
        {
          "feature": "Sales pipeline/deal tracking",
          "toolA": "available",
          "toolB": "available",
          "note": "Atomic CRM: Kanban board; Krayin: deal management, forecasting"
        },
        {
          "feature": "Contact/lead tracking",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Custom fields",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Access control lists",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Krayin: custom ACL"
        }
      ]
    },
    {
      "group": "Marketing & Support",
      "rows": [
        {
          "feature": "Marketing automation/campaigns",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Email marketing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Live chat/VoIP support",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Multi-channel messaging (WhatsApp, Facebook, WeChat, Skype)",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Extensibility",
      "rows": [
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "available",
          "note": "Krayin: MIT license"
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
          "feature": "MCP Server/AI integration",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is better for marketing automation, Atomic CRM or Krayin?",
      "answer": "Krayin bundles marketing automation (campaigns, email marketing, segmentation) directly into the CRM; Atomic CRM's documented features don't include a marketing automation module."
    },
    {
      "question": "What's the tech stack difference between the two?",
      "answer": "Atomic CRM is built on React, TypeScript, Shadcn UI, and Supabase. Krayin CRM is built on Laravel (PHP)."
    },
    {
      "question": "Does Atomic CRM offer managed hosting?",
      "answer": "Yes, Marmelab offers managed plans starting at €25/month (Starter, 1,000 contacts) up to €50/month (Team, 10,000 contacts)."
    },
    {
      "question": "Is Krayin really free?",
      "answer": "Yes, Krayin is fully open source under the MIT license and free to self-host."
    },
    {
      "question": "Does either CRM include AI features?",
      "answer": "Atomic CRM includes an MCP Server for AI assistant integration; Krayin's facts don't document AI features."
    },
    {
      "question": "Which CRM supports single sign-on?",
      "answer": "Atomic CRM documents SSO support via Google, Azure, Keycloak, and Auth0. Krayin's facts don't document SSO."
    }
  ]
};

export default atomicCrmVsKrayinCrmContent;

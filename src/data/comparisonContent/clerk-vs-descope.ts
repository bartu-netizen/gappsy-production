import type { ToolComparisonContent } from './types';

const clerkVsDescopeContent: ToolComparisonContent = {
  "verdict": "Clerk is a full-stack authentication and user management platform built around prebuilt drop-in UI components, native billing integration, and a generous 50,000 MAU free tier. Descope is built around a no-code visual workflow builder (Descope Flows), fine-grained RBAC/ReBAC/ABAC authorization, and dedicated AI agent/MCP server security, with a smaller 7,500 MAU free tier. Clerk suits teams wanting fast component-based integration and built-in subscription billing tied to user accounts, while Descope suits teams that need deeper authorization control or are securing AI-agent access.",
  "bestForToolA": "Teams building on Next.js, React, or Expo that want drop-in sign-up/sign-in components and native subscription billing tied directly to user accounts fit Clerk's model well.",
  "bestForToolB": "Teams that need visual, no-code control over authentication journeys or must support advanced authorization models (RBAC/ReBAC/ABAC) and AI-agent/MCP security are better served by Descope.",
  "whoNeedsBoth": "Both are full CIAM platforms for the same job, so combining them for one application is unusual. A more realistic split is organizational: a consumer product team uses Clerk for fast Next.js/React integration and built-in billing, while a separate AI-agent-facing product within the same company uses Descope specifically for its MCP server security and ReBAC/ABAC models.",
  "keyDifferences": [
    {
      "title": "Built-In Billing Integration",
      "toolA": "Clerk includes native subscription management and plan-based content gating tied directly to user accounts, with a billing add-on charging 0.7% of processed billing volume.",
      "toolB": "Descope does not document a billing or subscription management feature.",
      "whyItMatters": "A native billing layer removes the need to wire a separate subscription system to the auth layer.",
      "benefitsWho": "SaaS teams that want subscription gating built into the same platform that handles login."
    },
    {
      "title": "No-Code Flow Builder",
      "toolA": "Clerk relies on prebuilt, customizable drop-in UI components (sign-up, sign-in, user profile, waitlist) rather than a visual workflow builder.",
      "toolB": "Descope Flows is a drag-and-drop visual builder for designing authentication and identity journeys without custom code.",
      "whyItMatters": "Component-based integration is typically faster to ship initially, while a visual flow builder gives more flexibility to modify logic later without redeploying.",
      "benefitsWho": "Teams that expect frequent changes to their auth journey benefit from Descope's builder; teams wanting the fastest initial integration benefit from Clerk's components."
    },
    {
      "title": "Free Tier MAU Ceiling",
      "toolA": "Clerk's Hobby plan is free for up to 50,000 monthly active users and 100 monthly active organizations, with no credit card required.",
      "toolB": "Descope's Free Forever plan caps at 7,500 MAUs, 10 tenants, and 3 SSO connections.",
      "whyItMatters": "A higher free-tier ceiling delays the point at which a growing product needs to start paying for identity infrastructure.",
      "benefitsWho": "Early-stage startups trying to control fixed costs while scaling users."
    },
    {
      "title": "Enterprise SSO Pricing",
      "toolA": "Clerk charges $75/month per enterprise SSO connection on top of its $25/month Pro plan.",
      "toolB": "Descope bundles SSO connections into its plan tiers: 3 free, 5 on Pro ($249/month), and 10 on Growth ($799/month), rather than per-connection add-on pricing.",
      "whyItMatters": "Per-connection add-on pricing versus tier-bundled connections produces different costs depending on how many enterprise customers a company signs.",
      "benefitsWho": "B2B SaaS companies forecasting costs as their enterprise customer count grows."
    },
    {
      "title": "Authorization Model Depth",
      "toolA": "Clerk's Organizations feature includes custom roles for multi-tenant B2B products, and security controls cover MFA, bot detection, and fraud detection.",
      "toolB": "Descope supports role-based (RBAC), relationship-based (ReBAC), and attribute-based (ABAC) access control, plus dedicated AI agent and MCP server security.",
      "whyItMatters": "Products with complex, resource-level permission needs or AI-agent access require authorization models beyond basic roles.",
      "benefitsWho": "Platforms with nested or resource-level permissions, and teams securing AI-agent or MCP access."
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Tier & Pricing",
      "rows": [
        {
          "feature": "Free plan MAU limit",
          "toolA": "available",
          "toolB": "available",
          "note": "Clerk 50,000 MAU vs. Descope 7,500 MAUs"
        },
        {
          "feature": "Free organizations/tenants included",
          "toolA": "available",
          "toolB": "available",
          "note": "Clerk 100 organizations vs. Descope 10 tenants"
        },
        {
          "feature": "Entry paid plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "Clerk $25/month vs. Descope $249/month"
        }
      ]
    },
    {
      "group": "Developer Experience & UI",
      "rows": [
        {
          "feature": "Prebuilt drop-in UI components",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "No-code visual auth flow builder",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Descope Flows"
        },
        {
          "feature": "Built-in billing/subscription management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Native mobile framework SDKs",
          "toolA": "available",
          "toolB": "available",
          "note": "Clerk via Expo; Descope via React Native, Swift, Kotlin, Flutter"
        }
      ]
    },
    {
      "group": "Authorization, Security & AI",
      "rows": [
        {
          "feature": "Role-based access control",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Relationship-based/attribute-based access (ReBAC/ABAC)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "AI agent/MCP server security",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Bot/fraud detection",
          "toolA": "available",
          "toolB": "available",
          "note": "Descope's requires Growth tier ($799/mo)"
        },
        {
          "feature": "Enterprise SSO connection pricing",
          "toolA": "available",
          "toolB": "available",
          "note": "Clerk $75/mo/connection; Descope bundled into plan tiers"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Clerk or Descope have a bigger free plan?",
      "answer": "Clerk's Hobby plan is free for up to 50,000 MAU and 100 organizations, well above Descope's Free Forever plan of 7,500 MAUs and 10 tenants."
    },
    {
      "question": "Which platform includes billing/subscription management?",
      "answer": "Clerk includes native billing integration for subscription management and plan-based content gating; Descope does not document a billing feature."
    },
    {
      "question": "Which supports AI-agent or MCP server authentication?",
      "answer": "Descope has a dedicated AI agent and MCP server security feature; Clerk does not document an equivalent capability."
    },
    {
      "question": "How does enterprise SSO pricing compare?",
      "answer": "Clerk charges $75/month per enterprise SSO connection added to its $25/month Pro plan. Descope bundles a set number of SSO connections into each plan tier instead of billing per connection."
    },
    {
      "question": "Which has deeper authorization controls?",
      "answer": "Descope, with RBAC, ReBAC, and ABAC support. Clerk's Organizations feature provides custom roles but does not document ReBAC or ABAC."
    },
    {
      "question": "What frameworks does each support?",
      "answer": "Clerk supports Next.js, React, React Router, TanStack React Start, Astro, and Expo. Descope supports React, Next.js, Vue.js, Angular, Python, Node.js, Java, .NET, Go, PHP, Ruby, Kotlin, Swift, React Native, and Flutter."
    }
  ]
};

export default clerkVsDescopeContent;

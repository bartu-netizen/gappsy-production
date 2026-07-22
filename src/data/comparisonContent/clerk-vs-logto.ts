import type { ToolComparisonContent } from './types';

const clerkVsLogtoContent: ToolComparisonContent = {
  "verdict": "Clerk is a proprietary, cloud-hosted authentication platform with prebuilt UI components, built-in billing integration, and a free tier up to 50,000 MAU, with Pro starting at $25/month and enterprise SSO billed separately at $75/connection. Logto is an open-source, self-hostable authentication platform with a comparable 50,000 MAU free tier, a flat $24/month Pro plan that includes enterprise SSO, and a no-code Protected App option for adding auth without SDK integration. The choice largely comes down to whether a team wants Clerk's component-driven, billing-integrated developer experience or Logto's open-source flexibility and flat enterprise-SSO pricing.",
  "bestForToolA": "Teams building consumer or B2B SaaS apps on Next.js/React that want fast drop-in UI components plus native subscription billing tied to accounts are well suited to Clerk.",
  "bestForToolB": "Teams that want the option to self-host identity infrastructure, need enterprise SSO without per-connection add-on fees, or want to add auth in front of an existing app without SDK changes are better served by Logto.",
  "whoNeedsBoth": "Since both handle the same core identity layer, there's no common architecture that uses them together for one application. The realistic split is organizational: a product team building on Next.js/React might choose Clerk for its component-based setup, while a platform team that wants to self-host identity for compliance reasons runs Logto's open-source edition for a separate, internally-hosted product.",
  "keyDifferences": [
    {
      "title": "Open Source & Self-Hosting",
      "toolA": "Clerk is a proprietary, cloud-hosted platform with no self-hosting option documented.",
      "toolB": "Logto is open source, with full source available and a self-hosting option (including a dedicated Logto Private Cloud offering) instead of using the managed cloud.",
      "whyItMatters": "Self-hosting matters for teams with data residency, compliance, or infrastructure-control requirements.",
      "benefitsWho": "Engineering-heavy teams or regulated organizations that need to keep identity infrastructure under their own control."
    },
    {
      "title": "Enterprise SSO Pricing",
      "toolA": "Clerk charges $75/month per enterprise SSO connection added on top of its $25/month Pro plan.",
      "toolB": "Logto includes SAML and OIDC-based enterprise SSO directly in its flat $24/month Pro plan, with no per-connection add-on fee documented.",
      "whyItMatters": "Per-connection billing can scale costs quickly for B2B apps serving many enterprise customers, while flat-plan inclusion keeps costs predictable.",
      "benefitsWho": "B2B SaaS companies signing multiple enterprise customers who want predictable SSO costs."
    },
    {
      "title": "Free Tier Structure",
      "toolA": "Clerk's Hobby plan is free for up to 50,000 monthly active users and 100 organizations, with the Pro plan billing $0.02/month per MRU beyond the included 50,000.",
      "toolB": "Logto's Free plan supports up to 50,000 monthly active users with no credit card required, but its Pro plan moves to unlimited MAU for a flat $24/month with per-token overage billing ($0.08 per 100 extra tokens).",
      "whyItMatters": "Both offer comparable free MAU ceilings, but the paid-tier cost structures diverge: usage-based overage per MRU versus a flat unlimited-MAU price with token-based overage.",
      "benefitsWho": "Growing products trying to predict costs as their active user base scales past the free tier."
    },
    {
      "title": "No-Code Auth Embedding",
      "toolA": "Clerk requires SDK or component integration (prebuilt UI components) rather than offering a no-code proxy layer.",
      "toolB": "Logto's Protected App feature lets teams add authentication in front of an existing app without SDK integration.",
      "whyItMatters": "A no-code proxy option can add authentication to legacy or third-party apps that can't easily be modified to add an SDK.",
      "benefitsWho": "Teams needing to secure an existing app quickly without a code-level integration project."
    },
    {
      "title": "Built-In Billing",
      "toolA": "Clerk includes native subscription management and plan-based content gating tied directly to user accounts.",
      "toolB": "Logto does not document a billing or subscription management feature.",
      "whyItMatters": "Combining billing and identity in one platform can reduce integration work for SaaS products with paid tiers.",
      "benefitsWho": "SaaS teams that want subscription gating handled by the same platform as authentication."
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing & Free Tier",
      "rows": [
        {
          "feature": "Free plan MAU limit",
          "toolA": "available",
          "toolB": "available",
          "note": "Both offer 50,000 MAU free"
        },
        {
          "feature": "Entry paid plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "Clerk $25/month ($20 annual) vs. Logto $24/month"
        },
        {
          "feature": "Enterprise SSO included in entry paid plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Clerk bills $75/mo/connection separately; Logto includes it in Pro"
        }
      ]
    },
    {
      "group": "Authentication & Multi-Tenancy",
      "rows": [
        {
          "feature": "B2B organizations / multi-tenancy",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Multi-factor authentication",
          "toolA": "available",
          "toolB": "available",
          "note": "Logto includes WebAuthn, authenticator apps, backup codes"
        },
        {
          "feature": "Built-in billing/subscription management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Machine-to-machine authentication",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Deployment & Extensibility",
      "rows": [
        {
          "feature": "Self-hosting option",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "No-code auth proxy (add auth without SDK)",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Logto Protected App"
        },
        {
          "feature": "Framework/SDK breadth",
          "toolA": "available",
          "toolB": "available",
          "note": "Clerk: Next.js, React, React Router, TanStack, Astro, Expo. Logto: 20+ frameworks including Vue, Angular, Go, Swift, Python"
        },
        {
          "feature": "Webhooks",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "1 on Free, 10 on Pro"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can Logto be self-hosted while Clerk cannot?",
      "answer": "Yes. Logto is open source and can be self-hosted, while Clerk is a proprietary cloud service with no self-hosting option documented."
    },
    {
      "question": "Which includes enterprise SSO without extra fees?",
      "answer": "Logto includes SAML/OIDC enterprise SSO in its flat $24/month Pro plan. Clerk charges $75/month per enterprise connection added to its $25/month Pro plan."
    },
    {
      "question": "Do both offer a free plan?",
      "answer": "Yes, both offer a free tier for up to 50,000 monthly active users with no credit card required."
    },
    {
      "question": "Which has a no-code option for adding authentication to an existing app?",
      "answer": "Logto's Protected App feature adds authentication in front of an existing app without SDK integration. Clerk requires SDK or component-level integration."
    },
    {
      "question": "Does either include built-in billing?",
      "answer": "Clerk includes native subscription management and plan-based content gating tied to user accounts. Logto does not document a billing feature."
    },
    {
      "question": "How much does Logto's Pro plan cost?",
      "answer": "Logto's Pro plan costs $24/month and includes unlimited MAU, RBAC, organizations, MFA, and enterprise SSO."
    }
  ]
};

export default clerkVsLogtoContent;

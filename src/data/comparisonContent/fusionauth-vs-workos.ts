import type { ToolComparisonContent } from './types';

const fusionauthVsWorkosContent: ToolComparisonContent = {
  "verdict": "FusionAuth is a customer identity platform built around a free, self-hostable Community Edition and flexible deployment (self-hosted, cloud, on-premises, hybrid, or air-gapped), with cloud pricing starting at $162/month for the Starter plan. WorkOS is an API-first identity platform centered on AuthKit, which is free for the first 1 million monthly active users, plus per-connection enterprise SSO and Directory Sync pricing starting at $125/connection. The two suit different starting points: teams that want control over hosting and are comfortable self-managing infrastructure lean toward FusionAuth, while teams building a cloud-native app that wants a generous free ceiling and pay only when they sign enterprise customers lean toward WorkOS.",
  "bestForToolA": "Teams that need to self-host identity for compliance, air-gapped, or on-premises requirements will find FusionAuth's free Community Edition (deployable via ZIP, DEB, RPM, Docker, or Kubernetes) fits that requirement directly, something WorkOS does not offer.",
  "bestForToolB": "B2B SaaS teams that want a large free ceiling before paying anything (AuthKit free up to 1 million MAU) and need broad enterprise identity provider coverage (20+ IdPs including Okta, Azure AD, and Google) are well served by WorkOS.",
  "whoNeedsBoth": "There's little practical scenario for running both on one application since they solve the same identity problem. The more realistic split is a company using WorkOS's free AuthKit for its primary cloud product while a separate internal or air-gapped tool runs a self-hosted FusionAuth Community Edition where cloud identity providers aren't viable.",
  "keyDifferences": [
    {
      "title": "Self-Hosting vs. Managed-Only",
      "toolA": "FusionAuth offers a free, fully self-hostable Community Edition deployable via ZIP, DEB, RPM, Docker, or Kubernetes, plus support for on-premises, hybrid, and air-gapped deployments.",
      "toolB": "WorkOS is not documented as offering a self-hosted option; its architecture is API-first, delivered as a hosted cloud service with AuthKit as the primary user-facing product.",
      "whyItMatters": "Organizations with data residency, compliance, or offline requirements need self-hosting, which only one of these platforms provides.",
      "benefitsWho": "Regulated or infrastructure-conscious engineering teams that must keep identity data on their own servers."
    },
    {
      "title": "Free Tier Ceiling",
      "toolA": "FusionAuth's free tier is the self-hosted Community Edition with core authentication features; its cheapest managed cloud plan, Starter, costs $162/month billed annually.",
      "toolB": "WorkOS's AuthKit is free for the first 1 million monthly active users in production, and staging environments are always free regardless of usage.",
      "whyItMatters": "The gap between a free self-hosted tier and a free-to-1M-MAU cloud tier changes the cost calculus for early-stage teams that don't want to run their own infrastructure.",
      "benefitsWho": "Startups scaling a cloud product that want to defer identity costs until they reach significant user volume."
    },
    {
      "title": "Enterprise SSO Pricing Model",
      "toolA": "FusionAuth's SSO and enterprise tenant management capabilities are bundled into its Enterprise cloud plan, which starts at $2,970/month billed annually.",
      "toolB": "WorkOS bills SSO and Directory Sync per connection on a tiered scale, from $125/connection for 1-15 connections down to $50/connection for 101-200 connections, with custom pricing above 200.",
      "whyItMatters": "A flat enterprise-tier price versus per-connection billing produces very different cost curves depending on how many enterprise customers a company signs.",
      "benefitsWho": "B2B SaaS companies trying to forecast costs as their number of enterprise SSO customers grows."
    },
    {
      "title": "Fraud and Bot Protection",
      "toolA": "FusionAuth's documented security features focus on MFA, passkeys, and breached password detection (paid plans); a dedicated fraud/bot protection feature is not documented.",
      "toolB": "WorkOS includes Radar, real-time protection against bots, fraud, and abuse, with the first 1,000 checks included free each month.",
      "whyItMatters": "Built-in fraud detection reduces the need for a separate third-party risk tool during signup and login flows.",
      "benefitsWho": "Consumer-facing or high-signup-volume apps concerned about bot and fraud abuse at registration."
    },
    {
      "title": "24/7 Support Availability",
      "toolA": "FusionAuth includes 24/7 phone and email support along with a private Slack channel only on its Enterprise plan (starting at $2,970/month).",
      "toolB": "WorkOS offers video call support, onboarding guidance, and a 1-hour P1 response time through its $1,000/month Scale Support plan, with 24/7 SLAs reserved for custom Enterprise contracts.",
      "whyItMatters": "The price point at which round-the-clock or guaranteed-response support becomes available differs significantly between the two platforms.",
      "benefitsWho": "Mid-market teams evaluating how much they'll need to spend to get guaranteed support response times."
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing & Free Tier",
      "rows": [
        {
          "feature": "Free self-hosted edition",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "FusionAuth Community Edition"
        },
        {
          "feature": "Free managed cloud tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "WorkOS AuthKit free up to 1M MAU"
        },
        {
          "feature": "Cheapest paid cloud plan",
          "toolA": "available",
          "toolB": "available",
          "note": "FusionAuth Starter $162/mo annual vs. WorkOS $125/SSO connection"
        }
      ]
    },
    {
      "group": "Authentication & Identity Features",
      "rows": [
        {
          "feature": "Passwordless / magic links",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Passkeys",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Directory Sync (HR/corporate directory)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Includes BambooHR sync"
        },
        {
          "feature": "Fraud/bot protection",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "WorkOS Radar, 1,000 free checks/mo"
        },
        {
          "feature": "Self-serve IT admin portal",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "WorkOS Admin Portal"
        }
      ]
    },
    {
      "group": "Deployment & Support",
      "rows": [
        {
          "feature": "Self-hosted / on-premises deployment",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Air-gapped deployment",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "24/7 phone support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "FusionAuth Enterprise plan only"
        },
        {
          "feature": "Audit log export/SIEM streaming",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Separately priced add-on"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does FusionAuth or WorkOS have a free plan?",
      "answer": "Both do, but differently: FusionAuth's Community Edition is free to self-host, while WorkOS's AuthKit is a free managed cloud service for up to 1 million monthly active users in production."
    },
    {
      "question": "Can I self-host WorkOS the way I can self-host FusionAuth?",
      "answer": "No. WorkOS is not documented as offering a self-hosted option; FusionAuth's Community Edition can be deployed via ZIP, DEB, RPM, Docker, or Kubernetes."
    },
    {
      "question": "How does enterprise SSO pricing compare?",
      "answer": "WorkOS charges per SSO connection starting at $125 (dropping to $50 at higher volumes), while FusionAuth bundles enterprise SSO capabilities into its Enterprise cloud plan starting at $2,970/month."
    },
    {
      "question": "Which platform has built-in fraud or bot protection?",
      "answer": "WorkOS includes Radar, with the first 1,000 fraud/bot checks free each month. FusionAuth does not document an equivalent named feature."
    },
    {
      "question": "Which is cheaper for an app with under 1 million users?",
      "answer": "WorkOS's AuthKit is free up to 1 million MAU in production, making it likely cheaper for a cloud-hosted app below that threshold, unless the team needs FusionAuth's self-hosting instead."
    },
    {
      "question": "What support options does each offer?",
      "answer": "FusionAuth includes 24/7 phone and email support only on its Enterprise plan ($2,970+/month). WorkOS offers video call support and a 1-hour P1 response time via its $1,000/month Scale Support plan, with full 24/7 SLAs on custom Enterprise contracts."
    }
  ]
};

export default fusionauthVsWorkosContent;

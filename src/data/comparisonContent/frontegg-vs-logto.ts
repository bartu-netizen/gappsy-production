import type { ToolComparisonContent } from './types';

const fronteggVsLogtoContent: ToolComparisonContent = {
  "verdict": "Frontegg is a customer identity platform with a free Pay-as-you-Go tier that includes 5 enterprise SSO/SCIM connections, unlimited organizations, and usage-based pricing beyond that via a calculator whose per-unit rates aren't publicly listed. Logto is an open-source, self-hostable platform with a higher 50,000 MAU free ceiling, a flat $24/month Pro plan with published features, but no SSO included on its free tier. Frontegg suits teams that want enterprise SSO/SCIM available from day one and are comfortable with usage-based pricing, while Logto suits teams that want published flat pricing, self-hosting flexibility, and a larger free MAU ceiling.",
  "bestForToolA": "B2B SaaS teams that need enterprise SSO and SCIM connections available immediately, even on a free plan, and want a related AI/agentic access layer (Agen.co) fit Frontegg.",
  "bestForToolB": "Teams that want a published, predictable flat-rate paid plan, a larger free MAU ceiling, and the option to self-host are better served by Logto.",
  "whoNeedsBoth": "Both are complete CIAM platforms competing for the same integration point, so there's no architecture where an app uses both simultaneously. A more realistic scenario is a company evaluating both during a vendor selection process and choosing Logto for one product that needs self-hosting while using Frontegg for another that needs SCIM available on the free tier.",
  "keyDifferences": [
    {
      "title": "SCIM Availability",
      "toolA": "Frontegg includes SCIM connections starting on its free Pay-as-you-Go tier, with 5 enterprise SSO/SCIM connections included.",
      "toolB": "Logto does not document SCIM support; its documented enterprise identity feature is SAML/OIDC-based SSO on the Pro plan.",
      "whyItMatters": "SCIM enables automated user provisioning for enterprise customers; whether it's available and at what tier affects onboarding speed for enterprise deals.",
      "benefitsWho": "B2B SaaS vendors selling to enterprise customers who require automated directory provisioning."
    },
    {
      "title": "Free Tier Composition",
      "toolA": "Frontegg's free tier includes 7,500 MAU plus 5 enterprise SSO/SCIM connections, unlimited organizations, and a custom domain.",
      "toolB": "Logto's free tier includes up to 50,000 MAU but no enterprise SSO connections; SSO requires the $24/month Pro plan.",
      "whyItMatters": "The two free tiers trade off differently: more users for free versus more enterprise features for free.",
      "benefitsWho": "Frontegg's free tier suits teams onboarding enterprise pilots early; Logto's suits teams scaling a larger self-serve user base before needing SSO."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Frontegg uses an interactive usage-based calculator based on MAU, SSO connections, and M2M tokens, with per-unit rates beyond the free tier not publicly listed.",
      "toolB": "Logto publishes a flat $24/month Pro price with a defined feature list, including unlimited MAU, RBAC, organizations, MFA, and enterprise SSO.",
      "whyItMatters": "Published flat pricing is easier to budget against than a calculator-based model that requires sales contact for specifics.",
      "benefitsWho": "Budget-conscious teams that want cost predictability without a sales conversation."
    },
    {
      "title": "Self-Hosting",
      "toolA": "Frontegg is not documented as offering a self-hosting option; it is a cloud-hosted platform.",
      "toolB": "Logto is open source and self-hostable, with a dedicated Logto Private Cloud offering for Enterprise customers.",
      "whyItMatters": "Self-hosting matters for teams with data residency or infrastructure-control requirements.",
      "benefitsWho": "Engineering teams that need to keep identity infrastructure on their own servers or private cloud."
    },
    {
      "title": "AI/Agentic Access Features",
      "toolA": "Frontegg offers Agen.co, a related offering that lets users interact with SaaS products through generative AI platforms.",
      "toolB": "Logto does not document an equivalent agentic access feature; its no-code offering is Protected App, which adds auth in front of an app without SDK integration.",
      "whyItMatters": "Products exploring AI-agent-driven interfaces may value a vendor-provided agentic access layer versus a general no-code auth proxy.",
      "benefitsWho": "Teams building or exploring AI-agent interfaces for their SaaS product."
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Tier & Pricing Model",
      "rows": [
        {
          "feature": "Free plan MAU",
          "toolA": "available",
          "toolB": "available",
          "note": "Frontegg 7,500 MAU vs. Logto 50,000 MAU"
        },
        {
          "feature": "SCIM connections on free tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Frontegg includes 5"
        },
        {
          "feature": "Published flat pricing beyond free tier",
          "toolA": "limited",
          "toolB": "available",
          "note": "Frontegg uses a usage calculator; Logto publishes $24/month Pro"
        }
      ]
    },
    {
      "group": "Enterprise & Multi-Tenancy",
      "rows": [
        {
          "feature": "Enterprise SSO",
          "toolA": "available",
          "toolB": "available",
          "note": "Frontegg on free tier; Logto on $24/month Pro"
        },
        {
          "feature": "Multi-tenant organizations",
          "toolA": "available",
          "toolB": "available",
          "note": "Frontegg unlimited on free tier; Logto via Organizations on Pro"
        },
        {
          "feature": "Advanced fraud protection",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Frontegg Enterprise tier only"
        },
        {
          "feature": "99.99% uptime SLA",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Frontegg Enterprise tier"
        }
      ]
    },
    {
      "group": "Deployment & AI Features",
      "rows": [
        {
          "feature": "Self-hosting",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Open source",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "AI/agentic access layer",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Frontegg Agen.co"
        },
        {
          "feature": "No-code auth proxy",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Logto Protected App"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which includes SCIM on its free tier, Frontegg or Logto?",
      "answer": "Frontegg includes 5 enterprise SSO/SCIM connections on its free Pay-as-you-Go tier. Logto does not document SCIM support at all."
    },
    {
      "question": "Which has a bigger free MAU allowance?",
      "answer": "Logto's free tier supports up to 50,000 MAU, compared to Frontegg's 7,500 MAU on its free Pay-as-you-Go tier."
    },
    {
      "question": "Can Frontegg be self-hosted like Logto?",
      "answer": "No, Frontegg is not documented as offering a self-hosting option, while Logto is open source and self-hostable."
    },
    {
      "question": "How is Frontegg priced beyond the free tier?",
      "answer": "Frontegg uses an interactive usage-based calculator based on monthly active users, enterprise connections, and M2M tokens; exact per-unit rates require contacting sales."
    },
    {
      "question": "What does Logto's Pro plan cost and include?",
      "answer": "Logto's Pro plan is a flat $24/month and includes unlimited MAU, RBAC, organizations, MFA, and enterprise SSO."
    },
    {
      "question": "Which platform has an AI-agent access feature?",
      "answer": "Frontegg offers Agen.co, letting users interact with SaaS products through generative AI platforms. Logto does not document an equivalent feature."
    }
  ]
};

export default fronteggVsLogtoContent;

import type { ToolComparisonContent } from './types';

const keycloakVsOryContent: ToolComparisonContent = {
  "verdict": "Both are open-source identity platforms with self-hosting options, but Keycloak is entirely free with no paid tiers or managed offering, while Ory is a freemium company offering a free Developer tier alongside paid Production ($770/year) and Growth ($9,350/year) plans plus a fully managed Ory Network. The decision often comes down to whether an organization wants a no-cost, self-operated platform or a path to a managed, horizontally-scalable production service.",
  "bestForToolA": "Teams wanting a fully free, self-hosted IAM platform with LDAP/Active Directory federation and no ongoing subscription cost, and the operational capacity to run it themselves.",
  "bestForToolB": "Teams wanting a growth path from a free developer tier to a managed, horizontally-scaling production identity service starting at $770/year, with built-in B2B SSO and machine-to-machine authentication.",
  "whoNeedsBoth": "A company might run Keycloak for internal or workforce identity tied to existing directories while trialing Ory's free Developer tier for a separate customer-facing product before deciding which platform to standardize on for that use case.",
  "keyDifferences": [
    {
      "title": "Pricing Structure",
      "toolA": "Keycloak is entirely free and open source with no paid plans.",
      "toolB": "Ory is freemium: a free Developer tier, then $770/year for Production, $9,350/year for Growth, and custom Enterprise pricing.",
      "whyItMatters": "A zero-cost model versus a tiered subscription changes budgeting and long-term cost planning very differently.",
      "benefitsWho": "Organizations with strong internal DevOps capacity benefit from Keycloak's free model; teams wanting a managed growth path benefit from Ory's tiers."
    },
    {
      "title": "Deployment Options",
      "toolA": "Keycloak is self-hosted only, with no official managed cloud offering.",
      "toolB": "Ory offers self-hosted deployment, an Ory Enterprise License for private infrastructure, and the fully managed Ory Network.",
      "whyItMatters": "Managed hosting removes the operational burden of running identity infrastructure in-house.",
      "benefitsWho": "Teams without dedicated infrastructure staff benefit from Ory's managed Ory Network option."
    },
    {
      "title": "Directory Federation",
      "toolA": "Keycloak explicitly supports LDAP and Active Directory user federation.",
      "toolB": "Ory's documented features focus on CIAM, B2B, and machine-to-machine identity without calling out LDAP/AD federation.",
      "whyItMatters": "Enterprises with existing on-premises directories need federation support to avoid duplicating identity data.",
      "benefitsWho": "Enterprises with legacy directory infrastructure benefit from Keycloak's federation support."
    },
    {
      "title": "Machine-to-Machine Support",
      "toolA": "Keycloak's feature list does not call out machine-to-machine authentication specifically.",
      "toolB": "Ory explicitly documents machine-to-machine authentication for services and automated agents.",
      "whyItMatters": "As service-to-service and AI agent authentication becomes more common, dedicated M2M support matters for modern architectures.",
      "benefitsWho": "Teams building service-to-service or AI agent authentication benefit from Ory's explicit M2M support."
    },
    {
      "title": "Governance and Scale",
      "toolA": "Keycloak is a Cloud Native Computing Foundation (CNCF) incubating project governed by the community.",
      "toolB": "Ory reports 48,000+ GitHub stars and managing 3.3 billion identities across its network, with a stateless horizontal-scaling architecture described as supporting very large deployments.",
      "whyItMatters": "Scale claims and community size can be a signal of production readiness and long-term project viability.",
      "benefitsWho": "Large-scale deployments evaluating vendor track record benefit from Ory's documented scale claims."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment & Hosting",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Fully managed cloud service",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Ory Network"
        },
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "limited",
          "note": "Ory: 2 dev environments, community support"
        }
      ]
    },
    {
      "group": "Identity & Access Features",
      "rows": [
        {
          "feature": "LDAP / Active Directory federation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Machine-to-machine authentication",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "B2B SSO / SCIM",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Fine-grained authorization",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Admin console",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Support",
      "rows": [
        {
          "feature": "Paid production tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "$770/year Production plan"
        },
        {
          "feature": "Vendor commercial support",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Community/OSS governance",
          "toolA": "available",
          "toolB": "available",
          "note": "Keycloak: CNCF; Ory: 48,000+ GitHub stars"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Keycloak free?",
      "answer": "Yes, Keycloak is fully open source with no licensing cost."
    },
    {
      "question": "Does Ory have a free tier?",
      "answer": "Yes, Ory's Developer tier is free and includes 2 development environments and community support."
    },
    {
      "question": "How much does Ory's Production plan cost?",
      "answer": "$770 per year."
    },
    {
      "question": "Does Keycloak support machine-to-machine authentication?",
      "answer": "This isn't documented among Keycloak's listed features, unlike Ory which explicitly supports machine-to-machine authentication for services and agents."
    },
    {
      "question": "Which platform supports LDAP or Active Directory federation?",
      "answer": "Keycloak explicitly documents this. Ory's documented features don't call out LDAP/AD federation."
    },
    {
      "question": "Can Ory be self-hosted like Keycloak?",
      "answer": "Yes, Ory offers an open-source self-hosted deployment option and an Ory Enterprise License, in addition to its fully managed Ory Network."
    }
  ]
};

export default keycloakVsOryContent;

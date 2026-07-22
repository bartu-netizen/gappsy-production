import type { ToolComparisonContent } from './types';

const keycloakVsZitadelContent: ToolComparisonContent = {
  "verdict": "Both are open-source identity platforms, but Keycloak is a fully free, self-hosted-only project with no managed cloud offering, while Zitadel is a freemium company offering both self-hosting and a managed cloud/Pro tier with formal compliance certifications. The choice largely comes down to whether an organization wants to operate identity infrastructure itself for free or pay for a managed, certified service.",
  "bestForToolA": "Organizations wanting a completely free, self-hosted IAM platform with deep LDAP/Active Directory federation, and the operational capacity to run it themselves without paid vendor support.",
  "bestForToolB": "Teams wanting a managed or hybrid identity platform with a free tier up to 100 daily active users, hosted login pages, and formal SOC2/ISO27001/OpenID certifications, without operating the infrastructure themselves.",
  "whoNeedsBoth": "An organization might run Keycloak internally for employee/workforce SSO tied to existing Active Directory infrastructure while adopting Zitadel for a separate customer-facing product that needs hosted login pages and a managed free tier to launch quickly.",
  "keyDifferences": [
    {
      "title": "Hosting Model",
      "toolA": "Keycloak has no official managed cloud/hosted offering from the project itself; it must be self-hosted.",
      "toolB": "Zitadel offers a free-tier managed cloud service as well as self-hosted and custom Enterprise deployment options.",
      "whyItMatters": "Teams without dedicated ops capacity may not be able to realistically run a self-hosted-only identity platform.",
      "benefitsWho": "Small teams without dedicated infrastructure staff benefit from Zitadel's managed cloud option."
    },
    {
      "title": "Pricing",
      "toolA": "Keycloak is entirely free and open source with no paid tiers.",
      "toolB": "Zitadel is freemium: free up to 100 daily active users, then $100/month for Pro (up to 25,000 DAU), with custom Enterprise pricing above that.",
      "whyItMatters": "Zero licensing cost versus a usage-based subscription changes the long-term cost calculus as user counts grow.",
      "benefitsWho": "Cost-sensitive organizations with strong DevOps capacity benefit from Keycloak's zero cost; growing SaaS products benefit from Zitadel's predictable tiered pricing."
    },
    {
      "title": "Directory Federation",
      "toolA": "Keycloak explicitly supports user federation with existing LDAP or Active Directory directories.",
      "toolB": "Zitadel's documented features don't call out LDAP/AD federation specifically.",
      "whyItMatters": "Enterprises with existing on-premises directories need federation to avoid duplicating user data.",
      "benefitsWho": "Enterprises with legacy Active Directory or LDAP infrastructure benefit from Keycloak's federation support."
    },
    {
      "title": "Compliance Certifications",
      "toolA": "Keycloak does not document formal compliance certifications of the kind Zitadel lists.",
      "toolB": "Zitadel is ISO 27001 certified, SOC2 Type II certified, and OpenID certified, with data residency in the EU, US, Switzerland, and Australia.",
      "whyItMatters": "Regulated industries often require documented third-party compliance certifications before adopting an identity vendor.",
      "benefitsWho": "Enterprises in regulated industries benefit from Zitadel's certification profile."
    },
    {
      "title": "Governance and Support",
      "toolA": "Keycloak is a Cloud Native Computing Foundation (CNCF) incubating project with a community-driven model and no commercial vendor support included by default.",
      "toolB": "Zitadel is a commercial open-source company headquartered in San Francisco, offering paid SLAs (99.5% uptime on Pro, 99.99% on Enterprise).",
      "whyItMatters": "Vendor-backed SLAs provide accountability that a purely community-governed project doesn't offer by default.",
      "benefitsWho": "Businesses requiring contractual uptime guarantees benefit from Zitadel's paid SLA tiers."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment & Hosting",
      "rows": [
        {
          "feature": "Official managed cloud offering",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Free to use",
          "toolA": "available",
          "toolB": "limited",
          "note": "Zitadel free up to 100 DAU"
        }
      ]
    },
    {
      "group": "Authentication & Directory",
      "rows": [
        {
          "feature": "LDAP / Active Directory federation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Single sign-on",
          "toolA": "available",
          "toolB": "available",
          "note": "Zitadel via hosted login pages"
        },
        {
          "feature": "MFA / passwordless login",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Social login",
          "toolA": "available",
          "toolB": "available",
          "note": "Zitadel: Google, Microsoft, GitHub"
        },
        {
          "feature": "gRPC / REST APIs",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Enterprise & Compliance",
      "rows": [
        {
          "feature": "ISO 27001 / SOC2 / OpenID certification",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Data residency options",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zitadel: EU, US, Switzerland, Australia"
        },
        {
          "feature": "Contractual uptime SLA",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "99.5% Pro, 99.99% Enterprise"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Keycloak completely free?",
      "answer": "Yes, Keycloak is open-source software with no licensing cost."
    },
    {
      "question": "Does Zitadel have a free tier?",
      "answer": "Yes, Zitadel's free plan includes unlimited users and organizations up to 100 daily active users."
    },
    {
      "question": "Does Keycloak offer a managed cloud version?",
      "answer": "No, there is no official managed or hosted offering from the Keycloak project itself; it must be self-hosted."
    },
    {
      "question": "Which platform supports LDAP or Active Directory federation?",
      "answer": "Keycloak explicitly documents user federation with LDAP and Active Directory. Zitadel's feature list doesn't call out this specific capability."
    },
    {
      "question": "Which platform has formal compliance certifications?",
      "answer": "Zitadel is ISO 27001, SOC2 Type II, and OpenID certified. Keycloak doesn't document equivalent formal certifications."
    },
    {
      "question": "What uptime SLA does each offer?",
      "answer": "Zitadel offers a 99.5% uptime guarantee on Pro and 99.99% on Enterprise. Keycloak, as self-hosted open source, comes with no vendor SLA."
    }
  ]
};

export default keycloakVsZitadelContent;

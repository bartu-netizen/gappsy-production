import type { ToolComparisonContent } from './types';

const hygraphVsStatamicContent: ToolComparisonContent = {
  "verdict": "Hygraph is a hosted, GraphQL-native headless CMS built for enterprises that need content federation across multiple sources, SOC 2/ISO 27001-grade security, and delivery to many channels. Statamic is a self-hosted, Laravel-based CMS with a permanently free Core edition, aimed at PHP/Laravel developers and agencies who want flat-file or database-backed sites with a paid Pro tier unlocking headless/API access. The choice is less about features and more about deployment model: managed SaaS with per-entry/API-call limits versus self-hosted software licensed per site.",
  "bestForToolA": "Enterprise and multi-brand teams that need GraphQL content federation, SOC 2 Type 2 and ISO 27001 certification, and granular RBAC/SSO across up to 200 seats and 80 locales fit Hygraph's hosted platform best.",
  "bestForToolB": "PHP/Laravel developers and agencies building a self-hosted, flat-file or database-backed website who want a permanently free Core edition and only need to pay $349/site (then $99/year) once they require multi-user accounts or headless API access fit Statamic best.",
  "whoNeedsBoth": "There is no realistic scenario for using both together — each is a primary CMS for building and serving a site's content, and a team would choose one as the system of record rather than run both in the same content pipeline.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "Hygraph is a SaaS subscription: a free Hobby tier, then Growth at $199/month, then custom Enterprise pricing.",
      "toolB": "Statamic is licensed per self-hosted site: Core is free forever, Pro costs $349/site for the first year (including updates) then $99/year to keep updating.",
      "whyItMatters": "Recurring monthly SaaS cost behaves very differently in a budget than a one-time-per-site license with a low annual renewal.",
      "benefitsWho": "Agencies managing many client sites may prefer Statamic's flat per-site license; teams wanting predictable managed infrastructure may prefer Hygraph's subscription."
    },
    {
      "title": "Hosting & Architecture",
      "toolA": "Hygraph is a fully hosted, GraphQL-native content-as-a-service platform with content federation across multiple data sources.",
      "toolB": "Statamic is a self-hosted PHP application built on Laravel, and can run in flat-file mode (no database required) or database-backed mode.",
      "whyItMatters": "Self-hosting requires PHP/Laravel server management skills, while a hosted CMS removes infrastructure work but adds usage-based limits.",
      "benefitsWho": "Teams without server-ops capacity benefit from Hygraph's managed hosting; developers who want full infrastructure control benefit from Statamic's self-hosted model."
    },
    {
      "title": "API Access by Tier",
      "toolA": "Hygraph includes GraphQL API access on every tier, including the free Hobby plan (500,000 API calls/month, 1,000 entries).",
      "toolB": "Statamic's REST API and GraphQL endpoint are gated behind the paid Pro license — the free Core edition does not include headless/API access.",
      "whyItMatters": "If a team needs headless delivery to a separate frontend or app, this determines whether that capability is free or requires payment.",
      "benefitsWho": "Developers building decoupled/headless frontends on a budget benefit from Hygraph's free-tier API access."
    },
    {
      "title": "Security & Compliance Certifications",
      "toolA": "Hygraph is SOC 2 Type 2 certified (since August 2022) and ISO 27001 certified, with GDPR and German BDSG/TMG compliance, plus RBAC with OIDC/LDAP/SAML SSO.",
      "toolB": "Statamic's Enterprise tier adds SSO, 2FA, and Audit Logging, but no third-party security certifications (SOC 2, ISO 27001) are documented.",
      "whyItMatters": "Regulated enterprises often require documented third-party security certifications before approving a vendor.",
      "benefitsWho": "Enterprise buyers with compliance/procurement requirements benefit from Hygraph's certified security posture."
    },
    {
      "title": "Multi-Locale & Multi-Site Scale",
      "toolA": "Hygraph Enterprise supports up to 80 locales and 200 seats, with multitenancy and dedicated infrastructure.",
      "toolB": "Statamic Pro includes multi-site support for managing multiple languages, domains, or sub-brands from a single install, but specific locale or seat limits are not documented.",
      "whyItMatters": "Large, multi-market organizations need to know concrete scale limits before committing to a platform.",
      "benefitsWho": "Global enterprises managing many locales and brands benefit from Hygraph's documented Enterprise-scale limits."
    }
  ],
  "featureMatrix": [
    {
      "group": "Content Modeling & Delivery",
      "rows": [
        {
          "feature": "GraphQL API",
          "toolA": "available",
          "toolB": "limited",
          "note": "Statamic GraphQL requires Pro license; Hygraph includes it on the free Hobby tier"
        },
        {
          "feature": "REST API",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Statamic REST API requires Pro"
        },
        {
          "feature": "Content federation across sources",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Rich block/field editor",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Statamic's Bard block editor with 40+ fieldtypes"
        },
        {
          "feature": "Flat-file storage mode",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Licensing",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Hygraph Hobby (3 seats, 1,000 entries); Statamic Core (1 admin user)"
        },
        {
          "feature": "Entry paid tier price",
          "toolA": "available",
          "toolB": "available",
          "note": "Hygraph Growth $199/month; Statamic Pro $349/site first year, $99/year renewal"
        },
        {
          "feature": "Enterprise custom pricing",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access, Security & Scale",
      "rows": [
        {
          "feature": "SSO",
          "toolA": "available",
          "toolB": "limited",
          "note": "Hygraph on Enterprise (OIDC/LDAP/SAML); Statamic SSO is Enterprise-only"
        },
        {
          "feature": "SOC 2 / ISO 27001 certification",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Audit logs",
          "toolA": "available",
          "toolB": "limited",
          "note": "Statamic Audit Logging is Enterprise-only"
        },
        {
          "feature": "Multi-locale/multi-site support",
          "toolA": "available",
          "toolB": "available",
          "note": "Hygraph up to 80 locales (Enterprise); Statamic multi-site on Pro"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Hygraph free?",
      "answer": "Yes, the Hobby plan is free forever with 3 seats, unlimited asset storage, 1,000 entries, and 500,000 API calls/month, though the next tier jumps to $199/month with no documented mid-tier option."
    },
    {
      "question": "Is Statamic free?",
      "answer": "The Core edition is free forever with no per-site licensing fee. The Pro tier, required for multi-user accounts, revisions, and REST/GraphQL API access, costs $349/site the first year and $99/year to renew."
    },
    {
      "question": "Which one is self-hosted?",
      "answer": "Statamic is self-hosted, built on Laravel, and can run in flat-file mode without a database. Hygraph is a hosted SaaS platform; no self-hosting option is documented."
    },
    {
      "question": "Does Statamic support headless or API-based delivery?",
      "answer": "Yes, but only with a Pro license — REST API and GraphQL access are Pro features, not included in the free Core edition."
    },
    {
      "question": "Is Hygraph SOC 2 certified?",
      "answer": "Yes, Hygraph has been SOC 2 Type 2 certified since August 2022 and is also ISO 27001 certified. No equivalent certification is documented for Statamic."
    },
    {
      "question": "Which tool requires PHP/Laravel development skills?",
      "answer": "Statamic requires PHP/Laravel hosting and development knowledge to self-host and customize. Hygraph is a hosted content-as-a-service platform that doesn't require managing that infrastructure."
    }
  ]
};

export default hygraphVsStatamicContent;

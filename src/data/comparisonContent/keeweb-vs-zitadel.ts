import type { ToolComparisonContent } from './types';

const keewebVsZitadelContent: ToolComparisonContent = {
  "verdict": "KeeWeb is a personal password vault for storing and organizing individual credentials, while Zitadel is developer-facing identity infrastructure for building login, MFA, and multi-tenant authentication into applications. They don't compete for the same job: one manages your passwords, the other authenticates your users.",
  "bestForToolA": "Individuals who want a free, open-source, KeePass-compatible password manager with no cost, no limits, and cross-platform desktop/web apps.",
  "bestForToolB": "Engineering teams building authentication into their own product who need hosted login pages, MFA/passkeys, RBAC, and multi-tenancy, with a free tier up to 100 daily active users.",
  "whoNeedsBoth": "A SaaS company might use Zitadel to power login and authentication for its own product while employees separately use KeeWeb to store internal or operational passwords that aren't managed through Zitadel's identity flows at all.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "KeeWeb is a password manager for storing and browsing credentials in KeePass-compatible database files.",
      "toolB": "Zitadel is identity/access management (IAM) infrastructure for building login and authentication into applications.",
      "whyItMatters": "Confusing a password manager with an identity platform leads to picking the wrong tool for building a login system.",
      "benefitsWho": "Developers researching auth solutions benefit from this categorical distinction."
    },
    {
      "title": "Pricing",
      "toolA": "KeeWeb is completely free with no trials, demos, or limits.",
      "toolB": "Zitadel is free up to 100 daily active users, then $100/month for Pro (up to 25,000 DAU), with custom Enterprise pricing above that.",
      "whyItMatters": "Zitadel's pricing scales with usage since it's a service that runs your application's authentication, unlike a static local tool.",
      "benefitsWho": "Startups scaling user bases benefit from understanding Zitadel's tiered growth path."
    },
    {
      "title": "Authentication Delivery",
      "toolA": "KeeWeb does not provide authentication-as-a-service; it only stores stored KeePass entries locally or via file sync.",
      "toolB": "Zitadel provides hosted login pages, MFA, passwordless/passkey login, and social login via Google, Microsoft, and GitHub.",
      "whyItMatters": "Only one of these tools can actually power the login flow for another application.",
      "benefitsWho": "Product teams building customer-facing login benefit from Zitadel; individuals just need KeeWeb for personal use."
    },
    {
      "title": "Compliance Certifications",
      "toolA": "KeeWeb does not document any formal compliance certifications.",
      "toolB": "Zitadel is ISO 27001 certified, SOC2 Type II certified, and OpenID certified, with data residency options in the EU, US, Switzerland, and Australia.",
      "whyItMatters": "Regulated businesses need documented compliance certifications before adopting an identity provider.",
      "benefitsWho": "Enterprises and regulated industries benefit from Zitadel's certification profile."
    },
    {
      "title": "Multi-Tenancy and APIs",
      "toolA": "KeeWeb has no API or multi-tenant features; it offers multi-file support and cloud sync via Dropbox, Google Drive, OneDrive, or WebDAV.",
      "toolB": "Zitadel provides multi-tenancy for extending applications to new organizations, plus gRPC and REST APIs for custom integrations.",
      "whyItMatters": "Building a multi-customer SaaS product requires programmatic, multi-tenant identity infrastructure that a personal password manager doesn't offer.",
      "benefitsWho": "B2B SaaS builders benefit from Zitadel's multi-tenancy and API access."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Personal password storage",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Hosted login pages for applications",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "KeePass file compatibility",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Password generator",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Access & Security",
      "rows": [
        {
          "feature": "MFA / passkeys for application login",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Social login (Google, Microsoft, GitHub)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Role-based access control",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Protected/hidden fields",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Deployment & Compliance",
      "rows": [
        {
          "feature": "Multi-tenancy support",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "gRPC/REST API access",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Formal compliance certifications",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Zitadel: ISO 27001, SOC2 Type II, OpenID"
        },
        {
          "feature": "Free tier / free to use",
          "toolA": "available",
          "toolB": "limited",
          "note": "Zitadel free up to 100 DAU"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is KeeWeb an identity provider like Zitadel?",
      "answer": "No, KeeWeb is a personal password manager. It doesn't provide login, SSO, or authentication services for applications the way Zitadel does."
    },
    {
      "question": "Does Zitadel have a free tier?",
      "answer": "Yes, Zitadel's free plan covers unlimited users and organizations up to 100 daily active users."
    },
    {
      "question": "Is KeeWeb open source?",
      "answer": "Yes, KeeWeb is open source with its code available on GitHub."
    },
    {
      "question": "Is Zitadel open source?",
      "answer": "Yes, Zitadel is open source and reports an active GitHub community with 4,000+ stars."
    },
    {
      "question": "Does KeeWeb support MFA or SSO for applications?",
      "answer": "This isn't documented as a feature. KeeWeb stores passwords for individual use rather than issuing authentication for other applications."
    },
    {
      "question": "How much does Zitadel's Pro plan cost?",
      "answer": "$100 per month, which includes up to 25,000 daily active users."
    }
  ]
};

export default keewebVsZitadelContent;

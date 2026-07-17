import type { ToolComparisonContent } from './types';

const fusionauthVsVaultwardenContent: ToolComparisonContent = {
  "verdict": "FusionAuth is a customer identity and access management (CIAM) platform that handles login, SSO, MFA, and RBAC for the applications a company builds, with a free self-hosted Community Edition and cloud plans starting at $162/month. Vaultwarden is a free, open-source, self-hosted password manager server compatible with official Bitwarden apps, used by individuals and teams to store and share their own credentials. They serve adjacent but distinct jobs: authenticating a company's end users versus storing a team's own passwords.",
  "bestForToolA": "Companies that need to add login, SSO, social authentication, passkeys, or machine-to-machine authentication to their own applications, with SDKs across languages like .NET Core, React, Java, Python, and PHP.",
  "bestForToolB": "Individuals, families, or small teams who want a free, self-hosted, Bitwarden-compatible password vault for their own personal or shared organizational credentials.",
  "whoNeedsBoth": "A common real-world pairing: a company uses FusionAuth to power login, SSO, and MFA for its own customer-facing product, while its internal team separately uses Vaultwarden to store and share internal credentials such as admin panel logins and infrastructure passwords that aren't managed through the application's own auth system.",
  "keyDifferences": [
    {
      "title": "Primary Purpose",
      "toolA": "FusionAuth is a customer identity and access management platform for authenticating and authorizing an application's end users.",
      "toolB": "Vaultwarden is a personal/team password vault for storing and sharing login credentials people already have, not for authenticating into a company's own application.",
      "whyItMatters": "Building login for your product and storing your team's passwords are different problems requiring different tools.",
      "benefitsWho": "Product teams building customer-facing login need FusionAuth; internal IT and small teams managing shared credentials need Vaultwarden."
    },
    {
      "title": "Pricing Structure",
      "toolA": "FusionAuth's Community Edition is free and self-hosted; cloud plans start at $162/month (Starter, billed annually), rising to Essentials and Enterprise plans starting at $2,970/month.",
      "toolB": "Vaultwarden has no published pricing plans in its documented facts — it is free, open-source software intended for self-hosting.",
      "whyItMatters": "Teams scaling into paid CIAM tiers need to budget for FusionAuth's cloud pricing curve, while Vaultwarden's cost is mainly self-hosting infrastructure.",
      "benefitsWho": "Growing SaaS companies need to plan for FusionAuth's tiered cloud pricing; individuals and small teams benefit from Vaultwarden's fully free model."
    },
    {
      "title": "Authentication Features for Applications",
      "toolA": "FusionAuth provides SSO, social logins, passwordless magic links, passkeys, and machine-to-machine authentication specifically for securing applications.",
      "toolB": "Vaultwarden documents MFA methods (FIDO2 WebAuthn, YubiKey, Duo) to protect the vault itself, not to authenticate users into third-party applications.",
      "whyItMatters": "Securing your own product's login flow requires a dedicated CIAM feature set that a password vault doesn't provide.",
      "benefitsWho": "Developers building customer-facing authentication flows need FusionAuth's SSO and passwordless features."
    },
    {
      "title": "Developer SDK Ecosystem",
      "toolA": "FusionAuth is API-first with webhooks and provides SDKs and quickstarts across .NET Core, Angular, Python, iOS, React, Java, Ruby, JavaScript, Vue, Flutter, Go, and PHP.",
      "toolB": "Vaultwarden's integration surface is Bitwarden Client API compatibility for existing official Bitwarden apps, not an SDK ecosystem for embedding auth into other applications.",
      "whyItMatters": "Teams integrating authentication into their own codebase need broad language and framework SDK support.",
      "benefitsWho": "Development teams building custom apps across multiple languages benefit from FusionAuth's SDK breadth."
    },
    {
      "title": "Support Tiers",
      "toolA": "FusionAuth documents business-day email support on the Essentials plan and 24/7 phone and email support plus a private Slack channel on the Enterprise plan.",
      "toolB": "Vaultwarden is an unofficial, community-built project with no documented official support tiers.",
      "whyItMatters": "Mission-critical authentication systems often need guaranteed vendor support SLAs, unlike a self-hosted community password vault.",
      "benefitsWho": "Enterprises requiring guaranteed support response times benefit from FusionAuth's Enterprise support tier."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Customer/application login and SSO",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Personal / team password vault",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Passwordless / passkey login for apps",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Bitwarden client compatibility",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Access Control & Security",
      "rows": [
        {
          "feature": "Role-based access control for applications",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Vaultwarden's Organizations feature governs vault sharing roles, not app authorization"
        },
        {
          "feature": "Machine-to-machine authentication",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "MFA to secure the tool itself",
          "toolA": "available",
          "toolB": "available",
          "note": "FusionAuth: MFA and passkeys; Vaultwarden: Authenticator, FIDO2 WebAuthn, YubiKey, Duo"
        },
        {
          "feature": "Emergency access to shared credentials",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Deployment",
      "rows": [
        {
          "feature": "Free self-hosted core",
          "toolA": "available",
          "toolB": "available",
          "note": "FusionAuth Community Edition; Vaultwarden AGPL-3.0"
        },
        {
          "feature": "Published paid cloud tiers",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "FusionAuth: $162/mo up to $2,970/mo+"
        },
        {
          "feature": "24/7 enterprise support",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are FusionAuth and Vaultwarden competitors?",
      "answer": "No, they serve different purposes — FusionAuth handles login and SSO for a company's own application, while Vaultwarden is a personal or team password manager for storing existing credentials."
    },
    {
      "question": "Is FusionAuth free?",
      "answer": "Yes, the Community Edition is free to self-host with core authentication features; paid cloud plans start at $162/month (Starter)."
    },
    {
      "question": "Is Vaultwarden free?",
      "answer": "Yes, Vaultwarden is free, open-source software licensed under AGPL-3.0, with no published pricing plans."
    },
    {
      "question": "Which tool should I use to add login to my app?",
      "answer": "FusionAuth is built for that — it provides SSO, social logins, magic links, passkeys, and machine-to-machine authentication with SDKs across many languages; Vaultwarden does not provide application login capabilities."
    },
    {
      "question": "Which tool should my team use to store shared passwords?",
      "answer": "Vaultwarden is built for that — it's a self-hosted, Bitwarden-compatible vault with Organizations, Send, and emergency access features; FusionAuth does not provide personal credential storage."
    },
    {
      "question": "How does pricing compare at scale?",
      "answer": "FusionAuth's cloud pricing scales from $162/month (Starter) up to Essentials and Enterprise plans starting at $2,970/month, while Vaultwarden has no published pricing since it is free, self-hosted software."
    }
  ]
};

export default fusionauthVsVaultwardenContent;

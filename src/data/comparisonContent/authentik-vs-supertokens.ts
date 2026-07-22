import type { ToolComparisonContent } from './types';

const authentikVsSupertokensContent: ToolComparisonContent = {
  "verdict": "Authentik and SuperTokens are both open-source identity platforms, but they target different deployment philosophies: Authentik is self-hosted only with broad protocol coverage (OIDC, SAML, LDAP, RADIUS, Kerberos) and a built-in remote access proxy, while SuperTokens offers both self-hosting and a managed cloud tier free under 5,000 monthly active users, with an emphasis on framework/SDK breadth. Neither is a blanket winner — the right choice depends on whether you need Authentik's protocol and infrastructure depth or SuperTokens' managed-cloud convenience and language coverage.",
  "bestForToolA": "Teams needing broad identity protocol support (SAML, LDAP, RADIUS, Kerberos) plus a built-in remote access proxy for internal infrastructure, fully self-hosted.",
  "bestForToolB": "Teams building an application who want a managed cloud identity option free under 5,000 monthly active users, with documented support for 25+ frameworks and languages including React, Angular, Vue, Python, Go, Android, Flutter, and iOS.",
  "whoNeedsBoth": "There isn't a realistic scenario for running both together — they compete directly as identity providers for the same authentication layer, so a team would evaluate and standardize on one rather than operate both in parallel.",
  "keyDifferences": [
    {
      "title": "Hosting Options",
      "toolA": "Authentik requires self-hosting for every tier, including Enterprise, with no official cloud-hosted option.",
      "toolB": "SuperTokens offers both self-hosting (free, unlimited MAU) and a managed cloud service free under 5,000 monthly active users.",
      "whyItMatters": "Teams without dedicated ops resources need a managed option, which only one of these tools documents.",
      "benefitsWho": "Small teams or startups wanting to avoid operating identity infrastructure themselves benefit from SuperTokens' managed cloud tier."
    },
    {
      "title": "Protocol Breadth",
      "toolA": "Authentik documents support for OAuth2/OIDC, SAML2, SCIM, LDAP, RADIUS, and Kerberos, plus a general application proxy.",
      "toolB": "SuperTokens' documented feature set centers on email/password, passwordless/magic-link login, social login, and SSO, without naming SAML, LDAP, or RADIUS support.",
      "whyItMatters": "Organizations needing legacy enterprise protocols like SAML or LDAP for federation with existing directory systems need that support confirmed.",
      "benefitsWho": "Enterprises with existing SAML/LDAP-based directories favor Authentik's broader protocol documentation."
    },
    {
      "title": "Pricing Above the Free Tier",
      "toolA": "Authentik Enterprise costs $5/user/month (internal) plus $0.02/external user/month, and Enterprise Plus starts at $20,000/year.",
      "toolB": "SuperTokens' core features are free at any scale when self-hosted; premium add-ons like MFA ($0.01/MAU) and account linking ($0.005/MAU) carry a $100/month minimum.",
      "whyItMatters": "The pricing models scale differently — per-user for Authentik versus per-monthly-active-user for SuperTokens add-ons — which affects cost at different user volumes.",
      "benefitsWho": "High-MAU, low-per-feature-need applications may find SuperTokens' add-on model more predictable; teams needing full protocol coverage from day one may prefer Authentik's flat per-user Enterprise pricing."
    },
    {
      "title": "Remote Access & Proxy Capabilities",
      "toolA": "Authentik provides web-based RDP, VNC, and SSH access plus a general application proxy as a named feature.",
      "toolB": "No equivalent remote access proxy capability is documented for SuperTokens.",
      "whyItMatters": "Teams wanting to use their identity provider to gate access to internal infrastructure (not just apps) need this proxy capability.",
      "benefitsWho": "IT/infrastructure teams securing internal admin tools and servers behind a proxy benefit from Authentik's built-in proxy."
    },
    {
      "title": "Framework & SDK Coverage",
      "toolA": "Authentik's documented differentiators are 30+ named enterprise service integrations (Google Workspace, Microsoft Entra, Slack, GitHub Enterprise, AWS, Grafana, Stripe, Salesforce) rather than a language/framework SDK list.",
      "toolB": "SuperTokens states it works with 25+ frameworks and languages, explicitly naming React, Angular, Vue, Python, Go, Android, Flutter, and iOS.",
      "whyItMatters": "Application developers embedding auth directly into a product need confirmed SDK support for their specific stack.",
      "benefitsWho": "Product engineering teams building auth into a mobile or web app across multiple languages benefit from SuperTokens' documented SDK breadth."
    }
  ],
  "featureMatrix": [
    {
      "group": "Authentication Protocols",
      "rows": [
        {
          "feature": "SAML support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "LDAP support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Passwordless / magic link login",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multi-factor authentication",
          "toolA": "available",
          "toolB": "available",
          "note": "SuperTokens MFA is a paid add-on, $0.01/MAU min $100/month"
        },
        {
          "feature": "Multi-tenancy",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SuperTokens: contact sales for full multi-tenancy"
        }
      ]
    },
    {
      "group": "Deployment & Hosting",
      "rows": [
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Managed cloud hosting",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Free under 5,000 MAU"
        },
        {
          "feature": "Free at unlimited scale (self-hosted)",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Enterprise & Compliance",
      "rows": [
        {
          "feature": "SOC 2 compliance",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Mentioned for the managed dashboard"
        },
        {
          "feature": "FIPS/FedRAMP compliance",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Authentik Enterprise Plus, from $20,000/year"
        },
        {
          "feature": "Remote access proxy (RDP/VNC/SSH)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Named enterprise service integrations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Authentik: 30+ services including Google Workspace, Salesforce"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Authentik and SuperTokens both free?",
      "answer": "Yes, both have free self-hosted options; SuperTokens also offers a free managed cloud tier under 5,000 monthly active users, while Authentik has no official cloud-hosted tier at any price."
    },
    {
      "question": "Does SuperTokens offer cloud hosting?",
      "answer": "Yes, SuperTokens' managed cloud service is free for under 5,000 monthly active users."
    },
    {
      "question": "Does Authentik offer cloud hosting?",
      "answer": "No, all Authentik tiers, including Enterprise, require self-hosting."
    },
    {
      "question": "Which supports more identity protocols?",
      "answer": "Authentik documents broader protocol coverage — OAuth2/OIDC, SAML2, SCIM, LDAP, RADIUS, and Kerberos — while SuperTokens' documented features center on email/password, passwordless, social login, and SSO without naming SAML or LDAP."
    },
    {
      "question": "How does pricing scale above the free tier?",
      "answer": "Authentik Enterprise costs $5/user/month (internal) plus $0.02/external user/month; SuperTokens' premium add-ons (MFA, account linking) are billed per monthly active user with a $100/month minimum."
    },
    {
      "question": "Which frameworks and languages are supported?",
      "answer": "SuperTokens states it works with 25+ frameworks including React, Angular, Vue, Python, Go, Android, Flutter, and iOS; Authentik's documentation instead lists 30+ named enterprise service integrations rather than an SDK framework list."
    }
  ]
};

export default authentikVsSupertokensContent;

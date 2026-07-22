import type { ToolComparisonContent } from './types';

const casdoorVsPropelauthContent: ToolComparisonContent = {
  "verdict": "Casdoor is a fully open-source, self-hostable identity platform with very broad protocol support (OAuth2, OIDC, SAML, CAS, LDAP, WebAuthn), 100+ built-in identity provider connectors, and a native MCP server for AI-agent management of the platform itself, at no license cost. PropelAuth is a managed B2B authentication SaaS with a Free plan (10,000 MAUs), prebuilt UI components, and MCP server authentication starting on its $150/month Growth plan. Casdoor suits engineering teams that want full self-hosted control and broad protocol coverage without licensing cost; PropelAuth suits teams that want a managed service with polished prebuilt components and predictable pricing.",
  "bestForToolA": "Engineering teams that want to self-host identity infrastructure at no license cost, need broad protocol coverage (OAuth2, OIDC, SAML, CAS, LDAP), or want AI coding assistants like Claude Desktop or Cursor to manage the identity platform itself via its native MCP server fit Casdoor.",
  "bestForToolB": "B2B SaaS teams that want a managed service with prebuilt UI components, self-service SAML/SSO setup, and MCP server authentication for their own AI-agent-facing product are better served by PropelAuth.",
  "whoNeedsBoth": "It's plausible for an engineering-heavy organization to self-host Casdoor for internal tools and infrastructure identity, leveraging its free licensing and broad protocol support, while using PropelAuth's managed B2B service for a customer-facing product where a polished prebuilt UI and fast implementation matter more than self-hosting control.",
  "keyDifferences": [
    {
      "title": "Deployment Model & Cost",
      "toolA": "Casdoor is fully open source and free to self-host with no license cost.",
      "toolB": "PropelAuth is a managed SaaS with a free tier (10,000 MAUs) but paid tiers starting at $150/month for Growth and $500/month for Growth Plus.",
      "whyItMatters": "Self-hosting eliminates recurring license fees but requires operational effort; managed SaaS trades ongoing cost for reduced operational burden.",
      "benefitsWho": "Casdoor benefits engineering teams with infrastructure capacity to self-host; PropelAuth benefits teams that prefer not to manage servers."
    },
    {
      "title": "Protocol Breadth",
      "toolA": "Casdoor documents very broad protocol support: OAuth 2.0, OIDC, SAML, CAS, LDAP, WebAuthn, and MFA, plus 100+ built-in identity provider connectors.",
      "toolB": "PropelAuth's documented protocols are SAML, OIDC, and SCIM.",
      "whyItMatters": "Organizations with legacy or diverse identity systems (e.g., LDAP-based corporate directories) need broader protocol coverage.",
      "benefitsWho": "Enterprises or platforms that must integrate with legacy identity protocols beyond SAML/OIDC."
    },
    {
      "title": "Built-In SaaS Billing",
      "toolA": "Casdoor includes built-in SaaS billing as a native feature: plans, pricing tiers, payment processing, and subscription management.",
      "toolB": "PropelAuth does not document a billing/payments feature.",
      "whyItMatters": "A native billing layer can reduce the need for a separate subscription management system.",
      "benefitsWho": "Teams building a SaaS product that wants billing and identity managed by one platform."
    },
    {
      "title": "AI-Agent Management Approach",
      "toolA": "Casdoor ships a native MCP server letting AI coding assistants (Claude Desktop, Cursor, VS Code Copilot) manage the Casdoor instance itself via natural language, plus OpenClaw for LLM agent protection with OpenTelemetry audit trails.",
      "toolB": "PropelAuth's MCP feature (Growth plan and above) provides OAuth 2.1 authentication and token revocation for MCP servers an app exposes, not for managing the identity platform itself.",
      "whyItMatters": "These are different use cases: managing the identity platform via AI versus securing an app's own AI-agent-facing MCP endpoints.",
      "benefitsWho": "Casdoor's approach benefits teams wanting AI-assisted administration; PropelAuth's benefits teams securing their own product's MCP servers."
    },
    {
      "title": "Prebuilt UI Components",
      "toolA": "Casdoor does not document a prebuilt UI component library; its focus is protocol and backend coverage.",
      "toolB": "PropelAuth ships a customizable component library for rapid deployment of auth screens.",
      "whyItMatters": "Prebuilt UI components speed up front-end integration for teams that don't want to build custom login screens.",
      "benefitsWho": "Product teams that want to ship auth screens quickly without custom UI work."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Free managed cloud tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "PropelAuth Free: 10,000 MAUs"
        },
        {
          "feature": "Published commercial pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "PropelAuth: $150/mo Growth, $500/mo Growth Plus"
        }
      ]
    },
    {
      "group": "Protocol & Identity Provider Coverage",
      "rows": [
        {
          "feature": "SAML SSO",
          "toolA": "available",
          "toolB": "available",
          "note": "PropelAuth offers self-service setup"
        },
        {
          "feature": "LDAP support",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "CAS protocol",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Built-in identity provider connectors",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Casdoor: 100+ connectors including Google, GitHub, WeChat"
        }
      ]
    },
    {
      "group": "AI-Agent Features & Developer Experience",
      "rows": [
        {
          "feature": "MCP server for managing the platform itself",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "MCP server authentication for an app's AI agents",
          "toolA": "limited",
          "toolB": "available",
          "note": "Casdoor via OAuth 2.1/DCR; PropelAuth on Growth plan+"
        },
        {
          "feature": "Prebuilt UI component library",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Built-in SaaS billing/payments",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Casdoor free while PropelAuth is not?",
      "answer": "Casdoor is fully open source and free to self-host with no license cost. PropelAuth has a free tier (10,000 MAUs) but paid plans starting at $150/month for features like unlimited SSO."
    },
    {
      "question": "Which supports more identity protocols?",
      "answer": "Casdoor documents broader protocol support, including OAuth2, OIDC, SAML, CAS, LDAP, and WebAuthn, plus 100+ identity provider connectors. PropelAuth documents SAML, OIDC, and SCIM."
    },
    {
      "question": "Do both platforms support MCP for AI agents?",
      "answer": "Both do, but differently. Casdoor's native MCP server lets AI assistants manage the Casdoor platform itself. PropelAuth's MCP feature (Growth plan+) authenticates MCP servers that an app exposes to its own AI agents."
    },
    {
      "question": "Which is easier to deploy without self-hosting?",
      "answer": "PropelAuth, as a managed SaaS with a free tier and published pricing. Casdoor requires self-hosting since no managed/commercial offering is documented."
    },
    {
      "question": "Does Casdoor include billing features?",
      "answer": "Yes, Casdoor includes built-in SaaS billing covering plans, pricing tiers, payment processing, and subscription management. PropelAuth does not document a billing feature."
    },
    {
      "question": "Who uses Casdoor in production?",
      "answer": "Casdoor lists notable users including Intel, VMware Harbor, Docker, Cisco, Microsoft, Alibaba, and Tencent."
    }
  ]
};

export default casdoorVsPropelauthContent;

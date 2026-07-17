import type { ToolComparisonContent } from './types';

const fronteggVsPropelauthContent: ToolComparisonContent = {
  "verdict": "Frontegg's free Pay-as-you-Go tier bundles 7,500 MAU with 5 enterprise SSO/SCIM connections and unlimited organizations, pricing beyond that via a usage-based calculator without published per-unit rates. PropelAuth's Free plan includes 10,000 MAUs with no SSO, but publishes fixed monthly prices for its Growth ($150/month, unlimited SAML/SSO, MCP authentication) and Growth Plus ($500/month, SCIM/directory sync) tiers. Frontegg suits teams that want SSO/SCIM usable immediately even on a free plan; PropelAuth suits teams that want predictable, published pricing and prebuilt UI components with a clear feature-to-price mapping.",
  "bestForToolA": "Teams that need enterprise SSO and SCIM connections working from the free tier onward, without waiting to upgrade, fit Frontegg's Pay-as-you-Go model.",
  "bestForToolB": "B2B SaaS teams that want published, predictable pricing and need MCP server authentication for AI-agent use cases are better served by PropelAuth's Growth plan and above.",
  "whoNeedsBoth": "As competing B2B authentication platforms, there's no architecture where an application would run both at once. A company evaluating vendors might use Frontegg for a product that needs free-tier SCIM immediately while choosing PropelAuth for a separate product built around MCP server authentication, but these would be two distinct deployments.",
  "keyDifferences": [
    {
      "title": "Free-Tier SSO/SCIM Access",
      "toolA": "Frontegg's free Pay-as-you-Go tier includes 5 enterprise SSO/SCIM connections alongside 7,500 MAU.",
      "toolB": "PropelAuth's Free plan includes 10,000 MAUs but no SSO; unlimited SAML/enterprise SSO only unlocks on the $150/month Growth plan.",
      "whyItMatters": "Teams onboarding enterprise pilot customers early need SSO available before committing to a paid plan.",
      "benefitsWho": "Early-stage B2B vendors trying to close enterprise pilot deals without upfront platform spend."
    },
    {
      "title": "SCIM/Directory Sync Pricing",
      "toolA": "SCIM connections are included starting on Frontegg's free tier (5 included).",
      "toolB": "PropelAuth gates SCIM/directory sync behind the $500/month Growth Plus plan, plus an additional $100 per SCIM connection.",
      "whyItMatters": "The cost of enabling automated enterprise directory provisioning differs substantially between the two.",
      "benefitsWho": "B2B vendors selling to enterprise customers that require SCIM as a contractual requirement."
    },
    {
      "title": "MCP / AI-Agent Authentication",
      "toolA": "Frontegg's AI-related offering is Agen.co, a separate agentic access layer for interacting with SaaS products via generative AI platforms.",
      "toolB": "PropelAuth has a dedicated MCP server authentication feature (OAuth 2.1 flows, token revocation) available on the Growth plan and above.",
      "whyItMatters": "MCP-specific authentication is a distinct capability from a general agentic access layer, and matters for products exposing MCP servers to AI agents.",
      "benefitsWho": "Teams building or exposing MCP servers that need scoped, revocable AI-agent authentication."
    },
    {
      "title": "Free Tier MAU",
      "toolA": "Frontegg's Pay-as-you-Go plan includes 7,500 MAU.",
      "toolB": "PropelAuth's Free plan includes 10,000 MAUs.",
      "whyItMatters": "A higher free MAU ceiling delays when a growing product needs to start paying.",
      "benefitsWho": "Early-stage products trying to control fixed costs while scaling users."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Frontegg relies on an interactive usage calculator for pricing beyond the free tier, without published per-unit rates.",
      "toolB": "PropelAuth publishes fixed monthly prices for Growth ($150) and Growth Plus ($500), with itemized overage fees: extra MAUs at $0.05/user, SCIM connections at $100 each, and audit log export at $50/connection.",
      "whyItMatters": "Published, itemized pricing makes it easier to forecast costs without a sales conversation.",
      "benefitsWho": "Budget-conscious teams that want to model costs before committing to a vendor."
    }
  ],
  "featureMatrix": [
    {
      "group": "Free Tier & Pricing",
      "rows": [
        {
          "feature": "Free plan MAU",
          "toolA": "available",
          "toolB": "available",
          "note": "Frontegg 7,500 MAU vs. PropelAuth 10,000 MAU"
        },
        {
          "feature": "SSO on free tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "PropelAuth SSO starts at $150/mo Growth plan"
        },
        {
          "feature": "Published flat pricing",
          "toolA": "limited",
          "toolB": "available",
          "note": "PropelAuth publishes $150/mo and $500/mo tiers; Frontegg uses a calculator"
        }
      ]
    },
    {
      "group": "Enterprise Identity Features",
      "rows": [
        {
          "feature": "SCIM/directory sync",
          "toolA": "available",
          "toolB": "available",
          "note": "Frontegg on free tier; PropelAuth requires $500/mo Growth Plus + $100/connection"
        },
        {
          "feature": "Self-service SSO setup",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "PropelAuth self-service SAML/OIDC/SCIM"
        },
        {
          "feature": "User impersonation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "PropelAuth Growth plan"
        },
        {
          "feature": "Advanced security options",
          "toolA": "available",
          "toolB": "available",
          "note": "Frontegg Enterprise tier; PropelAuth Growth Plus tier"
        }
      ]
    },
    {
      "group": "AI/Agent & Developer Tools",
      "rows": [
        {
          "feature": "MCP server authentication",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "PropelAuth Growth plan and above"
        },
        {
          "feature": "AI/agentic access layer",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Frontegg Agen.co"
        },
        {
          "feature": "API key authentication with rate limiting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Framework/SDK breadth",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "PropelAuth: React, Next.js, FastAPI, Flask, .NET, Spring Boot, Go, Remix, Axum, Laravel"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which includes enterprise SSO on its free tier?",
      "answer": "Frontegg does, with 5 enterprise SSO/SCIM connections included on its free Pay-as-you-Go tier. PropelAuth's Free plan has no SSO; it requires the $150/month Growth plan."
    },
    {
      "question": "How does SCIM pricing compare?",
      "answer": "Frontegg includes SCIM connections on its free tier. PropelAuth gates SCIM/directory sync behind its $500/month Growth Plus plan, plus $100 per SCIM connection."
    },
    {
      "question": "Which supports MCP server authentication for AI agents?",
      "answer": "PropelAuth has a dedicated MCP server authentication feature on its Growth plan and above. Frontegg's AI offering, Agen.co, is a separate agentic access layer rather than MCP-specific authentication."
    },
    {
      "question": "Which has more predictable pricing?",
      "answer": "PropelAuth publishes fixed monthly prices ($150 Growth, $500 Growth Plus) with itemized overage fees. Frontegg uses an interactive calculator without published per-unit rates."
    },
    {
      "question": "Which has a bigger free MAU allowance?",
      "answer": "PropelAuth's Free plan includes 10,000 MAUs, versus Frontegg's 7,500 MAU on its free Pay-as-you-Go tier."
    },
    {
      "question": "What frameworks does PropelAuth support?",
      "answer": "PropelAuth supports React, Next.js, FastAPI, Flask, .NET, Spring Boot, Remix, Axum, Go, Laravel, and others."
    }
  ]
};

export default fronteggVsPropelauthContent;

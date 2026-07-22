import type { ToolComparisonContent } from './types';

const corbadoVsStytchContent: ToolComparisonContent = {
  "verdict": "Stytch is a build-your-own identity platform providing passwordless authentication, SSO/SCIM, machine-to-machine and AI agent authentication, and fraud protection APIs, with a transparent free tier up to 10,000 monthly active users. Corbado is not a replacement identity provider at all — its Observe product is a non-invasive analytics layer that sits on top of an existing IDP (Okta, Auth0, Ping Identity, Cognito, Entra) to reconstruct login journeys and pinpoint where passkey adoption breaks down, while its Connect product adds managed passkeys. Teams choosing a core auth backend should look at Stytch; teams that already run an IDP and want visibility into why users abandon login flows should look at Corbado.",
  "bestForToolA": "Corbado fits teams already running Okta, Auth0, Ping Identity, Cognito, or Entra ID that want per-user login-journey debugging and passkey adoption analytics without migrating identity providers.",
  "bestForToolB": "Stytch fits teams building or replacing their core authentication layer, especially those needing passwordless methods, enterprise SSO/SCIM, and native machine-to-machine or AI agent authentication with a free tier to start.",
  "whoNeedsBoth": "A company running Stytch as its core authentication provider could still layer Corbado's Observe product on top to analyze passkey drop-off and login friction, since Corbado is explicitly designed to work alongside existing identity providers rather than replace them.",
  "keyDifferences": [
    {
      "title": "Product Category",
      "toolA": "Corbado is a non-invasive analytics and observability layer — Journey reconstruction, Friction detection, and Per-user debugging — that instruments an existing identity provider rather than replacing it.",
      "toolB": "Stytch is a full authentication backend with its own APIs, prebuilt UI components, sessions, and RBAC, meant to be the primary auth provider.",
      "whyItMatters": "It determines whether the tool becomes your primary auth provider or sits as an add-on analytics layer.",
      "benefitsWho": "Architecture and identity teams deciding where a new tool fits in the stack."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Corbado does not publish pricing; both the Observe and Connect plans require contacting sales for a custom quote.",
      "toolB": "Stytch publishes a Pay As You Go tier that's free up to 10,000 MAUs, with usage-based overages and $125 per additional SSO/SCIM connection beyond the 5 included free.",
      "whyItMatters": "Published pricing lets teams self-serve a budget estimate without a sales conversation.",
      "benefitsWho": "Budget-conscious startups and small teams evaluating options quickly."
    },
    {
      "title": "AI Agent / M2M Authentication",
      "toolA": "Corbado has no documented machine-to-machine or AI-agent authentication feature; it focuses on human passkey and login journeys.",
      "toolB": "Stytch offers explicit machine-to-machine authentication with 1,000 free M2M tokens per month, positioned for both humans and AI agents.",
      "whyItMatters": "Teams building agentic products need programmatic, service-to-service auth that human-login analytics tools don't provide.",
      "benefitsWho": "Engineering teams building AI agent or service-to-service products."
    },
    {
      "title": "Fraud & Bot Protection",
      "toolA": "Corbado does not document a fraud or bot detection feature; its focus is friction and adoption analytics, not security screening.",
      "toolB": "Stytch includes device fingerprinting (claimed 99.99% bot detection accuracy, 10,000 free fingerprints/month, then $0.005 each) plus intelligent rate limiting.",
      "whyItMatters": "Consumer-facing apps exposed to credential stuffing or bot signups need active fraud screening, not just analytics.",
      "benefitsWho": "Consumer-facing apps with meaningful fraud or bot exposure."
    },
    {
      "title": "IDP Compatibility Breadth",
      "toolA": "Corbado is explicitly compatible with 20+ CIAM systems including Okta, Auth0, Ping Identity, ForgeRock, Cognito, and Entra, working as a layer on top of them.",
      "toolB": "Stytch is itself an identity provider alternative, not designed to sit on top of another IDP.",
      "whyItMatters": "It determines whether adopting the tool requires an identity migration project or can be layered onto what's already deployed.",
      "benefitsWho": "Enterprises with an entrenched IDP that don't want a migration."
    }
  ],
  "featureMatrix": [
    {
      "group": "Authentication Methods",
      "rows": [
        {
          "feature": "Passwordless (passkeys/magic links/OTP)",
          "toolA": "limited",
          "toolB": "available",
          "note": "Corbado's Connect product offers managed passkeys; Stytch covers passkeys, magic links, and OTP natively."
        },
        {
          "feature": "SSO / SCIM provisioning",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Stytch includes first 5 SSO/SCIM connections free."
        },
        {
          "feature": "Machine-to-machine / AI agent auth",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "1,000 free M2M tokens/month on Stytch."
        },
        {
          "feature": "Fraud and bot protection",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "10,000 free fingerprints/month on Stytch."
        }
      ]
    },
    {
      "group": "Enterprise & Compliance",
      "rows": [
        {
          "feature": "ISO 27001 / SOC 2 certification",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Corbado is ISO 27001, SOC 2 Type II, and GDPR certified."
        },
        {
          "feature": "HIPAA / BAA compliance",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Available on Stytch's custom Enterprise plan."
        },
        {
          "feature": "Multi-tenancy / organization management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Stytch offers unlimited organizations even on the free tier."
        }
      ]
    },
    {
      "group": "Analytics & Visibility",
      "rows": [
        {
          "feature": "Login journey reconstruction",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Per-user auth debugging",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Published self-serve pricing",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Corbado replace Stytch or another identity provider?",
      "answer": "No. Corbado's Observe product works as a non-invasive layer on top of existing identity providers such as Okta, Auth0, Ping Identity, Cognito, and Entra, while its Connect product adds managed passkeys — it isn't designed to replace a full identity provider like Stytch."
    },
    {
      "question": "Is Stytch free to use?",
      "answer": "Yes. Stytch's Pay As You Go plan is free up to 10,000 monthly active users/AI agents, 5 SSO or SCIM connections, and 1,000 M2M tokens."
    },
    {
      "question": "Does either tool support AI agent authentication?",
      "answer": "Stytch does, via machine-to-machine authentication with 1,000 free M2M tokens per month. Corbado does not document an AI-agent or M2M authentication feature; it focuses on human passkey login journeys."
    },
    {
      "question": "Which tool has published pricing?",
      "answer": "Stytch publishes its Pay As You Go free tier and overage structure. Corbado does not publish pricing for either its Observe or Connect plans — both require contacting sales."
    },
    {
      "question": "Does Corbado offer passkeys itself?",
      "answer": "Yes, through its Connect product, which offers managed passkeys, while its Observe product analyzes login journeys and passkey adoption across an existing IDP."
    },
    {
      "question": "Which tool includes fraud or bot detection?",
      "answer": "Stytch, via device fingerprinting (claimed 99.99% bot detection accuracy) and intelligent rate limiting. Corbado does not document a fraud detection feature."
    }
  ]
};

export default corbadoVsStytchContent;

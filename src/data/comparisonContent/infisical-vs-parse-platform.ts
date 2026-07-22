import type { ToolComparisonContent } from './types';

const infisicalVsParsePlatformContent: ToolComparisonContent = {
  "verdict": "Infisical secures secrets, PKI certificates, and privileged access across infrastructure and AI agents, while Parse Platform is a backend-as-a-service framework for building applications with data storage, APIs, and push notifications. They serve adjacent but distinct roles in an app stack — one secures the credentials an app uses, the other provides the app's backend itself.",
  "bestForToolA": "Teams needing centralized secrets, PKI, and privileged access management with RBAC and dynamic secrets, especially those managing credentials for AI agents via Agent Vault.",
  "bestForToolB": "Developers building an app who need a free, self-hosted backend with auto-generated REST/GraphQL APIs, real-time Live Queries, push notifications, and built-in user authentication without building a server from scratch.",
  "whoNeedsBoth": "A team self-hosting a Parse Server backend would reasonably use Infisical to manage the database credentials, API keys, and push-notification certificates that Parse Server needs to run securely.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Centralizes secrets, PKI certificates, and privileged access with RBAC, approval workflows, and dynamic secret issuance.",
      "toolB": "Provides the actual application backend — auto-generated APIs, data storage, real-time queries, and user auth.",
      "whyItMatters": "This determines which layer of the stack each tool addresses.",
      "benefitsWho": "Architects deciding what infrastructure gap needs solving first."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Freemium — Free plan is free forever (5 identities, 3 projects, 3 environments, 10 integrations), Pro is $18/identity/month, Enterprise is custom.",
      "toolB": "No vendor pricing at all — its only \"plan\" is free, self-hosted, Apache-2.0 licensed open source.",
      "whyItMatters": "Infisical's paid tier scales cost with identity/agent count, while Parse Platform has zero vendor cost (only infrastructure hosting costs).",
      "benefitsWho": "Budget-conscious teams comparing recurring SaaS cost against pure self-hosting."
    },
    {
      "title": "Hosting Options",
      "toolA": "Offers both self-hosting and a managed cloud option.",
      "toolB": "Documents no official managed hosting from the project itself — deploy yourself to Docker, Heroku, AWS Elastic Beanstalk, Google App Engine, Azure, or DigitalOcean.",
      "whyItMatters": "Teams wanting to avoid ops overhead may prefer Infisical's cloud option, since Parse Platform requires running and maintaining your own Node.js and database infrastructure.",
      "benefitsWho": "Teams without dedicated infrastructure ops staff."
    },
    {
      "title": "AI-Specific Capabilities",
      "toolA": "Includes Agent Vault, giving AI agents scoped credential access without exposing secret values directly.",
      "toolB": "Its feature set (Cloud Code, Live Queries, push notifications) does not document AI-agent-specific access controls.",
      "whyItMatters": "Teams building AI-agent-integrated systems need to know which tool secures agent credentials.",
      "benefitsWho": "Teams building AI agents that need scoped, auditable access to secrets."
    },
    {
      "title": "Application Data Layer",
      "toolA": "Centers on secrets/PKI/PAM and does not document a general-purpose application database layer.",
      "toolB": "Supports both MongoDB (v6-8) and PostgreSQL (v15-18, with PostGIS) as the backing database, plus SDKs for major client platforms.",
      "whyItMatters": "Parse Platform is the choice when you need an actual app database and API, not just secrets storage.",
      "benefitsWho": "App developers who need a full backend rather than just credential management."
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing & Deployment",
      "rows": [
        {
          "feature": "Self-hosting available",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Managed cloud hosting",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "No official managed hosting documented for Parse"
        },
        {
          "feature": "Free-forever tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Infisical: 5 identities/3 projects/3 environments; Parse: fully free Apache-2.0"
        },
        {
          "feature": "Open source",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Secrets, Access & Security",
      "rows": [
        {
          "feature": "Secrets management (rotation, RBAC)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "PKI / certificate management",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Privileged access management (PAM)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Dynamic secrets",
          "toolA": "limited",
          "toolB": "unavailable",
          "note": "Infisical: Enterprise plan only"
        },
        {
          "feature": "Built-in application user authentication",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Sessions, email verification, password reset"
        }
      ]
    },
    {
      "group": "Application Backend Capabilities",
      "rows": [
        {
          "feature": "Auto-generated REST/GraphQL APIs",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Real-time data sync (Live Queries)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Push notifications (APNs/FCM)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Custom backend logic (Cloud Code)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Pluggable file storage",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Infisical and Parse Platform compete for the same use case?",
      "answer": "No — Infisical manages secrets, certificates, and access, while Parse Platform is a backend framework for building an app's data layer and APIs; many teams would use both together."
    },
    {
      "question": "Which tool is free?",
      "answer": "Parse Platform is entirely free and open source (Apache-2.0) with no vendor pricing plans at all. Infisical is freemium — its Free plan is also free forever (up to 5 identities, 3 projects, 3 environments), but scaling beyond that requires the $18/identity/month Pro plan."
    },
    {
      "question": "Does either tool offer managed hosting?",
      "answer": "Infisical offers a managed cloud option in addition to self-hosting. Parse Platform documents no official managed hosting — you must deploy it yourself to Docker, Heroku, AWS Elastic Beanstalk, Google App Engine, Azure, or DigitalOcean."
    },
    {
      "question": "Can Parse Platform manage secrets like Infisical?",
      "answer": "No — Parse Platform's documented features center on APIs, real-time queries, Cloud Code, push notifications, and user authentication, not secrets, PKI, or PAM management."
    },
    {
      "question": "Does Infisical support AI agent workflows?",
      "answer": "Yes — Infisical's Agent Vault feature gives AI agents scoped access to credentials without exposing the underlying secret values."
    },
    {
      "question": "What databases can Parse Platform run on?",
      "answer": "MongoDB (versions 6-8) or PostgreSQL (versions 15-18, with PostGIS support)."
    }
  ]
};

export default infisicalVsParsePlatformContent;

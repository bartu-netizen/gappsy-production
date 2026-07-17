import type { ToolComparisonContent } from './types';

const dopplerVsInfisicalContent: ToolComparisonContent = {
  "verdict": "Doppler and Infisical both offer free tiers and AI-agent credential access, but they differ in scope and pricing model: Doppler is a hosted, per-user-priced secrets sync tool with deep native cloud/CI-CD integrations, while Infisical is open-source, self-hostable even on its free tier, priced per identity, and bundles PKI certificate management and privileged access management alongside secrets.",
  "bestForToolA": "Teams standardizing on a hosted, per-user-priced secrets manager with native syncs into Vercel, Heroku, AWS Secrets Manager, GitHub Actions, and Kubernetes.",
  "bestForToolB": "Teams that want self-hosting available even on the free tier, need PKI/certificate management or privileged access management alongside secrets, and have many machine or AI identities that make per-identity pricing more predictable than per-user pricing.",
  "whoNeedsBoth": "Platform teams that use Doppler to sync secrets into existing CI/CD and cloud deployment targets while relying on Infisical's PKI and privileged-access-management features for certificate lifecycle and short-lived access sessions that Doppler doesn't offer.",
  "keyDifferences": [
    {
      "title": "Product scope beyond secrets",
      "toolA": "Focused on centralized secrets storage, syncing, and rotation across infrastructure, CI/CD, and AI agents.",
      "toolB": "Combines secrets management with certificate/PKI management (issuance, renewal, revocation) and privileged access management with session recording and AI-generated summaries.",
      "whyItMatters": "Teams needing certificate lifecycle management or short-lived privileged access sessions get it natively with Infisical, whereas Doppler would require a separate tool.",
      "benefitsWho": "Security and platform teams managing certificates and privileged access alongside secrets."
    },
    {
      "title": "Open source and self-hosting availability",
      "toolA": "Not stated as open source; on-premise or cloud deployment is mentioned only as an Enterprise-tier feature.",
      "toolB": "Open source with a self-hosting option available on every tier, including the Free plan.",
      "whyItMatters": "Teams wanting infrastructure control without an enterprise contract can self-host from day one with Infisical.",
      "benefitsWho": "Teams with data-residency requirements or that want to avoid vendor lock-in early."
    },
    {
      "title": "Pricing unit",
      "toolA": "Priced per user: free for up to 3 users, then $8/user/month (Developer) or $21/user/month (Team).",
      "toolB": "Priced per identity on the Pro plan at $18/identity/month.",
      "whyItMatters": "Teams provisioning many machine or AI identities (rather than human users) may find per-identity pricing scales differently than per-user pricing.",
      "benefitsWho": "Teams with a high ratio of automated/service identities to human users."
    },
    {
      "title": "AI agent credential access mechanism",
      "toolA": "Provides an MCP server and OIDC-scoped service accounts so AI agents can request secrets without embedding credentials in code.",
      "toolB": "Provides Agent Vault, which gives AI agents access to credentials they need without exposing the underlying secret values directly to the agent.",
      "whyItMatters": "Both solve the AI-agent secret-access problem but via different mechanisms — scoped service accounts versus value-obscuring vault access.",
      "benefitsWho": "Teams building AI-agent workflows that need to control what credentials the agent can see."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Features",
      "rows": [
        {
          "feature": "Secrets storage and rotation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Dynamic secrets",
          "toolA": "limited",
          "toolB": "limited",
          "note": "Both list this as a general feature but only include it explicitly at the Enterprise pricing tier."
        },
        {
          "feature": "PKI / certificate management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Privileged access management (PAM)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Access",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Self-hosting on the free tier",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SAML SSO",
          "toolA": "available",
          "toolB": "available",
          "note": "Doppler includes it on Team ($21/user/month); Infisical on Pro ($18/identity/month)."
        }
      ]
    },
    {
      "group": "AI Agent Integration",
      "rows": [
        {
          "feature": "AI agent credential access",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Doppler have a free plan?",
      "answer": "Yes, the Developer plan is free for up to 3 users, with additional users billed at $8/month each."
    },
    {
      "question": "Does Doppler support AI agents?",
      "answer": "Yes, Doppler provides an MCP server and OIDC-scoped service accounts so AI agents can request secrets without embedding credentials in code."
    },
    {
      "question": "What compliance certifications does Doppler have?",
      "answer": "Doppler is SOC 2 and ISO 27001 compliant, with complete audit logging of secret access."
    },
    {
      "question": "Does Infisical have a free plan?",
      "answer": "Yes, the Free plan is free forever and includes up to 5 identities, 3 projects, and 3 environments."
    },
    {
      "question": "Is Infisical open source?",
      "answer": "Yes, Infisical is an open-source project that also offers self-hosting."
    },
    {
      "question": "Does Infisical support AI agent credential access?",
      "answer": "Yes, through Agent Vault, which lets AI agents use credentials without exposing the secret values directly."
    }
  ]
};

export default dopplerVsInfisicalContent;

import type { ToolComparisonContent } from './types';

const akeylessVsHashicorpVaultContent: ToolComparisonContent = {
  "verdict": "Both are secrets management platforms, but they start from different deployment philosophies. Akeyless is SaaS-first, using patented Distributed Fragments Cryptography and offering a quota-limited Free plan alongside a custom Enterprise tier. HashiCorp Vault is open-source-first, with a fully free, self-hostable Community edition, an Enterprise tier requiring a paid license, and HCP Vault Dedicated as a separate cloud-hosted managed option with a free trial. The choice often comes down to whether a team wants to self-host or consume secrets management as a service.",
  "bestForToolA": "Teams that want a managed SaaS secrets platform out of the box, need built-in multi-cloud KMS and privileged access management (PAM), or are building AI agent workflows and want SecretlessAI to keep secrets out of agent context.",
  "bestForToolB": "Teams that want a free, fully self-hostable open-source secrets platform (Vault Community), with the option to later use HCP Vault Dedicated's managed cloud offering (free trial available) or Vault Enterprise for features like the Transform Secrets Engine.",
  "whoNeedsBoth": "These largely compete for the same job as primary secrets stores, so most teams pick one rather than running both in parallel; the main joint scenario is a multi-cloud or vendor-diversification strategy where different business units standardize on different vaults during a merger or migration, rather than a genuine complementary integration.",
  "keyDifferences": [
    {
      "title": "Deployment Philosophy",
      "toolA": "Akeyless is a SaaS platform by design, using patented Distributed Fragments Cryptography that fragments cryptographic keys across regions.",
      "toolB": "HashiCorp Vault's Community edition is free, open-source, and self-hosted, with HCP Vault Dedicated available separately as a managed cloud option offering a free trial.",
      "whyItMatters": "Self-hosting versus SaaS affects operational overhead, data residency control, and how quickly a team can get started.",
      "benefitsWho": "Teams wanting to avoid infrastructure management benefit from Akeyless's SaaS-first model; teams wanting full control or needing to self-host for compliance reasons benefit from Vault Community."
    },
    {
      "title": "Free Tier Structure",
      "toolA": "Akeyless's Free plan has documented quotas: up to 5 clients, 500 static secrets, 5 dynamic secrets, 5 rotated secrets, 3 targets, and 3-day audit log retention.",
      "toolB": "Vault Community is free and open source without documented client or secret count caps, since it runs on infrastructure the user controls, though it lacks the Enterprise-only Transform Secrets Engine (tokenization).",
      "whyItMatters": "Quota-limited SaaS free tiers cap usage explicitly, while self-hosted free tiers are typically limited by infrastructure and missing enterprise-only features instead.",
      "benefitsWho": "Small teams testing with low secret volumes fit Akeyless's Free plan; teams needing scale without vendor quota limits fit self-hosted Vault Community."
    },
    {
      "title": "Cryptographic Architecture",
      "toolA": "Akeyless uses patented Distributed Fragments Cryptography, fragmenting keys across regions so no single location holds a complete key.",
      "toolB": "Vault provides encryption as a service through its Transit Secrets Engine but does not document a fragmented-key architecture.",
      "whyItMatters": "Fragmented key architectures can reduce single-point-of-compromise risk for the cryptographic material itself.",
      "benefitsWho": "Security architects evaluating key-compromise resilience may weigh Akeyless's fragmentation approach specifically."
    },
    {
      "title": "AI Agent Secret Protection",
      "toolA": "Akeyless offers SecretlessAI, a dedicated feature that keeps secrets out of AI agent context while validating agent actions at runtime via Agentic Runtime Authority.",
      "toolB": "Vault documents general identity-based access control for humans, machines, and AI agents, but no dedicated SecretlessAI-equivalent product feature.",
      "whyItMatters": "As AI agents increasingly need credentialed access, a purpose-built control layer reduces the risk of secrets leaking into model context.",
      "benefitsWho": "Teams deploying autonomous AI agents that need runtime-validated, context-free credential access benefit from Akeyless's SecretlessAI."
    },
    {
      "title": "Published Compliance Certifications",
      "toolA": "Akeyless documents ISO 27001, PCI-DSS, FIPS 140-3, GDPR, DORA, AICPA, and CSA STAR Level One certifications.",
      "toolB": "Formal product compliance certifications are not documented in Vault's public facts; Vault instead offers personnel certification programs (Vault Associate, Vault Operations Professional).",
      "whyItMatters": "Regulated buyers often need documented product-level compliance attestations during procurement, distinct from staff training certifications.",
      "benefitsWho": "Compliance-driven buyers evaluating documented certifications directly benefit from Akeyless's published list."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment Model",
      "rows": [
        {
          "feature": "Free, self-hostable open-source edition",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Vault Community edition"
        },
        {
          "feature": "Managed cloud SaaS option",
          "toolA": "available",
          "toolB": "available",
          "note": "Akeyless core is SaaS; HCP Vault Dedicated is Vault's managed cloud option"
        },
        {
          "feature": "Free trial for managed cloud",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "HCP Vault Dedicated"
        }
      ]
    },
    {
      "group": "Secrets & Key Management Capabilities",
      "rows": [
        {
          "feature": "Dynamic database credentials",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Encryption as a service",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Vault Transit Secrets Engine"
        },
        {
          "feature": "Tokenization",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Vault Transform Secrets Engine, Enterprise-only"
        },
        {
          "feature": "Multi-cloud key management (KMS)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Certificate lifecycle management",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Privileged access management (PAM)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI, Compliance & Pricing",
      "rows": [
        {
          "feature": "AI agent-specific secret protection",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Akeyless SecretlessAI"
        },
        {
          "feature": "Published product compliance certifications",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Published free-tier usage quotas",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Akeyless: 5 clients / 500 static secrets / 3-day audit log"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is HashiCorp Vault free?",
      "answer": "Yes, Vault Community edition is free and open source; Vault Enterprise requires a valid paid license, and HCP Vault Dedicated offers a free trial."
    },
    {
      "question": "Is Akeyless free?",
      "answer": "Yes, Akeyless offers a Free plan, though with limited quotas such as up to 5 clients, 500 static secrets, and 3-day audit log retention."
    },
    {
      "question": "Which one has a free self-hosted option?",
      "answer": "HashiCorp Vault's Community edition is free and open source for self-hosting; Akeyless's Free plan is SaaS-based rather than self-hosted, per the documented facts."
    },
    {
      "question": "Do both support dynamic secrets?",
      "answer": "Yes, Akeyless's Free plan includes dynamic secrets (up to 5), and Vault has a dedicated Database Secrets Engine that generates short-lived database credentials dynamically."
    },
    {
      "question": "Which has more documented compliance certifications?",
      "answer": "Akeyless documents a longer list, including ISO 27001, PCI-DSS, FIPS 140-3, GDPR, and DORA; formal product compliance certifications are not documented for Vault in the available facts."
    },
    {
      "question": "Do both handle AI agent security?",
      "answer": "Akeyless has a dedicated SecretlessAI feature for keeping secrets out of AI agent context; Vault documents identity-based access control that mentions AI agents generally but without a dedicated equivalent feature."
    }
  ]
};

export default akeylessVsHashicorpVaultContent;

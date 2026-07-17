import type { ToolComparisonContent } from './types';

const hashicorpVaultVsVaultwardenContent: ToolComparisonContent = {
  "verdict": "Despite the similar name, these solve different problems. HashiCorp Vault manages machine and application secrets — API keys, database credentials, encryption keys, and certificates — accessed via UI, CLI, or HTTP API. Vaultwarden is a free, open-source Rust server that implements the Bitwarden Client API, letting official Bitwarden mobile, desktop, and browser apps connect to a self-hosted backend for personal and team password management. One is infrastructure plumbing for developers and services; the other is a consumer-style password manager for humans.",
  "bestForToolA": "Platform and DevOps teams that need to dynamically generate short-lived database credentials, provide encryption as a service via the Transit Secrets Engine, or manage certificates for applications and services.",
  "bestForToolB": "Individuals, families, or small teams who want a self-hosted, Bitwarden-compatible password vault with Send for secure file/text sharing, organizations with member roles, and MFA options including FIDO2 WebAuthn and YubiKey.",
  "whoNeedsBoth": "A realistic pairing: an engineering organization uses HashiCorp Vault to manage application and infrastructure secrets like API keys and database credentials, while its employees separately use Vaultwarden as their personal or team password manager for logging into SaaS tools and internal accounts — different secret types serving humans versus machines.",
  "keyDifferences": [
    {
      "title": "Primary Purpose",
      "toolA": "Vault secures, stores, and tightly controls access to tokens, passwords, certificates, and encryption keys for applications and infrastructure.",
      "toolB": "Vaultwarden is a self-hosted server implementing the Bitwarden Client API for personal vault management, designed for humans storing and sharing their own passwords.",
      "whyItMatters": "Machine/application secrets and human login credentials have different lifecycle, rotation, and access patterns.",
      "benefitsWho": "DevOps/platform teams need Vault's application secrets management; end users and IT teams managing employee logins need Vaultwarden."
    },
    {
      "title": "Client Experience",
      "toolA": "Vault is accessed via UI, CLI, or HTTP API, built for developers and operators integrating secrets into pipelines and applications.",
      "toolB": "Vaultwarden is compatible with official Bitwarden mobile, desktop, and browser clients, giving end users a consumer-familiar password manager interface.",
      "whyItMatters": "Non-technical end users need a polished client app, while developers need programmatic API access integrated into automation.",
      "benefitsWho": "General employees benefit from Vaultwarden's Bitwarden client compatibility; engineers automating secret retrieval benefit from Vault's API-first design."
    },
    {
      "title": "Dynamic Secret Generation",
      "toolA": "Vault's Database Secrets Engine dynamically generates short-lived database credentials on demand.",
      "toolB": "Not documented as a Vaultwarden capability; Vaultwarden stores static personal and organizational vault items rather than generating dynamic credentials.",
      "whyItMatters": "Short-lived, dynamically generated credentials reduce the blast radius of a leaked secret compared to long-lived static passwords.",
      "benefitsWho": "Teams securing database access for applications benefit from Vault's dynamic secrets engine."
    },
    {
      "title": "Multi-Factor Authentication Methods",
      "toolA": "Vault documents policy-driven, identity-based access control for humans, machines, and AI agents, without listing specific consumer MFA methods.",
      "toolB": "Vaultwarden documents specific MFA methods: Authenticator apps, Email, FIDO2 WebAuthn, YubiKey, and Duo.",
      "whyItMatters": "Password managers need concrete, user-facing MFA options that everyday employees can set up on their own accounts.",
      "benefitsWho": "Security-conscious individuals and IT admins configuring employee vault security benefit from Vaultwarden's documented MFA method list."
    },
    {
      "title": "Official Support and Enterprise Tier",
      "toolA": "Vault Community is HashiCorp's official open-source project, with Vault Enterprise available under a paid license and Vault Associate/Operations Professional certification programs.",
      "toolB": "Vaultwarden is an unofficial, community-built project not affiliated with or officially supported by Bitwarden Inc., with no documented enterprise support tier.",
      "whyItMatters": "Organizations with compliance or vendor-support requirements need to know whether official commercial support exists.",
      "benefitsWho": "Enterprises needing vendor-backed support and certification paths benefit from Vault's official Enterprise tier; hobbyists and small teams comfortable with community support benefit from Vaultwarden."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Machine / application secrets management",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Personal / team password vault",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Bitwarden client app compatibility",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Encryption as a service for applications",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Vault Transit Secrets Engine"
        }
      ]
    },
    {
      "group": "Access & Sharing",
      "rows": [
        {
          "feature": "Secure item/file sharing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Vaultwarden Send"
        },
        {
          "feature": "Organizations with roles and groups",
          "toolA": "available",
          "toolB": "available",
          "note": "Vault via identity-based access control; Vaultwarden via Organizations feature"
        },
        {
          "feature": "Emergency access to shared items",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Documented MFA methods",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Authenticator, FIDO2 WebAuthn, YubiKey, Duo, Email"
        }
      ]
    },
    {
      "group": "Deployment & Licensing",
      "rows": [
        {
          "feature": "Free open-source core",
          "toolA": "available",
          "toolB": "available",
          "note": "Vaultwarden is AGPL-3.0"
        },
        {
          "feature": "Official vendor Enterprise tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Vaultwarden is unofficial, not affiliated with Bitwarden Inc."
        },
        {
          "feature": "Managed cloud-hosted option",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "HCP Vault Dedicated with free trial"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Vaultwarden the same as HashiCorp Vault?",
      "answer": "No, despite the similar name, they are unrelated products — Vault manages machine and application secrets, while Vaultwarden is a self-hosted, Bitwarden-compatible personal password manager."
    },
    {
      "question": "Is Vaultwarden official Bitwarden software?",
      "answer": "No, Vaultwarden is an unofficial, community-built alternative server implementation of the Bitwarden Client API, compatible with official Bitwarden clients but not affiliated with Bitwarden Inc."
    },
    {
      "question": "Can I use Vault to store my personal passwords?",
      "answer": "Vault is documented as securing tokens, passwords, certificates, and encryption keys for applications and infrastructure via UI, CLI, or API; it is not documented as offering a consumer password-manager client experience the way Vaultwarden does."
    },
    {
      "question": "Does HashiCorp Vault have an official managed cloud option?",
      "answer": "Yes, HCP Vault Dedicated is referenced as offering a free trial as a cloud-hosted, managed option; Vaultwarden has no documented managed cloud offering."
    },
    {
      "question": "Are both free to use?",
      "answer": "Yes, Vault Community edition is free and open source, and Vaultwarden is free and open source under the AGPL-3.0 license."
    },
    {
      "question": "What MFA options does Vaultwarden support?",
      "answer": "Vaultwarden supports Authenticator apps, Email, FIDO2 WebAuthn, YubiKey, and Duo for multi-factor authentication."
    }
  ]
};

export default hashicorpVaultVsVaultwardenContent;

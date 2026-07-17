import type { ToolComparisonContent } from './types';

const autheliaVsOpenarchiverContent: ToolComparisonContent = {
  "verdict": "Authelia and openarchiver solve unrelated problems in a self-hosted infrastructure stack: Authelia is an open-source authentication and authorization server that sits behind a reverse proxy to provide SSO and MFA for other self-hosted apps, while openarchiver is an open-source email archiving platform that connects to Microsoft 365, Google Workspace, or IMAP (or imports PST/EML files) for backup, compliance, and eDiscovery. Neither is a substitute for the other — one gates who can log in, the other retains and searches email records.",
  "bestForToolA": "Teams running multiple self-hosted web apps behind a reverse proxy who want centralized SSO and MFA (Passkeys, WebAuthn, OTP, push notifications) without a commercial identity provider.",
  "bestForToolB": "Organizations that need to archive Microsoft 365, Google Workspace, or IMAP mailboxes, or import legacy PST/EML files, for compliance and eDiscovery with full-text search, on their own infrastructure.",
  "whoNeedsBoth": "A self-hosted IT environment could deploy Authelia to gate SSO/MFA access to internal admin tools, including openarchiver's own web interface, while running openarchiver behind it to archive company email for compliance.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Authelia is an authentication and authorization server providing SSO and MFA for self-hosted apps.",
      "toolB": "openarchiver is an email archiving platform for backup, compliance, and eDiscovery with full-text search.",
      "whyItMatters": "The two tools address entirely different security and compliance requirements.",
      "benefitsWho": "Security engineers evaluating access control versus compliance/records teams evaluating retention."
    },
    {
      "title": "Deployment Model",
      "toolA": "Authelia requires a reverse proxy to function and ships as a container image under 20MB with typical memory usage under 30MB.",
      "toolB": "openarchiver connects directly to mail platforms via connectors and PST/EML import rather than sitting in front of a reverse proxy.",
      "whyItMatters": "Architecture requirements differ significantly for what has to be in place before deployment.",
      "benefitsWho": "Infra teams planning what else needs to exist in the stack before rollout."
    },
    {
      "title": "Licensing & Cost Transparency",
      "toolA": "Authelia is fully free and open source under Apache 2.0, with a single free plan and no paid tier.",
      "toolB": "openarchiver is listed with a Freemium pricing model and described as a free email archiver, but Gappsy's data doesn't document a specific paid tier or starting price for it.",
      "whyItMatters": "Buyers comparing budgets need clarity on what's actually free versus what unlocks behind payment.",
      "benefitsWho": "Budget-conscious IT teams comparing a fully free tool against a freemium one with an undocumented paid tier."
    },
    {
      "title": "Authentication Methods vs Mail Connectors",
      "toolA": "Authelia supports Passkeys, one-time passwords, mobile push notifications, and WebAuthn, and operates as an OpenID Certified provider.",
      "toolB": "openarchiver connects to Microsoft 365, Google Workspace, and generic IMAP servers, plus PST and EML file import for historical archives.",
      "whyItMatters": "Each tool's usefulness hinges on the specific protocols or platforms it integrates with.",
      "benefitsWho": "Teams needing specific modern auth methods versus teams needing specific mailbox platform coverage."
    },
    {
      "title": "Compliance Role",
      "toolA": "Authelia's compliance value is access governance and audit, enforced through MFA and granular authorization policies.",
      "toolB": "openarchiver is explicitly built for email backup, compliance, and eDiscovery, retaining searchable records rather than governing access.",
      "whyItMatters": "Only one of the two tools actually retains searchable records for legal or regulatory review.",
      "benefitsWho": "Legal/compliance teams needing eDiscovery versus security teams needing access governance."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment & Licensing",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Open-source license documented",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Authelia: Apache 2.0"
        },
        {
          "feature": "Reverse proxy required",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Authelia is a companion to a reverse proxy, not standalone"
        },
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Kubernetes support",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Core Capability",
      "rows": [
        {
          "feature": "SSO / MFA",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Email archiving",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Full-text search of records",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Granular authorization policies",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "PST/EML import",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Integration & Access",
      "rows": [
        {
          "feature": "Microsoft 365 connector",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Passkey / WebAuthn login",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "OpenID Connect certified provider",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "IMAP connector",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can Authelia and openarchiver be used together?",
      "answer": "Yes. Since they serve different layers of a self-hosted stack, some teams use Authelia to gate access to admin tools such as openarchiver's web interface, while using openarchiver itself to archive email."
    },
    {
      "question": "Is openarchiver free like Authelia?",
      "answer": "Authelia is fully free and open source under Apache 2.0 with a single free plan. openarchiver is listed as Freemium and described as a free email archiver, but Gappsy's data doesn't document a specific paid tier or starting price."
    },
    {
      "question": "Does Authelia archive email?",
      "answer": "No. Authelia is an authentication and authorization server for SSO and MFA; it has no email archiving, connector, or import functionality."
    },
    {
      "question": "Does openarchiver handle login or SSO for other apps?",
      "answer": "No. openarchiver's documented features are Microsoft 365, Google Workspace, and IMAP connectors plus PST/EML import for archiving; it is not an identity provider."
    },
    {
      "question": "What authentication methods does Authelia support?",
      "answer": "Passkeys, one-time passwords, mobile push notifications, and WebAuthn, alongside OpenID Connect 1.0 certified provider support."
    },
    {
      "question": "Which email platforms does openarchiver connect to?",
      "answer": "Microsoft 365 and Google Workspace directly, plus generic IMAP servers and PST/EML file imports for historical archives."
    }
  ]
};

export default autheliaVsOpenarchiverContent;

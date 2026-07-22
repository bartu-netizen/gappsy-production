import type { ToolComparisonContent } from './types';

const boundaryVsOpenarchiverContent: ToolComparisonContent = {
  "verdict": "Boundary and Open Archiver are both open-source, self-hostable infrastructure tools, but they solve unrelated problems. Boundary is HashiCorp's identity-based access management tool for securely connecting users and applications to infrastructure without exposing credentials or networks. Open Archiver is an email archiving platform for backup, compliance, and eDiscovery, connecting to Microsoft 365, Google Workspace, and IMAP mailboxes. Neither substitutes for the other; the comparison is useful mainly for teams evaluating self-hosted, open-source infrastructure tooling broadly.",
  "bestForToolA": "Security and infrastructure teams that need identity-based, VPN-less access to servers and systems, particularly those already managing infrastructure as code with Terraform.",
  "bestForToolB": "IT and compliance teams that need to archive and full-text search Microsoft 365, Google Workspace, or IMAP mailboxes for backup, legal hold, and eDiscovery purposes, including importing historical PST and EML files.",
  "whoNeedsBoth": "A security-conscious organization could deploy Boundary to control identity-based access to its self-hosted servers, including the server running Open Archiver, while relying on Open Archiver itself to meet email retention and eDiscovery obligations; Boundary secures the access layer around whatever infrastructure an organization runs, which can include an email archive.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Boundary provides identity-based access management, enabling privileged sessions to infrastructure based on user and application identity without exposing networks or credentials.",
      "toolB": "Open Archiver captures, stores, and indexes email for backup, compliance, and eDiscovery, with full-text search across archived messages.",
      "whyItMatters": "These solve entirely different problems: controlling who can reach infrastructure versus retaining and searching historical records.",
      "benefitsWho": "Security/DevOps teams need Boundary; IT and legal/compliance teams need Open Archiver."
    },
    {
      "title": "Data Source Connections",
      "toolA": "Boundary connects to infrastructure resources (hosts) via automated service discovery; it does not connect to email platforms.",
      "toolB": "Open Archiver connects directly to Microsoft 365, Google Workspace, and generic IMAP servers, plus supports PST and EML file import for historical archives.",
      "whyItMatters": "Buyers need the tool that actually connects to the systems they're trying to secure or archive.",
      "benefitsWho": "Organizations with Microsoft 365 or Google Workspace mailboxes needing archiving; organizations with servers and infrastructure needing access control."
    },
    {
      "title": "Deployment Model",
      "toolA": "Boundary offers a self-managed Community edition plus a managed HCP Boundary option with a free trial; pricing beyond the trial is not published.",
      "toolB": "Open Archiver is a self-hosted platform under a freemium pricing model, with no starting price or managed hosting plans documented.",
      "whyItMatters": "Understanding whether a managed option exists, and its cost, affects operational overhead decisions.",
      "benefitsWho": "Teams weighing self-managed versus managed-cloud deployment for either access control or email archiving."
    },
    {
      "title": "Auditability",
      "toolA": "Boundary provides session auditing with visibility into session metrics, events, logs, and traces, exportable to monitoring tools.",
      "toolB": "Open Archiver provides full-text search across archived email specifically for compliance and eDiscovery use cases.",
      "whyItMatters": "Both support audit-related use cases, but for entirely different record types: access events versus email content.",
      "benefitsWho": "Security teams building access audit trails need Boundary; legal and compliance teams responding to discovery requests need Open Archiver."
    },
    {
      "title": "Infrastructure-as-Code Support",
      "toolA": "Boundary has full Terraform provider support, letting teams define access policies and configuration as code.",
      "toolB": "Open Archiver does not document Terraform or infrastructure-as-code support.",
      "whyItMatters": "Terraform integration matters to teams that manage all infrastructure configuration declaratively.",
      "benefitsWho": "DevOps teams standardized on Terraform for provisioning and policy management."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Function",
      "rows": [
        {
          "feature": "Identity-based infrastructure access",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Email archiving and backup",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "SSH credential injection",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Full-text search of archived content",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Data Sources",
      "rows": [
        {
          "feature": "Free self-hosted edition",
          "toolA": "available",
          "toolB": "available",
          "note": "Boundary Community; Open Archiver self-hosted"
        },
        {
          "feature": "Managed/cloud option",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "HCP Boundary offers a free trial; pricing beyond that unpublished"
        },
        {
          "feature": "Microsoft 365 / Google Workspace connectors",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "PST/EML historical import",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Terraform provider support",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Compliance & Auditing",
      "rows": [
        {
          "feature": "Session auditing (logs, metrics, traces)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "eDiscovery / compliance archiving",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Export to monitoring tools",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Boundary and Open Archiver solve the same problem?",
      "answer": "No. Boundary is an identity-based access management tool for securely reaching infrastructure, while Open Archiver is an email archiving platform for backup, compliance, and eDiscovery. They are not substitutes for each other."
    },
    {
      "question": "Can Boundary archive emails?",
      "answer": "No, this is not a documented capability of Boundary; its features are focused on identity-based sessions, service discovery, and SSH credential injection for infrastructure access."
    },
    {
      "question": "Can Open Archiver manage infrastructure access?",
      "answer": "No, Open Archiver's documented features are limited to email connectors (Microsoft 365, Google Workspace, IMAP) and PST/EML import for archiving purposes."
    },
    {
      "question": "Is either tool free to self-host?",
      "answer": "Yes, both offer free self-hosted options: Boundary has a self-managed Community edition, and Open Archiver is self-hosted under a freemium pricing model."
    },
    {
      "question": "Does Open Archiver connect to Microsoft 365?",
      "answer": "Yes, along with Google Workspace and generic IMAP servers, plus it supports importing existing PST and EML archives without a live mailbox connection."
    },
    {
      "question": "Is pricing published for either tool beyond free trials?",
      "answer": "No. Boundary's HCP managed offering has a free trial but pricing beyond that isn't published, and Open Archiver has no starting price or pricing plans documented."
    }
  ]
};

export default boundaryVsOpenarchiverContent;

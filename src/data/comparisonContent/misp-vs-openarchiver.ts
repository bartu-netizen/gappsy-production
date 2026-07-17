import type { ToolComparisonContent } from './types';

const mispVsOpenarchiverContent: ToolComparisonContent = {
  "verdict": "MISP is a free, open-source threat intelligence platform for collecting, correlating, and sharing indicators of compromise among security teams, while openarchiver is an email archiving platform for backup, compliance, and eDiscovery. They serve different purposes — one shares threat indicators across trusted communities, the other retains searchable email records — with no direct functional overlap.",
  "bestForToolA": "Incident analysts and security teams building or joining threat-intel sharing communities, exporting indicators to STIX, OpenIOC, or via TAXII push for IDS/SIEM integration.",
  "bestForToolB": "Compliance and records teams needing to archive and search Microsoft 365, Google Workspace, or IMAP mailboxes, or import legacy PST/EML files.",
  "whoNeedsBoth": "A SOC could run MISP to collect and share threat indicators across a trusted community while running openarchiver on the side to retain a compliant, searchable email archive — two independent capabilities that could both be part of the same self-hosted security and compliance toolkit.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "MISP collects, correlates, and shares structured threat indicators.",
      "toolB": "openarchiver archives email for compliance and eDiscovery.",
      "whyItMatters": "Threat-intel sharing and email records management are unrelated disciplines.",
      "benefitsWho": "SOC/threat-intel analysts versus compliance/records teams."
    },
    {
      "title": "Data Model",
      "toolA": "MISP stores threat indicators in a structured format for correlation, exports to STIX and OpenIOC, and supports TAXII push, with MITRE ATT&CK and Galaxy taxonomies for classification.",
      "toolB": "openarchiver stores and indexes email content for full-text search rather than threat indicators.",
      "whyItMatters": "The two tools structure and export fundamentally different kinds of data.",
      "benefitsWho": "Threat-intel teams needing standardized indicator formats."
    },
    {
      "title": "Community Model",
      "toolA": "MISP supports multi-instance synchronization so organizations can build their own trusted sharing communities, governed by an interlocked contributor license so no single organization can change its open-source model.",
      "toolB": "openarchiver's community and governance model aren't documented.",
      "whyItMatters": "MISP's value scales with the size and trust of the community sharing intelligence through it.",
      "benefitsWho": "Organizations wanting to participate in or run threat-intel sharing communities."
    },
    {
      "title": "API & Automation",
      "toolA": "MISP offers a REST API and the PyMISP Python library for programmatic access and automation.",
      "toolB": "openarchiver's programmatic access options aren't documented beyond its mailbox connectors.",
      "whyItMatters": "API access determines how easily a tool integrates into automated security pipelines.",
      "benefitsWho": "Security engineers automating threat-intel ingestion and export."
    },
    {
      "title": "Hosting",
      "toolA": "MISP's cons explicitly state there is no official managed SaaS hosting from the core project itself; commercial hosting and support come from third parties.",
      "toolB": "openarchiver's hosting details aren't documented in the facts available.",
      "whyItMatters": "Neither tool documents an official managed hosting path from its own maintainers.",
      "benefitsWho": "Teams weighing self-hosting effort for open-source security tools."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Threat indicator storage / correlation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "STIX / OpenIOC / TAXII export",
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
        }
      ]
    },
    {
      "group": "Deployment & Licensing",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Open-source / OSI-approved license documented",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Official managed SaaS hosting",
          "toolA": "unavailable",
          "toolB": "not-documented",
          "note": "MISP: none from the core project itself"
        },
        {
          "feature": "Community / multi-instance sync",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Integrations & API",
      "rows": [
        {
          "feature": "REST API / PyMISP library",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "MITRE ATT&CK / Galaxy taxonomies",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Microsoft 365 / Google Workspace connectors",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "PST/EML import",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do MISP and openarchiver compete?",
      "answer": "No. They're in different categories — threat intelligence sharing versus email archiving."
    },
    {
      "question": "Is MISP free?",
      "answer": "Yes, completely free and open source, with its data format and API also released as open standards."
    },
    {
      "question": "Is openarchiver free?",
      "answer": "It's listed as Freemium and described as a free email archiver, but specific paid-tier pricing isn't documented."
    },
    {
      "question": "Does MISP archive email?",
      "answer": "No. MISP is a threat-intelligence platform for collecting and sharing indicators of compromise, not email."
    },
    {
      "question": "Can I run my own MISP sharing community?",
      "answer": "Yes. MISP supports multi-instance synchronization, allowing organizations to build and operate their own sharing communities."
    },
    {
      "question": "Does openarchiver share threat intelligence?",
      "answer": "No. Its documented scope is mailbox archiving and import, not indicator sharing."
    }
  ]
};

export default mispVsOpenarchiverContent;

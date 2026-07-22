import type { ToolComparisonContent } from './types';

const openarchiverVsOsqueryContent: ToolComparisonContent = {
  "verdict": "openarchiver is a self-hosted email archiving platform for backup, compliance, and eDiscovery, while osquery is a free, open-source tool that exposes an operating system as a relational database for SQL-based security monitoring. They serve different purposes within a security and compliance program — one retains mail records, the other queries endpoint and OS state.",
  "bestForToolA": "Compliance and records teams needing to archive and full-text search Microsoft 365, Google Workspace, or IMAP mailboxes, or import historical PST/EML files.",
  "bestForToolB": "Security and IT teams wanting to query OS state — running processes, network connections, file hashes — via SQL across Linux, macOS, and Windows fleets.",
  "whoNeedsBoth": "A security team could run osquery across endpoints to monitor process and file activity for threat detection while running openarchiver separately to retain email records for compliance — endpoint visibility and mail archiving addressing different parts of the same security program.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "openarchiver archives and indexes email for compliance and eDiscovery.",
      "toolB": "osquery exposes operating system and endpoint state for security monitoring.",
      "whyItMatters": "The two tools monitor completely different data: mail content versus OS/endpoint state.",
      "benefitsWho": "Compliance teams versus security/IT operations teams."
    },
    {
      "title": "Query Model",
      "toolA": "openarchiver offers no query language; it indexes mail for full-text search instead.",
      "toolB": "osquery exposes the OS as a relational database queryable via SQL, with ad hoc querying through osqueryi and continuous scheduled monitoring via osqueryd, backed by 100+ built-in tables.",
      "whyItMatters": "osquery requires SQL and systems knowledge to use effectively; openarchiver requires mailbox connector setup instead.",
      "benefitsWho": "Security engineers comfortable writing SQL queries against endpoint data."
    },
    {
      "title": "Licensing & Governance",
      "toolA": "openarchiver is listed as Freemium and described as free, but its specific license and governance details aren't documented.",
      "toolB": "osquery is free, dual-licensed under Apache 2.0 and GPL 2.0, and governed under the vendor-neutral Linux Foundation.",
      "whyItMatters": "Vendor-neutral governance signals a project isn't controlled by a single commercial entity.",
      "benefitsWho": "Enterprises requiring vendor-neutral open-source tooling for long-term adoption."
    },
    {
      "title": "Platform Coverage",
      "toolA": "openarchiver connects specifically to Microsoft 365, Google Workspace, and IMAP mail platforms, or imports PST/EML files.",
      "toolB": "osquery runs cross-platform on Linux, macOS, and Windows for general OS instrumentation.",
      "whyItMatters": "The two tools cover entirely different surfaces — mailboxes versus endpoints.",
      "benefitsWho": "IT teams deciding what asset class they need visibility into first."
    },
    {
      "title": "Extensibility",
      "toolA": "openarchiver's documented extensibility is limited to its mail connectors and PST/EML import formats.",
      "toolB": "osquery provides Thrift-based APIs for building custom applications and extensions on top of the query engine.",
      "whyItMatters": "Extensibility determines how easily a tool can be customized for advanced use cases.",
      "benefitsWho": "Security engineering teams building custom endpoint tooling on top of osquery."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Email archiving",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "OS / endpoint instrumentation",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Full-text search of records",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "SQL-based querying",
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
          "feature": "Open-source license documented",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "osquery: dual Apache 2.0 / GPL 2.0"
        },
        {
          "feature": "Cross-platform OS support (Linux/macOS/Windows)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Vendor-neutral foundation governance",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "osquery moved to the Linux Foundation"
        }
      ]
    },
    {
      "group": "Integration & Extensibility",
      "rows": [
        {
          "feature": "Microsoft 365 / Google Workspace connectors",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "PST/EML import",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "100+ built-in OS tables",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Thrift API extensions",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do openarchiver and osquery compete?",
      "answer": "No. They're in different categories — email archiving versus SQL-based OS/endpoint instrumentation."
    },
    {
      "question": "Is osquery free?",
      "answer": "Yes, dual-licensed under Apache 2.0 and GPL 2.0, with no paid tier from the project itself; fleet management typically requires a separate tool such as Fleet."
    },
    {
      "question": "Is openarchiver free?",
      "answer": "It's listed as Freemium and described as a free email archiver, but paid-tier pricing isn't documented."
    },
    {
      "question": "Can osquery archive email?",
      "answer": "No. osquery queries operating system and endpoint state; it has no email archiving functionality."
    },
    {
      "question": "Does openarchiver run SQL queries against endpoints?",
      "answer": "No. Its documented scope is mailbox connectors and PST/EML import for archiving."
    },
    {
      "question": "What platforms does osquery support?",
      "answer": "Linux, macOS, and Windows."
    }
  ]
};

export default openarchiverVsOsqueryContent;

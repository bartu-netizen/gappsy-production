import type { ToolComparisonContent } from './types';

const defectdojoVsOpenarchiverContent: ToolComparisonContent = {
  "verdict": "DefectDojo is an open-source vulnerability management and ASPM platform that centralizes security findings from 200+ scanning tools, while openarchiver is an email archiving platform for backup, compliance, and eDiscovery. They belong to different categories of a security program — vulnerability management versus records retention — with no functional overlap.",
  "bestForToolA": "AppSec teams needing to import, deduplicate, and manage vulnerability findings across 200+ scanning tools, with RBAC via LDAP, SAML, or OAuth and a REST API with Swagger documentation.",
  "bestForToolB": "Compliance and records teams needing to archive and search Microsoft 365, Google Workspace, or IMAP mailboxes, or import legacy PST/EML files.",
  "whoNeedsBoth": "An AppSec-mature organization might run DefectDojo to centralize and triage vulnerability findings from its scanning pipeline while separately running openarchiver to retain a compliant email archive — vulnerability management and records retention are distinct programs that could coexist in the same self-hosted stack.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "DefectDojo imports, deduplicates, and manages vulnerability findings from security scanners.",
      "toolB": "openarchiver archives email for compliance and eDiscovery.",
      "whyItMatters": "Vulnerability management and email archiving address unrelated risk domains.",
      "benefitsWho": "AppSec teams versus compliance/records teams."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "DefectDojo documents a free open-source edition under BSD-3-Clause at $0, plus a Pro tier starting at $300/month with an automation rules engine, premium parsers, a cloud-hosted option, and MFA.",
      "toolB": "openarchiver is listed as Freemium but has no documented pricing plans or starting price in Gappsy's data.",
      "whyItMatters": "Clear published pricing versus an undocumented paid tier changes how easily a buyer can budget.",
      "benefitsWho": "Procurement teams comparing costs across self-hosted security tools."
    },
    {
      "title": "Integrations",
      "toolA": "DefectDojo imports and deduplicates results from over 200 security scanning tools, with Pro adding integrations like Snyk, SonarQube, and AWS plus a universal CSV/JSON parser.",
      "toolB": "openarchiver integrates with Microsoft 365, Google Workspace, IMAP, and PST/EML import — no security scanner integrations.",
      "whyItMatters": "DefectDojo's value scales with the breadth of scanning tools it can ingest.",
      "benefitsWho": "AppSec teams running multiple scanning tools that need centralized findings."
    },
    {
      "title": "Access Control",
      "toolA": "DefectDojo supports RBAC alongside LDAP, SAML, and OAuth authentication, with MFA gated to the Pro tier.",
      "toolB": "openarchiver's access-control and authentication options aren't documented in the facts available.",
      "whyItMatters": "Enterprise access-control requirements often dictate which tools can be adopted.",
      "benefitsWho": "Security teams with existing LDAP/SAML identity infrastructure."
    },
    {
      "title": "Adoption Signals",
      "toolA": "DefectDojo cites 38 million+ downloads and 4,000+ GitHub stars for its open-source project.",
      "toolB": "openarchiver's adoption metrics aren't documented.",
      "whyItMatters": "Adoption scale can indicate community support and long-term project viability.",
      "benefitsWho": "Teams weighing the maturity of an open-source security tool before standardizing on it."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Vulnerability finding import & deduplication",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Vulnerability scanner integrations (200+)",
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
      "group": "Pricing & Licensing",
      "rows": [
        {
          "feature": "Free open-source edition",
          "toolA": "available",
          "toolB": "available",
          "note": "DefectDojo: BSD-3-Clause, $0"
        },
        {
          "feature": "Documented paid tier with public starting price",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "DefectDojo Pro: from $300/month"
        },
        {
          "feature": "REST API with Swagger documentation",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Access & Integration",
      "rows": [
        {
          "feature": "Role-based access control (RBAC)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "LDAP / SAML / OAuth authentication",
          "toolA": "available",
          "toolB": "not-documented"
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
      "question": "Do DefectDojo and openarchiver compete?",
      "answer": "No. They're in different categories — vulnerability management versus email archiving."
    },
    {
      "question": "Is DefectDojo free?",
      "answer": "Yes, the open-source edition is free under BSD-3-Clause; a Pro tier starts around $300/month for additional features like an automation rules engine and cloud hosting."
    },
    {
      "question": "Is openarchiver free?",
      "answer": "It's listed as Freemium and described as a free email archiver, but specific paid-tier pricing isn't documented."
    },
    {
      "question": "Does DefectDojo archive email?",
      "answer": "No. It centralizes and manages vulnerability findings from security scanning tools, not email."
    },
    {
      "question": "How many scanning tools does DefectDojo integrate with?",
      "answer": "Over 200 security scanning tools, with Pro adding further integrations like Snyk, SonarQube, and AWS."
    },
    {
      "question": "Does openarchiver manage vulnerability findings?",
      "answer": "No. Its documented scope is mailbox connectors and PST/EML import for archiving."
    }
  ]
};

export default defectdojoVsOpenarchiverContent;

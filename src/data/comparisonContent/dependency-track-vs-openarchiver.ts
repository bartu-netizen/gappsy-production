import type { ToolComparisonContent } from './types';

const dependencyTrackVsOpenarchiverContent: ToolComparisonContent = {
  "verdict": "Dependency-Track is an OWASP-maintained, open-source platform that analyzes SBOMs to inventory software components and identify supply-chain vulnerabilities, while openarchiver is an email archiving platform for backup, compliance, and eDiscovery. They address unrelated risk domains — software supply-chain security versus records retention — with no functional overlap.",
  "bestForToolA": "AppSec and DevSecOps teams needing to inventory software components via CycloneDX SBOMs and continuously match them against vulnerability sources like NVD, GitHub Advisories, Snyk, and OSV.",
  "bestForToolB": "Compliance, legal, and IT teams needing to archive and search corporate email from Microsoft 365, Google Workspace, or IMAP, or import legacy PST/EML files.",
  "whoNeedsBoth": "A security-conscious engineering organization might run Dependency-Track to continuously track vulnerabilities in its software supply chain while separately using openarchiver to retain a compliant, searchable archive of company email — two unrelated risk domains handled by two purpose-built, self-hosted tools.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Dependency-Track inventories software components via SBOMs and analyzes them for vulnerabilities.",
      "toolB": "openarchiver archives email for compliance and eDiscovery.",
      "whyItMatters": "Software supply-chain security and email records management are separate disciplines.",
      "benefitsWho": "AppSec/DevSecOps teams versus compliance/records teams."
    },
    {
      "title": "Scale & Maintainer",
      "toolA": "Dependency-Track is an OWASP Flagship Project, free under Apache 2.0, used by 20,000+ organizations per the project site, and able to process tens of thousands of SBOMs per hour with version 5.0's horizontal scaling and active/active high availability.",
      "toolB": "openarchiver's scale, license, and maintainer details aren't documented in the facts available.",
      "whyItMatters": "Project maturity and adoption signal how battle-tested a tool is for production use.",
      "benefitsWho": "Enterprises evaluating adoption risk of an open-source security tool."
    },
    {
      "title": "Deployment",
      "toolA": "Dependency-Track deploys via Docker or Docker Compose with a PostgreSQL database for version 5.0 and later.",
      "toolB": "openarchiver connects via Microsoft 365, Google Workspace, and IMAP connectors, or PST/EML import, rather than describing a database-backed deployment stack.",
      "whyItMatters": "Knowing the deployment footprint helps infra teams plan hosting requirements.",
      "benefitsWho": "Platform teams provisioning self-hosted infrastructure."
    },
    {
      "title": "Data Sources",
      "toolA": "Dependency-Track cross-references NVD, GitHub Advisories, Snyk, and OSV for component vulnerabilities.",
      "toolB": "openarchiver's data sources are mailbox platforms and archive file formats (PST/EML), not vulnerability feeds.",
      "whyItMatters": "The two tools ingest fundamentally different kinds of data.",
      "benefitsWho": "Security engineers tracking CVEs versus records managers archiving mail."
    },
    {
      "title": "Managed Hosting",
      "toolA": "Dependency-Track's cons explicitly note there is no official paid or managed hosting tier from the project itself, requiring self-hosting.",
      "toolB": "openarchiver's paid-tier and hosting details simply aren't documented in Gappsy's data.",
      "whyItMatters": "Neither tool offers a clearly documented managed hosting path, which affects operational overhead.",
      "benefitsWho": "Teams weighing self-hosting effort against managed alternatives."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "SBOM-based component inventory",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Continuous vulnerability analysis",
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
          "feature": "Open-source license documented",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Dependency-Track: Apache 2.0"
        },
        {
          "feature": "Official managed/hosted tier",
          "toolA": "unavailable",
          "toolB": "not-documented",
          "note": "Dependency-Track: none from the project itself"
        },
        {
          "feature": "Horizontal scaling / HA",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Dependency-Track v5.0+"
        }
      ]
    },
    {
      "group": "Integrations",
      "rows": [
        {
          "feature": "Vulnerability source cross-referencing (NVD, GitHub Advisories, Snyk, OSV)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Policy engine for security/license rules",
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
      "question": "Do Dependency-Track and openarchiver compete?",
      "answer": "No. They're in different categories — software supply-chain vulnerability management versus email archiving."
    },
    {
      "question": "Is Dependency-Track free?",
      "answer": "Yes, free and open source under Apache 2.0, maintained as an OWASP Flagship Project."
    },
    {
      "question": "Is openarchiver free?",
      "answer": "It's listed as Freemium and described as a free email archiver, but specific paid-tier pricing isn't documented."
    },
    {
      "question": "Does Dependency-Track archive email?",
      "answer": "No. It inventories software components via SBOMs and tracks vulnerabilities, not email."
    },
    {
      "question": "What SBOM format does Dependency-Track use?",
      "answer": "CycloneDX SBOMs to track libraries, containers, operating systems, firmware, and services."
    },
    {
      "question": "Does openarchiver track software vulnerabilities?",
      "answer": "No. Its documented scope is mailbox connectors and PST/EML import for archiving."
    }
  ]
};

export default dependencyTrackVsOpenarchiverContent;

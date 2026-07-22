import type { ToolComparisonContent } from './types';

const fleetdmVsOpenarchiverContent: ToolComparisonContent = {
  "verdict": "FleetDM is an open-source device management platform built on osquery for managing macOS, Linux, Windows, iOS, and Android devices from one console. openarchiver is an open-source, self-hosted platform for email backup, compliance, and eDiscovery with full-text search. Both are open-source IT/security infrastructure tools that can be self-hosted, but they manage completely different assets — FleetDM manages endpoint devices, openarchiver manages archived email.",
  "bestForToolA": "FleetDM fits IT and security teams needing cross-platform device inventory, patch and vulnerability management, and live queries across macOS, Linux, Windows, iOS, and Android, with data reported back in under 30 seconds and a free open-source tier the company states will always remain free.",
  "bestForToolB": "openarchiver fits IT and compliance teams needing to archive email from Microsoft 365, Google Workspace, or IMAP, or import historical PST/EML files, for backup, eDiscovery, and full-text search.",
  "whoNeedsBoth": "An IT department could run FleetDM to manage and patch its fleet of employee devices while separately running openarchiver to archive company email for compliance and legal discovery — two distinct but complementary parts of an organization's IT and compliance stack.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "FleetDM manages and monitors physical and virtual endpoint devices — inventory, patches, vulnerabilities, and live diagnostics — built on the osquery agent.",
      "toolB": "openarchiver archives email communications for backup, compliance, and eDiscovery, with full-text search across archived messages.",
      "whyItMatters": "Device management and email archiving are distinct IT disciplines with different data models, so the right tool depends entirely on what asset needs managing.",
      "benefitsWho": "IT teams managing hardware/software fleets need FleetDM; compliance and legal teams handling email retention need openarchiver."
    },
    {
      "title": "Deployment Options",
      "toolA": "FleetDM can be run as a self-hosted open-source deployment or as a hosted cloud service.",
      "toolB": "openarchiver is documented as self-hosted, with no managed cloud version documented.",
      "whyItMatters": "Having both self-hosted and managed cloud options gives teams flexibility to start without infrastructure and migrate later if needed.",
      "benefitsWho": "Teams wanting deployment flexibility benefit from FleetDM's dual options; openarchiver users must currently plan for self-hosting."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "FleetDM's Free, open-source tier is stated to \"always remain free,\" with a custom-priced Premium tier for additional management and automation features.",
      "toolB": "openarchiver is tagged as freemium, but no specific pricing plans are documented.",
      "whyItMatters": "An explicit commitment to a permanently free tier gives buyers more confidence in long-term cost planning than an undocumented freemium model.",
      "benefitsWho": "Budget-planning IT teams get clearer signal from FleetDM's documented free-tier commitment."
    },
    {
      "title": "Scale and Adoption Evidence",
      "toolA": "FleetDM states it is used by 1,300+ organizations across 90+ countries, managing over 2,000,000 devices.",
      "toolB": "openarchiver does not publish comparable adoption or scale figures in the available facts.",
      "whyItMatters": "Publicly stated adoption numbers can serve as a proof point for enterprise buyers evaluating vendor maturity.",
      "benefitsWho": "Enterprises wanting evidence of at-scale usage get more documented signal from FleetDM."
    },
    {
      "title": "Automation and API",
      "toolA": "FleetDM device configuration and policies can be managed as code and automated via a single REST API, with live queries and scripting supported against endpoints.",
      "toolB": "openarchiver does not document a REST API or infrastructure-as-code workflow in the available facts.",
      "whyItMatters": "API-driven, infrastructure-as-code management matters for teams that want to automate device policy changes at scale rather than click through a UI.",
      "benefitsWho": "DevOps-oriented IT teams benefit specifically from FleetDM's documented API and infrastructure-as-code support."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Capability",
      "rows": [
        {
          "feature": "Cross-platform device inventory (macOS/Linux/Windows/iOS/Android)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Email archiving & eDiscovery",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Patch and vulnerability management",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Full-text search",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Automation & API",
      "rows": [
        {
          "feature": "REST API for automation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Infrastructure-as-code management",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Live queries and diagnostics",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Real-time reporting (under 30 seconds)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Managed cloud option",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Free tier explicitly stated to remain free",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Published pricing tiers",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "FleetDM: Free tier documented, Premium is custom-priced"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are FleetDM and openarchiver competitors?",
      "answer": "No. FleetDM manages endpoint devices (inventory, patching, vulnerabilities), while openarchiver archives email for compliance and eDiscovery. They cover different parts of an IT and compliance stack."
    },
    {
      "question": "Is FleetDM free to use?",
      "answer": "Fleet maintains a free, open-source version that the company states will always be free, alongside a custom-priced Premium tier with additional management and automation features."
    },
    {
      "question": "Does openarchiver publish its pricing?",
      "answer": "No specific pricing plans are documented for openarchiver, even though it's tagged as freemium."
    },
    {
      "question": "Can either tool be self-hosted?",
      "answer": "Yes, both can. FleetDM supports self-hosted or hosted cloud deployment, while openarchiver is documented as self-hosted with no managed cloud option listed."
    },
    {
      "question": "Which tool has a documented REST API?",
      "answer": "FleetDM documents a single REST API supporting infrastructure-as-code device management and automation. openarchiver does not document a comparable API in the available facts."
    },
    {
      "question": "Would an organization need both tools?",
      "answer": "Many IT departments would run both for different purposes — FleetDM to manage and secure employee devices, and openarchiver to archive email communications for legal and compliance retention requirements."
    }
  ]
};

export default fleetdmVsOpenarchiverContent;

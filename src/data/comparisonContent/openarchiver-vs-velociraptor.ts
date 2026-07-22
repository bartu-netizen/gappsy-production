import type { ToolComparisonContent } from './types';

const openarchiverVsVelociraptorContent: ToolComparisonContent = {
  "verdict": "openarchiver is an open-source, self-hosted platform for email backup, compliance, and eDiscovery with full-text search. Velociraptor is a free, open-source digital forensics and incident response (DFIR) tool for endpoint monitoring and threat hunting, using its own Velociraptor Query Language (VQL). Both are open-source, self-hosted security and compliance infrastructure, but openarchiver preserves email records while Velociraptor investigates and hunts across live endpoints.",
  "bestForToolA": "openarchiver fits IT and compliance teams that need to archive email from Microsoft 365, Google Workspace, or IMAP, or import historical PST/EML files, for backup, eDiscovery, and full-text search.",
  "bestForToolB": "Velociraptor fits security and incident response teams that need to write custom VQL queries for targeted forensic evidence collection, continuous endpoint monitoring, and threat hunting across large, distributed fleets, maintained by Rapid7 since its 2021 acquisition of the Velociraptor team.",
  "whoNeedsBoth": "A security team investigating a suspected breach could use Velociraptor to hunt for malicious activity and collect forensic evidence across endpoints, while pulling relevant archived email from openarchiver as part of the same eDiscovery or incident timeline.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "openarchiver archives email communications for backup, compliance, and eDiscovery, with full-text search across archived messages.",
      "toolB": "Velociraptor collects forensic evidence and hunts for threats across endpoints, monitoring logs, file changes, and processes using its own VQL query language.",
      "whyItMatters": "Email archiving and endpoint forensics address different stages and data types within security and compliance work.",
      "benefitsWho": "Compliance/legal teams handling email retention need openarchiver; incident responders investigating endpoint activity need Velociraptor."
    },
    {
      "title": "Data Focus",
      "toolA": "openarchiver focuses on email data from Microsoft 365, Google Workspace, IMAP, and PST/EML file imports.",
      "toolB": "Velociraptor focuses on endpoint telemetry — logs, file changes, and processes — across potentially tens of thousands of machines in real incident response operations.",
      "whyItMatters": "The type of data source directly determines which tool is relevant to a given investigation or compliance requirement.",
      "benefitsWho": "Teams responding to endpoint-based incidents need Velociraptor's telemetry focus; teams managing email retention need openarchiver's mailbox focus."
    },
    {
      "title": "Licensing and Backing",
      "toolA": "openarchiver's short description calls it the \"leading open-source email archiving solution,\" but no specific license or company backing is documented.",
      "toolB": "Velociraptor is explicitly licensed under AGPL and maintained by Rapid7, which acquired the Velociraptor team in 2021.",
      "whyItMatters": "A named license and a documented maintaining company give buyers clearer signal about legal terms and long-term support.",
      "benefitsWho": "Risk-averse buyers evaluating open-source infrastructure get more documented certainty from Velociraptor's explicit AGPL license and Rapid7 backing."
    },
    {
      "title": "Deployment Model",
      "toolA": "openarchiver is documented as self-hosted, with no managed cloud version and no vendor-run SaaS documented.",
      "toolB": "Velociraptor also requires self-hosting and operational management, with no vendor-run SaaS version of the open-source tool itself — Rapid7 separately sells a commercial InsightIDR/XDR product that integrates Velociraptor.",
      "whyItMatters": "Neither tool offers a fully managed SaaS version of its core open-source product, so both require the buyer to run and operate the infrastructure.",
      "benefitsWho": "Technical teams comfortable with self-hosted operations are the fit for both tools; teams wanting a fully managed SaaS product would need to look at Rapid7's separate commercial offerings for forensics."
    },
    {
      "title": "Query and Customization Model",
      "toolA": "openarchiver does not document a custom query language, relying instead on full-text search over archived email.",
      "toolB": "Velociraptor's VQL lets investigators write fully custom forensic collections and threat hunts, backed by a built-in library of forensic artifacts, though it has a documented learning curve.",
      "whyItMatters": "A custom query language enables highly specific, repeatable investigations that a fixed search interface can't replicate.",
      "benefitsWho": "Forensic analysts building tailored, repeatable hunts benefit specifically from Velociraptor's VQL."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Capability",
      "rows": [
        {
          "feature": "Email archiving & eDiscovery",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Endpoint forensic evidence collection",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Continuous endpoint monitoring",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Full-text search",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Customization & Scale",
      "rows": [
        {
          "feature": "Custom query language",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Velociraptor Query Language (VQL)"
        },
        {
          "feature": "Built-in artifact/template library",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Large-scale deployment (tens of thousands of endpoints)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Microsoft 365 / Google Workspace connectors",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Licensing & Deployment",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Vendor-run managed SaaS of the core tool",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "Velociraptor: none for the open-source tool itself"
        },
        {
          "feature": "Explicit open-source license documented",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Velociraptor: AGPL"
        },
        {
          "feature": "Published pricing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Velociraptor: Open Source plan, $0"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are openarchiver and Velociraptor competitors?",
      "answer": "No. openarchiver archives email for compliance and eDiscovery, while Velociraptor collects forensic evidence and hunts for threats across live endpoints. They address different stages of security and compliance work."
    },
    {
      "question": "Is Velociraptor free?",
      "answer": "Yes. Velociraptor is open source under the AGPL license and free to use, maintained by Rapid7 following its 2021 acquisition of the Velociraptor team."
    },
    {
      "question": "Does openarchiver publish its pricing?",
      "answer": "No specific pricing plans are documented for openarchiver, even though it's tagged as freemium."
    },
    {
      "question": "What is VQL?",
      "answer": "VQL (Velociraptor Query Language) is Velociraptor's query language for writing custom forensic collections and threat-hunting queries, backed by a built-in library of forensic artifacts."
    },
    {
      "question": "Can openarchiver and Velociraptor be used together?",
      "answer": "Yes — during a security investigation, a team could use Velociraptor to hunt for malicious activity and collect endpoint evidence while pulling relevant archived email from openarchiver as part of the same eDiscovery timeline."
    },
    {
      "question": "Does either tool offer a fully managed SaaS version?",
      "answer": "No. Neither openarchiver nor Velociraptor's open-source tool documents a vendor-run SaaS version — both require self-hosting, though Rapid7 separately sells a commercial InsightIDR/XDR product that integrates Velociraptor."
    }
  ]
};

export default openarchiverVsVelociraptorContent;

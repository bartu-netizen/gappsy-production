import type { ToolComparisonContent } from './types';

const openarchiverVsSuricataContent: ToolComparisonContent = {
  "verdict": "openarchiver and Suricata protect different parts of an organization's infrastructure: openarchiver is a self-hosted email archiving platform for compliance, backup, and eDiscovery, while Suricata is an open-source network intrusion detection and prevention engine that inspects network traffic for threats. They don't compete for the same budget line — one retains records, the other detects and blocks malicious traffic.",
  "bestForToolA": "Organizations needing to retain and full-text search Microsoft 365, Google Workspace, or IMAP mailboxes for legal, compliance, or eDiscovery requirements.",
  "bestForToolB": "Network and security teams needing real-time intrusion detection or inline traffic blocking (IPS) using Snort-compatible rulesets such as Emerging Threats Open, particularly on high-throughput, multi-core networks.",
  "whoNeedsBoth": "A regulated company running its own infrastructure might deploy Suricata to monitor and block malicious network traffic at the perimeter while running openarchiver to retain a searchable, compliant archive of company email — two separate risk domains handled by two purpose-built tools.",
  "keyDifferences": [
    {
      "title": "Primary Function",
      "toolA": "openarchiver is an email archiving platform for compliance and eDiscovery.",
      "toolB": "Suricata is a network intrusion detection and prevention engine (IDS/IPS).",
      "whyItMatters": "The tools address entirely different threat and compliance surfaces.",
      "benefitsWho": "Compliance officers versus network security engineers."
    },
    {
      "title": "Detection / Rule Engine",
      "toolA": "openarchiver has no rule or detection engine; its connectors are for archiving mail, not inspecting traffic.",
      "toolB": "Suricata uses Snort-compatible rule syntax, so rulesets like Emerging Threats Open work without modification, running on a multi-threaded engine built for high-throughput networks.",
      "whyItMatters": "Suricata's usefulness depends on rule tuning and expertise; openarchiver's depends on mailbox connector setup.",
      "benefitsWho": "SOC and network teams evaluating detection capability."
    },
    {
      "title": "Licensing & Governance",
      "toolA": "openarchiver is listed as Freemium and described as a free email archiver, but its specific license and paid-tier pricing aren't documented in Gappsy's data.",
      "toolB": "Suricata is free under GPLv2 with no licensing fee for the engine, maintained by the nonprofit Open Information Security Foundation (OISF).",
      "whyItMatters": "Clarity on licensing and governance affects long-term cost and project stability.",
      "benefitsWho": "Procurement and security teams doing open-source vendor due diligence."
    },
    {
      "title": "Deployment Point",
      "toolA": "openarchiver connects to Microsoft 365, Google Workspace, and IMAP servers, or imports PST/EML files.",
      "toolB": "Suricata deploys at the network layer, either inline as an IPS or passively as an IDS/network security monitor.",
      "whyItMatters": "The two tools sit at completely different points in the infrastructure.",
      "benefitsWho": "Infra architects planning where each tool physically sits in the stack."
    },
    {
      "title": "Community & Governance",
      "toolA": "openarchiver's governance and maintainer details aren't documented in the facts available.",
      "toolB": "Suricata is backed by the nonprofit OISF, with an active community and an annual SuriCon conference.",
      "whyItMatters": "Foundation-level governance signals long-term project stability.",
      "benefitsWho": "Teams doing due diligence before committing to a self-hosted open-source security tool."
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
          "feature": "Network intrusion detection",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Inline traffic blocking (IPS)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Full-text search of retained records",
          "toolA": "available",
          "toolB": "unavailable"
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
          "note": "Suricata: GPLv2"
        },
        {
          "feature": "No licensing fee for core engine",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Official managed/hosted commercial tier",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "No official managed tier from OISF"
        }
      ]
    },
    {
      "group": "Integration",
      "rows": [
        {
          "feature": "Microsoft 365 / Google Workspace connectors",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Snort-compatible rulesets (e.g. Emerging Threats Open)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "PST/EML import",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Multi-threaded high-throughput engine",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are openarchiver and Suricata competitors?",
      "answer": "No. They're in different categories — email archiving versus network IDS/IPS — and address unrelated parts of a security and compliance program."
    },
    {
      "question": "Is Suricata free?",
      "answer": "Yes. It is free and open source under GPLv2 with no fee for the engine, maintained by the nonprofit Open Information Security Foundation."
    },
    {
      "question": "Is openarchiver free?",
      "answer": "It's listed as Freemium and described as a free email archiver, but the exact paid tier and pricing aren't documented in the available data."
    },
    {
      "question": "Can Suricata archive email?",
      "answer": "No. Suricata inspects network traffic for intrusion detection and prevention; it has no email archiving functionality."
    },
    {
      "question": "Does openarchiver detect network threats?",
      "answer": "No. Its documented scope is mailbox connectors and PST/EML import for archiving, not network traffic inspection."
    },
    {
      "question": "What rule format does Suricata use?",
      "answer": "Snort-style rule syntax, so rulesets like Emerging Threats Open work with it out of the box."
    }
  ]
};

export default openarchiverVsSuricataContent;

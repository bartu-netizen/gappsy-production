import type { ToolComparisonContent } from './types';

const securityOnionVsWazuhContent: ToolComparisonContent = {
  "verdict": "Security Onion and Wazuh are both free, open-source security platforms with optional paid tiers, but they're architecturally different: Security Onion is built on Suricata, Zeek, and the Elastic Stack for network security monitoring and threat hunting, while Wazuh is a purpose-built SIEM/XDR platform focused on endpoint security, file integrity monitoring, and compliance. Teams that need deep network traffic visibility and packet-level threat hunting tend toward Security Onion; teams that need centralized endpoint monitoring, active response, and compliance reporting tend toward Wazuh.",
  "bestForToolA": "Security Onion fits teams needing network security monitoring and threat hunting built on established tools (Suricata, Zeek, Elastic Stack), with a 2008 founding and long track record across government, defense, Fortune 500, and academic sectors.",
  "bestForToolB": "Wazuh fits teams needing endpoint-centric SIEM/XDR — configuration assessment, malware detection, file integrity monitoring, and active on-device response — at no licensing cost, reporting 15+ million protected endpoints.",
  "whoNeedsBoth": "A security operations center could deploy Security Onion for network-level visibility (packet capture, IDS alerts via Suricata/Zeek) while running Wazuh in parallel for endpoint-level detection and file integrity monitoring, correlating both data sources for a fuller picture than either tool provides alone.",
  "keyDifferences": [
    {
      "title": "Underlying Architecture",
      "toolA": "Security Onion is built on Suricata, Zeek, and the Elastic Stack for full network visibility, combining these established open-source tools into one integrated platform.",
      "toolB": "Wazuh is architected around Active XDR with real-time correlation and granular, on-device active responses, alongside dedicated Endpoint Security and SIEM Capabilities features.",
      "whyItMatters": "The underlying architecture determines whether a tool excels at network traffic analysis or host/endpoint-level detection.",
      "benefitsWho": "Network security teams doing packet-level analysis benefit from Security Onion's Suricata/Zeek foundation; endpoint security teams benefit from Wazuh's XDR design."
    },
    {
      "title": "AI Features",
      "toolA": "Security Onion offers Onion AI for AI-assisted alert analysis and detection tuning, with local model support available in the paid Pro tier launched in 2024.",
      "toolB": "Wazuh's documented feature list does not include an AI-assisted analysis capability.",
      "whyItMatters": "AI-assisted triage can reduce analyst workload when reviewing high alert volumes.",
      "benefitsWho": "SOC teams looking to reduce alert fatigue may value Security Onion's Onion AI, especially in the Pro tier."
    },
    {
      "title": "Founding & Track Record",
      "toolA": "Security Onion was founded in 2008 by Doug Burks, with Security Onion Solutions, LLC established in 2014, and reports over 2 million downloads by 2021.",
      "toolB": "Wazuh's founding year and headquarters are not disclosed in available facts, though it reports 15+ million protected endpoints and 100,000+ enterprise users.",
      "whyItMatters": "Company history and disclosed scale metrics help buyers assess vendor maturity, though both tools show strong adoption signals via different metrics.",
      "benefitsWho": "Buyers doing vendor due diligence may weigh Security Onion's documented 2008 founding date and long public track record."
    },
    {
      "title": "Compliance Focus",
      "toolA": "Security Onion's documented features focus on network security monitoring, threat hunting, and log management rather than compliance-specific reporting.",
      "toolB": "Wazuh's SIEM Capabilities explicitly include regulatory compliance support alongside centralized monitoring and alerting.",
      "whyItMatters": "Organizations under specific regulatory regimes need compliance reporting built into their monitoring stack, not bolted on separately.",
      "benefitsWho": "Compliance and audit teams benefit from Wazuh's built-in regulatory compliance support."
    },
    {
      "title": "Paid Tier Structure",
      "toolA": "Security Onion Pro adds Onion AI Assistant, local model support, and enhanced AI-driven capabilities, with pricing not publicly disclosed.",
      "toolB": "Wazuh's paid options are optional managed Wazuh Cloud and professional support/training, also not publicly listed.",
      "whyItMatters": "Neither tool publishes paid pricing, so both require a sales conversation once a team outgrows the free community edition.",
      "benefitsWho": "Budget planners should expect to contact sales for either tool's paid tier since neither publishes pricing."
    }
  ],
  "featureMatrix": [
    {
      "group": "Network & Threat Detection",
      "rows": [
        {
          "feature": "Network security monitoring",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Security Onion built on Suricata/Zeek/Elastic"
        },
        {
          "feature": "Threat hunting tools",
          "toolA": "available",
          "toolB": "available",
          "note": "Both list threat hunting as a core feature"
        },
        {
          "feature": "Log management",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Community detection rules",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Security Onion Community Detection Rules"
        }
      ]
    },
    {
      "group": "Endpoint & Compliance",
      "rows": [
        {
          "feature": "Endpoint file integrity monitoring",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Wazuh Endpoint Security"
        },
        {
          "feature": "Active/automated response",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Wazuh Active XDR"
        },
        {
          "feature": "Regulatory compliance monitoring",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Wazuh SIEM Capabilities"
        },
        {
          "feature": "Cloud/container security",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Wazuh Cloud Security"
        }
      ]
    },
    {
      "group": "AI & Pricing",
      "rows": [
        {
          "feature": "AI-assisted alert analysis",
          "toolA": "limited",
          "toolB": "unavailable",
          "note": "Security Onion Onion AI is core-tier; local models require Pro"
        },
        {
          "feature": "Free core plan",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Published paid tier pricing",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Neither publishes Pro/Cloud pricing"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Security Onion or Wazuh free?",
      "answer": "Both are free and open source at their core. Security Onion's Community edition is free, with an optional paid Pro tier for AI-driven features. Wazuh's Community (self-hosted) plan is free with the full SIEM/XDR feature set, with optional paid Wazuh Cloud and support."
    },
    {
      "question": "Which tool is better for network traffic analysis?",
      "answer": "Security Onion is purpose-built for this, combining Suricata, Zeek, and the Elastic Stack for full network visibility. Wazuh's documented strengths are endpoint security and SIEM/XDR correlation rather than deep network packet analysis."
    },
    {
      "question": "Does either tool have AI features?",
      "answer": "Security Onion offers Onion AI for AI-assisted alert analysis and detection tuning, with local model support in the paid Pro tier. Wazuh's documented feature list does not include an AI capability."
    },
    {
      "question": "How long has each tool existed?",
      "answer": "Security Onion was founded in 2008 by Doug Burks, with Security Onion Solutions, LLC established in 2014. Wazuh's founding year is not disclosed in available facts."
    },
    {
      "question": "Which tool has stronger compliance reporting?",
      "answer": "Wazuh explicitly lists regulatory compliance support as part of its SIEM Capabilities. Security Onion's documented features center on network monitoring and threat hunting rather than compliance-specific reporting."
    },
    {
      "question": "How many organizations use each platform?",
      "answer": "Security Onion reports over 2 million downloads by 2021 and use across government, defense, Fortune 500, and academic sectors. Wazuh reports 15+ million protected endpoints and 100,000+ enterprise users."
    }
  ]
};

export default securityOnionVsWazuhContent;

import type { ToolComparisonContent } from './types';

const greenboneVsMendIoContent: ToolComparisonContent = {
  "verdict": "Greenbone and Mend.io both operate in vulnerability-related security, but at different layers: Greenbone is a network and infrastructure vulnerability scanner offering a free open-source OpenVAS edition plus tiered commercial products, while Mend.io is an application security platform focused on Software Composition Analysis (SCA), SAST, and AI risk governance for enterprise development teams, priced up to $1,000 per developer per year for its full AppSec suite. Teams scanning networks, servers, and infrastructure for known vulnerabilities need Greenbone; teams securing application source code, open-source dependencies, and now AI models/agents need Mend.io.",
  "bestForToolA": "Greenbone fits IT and network security teams that need automated infrastructure vulnerability scanning with a daily-updated database of 100,000+ tests, deployable as hardware, VM, or cloud, with a free OPENVAS FREE tier for teams that don't need enterprise support.",
  "bestForToolB": "Mend.io fits application security teams at enterprises like the ones it names as customers (Microsoft, Google, Vodafone, Yahoo, Siemens) that need SCA and SAST for code and dependencies, plus newer AI-BOM/Shadow AI discovery and automated red teaming for AI models and agents.",
  "whoNeedsBoth": "A security organization could run Greenbone to continuously scan its network and server infrastructure for known vulnerabilities while separately running Mend.io in its CI/CD pipeline to catch vulnerable open-source dependencies and insecure application code before it's deployed onto that infrastructure — covering the network layer and the application layer respectively.",
  "keyDifferences": [
    {
      "title": "Security Layer",
      "toolA": "Greenbone performs Automated vulnerability scanning of networks and IT infrastructure using a database of 100,000+ tests updated daily.",
      "toolB": "Mend.io performs Software Composition Analysis (SCA) on open source dependencies and High-accuracy SAST on proprietary code, including AI-generated code security checks.",
      "whyItMatters": "Network-layer vulnerability scanning and application/code-layer security testing catch fundamentally different classes of risk.",
      "benefitsWho": "Infrastructure and network security teams need Greenbone; application security and developer teams need Mend.io."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Greenbone offers a free OPENVAS FREE tier, with BASIC, SCAN, and SECURITY INTELLIGENCE tiers all listed as 'Contact for pricing.'",
      "toolB": "Mend.io publishes transparent per-developer pricing: up to $1,000/developer/year for Mend AppSec, up to $300/developer/year for Mend AI, and up to $250/developer/year for Mend Renovate Enterprise, with no additional per-GB fees.",
      "whyItMatters": "Published per-unit pricing lets buyers estimate total cost before a sales call, while contact-for-pricing models require more upfront sales engagement.",
      "benefitsWho": "Procurement teams doing early-stage budget comparisons benefit from Mend.io's published per-developer figures."
    },
    {
      "title": "AI Security Coverage",
      "toolA": "Greenbone's documented product line (OPENVAS FREE/BASIC/SCAN/SECURITY INTELLIGENCE) does not include AI-specific security testing features.",
      "toolB": "Mend.io includes AI-BOM and Shadow AI discovery, Automated AI red teaming, and System prompt hardening as dedicated features under its Mend AI product, priced up to $300/developer/year.",
      "whyItMatters": "As organizations adopt AI models and agents, discovering and testing them for security risk becomes a distinct requirement that traditional infrastructure scanners don't address.",
      "benefitsWho": "AppSec teams responsible for AI/LLM governance specifically need Mend.io's Mend AI product; this is not something Greenbone offers."
    },
    {
      "title": "Automated Remediation",
      "toolA": "Greenbone's documented features focus on detection (scanning) rather than automated remediation of found issues.",
      "toolB": "Mend Renovate automates dependency updates at scale with Merge Confidence ratings and workflows, priced up to $250/developer/year as Mend Renovate Enterprise.",
      "whyItMatters": "Automated patching reduces the manual effort required after vulnerabilities are identified, which matters for teams with large dependency trees.",
      "benefitsWho": "Development teams managing many open-source dependencies benefit from Mend Renovate's automated update workflows."
    },
    {
      "title": "Free Access",
      "toolA": "Greenbone offers OPENVAS FREE as a genuine free, open-source scanning edition alongside its paid commercial tiers.",
      "toolB": "Mend.io lists no free plan or free trial; the website offers a 'Schedule a Demo' option instead, requiring a sales conversation to access the product.",
      "whyItMatters": "Whether a tool can be evaluated or used at no cost affects how easily smaller teams or individual developers can get started.",
      "benefitsWho": "Cost-sensitive teams and individual security practitioners benefit from Greenbone's genuinely free OPENVAS FREE tier."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Scanning",
      "rows": [
        {
          "feature": "Network/infrastructure vulnerability scanning",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Greenbone core function"
        },
        {
          "feature": "Software Composition Analysis (SCA)",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Mend.io SCA"
        },
        {
          "feature": "SAST (static application security testing)",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Mend.io High-accuracy SAST"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI model/agent security testing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Mend AI: up to $300/dev/year"
        },
        {
          "feature": "Automated dependency updates",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Mend Renovate"
        },
        {
          "feature": "DAST / API security testing",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "Mend.io offers DAST/API security as separate add-ons"
        }
      ]
    },
    {
      "group": "Access & Pricing",
      "rows": [
        {
          "feature": "Free tier available",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Greenbone OPENVAS FREE; Mend.io has no free plan"
        },
        {
          "feature": "Published pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Mend.io: up to $1000/dev/year (AppSec)"
        },
        {
          "feature": "ISO certification",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Greenbone: ISO 9001, 27001, 14001"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Greenbone and Mend.io compete for the same budget?",
      "answer": "Not directly — Greenbone scans networks and infrastructure for vulnerabilities, while Mend.io secures application code, open-source dependencies, and now AI models/agents. Most organizations would use tools like these for different line items in a security budget."
    },
    {
      "question": "Does Mend.io have a free plan?",
      "answer": "No, Mend.io lists no free plan or free trial; the website offers a 'Schedule a Demo' option instead. Greenbone, by contrast, offers a genuinely free OPENVAS FREE edition."
    },
    {
      "question": "How is Mend.io priced?",
      "answer": "Mend.io publishes per-developer annual pricing: up to $1,000/developer/year for Mend AppSec, up to $300/developer/year for Mend AI, and up to $250/developer/year for Mend Renovate Enterprise, with no additional per-GB fees."
    },
    {
      "question": "Does Greenbone secure AI models or application code?",
      "answer": "No, Greenbone's documented product line (OPENVAS FREE, BASIC, SCAN, SECURITY INTELLIGENCE) focuses on network and infrastructure vulnerability scanning, not application code or AI model security."
    },
    {
      "question": "What is Mend AI?",
      "answer": "Mend AI is Mend.io's product for AI-BOM and Shadow AI discovery, system prompt hardening, automated red teaming, and in-app runtime guardrails, priced up to $300/developer/year."
    },
    {
      "question": "Is Greenbone ISO certified?",
      "answer": "Yes, Greenbone holds ISO 9001, ISO 27001, and ISO 14001 certifications and states its operations are GDPR-compliant. Mend.io's certifications are not documented in available facts."
    }
  ]
};

export default greenboneVsMendIoContent;

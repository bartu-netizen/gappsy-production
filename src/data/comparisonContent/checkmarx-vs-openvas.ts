import type { ToolComparisonContent } from './types';

const checkmarxVsOpenvasContent: ToolComparisonContent = {
  "verdict": "Checkmarx One is a broad, AI-powered application security platform covering SAST, DAST, SCA, container, secrets, IaC, and API security, priced through custom enterprise quotes with no advertised free trial. OpenVAS is a free, open-source network vulnerability scanner maintained by Greenbone since 2006, focused on authenticated and unauthenticated protocol-level testing. They sit at different layers of a security program — application source code and pipelines versus network infrastructure — so choosing between them depends on what surface needs coverage.",
  "bestForToolA": "Enterprises needing a single AI-assisted platform to cover SAST, DAST, SCA, container, secrets, IaC, and API security across a large development organization, especially those needing SOC 2 Type II, ISO 27001, or FedRAMP-aligned vendors.",
  "bestForToolB": "Organizations that need free, self-hosted network vulnerability scanning with a daily-updated detection feed, particularly as part of the broader Greenbone Community Edition.",
  "whoNeedsBoth": "A realistic combination: an enterprise security program runs Checkmarx to scan application source code, dependencies, containers, and IaC templates across its development pipeline, while separately running OpenVAS (or Greenbone Community Edition) to perform network vulnerability scans of the servers and infrastructure that host those applications.",
  "keyDifferences": [
    {
      "title": "Scan Coverage",
      "toolA": "Checkmarx One covers NG SAST (source code analysis), DAST, SCA, container security, secrets detection, IaC security, and API security in one platform.",
      "toolB": "OpenVAS performs authenticated and unauthenticated network vulnerability scanning across internet and industrial protocols; source code or dependency analysis is not documented.",
      "whyItMatters": "Application-layer vulnerabilities (in code, dependencies, containers) and network-layer vulnerabilities require fundamentally different scanning engines.",
      "benefitsWho": "AppSec teams responsible for the SDLC need Checkmarx's coverage; infrastructure/network security teams need OpenVAS's coverage."
    },
    {
      "title": "AI-Powered Remediation",
      "toolA": "Checkmarx includes AI-powered agents — Developer Assist and Triage & Remediation Assist — plus a Checkmarx MCP Server to help developers fix findings faster.",
      "toolB": "Not documented as an OpenVAS feature.",
      "whyItMatters": "AI-assisted triage and remediation can significantly reduce the manual effort of fixing large volumes of findings.",
      "benefitsWho": "Development teams facing a high volume of security findings who want AI-assisted fixes benefit from Checkmarx's agents."
    },
    {
      "title": "Pricing Transparency",
      "toolA": "Checkmarx pricing is fully custom, calculated on developers, apps, and usage, with no public price list and no advertised free trial.",
      "toolB": "OpenVAS is free and open source, forming the core of the free Greenbone Community Edition, with no cost to start.",
      "whyItMatters": "Budget-constrained teams need to know upfront whether a tool is free to adopt or requires a sales conversation and enterprise budget.",
      "benefitsWho": "Startups and small teams with limited security budgets benefit from OpenVAS's zero-cost entry point; large enterprises with dedicated AppSec budgets are the target for Checkmarx's custom pricing."
    },
    {
      "title": "Compliance Certifications",
      "toolA": "Checkmarx holds SOC 2 Type II, ISO 27001 certification, and FedRAMP authorization, and was recognized as a Leader in the 2026 Gartner Magic Quadrant for Software Supply Chain Security.",
      "toolB": "Not documented as holding formal compliance certifications; OpenVAS is instead positioned on its open-source pedigree and daily-updated feed since 2006.",
      "whyItMatters": "Regulated industries and government-adjacent buyers often require vendor compliance attestations before procurement.",
      "benefitsWho": "Enterprises and government-adjacent buyers with formal vendor compliance requirements benefit from Checkmarx's documented certifications."
    },
    {
      "title": "Custom Scan Scripting",
      "toolA": "Not documented as a Checkmarx feature.",
      "toolB": "OpenVAS includes an internal scripting language for writing custom vulnerability tests.",
      "whyItMatters": "The ability to write custom detection logic matters for niche or internally developed protocols and systems.",
      "benefitsWho": "Security engineers who need to write custom network vulnerability tests benefit from OpenVAS's scripting language."
    }
  ],
  "featureMatrix": [
    {
      "group": "Scan Coverage",
      "rows": [
        {
          "feature": "Static application security testing (SAST)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Dynamic application security testing (DAST)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Network / infrastructure vulnerability scanning",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Software composition analysis (SCA)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "IaC security scanning",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Secrets detection in source code",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI-powered remediation agents",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Checkmarx Developer Assist and Triage & Remediation Assist"
        },
        {
          "feature": "Model Context Protocol (MCP) server",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Checkmarx MCP Server"
        },
        {
          "feature": "Custom scan test scripting",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing, Compliance & Support",
      "rows": [
        {
          "feature": "Publicly published pricing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "OpenVAS core is $0; Checkmarx requires a custom quote"
        },
        {
          "feature": "Free / open-source tier",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Formal compliance certifications listed",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "SOC 2 Type II, ISO 27001, FedRAMP"
        },
        {
          "feature": "Enterprise commercial support option",
          "toolA": "available",
          "toolB": "available",
          "note": "Via Greenbone's commercial products for OpenVAS"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Checkmarx free?",
      "answer": "No, Checkmarx One is priced through custom, quote-based sales conversations based on developers, apps, and usage, with no advertised free trial."
    },
    {
      "question": "Is OpenVAS free?",
      "answer": "Yes, OpenVAS is open source and forms the core of the free Greenbone Community Edition."
    },
    {
      "question": "Does Checkmarx scan network infrastructure?",
      "answer": "This is not documented as a Checkmarx capability; its documented scope is application source code, dependencies, containers, IaC, and APIs."
    },
    {
      "question": "Does OpenVAS analyze application source code?",
      "answer": "This is not documented as an OpenVAS capability; its documented scope is authenticated and unauthenticated network protocol scanning."
    },
    {
      "question": "Which tool uses AI?",
      "answer": "Checkmarx includes AI-powered agents (Developer Assist, Triage & Remediation Assist) and a Checkmarx MCP Server; AI features are not documented for OpenVAS."
    },
    {
      "question": "Who are these tools built for?",
      "answer": "Checkmarx is built for enterprise application security teams needing broad SDLC coverage with custom pricing, while OpenVAS is built for teams needing a free, self-hosted network vulnerability scanner."
    }
  ]
};

export default checkmarxVsOpenvasContent;

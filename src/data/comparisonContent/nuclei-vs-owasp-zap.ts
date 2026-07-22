import type { ToolComparisonContent } from './types';

const nucleiVsOwaspZapContent: ToolComparisonContent = {
  "verdict": "Nuclei is ProjectDiscovery's YAML-template-based scanner, using a library of over 6,500 community templates to scan applications, infrastructure, and cloud platforms across multiple protocols (TCP, DNS, HTTP, file-based), with an optional paid Cloud tier for reporting and ticketing. OWASP ZAP is a free, open-source web application security scanner backed by Checkmarx, extended through a community add-on marketplace and explicitly documented as beginner-friendly with quick-start guides. Both are free at their core, but Nuclei is a command-line-first, template-driven tool built for automation and scale, while ZAP leans toward accessible, guided web app scanning.",
  "bestForToolA": "Security teams that want fast, parallel, template-driven scanning across multiple protocols and asset types (not just web apps), integrated into CI/CD pipelines, and who are comfortable with a command-line-first workflow.",
  "bestForToolB": "Users new to security testing who want beginner-friendly documentation and quick-start guides for automated web application scanning, extensible through a community add-on marketplace.",
  "whoNeedsBoth": "A security team could run Nuclei in CI/CD pipelines for fast, automated template-based vulnerability scanning on every build, while using OWASP ZAP for deeper, more interactive web application scanning sessions extended through its add-on marketplace — the two serve complementary roles (automated pipeline scanning vs. focused web app testing) rather than duplicating each other.",
  "keyDifferences": [
    {
      "title": "Scanning Scope",
      "toolA": "Nuclei scans applications, infrastructure, and cloud platforms across TCP, DNS, HTTP, and file-based protocols.",
      "toolB": "OWASP ZAP is documented specifically as a web application security scanner, without infrastructure or multi-protocol scanning described.",
      "whyItMatters": "Teams needing to scan beyond web apps (network services, DNS, cloud assets) need broader protocol support than a web-app-only scanner provides.",
      "benefitsWho": "Teams with infrastructure and multi-protocol scanning needs benefit from Nuclei's broader scope."
    },
    {
      "title": "Paid Tier Availability",
      "toolA": "Nuclei has an optional Cloud tier (contact for pricing) that adds comprehensive reporting and ticketing integrations with Jira and Splunk.",
      "toolB": "OWASP ZAP has no official paid support tier or cloud offering documented — it operates as free, open-source software with a single plan.",
      "whyItMatters": "A paid tier with ticketing integrations matters for teams that need vulnerability findings to flow directly into their existing workflow tools.",
      "benefitsWho": "Security teams already using Jira or Splunk for tracking benefit from Nuclei's optional Cloud integrations."
    },
    {
      "title": "Extensibility Model",
      "toolA": "Nuclei's extensibility is template-driven, built on a library of over 6,500 community-contributed YAML templates.",
      "toolB": "OWASP ZAP's extensibility is add-on-driven, via a marketplace of community-contributed add-ons.",
      "whyItMatters": "The two extension models suit different workflows — YAML templates are easy to write and share for specific detection rules, while add-ons can extend the scanner's core functionality more broadly.",
      "benefitsWho": "Teams wanting quick, shareable detection rules benefit from Nuclei's template model; teams wanting broader tool functionality benefit from ZAP's add-on marketplace."
    },
    {
      "title": "Beginner Accessibility",
      "toolA": "Nuclei's own listed cons describe it as a 'command-line first tool that requires scripting knowledge to use effectively.'",
      "toolB": "OWASP ZAP explicitly markets beginner-friendly resources, including quick-start guides for users new to security testing.",
      "whyItMatters": "The learning curve differs significantly, affecting how quickly a new team member can become productive.",
      "benefitsWho": "Users new to security testing benefit from ZAP's documented beginner-friendly onboarding."
    },
    {
      "title": "Governance & Backing",
      "toolA": "Nuclei is maintained by ProjectDiscovery, the company that also offers its optional paid Cloud tier.",
      "toolB": "OWASP ZAP is backed by Checkmarx while remaining an independent open-source project maintained by the ZAP Dev Team.",
      "whyItMatters": "Understanding who maintains and funds a security tool matters for organizations assessing long-term project stability and vendor relationships.",
      "benefitsWho": "Organizations weighing vendor independence in their security tooling should note ZAP's explicitly independent governance model."
    }
  ],
  "featureMatrix": [
    {
      "group": "Scanning Capabilities",
      "rows": [
        {
          "feature": "Multi-protocol scanning (TCP, DNS, HTTP, file-based)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Infrastructure and cloud platform scanning",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Automated web app scanning",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Authentication handling (basic auth, JWT)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Parallel scanning for speed at scale",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Extensibility",
      "rows": [
        {
          "feature": "Community template library",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "6,500+ YAML templates"
        },
        {
          "feature": "Add-on marketplace",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "CI/CD pipeline integration",
          "toolA": "available",
          "toolB": "available",
          "note": "ZAP via its automation support"
        }
      ]
    },
    {
      "group": "Access & Support",
      "rows": [
        {
          "feature": "Free open-source core",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Paid cloud/reporting tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Nuclei Cloud: contact for pricing"
        },
        {
          "feature": "Ticketing integrations (Jira, Splunk)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Nuclei Cloud tier"
        },
        {
          "feature": "Beginner-friendly onboarding resources",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Quick-start guides"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are both tools free?",
      "answer": "Yes. Nuclei's core CLI scanner is free and open source, and OWASP ZAP is entirely free and open source with no paid tier documented. Nuclei additionally offers an optional paid Cloud tier for reporting and ticketing."
    },
    {
      "question": "Which is more beginner-friendly?",
      "answer": "OWASP ZAP explicitly documents beginner-friendly resources and quick-start guides. Nuclei is described in its own cons as a command-line-first tool that requires scripting knowledge to use effectively."
    },
    {
      "question": "Which integrates with ticketing systems like Jira?",
      "answer": "Nuclei's optional Cloud tier supports Jira and Splunk ticketing integrations. OWASP ZAP does not document ticketing system integrations."
    },
    {
      "question": "Which supports scanning beyond web applications?",
      "answer": "Nuclei scans applications, infrastructure, and cloud platforms across multiple protocols (TCP, DNS, HTTP, file-based). OWASP ZAP's documented scope is web application scanning."
    },
    {
      "question": "How is each tool extended?",
      "answer": "Nuclei is extended through YAML templates, with a library of over 6,500 community-contributed templates. OWASP ZAP is extended through a marketplace of community-contributed add-ons."
    },
    {
      "question": "Who maintains each project?",
      "answer": "Nuclei is maintained by ProjectDiscovery. OWASP ZAP is maintained by the ZAP Dev Team and backed by Checkmarx while remaining an independent open-source project."
    }
  ]
};

export default nucleiVsOwaspZapContent;

import type { ToolComparisonContent } from './types';

const securityOnionVsTrivyContent: ToolComparisonContent = {
  "verdict": "Security Onion and Trivy are both free, open-source security tools, but they operate at completely different layers: Security Onion is a network security monitoring and threat hunting platform built on Suricata, Zeek, and the Elastic Stack for detecting active threats, while Trivy is Aqua Security's all-in-one scanner for finding vulnerabilities, misconfigurations, secrets, and generating SBOMs in code, container images, and Kubernetes clusters before they run in production. The two rarely compete directly — one watches live traffic and hosts, the other scans artifacts and infrastructure definitions earlier in the pipeline.",
  "bestForToolA": "Security Onion fits security operations teams doing network security monitoring, threat hunting, and log management on live infrastructure, with an optional Pro tier adding Onion AI for AI-driven alert analysis and detection tuning.",
  "bestForToolB": "Trivy fits DevSecOps and platform engineering teams that need to scan code repositories, container images, and Kubernetes clusters for vulnerabilities, misconfigurations, and secrets as part of CI/CD, and generate SBOMs, all under the free Apache-2.0 license.",
  "whoNeedsBoth": "A DevSecOps team could use Trivy in CI/CD to catch vulnerabilities, secrets, and misconfigurations before container images are deployed, then run Security Onion in production to monitor network traffic and hunt for threats against the systems those images run on — covering pre-deployment and runtime security respectively.",
  "keyDifferences": [
    {
      "title": "Security Layer Covered",
      "toolA": "Security Onion focuses on Network Security Monitoring and Threat Hunting — analyzing live network traffic and logs for active threats.",
      "toolB": "Trivy focuses on Vulnerability scanning, Misconfiguration detection, Secret scanning, and SBOM generation across code, images, and clusters before or independent of runtime.",
      "whyItMatters": "Runtime threat detection and pre-deployment artifact scanning address different stages of the security lifecycle and are typically not substitutes for each other.",
      "benefitsWho": "SOC analysts monitoring live traffic need Security Onion; developers and CI/CD pipelines scanning build artifacts need Trivy."
    },
    {
      "title": "Deployment Model",
      "toolA": "Security Onion is deployed as a full platform (built on Suricata, Zeek, and the Elastic Stack) that requires in-house expertise to deploy and tune for network monitoring.",
      "toolB": "Trivy is a CLI-first tool that integrates with CI/CD or the command line rather than offering a hosted dashboard out of the box, and integrates with Docker, GitLab, Azure Container Registry, and Harbor.",
      "whyItMatters": "Platform-style deployments suit dedicated security infrastructure, while CLI-first tools slot directly into existing developer workflows.",
      "benefitsWho": "Security engineering teams building a SOC benefit from Security Onion's platform approach; developers automating pipeline checks benefit from Trivy's CLI-first design."
    },
    {
      "title": "SBOM & Supply Chain Coverage",
      "toolA": "Security Onion's documented features do not include SBOM generation or software supply chain scanning.",
      "toolB": "Trivy produces a Software Bill of Materials for container images and file systems and performs License checking on project dependencies.",
      "whyItMatters": "Software supply chain visibility (SBOMs, license risk) is increasingly required for compliance and vendor risk assessments.",
      "benefitsWho": "Teams needing SBOM compliance artifacts for audits or customers rely on Trivy, not Security Onion."
    },
    {
      "title": "AI Features",
      "toolA": "Security Onion offers Onion AI for AI-assisted alert analysis and detection tuning, with local model support in the paid Pro tier.",
      "toolB": "Trivy's documented features do not include an AI capability.",
      "whyItMatters": "AI-assisted triage helps reduce the volume of alerts a human analyst must review manually.",
      "benefitsWho": "SOC teams managing high alert volume may value Security Onion's Onion AI feature."
    },
    {
      "title": "Licensing & Support Model",
      "toolA": "Security Onion's Community edition is free, with an optional paid Pro tier whose pricing is not publicly disclosed.",
      "toolB": "Trivy is entirely free and open source under the permissive Apache-2.0 license, maintained by Aqua Security, with no official enterprise support plan documented on its website.",
      "whyItMatters": "Understanding what, if anything, requires payment shapes long-term budget planning for either tool.",
      "benefitsWho": "Teams wanting a fully free tool with no paid upsell path benefit from Trivy's model; teams wanting an optional paid support path benefit from Security Onion Pro."
    }
  ],
  "featureMatrix": [
    {
      "group": "Detection Scope",
      "rows": [
        {
          "feature": "Network traffic monitoring",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Security Onion via Suricata/Zeek"
        },
        {
          "feature": "Container image vulnerability scanning",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Trivy"
        },
        {
          "feature": "Kubernetes cluster scanning",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Trivy Kubernetes scanning"
        },
        {
          "feature": "Secret scanning in code/images",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Trivy Secret scanning"
        }
      ]
    },
    {
      "group": "Supply Chain & Compliance",
      "rows": [
        {
          "feature": "SBOM generation",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Trivy SBOM generation"
        },
        {
          "feature": "License risk checking",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Trivy License checking"
        },
        {
          "feature": "Threat hunting / log investigation",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Security Onion Threat Hunting"
        }
      ]
    },
    {
      "group": "Deployment & Cost",
      "rows": [
        {
          "feature": "Free open-source core",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "AI-assisted analysis",
          "toolA": "limited",
          "toolB": "unavailable",
          "note": "Security Onion Onion AI (local models require Pro)"
        },
        {
          "feature": "CI/CD-native CLI usage",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Trivy integrates with GitLab, Docker, ACR, Harbor"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Security Onion and Trivy compete with each other?",
      "answer": "Not directly — Security Onion monitors live network traffic and hosts for active threats, while Trivy scans code, container images, and Kubernetes clusters for vulnerabilities, misconfigurations, and secrets, typically earlier in the development pipeline."
    },
    {
      "question": "Which tool generates SBOMs?",
      "answer": "Trivy produces a Software Bill of Materials for container images and file systems. Security Onion does not document SBOM generation among its features."
    },
    {
      "question": "Are both tools free?",
      "answer": "Yes. Security Onion's Community edition is free and open source, with an optional paid Pro tier for AI features. Trivy is entirely free and open source under the Apache-2.0 license with no paid tier documented."
    },
    {
      "question": "Which tool is better for CI/CD pipelines?",
      "answer": "Trivy is CLI-first and integrates with CI/CD systems and registries like Docker, GitLab, Azure Container Registry, and Harbor. Security Onion is a network monitoring platform, not a CI/CD scanning tool."
    },
    {
      "question": "Does Security Onion scan container images or code?",
      "answer": "No, Security Onion's documented features focus on network security monitoring, threat hunting, and log management rather than scanning code repositories or container images."
    },
    {
      "question": "Which tool has AI features?",
      "answer": "Security Onion offers Onion AI for AI-assisted alert analysis and detection tuning, with local model support in its paid Pro tier. Trivy's documented feature list does not include AI capabilities."
    }
  ]
};

export default securityOnionVsTrivyContent;

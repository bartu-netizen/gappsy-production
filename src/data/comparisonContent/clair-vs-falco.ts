import type { ToolComparisonContent } from './types';

const clairVsFalcoContent: ToolComparisonContent = {
  "verdict": "Clair and Falco are complementary, both free and open source, but they secure different stages of the container lifecycle — Clair statically analyzes container images before deployment, matching indexed contents against vulnerability databases and powering the Quay registry's scanning, while Falco monitors running hosts, containers, Kubernetes, and cloud services in real time using eBPF to catch abnormal behavior after deployment. Clair answers whether an image contains known vulnerabilities before it ships; Falco answers whether something running right now is behaving abnormally.",
  "bestForToolA": "Clair fits teams wanting free, self-hosted static vulnerability scanning integrated into a registry or CI/CD pipeline before images are deployed, as used by the Quay container registry, supporting Ubuntu, Debian, RHEL, SUSE, Oracle, Alpine, Amazon Linux, VMware Photon, and Python packages.",
  "bestForToolB": "Falco fits platform and security teams wanting free, CNCF-graduated runtime threat detection across hosts, containers, and Kubernetes with low-overhead eBPF monitoring and 50+ integrations to forward alerts to SIEM tooling.",
  "whoNeedsBoth": "A DevSecOps team implementing a shift-left-plus-runtime security strategy would naturally run both — using Clair to scan container images for known vulnerabilities before they're deployed (e.g., in CI/CD or via a registry like Quay), then running Falco to monitor those same containers for abnormal runtime behavior once deployed to Kubernetes, since pre-deployment scanning and runtime detection are complementary, not competing, layers of container security.",
  "keyDifferences": [
    {
      "title": "Security Lifecycle Stage",
      "toolA": "Static, pre-deployment analysis of container image contents.",
      "toolB": "Real-time, runtime monitoring of running hosts, containers, Kubernetes, and cloud services.",
      "whyItMatters": "A complete container security posture needs both pre-deployment scanning and runtime detection, since each catches different classes of risk.",
      "benefitsWho": "Benefits DevSecOps teams building a defense-in-depth strategy."
    },
    {
      "title": "Analysis Method",
      "toolA": "Parses image contents (manifests, packages) without executing the container, matching against continuously ingested vulnerability data.",
      "toolB": "Uses eBPF to observe live Linux kernel events with low overhead.",
      "whyItMatters": "Static parsing vs. live kernel-level observation are fundamentally different detection techniques suited to different threats.",
      "benefitsWho": "Benefits security engineers designing layered detection pipelines."
    },
    {
      "title": "Ecosystem Integration",
      "toolA": "Powers vulnerability scanning behind the Quay container registry and is typically consumed via API or an integrated registry rather than a standalone UI.",
      "toolB": "Deploys via an official Helm chart to Kubernetes distributions (GKE, EKS, AKS) and forwards alerts to 50+ SIEM/data lake integrations.",
      "whyItMatters": "Teams need to know how each tool plugs into existing registry and cluster infrastructure.",
      "benefitsWho": "Benefits teams already using Quay (Clair) or running Kubernetes clusters needing SIEM alert forwarding (Falco)."
    },
    {
      "title": "Alerting & Notification",
      "toolA": "Includes a notification service that alerts when new vulnerabilities are found affecting previously indexed images.",
      "toolB": "Generates real-time streaming JSON alerts for automated response pipelines.",
      "whyItMatters": "Clair's alerts are retrospective (new CVEs affecting old images), while Falco's are live behavioral alerts — a full program needs both signal types.",
      "benefitsWho": "Benefits security teams wanting continuous coverage of both newly disclosed vulnerabilities and live anomalies."
    },
    {
      "title": "Governance",
      "toolA": "Distributed via GitHub and built on the ClairCore library, without CNCF graduation status documented.",
      "toolB": "CNCF-graduated project under The Linux Foundation, originally created by Sysdig.",
      "whyItMatters": "CNCF graduation signals a maturity/governance bar that some enterprise buyers use as a procurement filter.",
      "benefitsWho": "Benefits enterprises with open-source governance requirements in vendor/tool selection policy."
    }
  ],
  "featureMatrix": [
    {
      "group": "Detection Approach",
      "rows": [
        {
          "feature": "Static image vulnerability scanning",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Runtime behavioral anomaly detection",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "eBPF-based monitoring",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Vulnerability database matching",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Coverage & Deployment",
      "rows": [
        {
          "feature": "Kubernetes-native deployment (Helm chart)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Distribution/package coverage",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Clair: Ubuntu, Debian, RHEL, SUSE, Oracle, Alpine, Amazon Linux, VMware Photon, Python"
        },
        {
          "feature": "Multi-architecture support (x64/ARM)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Self-hosting required",
          "toolA": "available",
          "toolB": "available",
          "note": "Neither offers an official managed/hosted SaaS"
        }
      ]
    },
    {
      "group": "Ecosystem & Governance",
      "rows": [
        {
          "feature": "Notification/alerting service",
          "toolA": "available",
          "toolB": "available",
          "note": "Clair: new CVEs on indexed images; Falco: real-time streaming JSON alerts"
        },
        {
          "feature": "Third-party integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Falco: 50+ SIEM/data lake integrations"
        },
        {
          "feature": "CNCF graduated status",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Used by a named production platform",
          "toolA": "available",
          "toolB": "available",
          "note": "Clair: Quay registry; Falco: cited at Shopify, GitLab"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Clair and Falco do the same job?",
      "answer": "No — Clair statically scans container images for known vulnerabilities before deployment, while Falco monitors running systems for abnormal behavior at runtime."
    },
    {
      "question": "Are both free?",
      "answer": "Yes, both are fully free and open source with no licensing fees."
    },
    {
      "question": "Which one does Quay use?",
      "answer": "Clair is used as the vulnerability scanner behind the Quay container registry."
    },
    {
      "question": "Which is CNCF graduated?",
      "answer": "Falco is a CNCF-graduated project under The Linux Foundation; CNCF status is not documented for Clair."
    },
    {
      "question": "Does either require self-hosting?",
      "answer": "Yes — both require self-hosting and operational setup, with no official managed or hosted SaaS offering documented from either project."
    },
    {
      "question": "Can Clair and Falco be used together?",
      "answer": "Yes, they're commonly complementary — Clair for pre-deployment image scanning and Falco for post-deployment runtime detection, covering different stages of the container lifecycle."
    }
  ]
};

export default clairVsFalcoContent;

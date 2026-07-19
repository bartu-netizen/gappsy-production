import type { ToolComparisonContent } from './types';

const syftVsTrivyContent: ToolComparisonContent = {
  "verdict": "Syft and Trivy are both free, open-source, Go-based command-line tools from the container security ecosystem, but they differ in scope: Syft, sponsored by Anchore, is a focused SBOM generator that catalogs every software component packaged inside container images and filesystems into a detailed bill of materials, while Trivy, from Aqua Security, is an all-in-one scanner bundling vulnerability scanning, misconfiguration detection, secret scanning, SBOM generation, and Kubernetes scanning into a single tool. Teams that specifically want the deepest, most format-flexible SBOM tool — designed to pair with Grype for vulnerability scanning — lean toward Syft; teams that want one tool to cover vulnerabilities, secrets, misconfigurations, and SBOMs together lean toward Trivy.",
  "bestForToolA": "Syft fits teams that want a dedicated, best-in-class SBOM generator. It reads package data from Debian and Alpine images, RPM-based systems, and codebases written in Go, Java, JavaScript, Python, Ruby, Rust, PHP, or .NET, then exports SBOMs to CycloneDX, SPDX, or Syft's own JSON format — built to pair with Grype for vulnerability scanning.",
  "bestForToolB": "Trivy fits teams that want a single all-in-one scanner covering vulnerability scanning, misconfiguration detection, secret scanning, SBOM generation, and Kubernetes cluster scanning without needing to combine multiple separate tools.",
  "whoNeedsBoth": "A platform engineering team already using Trivy for day-to-day vulnerability and misconfiguration scanning might still reach for Syft specifically when they need the most detailed SBOM with signed in-toto attestations or need to convert between SBOM formats — a task Syft documents explicitly and Trivy does not detail to the same degree.",
  "keyDifferences": [
    {
      "title": "Scope of Functionality",
      "toolA": "Syft is purpose-built for one job: SBOM generation from container images, filesystems, and archives, plus format conversion between standards.",
      "toolB": "Trivy is an all-in-one scanner combining vulnerability scanning, misconfiguration detection, secret scanning, SBOM generation, and license checking, plus Kubernetes cluster scanning.",
      "whyItMatters": "A focused single-purpose tool can go deeper on that one function, while an all-in-one tool reduces the number of separate tools a pipeline needs to integrate.",
      "benefitsWho": "Teams wanting maximum SBOM depth and flexibility benefit from Syft; teams wanting to consolidate scanning tooling benefit from Trivy."
    },
    {
      "title": "SBOM Format Support",
      "toolA": "Syft exports SBOMs in CycloneDX, SPDX, and its own Syft JSON format, can convert between those supported standards, and is able to produce cryptographically signed SBOM attestations built on the in-toto spec.",
      "toolB": "Trivy's SBOM generation feature produces a Software Bill of Materials for container images and file systems, without documented format-conversion or signed-attestation capabilities.",
      "whyItMatters": "Format conversion and signed attestations matter for organizations with specific downstream SBOM consumption or supply-chain verification requirements.",
      "benefitsWho": "Supply-chain security teams needing signed, standards-flexible SBOMs benefit from Syft's documented attestation and conversion features."
    },
    {
      "title": "Vulnerability Scanning",
      "toolA": "Syft does not scan for vulnerabilities itself; it is designed to pair directly with Grype, a separate Anchore tool, for that function.",
      "toolB": "Trivy includes native Vulnerability scanning that detects known CVEs in OS packages and application dependencies as a built-in feature.",
      "whyItMatters": "Needing a second tool (Grype) to get vulnerability detection adds a setup step compared to Trivy's built-in scanning.",
      "benefitsWho": "Teams wanting vulnerability detection out of the box in a single tool benefit from Trivy; teams already invested in the Anchore/Grype ecosystem benefit from Syft's tight pairing with Grype."
    },
    {
      "title": "Kubernetes & Misconfiguration Coverage",
      "toolA": "Syft's documented features do not include Kubernetes cluster scanning or Infrastructure as Code misconfiguration detection.",
      "toolB": "Trivy includes Kubernetes scanning (assessing running clusters for vulnerabilities and misconfigurations) and Misconfiguration detection for Infrastructure as Code files.",
      "whyItMatters": "Runtime Kubernetes and IaC misconfiguration coverage extends security scanning beyond just software components.",
      "benefitsWho": "Platform teams managing Kubernetes infrastructure benefit from Trivy's cluster-scanning capability, which Syft does not offer."
    },
    {
      "title": "Image Format Support",
      "toolA": "Image support for Syft spans OCI, Docker, and Singularity formats.",
      "toolB": "Trivy integrates with Docker, GitLab, Azure Container Registry, and Harbor for scanning.",
      "whyItMatters": "Support for specific image formats and registries determines how easily a tool fits into an existing container pipeline.",
      "benefitsWho": "Teams using Singularity images specifically benefit from Syft's documented support for that format, which Trivy's facts do not mention."
    }
  ],
  "featureMatrix": [
    {
      "group": "SBOM Capabilities",
      "rows": [
        {
          "feature": "SBOM generation",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "CycloneDX/SPDX export",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Syft explicitly documents both formats"
        },
        {
          "feature": "SBOM format conversion",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Syft Format conversion"
        },
        {
          "feature": "Signed SBOM attestations",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Syft in-toto attestations"
        }
      ]
    },
    {
      "group": "Scanning Capabilities",
      "rows": [
        {
          "feature": "Vulnerability (CVE) scanning",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Trivy native; Syft pairs with Grype instead"
        },
        {
          "feature": "Secret scanning",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Trivy Secret scanning"
        },
        {
          "feature": "IaC misconfiguration detection",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Trivy Misconfiguration detection"
        },
        {
          "feature": "Kubernetes cluster scanning",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Trivy Kubernetes scanning"
        }
      ]
    },
    {
      "group": "Licensing & Ecosystem",
      "rows": [
        {
          "feature": "Free and open source",
          "toolA": "available",
          "toolB": "available",
          "note": "Syft: Apache-2.0; Trivy: Apache-2.0"
        },
        {
          "feature": "License risk checking",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Trivy License checking"
        },
        {
          "feature": "Package ecosystem breadth",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Syft documents Alpine, Debian, RPM, Go, Python, Java, JS, Ruby, Rust, PHP, .NET"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the main difference between Syft and Trivy?",
      "answer": "Syft is a focused SBOM generator built to pair with Grype for vulnerability scanning, while Trivy is an all-in-one scanner that includes SBOM generation alongside vulnerability scanning, misconfiguration detection, secret scanning, and Kubernetes cluster scanning in a single tool."
    },
    {
      "question": "Does Syft scan for vulnerabilities?",
      "answer": "No, Syft is designed to generate SBOMs that Grype, a separate Anchore tool, can then scan for vulnerabilities. Trivy, by contrast, includes native vulnerability scanning as a built-in feature."
    },
    {
      "question": "Are Syft and Trivy both free?",
      "answer": "Yes — both ship under the Apache 2.0 open-source license at no cost, and neither tool documents any paid tier."
    },
    {
      "question": "Which tool supports more SBOM formats?",
      "answer": "Syft documents export to CycloneDX, SPDX, and its own Syft JSON format, plus format conversion between standards and signed in-toto attestations. Trivy's SBOM generation is documented as producing an SBOM for images and file systems without the same level of documented format-conversion detail."
    },
    {
      "question": "Can Trivy scan Kubernetes clusters?",
      "answer": "Yes, Trivy's Kubernetes scanning feature assesses running Kubernetes clusters for vulnerabilities and misconfigurations. Syft's documented features do not include Kubernetes cluster scanning."
    },
    {
      "question": "Who maintains Syft and Trivy?",
      "answer": "Syft is sponsored by Anchore and written in Go. Trivy is developed by Aqua Security Software Ltd. and also written in Go."
    }
  ]
};

export default syftVsTrivyContent;

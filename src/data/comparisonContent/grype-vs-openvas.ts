import type { ToolComparisonContent } from './types';

const grypeVsOpenvasContent: ToolComparisonContent = {
  "verdict": "Grype and OpenVAS are both free, open-source vulnerability scanners, but they target different attack surfaces. Built by Anchore, Grype inspects container images, filesystem trees, and SBOMs to flag known vulnerabilities across OS packages and language dependencies, prioritizing results with EPSS and CISA KEV data. OpenVAS, maintained by Greenbone since 2006, is a network vulnerability scanner that performs authenticated and unauthenticated testing across internet and industrial protocols, forming the core of Greenbone Community Edition. Neither replaces the other because they scan fundamentally different things.",
  "bestForToolA": "DevSecOps teams who need to scan container images, filesystems, or SBOM files (CycloneDX/SPDX) in CI/CD pipelines, with EPSS and CISA KEV data to prioritize which vulnerabilities to fix first.",
  "bestForToolB": "Security teams performing network vulnerability assessments against live infrastructure, including both authenticated and unauthenticated scans across internet and industrial protocols.",
  "whoNeedsBoth": "A realistic complementary setup: use Grype in CI/CD to catch dependency and container vulnerabilities before deployment, and run OpenVAS (or the broader Greenbone Community Edition it powers) against deployed infrastructure to catch network-facing exposures — supply-chain security and network security are different layers that both need coverage.",
  "keyDifferences": [
    {
      "title": "Scan Target",
      "toolA": "Grype scans container images, filesystems, and SBOM files for known vulnerabilities.",
      "toolB": "OpenVAS performs authenticated and unauthenticated testing directly against network-facing systems across many protocol types.",
      "whyItMatters": "Supply-chain vulnerabilities in code dependencies and network-exposed service vulnerabilities require entirely different scanning techniques.",
      "benefitsWho": "Application/DevSecOps teams need Grype's approach; infrastructure/network security teams need OpenVAS's approach."
    },
    {
      "title": "Ecosystem Coverage",
      "toolA": "Grype's OS package detection spans Alpine, Debian, Ubuntu, RHEL, Oracle Linux, and Amazon Linux, and it also tracks language-level dependencies across Ruby, Java, JavaScript, Python, .NET, Go, PHP, and Rust.",
      "toolB": "OpenVAS is not documented as scanning language package dependencies; it focuses on internet and industrial protocol testing.",
      "whyItMatters": "Modern applications depend on many language ecosystems whose vulnerabilities live in dependency manifests, not network services.",
      "benefitsWho": "Development teams tracking vulnerable dependencies across multiple programming languages benefit specifically from Grype's coverage."
    },
    {
      "title": "Vulnerability Prioritization",
      "toolA": "To help teams decide what to patch first, Grype combines EPSS scores, CISA KEV data, and its own risk scoring, and it also supports OpenVEX for filtering results.",
      "toolB": "Not documented as an OpenVAS feature; OpenVAS pulls detection tests from a feed updated daily but doesn't document EPSS/KEV-based scoring.",
      "whyItMatters": "Prioritization data reduces alert fatigue by helping teams focus on vulnerabilities that are actually being exploited in the wild.",
      "benefitsWho": "Teams drowning in vulnerability findings who need to triage by real-world exploitability benefit from Grype's EPSS/KEV integration."
    },
    {
      "title": "Feed Update Cadence",
      "toolA": "Not documented with a specific update cadence claim.",
      "toolB": "OpenVAS explicitly pulls vulnerability detection tests from a feed that is updated daily.",
      "whyItMatters": "Fresh detection signatures matter for catching newly disclosed network vulnerabilities quickly.",
      "benefitsWho": "Network security teams who need documented, predictable feed freshness benefit from OpenVAS's daily update cadence."
    },
    {
      "title": "Deployment Form",
      "toolA": "Grype runs purely from the terminal -- it ships no graphical dashboard -- and can be installed via curl, Homebrew, Docker, Chocolatey, or MacPorts.",
      "toolB": "OpenVAS is documented as best used as part of the broader Greenbone Community Edition rather than standalone, with enterprise features requiring Greenbone's commercial products.",
      "whyItMatters": "Teams need to know whether they're adopting a CLI utility for pipelines or a broader scanning suite for ongoing operations.",
      "benefitsWho": "CI/CD pipeline engineers benefit from Grype's lightweight CLI; security operations teams benefit from OpenVAS's role inside the fuller Greenbone suite."
    }
  ],
  "featureMatrix": [
    {
      "group": "Scan Scope",
      "rows": [
        {
          "feature": "Container image scanning",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Filesystem / SBOM scanning",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Network / host vulnerability scanning",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Industrial protocol testing",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Detection & Prioritization",
      "rows": [
        {
          "feature": "Language dependency vulnerability detection",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Ruby, Java, JavaScript, Python, .NET, Go, PHP, Rust"
        },
        {
          "feature": "EPSS / CISA KEV prioritization",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Daily-updated vulnerability feed",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Custom scan scripting language",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Ecosystem",
      "rows": [
        {
          "feature": "Free and open source",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Standalone CLI usage",
          "toolA": "available",
          "toolB": "limited",
          "note": "OpenVAS documented as best used within Greenbone Community Edition"
        },
        {
          "feature": "Commercial / enterprise tier available",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Via Greenbone's commercial products"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What does Grype scan that OpenVAS doesn't?",
      "answer": "Grype scans container images, filesystems, and SBOM files for OS package and language dependency vulnerabilities; this scan scope is not documented for OpenVAS."
    },
    {
      "question": "What does OpenVAS scan that Grype doesn't?",
      "answer": "OpenVAS performs authenticated and unauthenticated network vulnerability scanning across internet and industrial protocols, which is not documented as a Grype capability."
    },
    {
      "question": "Are both tools free?",
      "answer": "Yes -- Grype is released under Apache-2.0, and OpenVAS, which forms the core of Greenbone Community Edition, is likewise free and open source."
    },
    {
      "question": "Does Grype prioritize which vulnerabilities to fix first?",
      "answer": "Yes, Grype uses EPSS scores, CISA's Known Exploited Vulnerabilities list, and risk scoring to help prioritize remediation; this specific prioritization method is not documented for OpenVAS."
    },
    {
      "question": "Can Grype and OpenVAS be used together?",
      "answer": "Yes — they address different layers, so many teams run Grype in CI/CD for container and dependency scanning while using OpenVAS for network-facing infrastructure scanning."
    },
    {
      "question": "Does OpenVAS scan container images?",
      "answer": "This is not documented as an OpenVAS capability; its documented scope is network and protocol-based scanning rather than container image analysis."
    }
  ]
};

export default grypeVsOpenvasContent;

import type { ToolComparisonContent } from './types';

const greenboneVsSyftContent: ToolComparisonContent = {
  "verdict": "Greenbone and Syft both sit in the vulnerability and software-supply-chain security space but serve very different jobs: Greenbone is a German vulnerability management vendor offering the open-source OpenVAS scanner plus a tiered family of commercial network vulnerability scanning products, while Syft is Anchore's free, open-source CLI tool specifically for generating Software Bills of Materials from container images and filesystems. Teams scanning networks and infrastructure for known vulnerabilities need Greenbone; teams that need to inventory exactly what software components are inside their containers and codebases need Syft.",
  "bestForToolA": "Greenbone fits organizations that need automated network and infrastructure vulnerability scanning backed by a daily-updated database of 100,000+ tests, with deployment flexibility across hardware appliances, virtual machines, or cloud, and ISO 9001/27001/14001 certification.",
  "bestForToolB": "Syft fits development and platform teams that need to generate detailed SBOMs from container images and filesystems across a wide package ecosystem (Alpine, Debian, RPM, Go, Python, Java, JavaScript, Ruby, Rust, PHP, .NET) in CycloneDX, SPDX, or Syft's own format.",
  "whoNeedsBoth": "A security team could use Syft in CI/CD to generate an SBOM documenting exactly what's inside each container image before deployment, while running Greenbone's network vulnerability scanners against the live infrastructure hosting those containers to catch network-level and configuration vulnerabilities that an SBOM alone wouldn't reveal.",
  "keyDifferences": [
    {
      "title": "Primary Function",
      "toolA": "Greenbone's core feature is Automated vulnerability scanning of networks and IT infrastructure, backed by a Daily-updated test database of 100,000+ tests.",
      "toolB": "Syft's core function is SBOM generation, creating a bill of materials from container images, filesystems, and archives rather than scanning for vulnerabilities directly.",
      "whyItMatters": "Vulnerability scanning identifies exploitable weaknesses, while SBOM generation documents software composition — the two answer different security questions.",
      "benefitsWho": "Network security teams need Greenbone's vulnerability scanning; software supply-chain and compliance teams need Syft's component inventory."
    },
    {
      "title": "Pricing Model",
      "toolA": "Greenbone offers a free OPENVAS FREE tier alongside paid BASIC, SCAN, and SECURITY INTELLIGENCE tiers, all priced on a 'Contact for pricing' basis with no published numbers.",
      "toolB": "Syft is entirely free and open source under Apache-2.0, with a single Open Source plan and no paid tier at all.",
      "whyItMatters": "Whether a tool has any paid tier at all — and whether that pricing is public — shapes procurement timelines and total cost.",
      "benefitsWho": "Budget-constrained teams benefit from Syft having zero cost regardless of scale, while enterprise buyers needing dedicated support may accept Greenbone's contact-for-pricing paid tiers."
    },
    {
      "title": "Deployment Options",
      "toolA": "Greenbone is available as hardware appliances, virtual machines, or cloud-based deployments, giving buyers flexibility in how they run it.",
      "toolB": "Syft installs via Homebrew, Docker, Scoop, Chocolatey, and Nix as a command-line tool, with no hardware appliance or hosted service option documented.",
      "whyItMatters": "Deployment flexibility matters for organizations with specific infrastructure constraints, such as air-gapped networks needing a hardware appliance.",
      "benefitsWho": "Enterprises with fixed infrastructure requirements benefit from Greenbone's appliance options; developers wanting quick local installs benefit from Syft's package-manager-based installation."
    },
    {
      "title": "Certifications & Compliance Posture",
      "toolA": "Greenbone holds ISO 9001, ISO 27001, and ISO 14001 certifications and states its operations are GDPR-compliant.",
      "toolB": "Syft's documented facts do not mention formal certifications; its compliance value comes from generating audit-ready SBOMs rather than the vendor's own certification status.",
      "whyItMatters": "Vendor-level certifications can matter for procurement in regulated industries, separate from what the tool itself produces.",
      "benefitsWho": "Procurement and compliance teams evaluating vendor risk may specifically require Greenbone's ISO certifications."
    },
    {
      "title": "Output Format",
      "toolA": "Greenbone's output is vulnerability scan results from its 100,000+ test database rather than a structured software inventory document.",
      "toolB": "Syft outputs structured SBOMs in CycloneDX, SPDX, or Syft's own JSON format, plus signed attestations using the in-toto specification.",
      "whyItMatters": "Structured, standardized SBOM output is required for many supply-chain compliance frameworks, distinct from vulnerability scan reports.",
      "benefitsWho": "Teams needing to hand a standards-compliant SBOM to customers or auditors specifically need Syft's output format."
    }
  ],
  "featureMatrix": [
    {
      "group": "Scanning & Detection",
      "rows": [
        {
          "feature": "Network vulnerability scanning",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Greenbone core function"
        },
        {
          "feature": "SBOM generation",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Syft core function"
        },
        {
          "feature": "Daily-updated vulnerability test database",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Greenbone: 100,000+ tests"
        }
      ]
    },
    {
      "group": "Deployment & Access",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Greenbone OPENVAS FREE; Syft fully free"
        },
        {
          "feature": "Hardware appliance option",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Greenbone hardware/VM/cloud deployment"
        },
        {
          "feature": "CLI/package-manager installation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Syft: Homebrew, Docker, Scoop, Chocolatey, Nix"
        }
      ]
    },
    {
      "group": "Compliance & Certification",
      "rows": [
        {
          "feature": "ISO certification",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Greenbone: ISO 9001, 27001, 14001"
        },
        {
          "feature": "GDPR-compliant operations stated",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Standards-based SBOM output (CycloneDX/SPDX)",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Greenbone and Syft do the same thing?",
      "answer": "No. Greenbone is a network and infrastructure vulnerability scanner, while Syft is an SBOM generator that inventories software components inside container images and filesystems. They address different parts of a security program."
    },
    {
      "question": "Is Syft free?",
      "answer": "Yes, Syft is entirely free and open source under Apache-2.0. Greenbone offers a free OPENVAS FREE tier but also sells paid BASIC, SCAN, and SECURITY INTELLIGENCE tiers priced on a contact-for-pricing basis."
    },
    {
      "question": "Where is Greenbone based?",
      "answer": "Greenbone is headquartered in Germany and holds ISO 9001, ISO 27001, and ISO 14001 certifications, with operations stated to be GDPR-compliant."
    },
    {
      "question": "Can Syft scan for vulnerabilities like Greenbone does?",
      "answer": "No, Syft only generates SBOMs; it is designed to pair with Grype for vulnerability scanning. Greenbone performs vulnerability scanning directly using a daily-updated test database of 100,000+ tests."
    },
    {
      "question": "How is Greenbone priced?",
      "answer": "Greenbone's paid products are subscription-based and scaled by scanning scope, such as the number of IPs or assets covered, though exact prices are not published and require contacting sales."
    },
    {
      "question": "What formats does Syft support for SBOM output?",
      "answer": "Syft can output SBOMs in CycloneDX, SPDX, and its own Syft JSON format, and can convert between these formats plus create signed attestations using the in-toto specification."
    }
  ]
};

export default greenboneVsSyftContent;

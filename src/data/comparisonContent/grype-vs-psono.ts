import type { ToolComparisonContent } from './types';

const grypeVsPsonoContent: ToolComparisonContent = {
  "verdict": "Grype and Psono are both free, open-source security tools, but they address unrelated problems. Grype, sponsored by Anchore under Apache-2.0, is a command-line vulnerability scanner for container images, filesystems, and SBOMs across OS packages and language ecosystems. Psono, headquartered in Vorra, Germany, is a self-hosted or SaaS password manager for teams with client-side encryption, free for up to 10 users. One scans software for known vulnerabilities; the other stores and shares credentials securely.",
  "bestForToolA": "Grype fits DevSecOps and platform engineering teams that need to scan container images, filesystems, and SBOM files (including Syft-generated ones) for known vulnerabilities across OS packages (Alpine, Debian, RHEL, etc.) and languages (Ruby, Java, Python, Go, and more), with EPSS/KEV-based prioritization.",
  "bestForToolB": "Psono fits teams needing a self-hosted or SaaS password manager with client-side encryption and encrypted credential sharing, especially teams up to 10 users who want the free plan or larger teams that need full control over where credential data is stored.",
  "whoNeedsBoth": "A security-conscious engineering organization could run Grype in CI/CD pipelines to scan container images and SBOMs for vulnerabilities before deployment, while separately using Psono to securely store and share the credentials, API keys, and service account passwords that same engineering team needs day to day — both are open-source, self-hostable tools that fit naturally into the same security-conscious DevOps stack.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Grype is a vulnerability scanner that detects known security vulnerabilities in container images, filesystems, and SBOM files.",
      "toolB": "Psono is a password manager that stores and shares team credentials with client-side encryption.",
      "whyItMatters": "These are fundamentally different categories of security tooling — vulnerability detection versus credential storage — addressing different parts of a security program.",
      "benefitsWho": "Security engineers scanning build pipelines benefit from Grype; IT and engineering teams managing shared credentials benefit from Psono."
    },
    {
      "title": "Interface Type",
      "toolA": "Grype is a command-line tool with no built-in graphical dashboard, per its documented cons.",
      "toolB": "Psono provides apps for macOS, Windows, and Linux, mobile apps for iOS and Android, and browser extensions for Chrome, Firefox, and Edge.",
      "whyItMatters": "A CLI-only tool fits into automated pipelines but requires more setup for visual reporting, while a cross-platform app suite is built for everyday end-user interaction.",
      "benefitsWho": "CI/CD pipeline engineers benefit from Grype's CLI-first design; general employees who need day-to-day password access benefit from Psono's cross-platform apps."
    },
    {
      "title": "Cost Model",
      "toolA": "Grype is entirely free and open source under Apache-2.0, with no paid tier.",
      "toolB": "Psono is free for up to 10 users with all business features included, with a custom-priced Business/Enterprise tier for larger teams or added SLA/support.",
      "whyItMatters": "Grype has no cost ceiling to plan around, while Psono's free tier has a clear team-size boundary that affects budgeting as an organization grows.",
      "benefitsWho": "Any size organization benefits from Grype being free regardless of scale; small teams under 10 users get the same benefit from Psono's free tier."
    },
    {
      "title": "Scope of Coverage",
      "toolA": "Grype covers OS packages from Alpine, Debian, Ubuntu, RHEL, Oracle Linux, and Amazon Linux, plus language ecosystems including Ruby, Java, JavaScript, Python, .NET, Go, PHP, and Rust, and Docker, OCI, and Singularity image formats.",
      "toolB": "Psono's scope is credential encryption and sharing, not software scanning; it does not overlap with Grype's OS/language package coverage.",
      "whyItMatters": "Understanding exact coverage matters for security teams verifying that a scanner supports their specific tech stack.",
      "benefitsWho": "Teams running diverse OS and language stacks benefit from Grype's broad ecosystem coverage."
    },
    {
      "title": "Deployment Flexibility",
      "toolA": "Grype installs via curl, Homebrew, Docker, Chocolatey, or MacPorts, with no official managed or hosted service documented.",
      "toolB": "Psono offers both self-hosted deployment on your own servers and a hosted SaaS edition for teams that don't want to manage infrastructure.",
      "whyItMatters": "Having a hosted SaaS option removes infrastructure management burden, which Grype does not offer.",
      "benefitsWho": "Teams wanting to avoid infrastructure management benefit from Psono's SaaS option; Grype users must integrate it into their own pipelines regardless of team size."
    }
  ],
  "featureMatrix": [
    {
      "group": "Vulnerability Scanning (Grype)",
      "rows": [
        {
          "feature": "Container image scanning",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "SBOM file scanning",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "EPSS/KEV-based prioritization",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "OpenVEX support",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        }
      ]
    },
    {
      "group": "Credential Management (Psono)",
      "rows": [
        {
          "feature": "Client-side encryption of stored credentials",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Encrypted credential sharing among team members",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Browser extensions",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Chrome, Firefox, Edge"
        },
        {
          "feature": "Mobile apps",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "iOS, Android"
        }
      ]
    },
    {
      "group": "Deployment & Cost",
      "rows": [
        {
          "feature": "Open-source codebase",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Official hosted/SaaS offering",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Free tier / fully free product",
          "toolA": "available",
          "toolB": "available",
          "note": "Grype: fully free; Psono: free up to 10 users"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Grype and Psono competitors?",
      "answer": "No. Grype is an open-source vulnerability scanner for container images, filesystems, and SBOMs, while Psono is an open-source password manager for teams. They both fall under 'open-source security tooling' but serve unrelated functions."
    },
    {
      "question": "Are both Grype and Psono free?",
      "answer": "Grype is entirely free and open source under Apache-2.0 with no paid tier. Psono is free for up to 10 users with all business features included, with a custom-priced Business/Enterprise tier for larger teams."
    },
    {
      "question": "Does Grype have a graphical interface like Psono's apps?",
      "answer": "No. Grype is a command-line tool with no built-in graphical dashboard, per its documented cons. Psono provides desktop apps (macOS, Windows, Linux), mobile apps (iOS, Android), and browser extensions (Chrome, Firefox, Edge)."
    },
    {
      "question": "Can both tools be self-hosted?",
      "answer": "Yes. Grype is installed via curl, Homebrew, Docker, Chocolatey, or MacPorts with no official hosted service. Psono can be self-hosted on your own servers, or used as a hosted SaaS edition."
    },
    {
      "question": "Would a DevOps team use both Grype and Psono?",
      "answer": "It's plausible: Grype could scan container images and SBOMs in CI/CD pipelines for vulnerabilities, while Psono separately stores and shares the team's credentials, service account passwords, and API keys — both being open-source and self-hostable makes them a natural fit in the same security-conscious stack."
    }
  ]
};

export default grypeVsPsonoContent;

import type { ToolComparisonContent } from './types';

const conjurVsOpenarchiverContent: ToolComparisonContent = {
  "verdict": "Conjur is CyberArk's secrets management and machine-identity platform for securing credentials in cloud-native environments, while openarchiver is an open-source email archiving platform for backup, compliance, and eDiscovery. They occupy different layers of a self-hosted security stack — one secures application and workload credentials, the other retains searchable email records — with no functional overlap.",
  "bestForToolA": "Cloud-native and DevOps teams needing centralized secrets management with built-in Kubernetes, OpenShift, AWS IAM, and OIDC authenticators, plus a Secretless Broker so applications never handle raw credentials.",
  "bestForToolB": "Organizations needing compliant, searchable email archives from Microsoft 365, Google Workspace, or IMAP, or that need to import legacy PST/EML files.",
  "whoNeedsBoth": "A DevOps-heavy organization could use Conjur to manage application and service credentials across its Kubernetes and CI/CD pipelines, while separately running openarchiver to archive corporate email for compliance — two unrelated risk domains that could sit in the same self-hosted security stack.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "Conjur is a secrets management and machine-identity platform.",
      "toolB": "openarchiver is an email archiving platform for compliance and eDiscovery.",
      "whyItMatters": "The tools secure entirely different assets: credentials versus email records.",
      "benefitsWho": "DevSecOps teams versus compliance/records teams."
    },
    {
      "title": "Licensing & Backing",
      "toolA": "The Conjur server is licensed under GNU LGPL v3.0 (client libraries under Apache 2.0), backed by CyberArk, now part of Palo Alto Networks, with a commercial license option available.",
      "toolB": "openarchiver is listed as Freemium and described as a free email archiver, but no specific license or paid-tier pricing is documented.",
      "whyItMatters": "Backing and licensing clarity affect long-term support expectations and budget planning.",
      "benefitsWho": "Enterprises weighing vendor-backed open source against a less-documented freemium tool."
    },
    {
      "title": "Toolchain Integrations",
      "toolA": "Conjur integrates with Ansible, Jenkins, Puppet, and Terraform, and offers client SDKs for .NET, Go, Java, Python, and Ruby.",
      "toolB": "openarchiver integrates with Microsoft 365, Google Workspace, and IMAP, plus PST/EML import — no DevOps toolchain integrations are documented.",
      "whyItMatters": "Each tool's integration surface determines how easily it fits an existing pipeline.",
      "benefitsWho": "DevOps engineers automating secrets versus IT teams archiving mail."
    },
    {
      "title": "Authentication vs Archiving Mechanism",
      "toolA": "Conjur's built-in authenticators (Kubernetes, OpenShift, AWS IAM, OIDC) let workloads fetch secrets without static credentials via the Secretless Broker.",
      "toolB": "openarchiver has no authenticator or secrets mechanism; its connectors pull mail data for retention rather than issuing credentials.",
      "whyItMatters": "Only one of the two tools manages machine identity and credential issuance.",
      "benefitsWho": "Platform engineers securing workload-to-service communication."
    },
    {
      "title": "Governance",
      "toolA": "Conjur is maintained by CyberArk/Palo Alto Networks with active GitHub releases as recent as mid-2026 and over 900 GitHub stars.",
      "toolB": "openarchiver's maintainer and governance details aren't documented in the facts available.",
      "whyItMatters": "Visible release cadence and backing signal ongoing project maintenance.",
      "benefitsWho": "Teams doing due diligence before adopting a self-hosted security tool long-term."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Secrets management",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Machine identity / workload authentication",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Email archiving",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "eDiscovery / full-text search",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Licensing",
      "rows": [
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Commercial/enterprise license available",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Conjur: CyberArk commercial license"
        },
        {
          "feature": "Free open-source tier",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Client SDKs / language libraries",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Conjur: .NET, Go, Java, Python, Ruby"
        }
      ]
    },
    {
      "group": "Integrations",
      "rows": [
        {
          "feature": "Kubernetes / OpenShift authenticators",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "DevOps toolchain (Ansible, Jenkins, Puppet, Terraform)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Microsoft 365 / Google Workspace connectors",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "PST/EML import",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Conjur and openarchiver compete?",
      "answer": "No. They're different categories — secrets management/machine identity versus email archiving — and typically wouldn't be evaluated against each other."
    },
    {
      "question": "Is Conjur free?",
      "answer": "The open-source Conjur server is free under GNU LGPL v3.0; a commercial CyberArk license with enterprise support is also available."
    },
    {
      "question": "Is openarchiver free?",
      "answer": "It's listed as Freemium and described as a free email archiver, but specific paid-tier pricing isn't documented."
    },
    {
      "question": "Can Conjur archive email?",
      "answer": "No. Conjur stores secrets and authenticates workloads; it has no email archiving functionality."
    },
    {
      "question": "Does openarchiver manage secrets or machine identity?",
      "answer": "No. Its documented scope is mailbox connectors and PST/EML import for archiving."
    },
    {
      "question": "Who maintains Conjur today?",
      "answer": "CyberArk, now part of Palo Alto Networks, continues active open-source development on GitHub."
    }
  ]
};

export default conjurVsOpenarchiverContent;

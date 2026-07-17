import type { ToolComparisonContent } from './types';

const _1passwordSecretsAutomationVsTrufflehogContent: ToolComparisonContent = {
  "verdict": "1Password Secrets Automation and TruffleHog solve adjacent but different problems: 1Password Secrets Automation is about securely storing and injecting secrets into applications and CI/CD pipelines via Service Accounts or self-hosted Connect servers, while TruffleHog is about scanning code, git history, and Docker images to detect secrets that were already hardcoded or leaked. One prevents secrets from needing to be hardcoded; the other catches it when they are anyway.",
  "bestForToolA": "Teams already on a 1Password subscription who want to inject vaulted secrets into GitHub Actions, CircleCI, Jenkins, or Kubernetes without hardcoding credentials in application code.",
  "bestForToolB": "Teams needing a free, open-source way to scan git history, branches, and Docker images for secrets that leaked despite vaulting practices, using 800+ built-in detectors.",
  "whoNeedsBoth": "A team using 1Password Secrets Automation to inject credentials into CI/CD pipelines would still benefit from running TruffleHog in pre-commit and pre-receive hooks, since vaulting secrets doesn't prevent a developer from accidentally hardcoding one directly into a file; TruffleHog catches that case that 1Password's injection model doesn't address.",
  "keyDifferences": [
    {
      "title": "Core Function",
      "toolA": "1Password Secrets Automation stores secrets in vaults and delivers them to apps/infrastructure via Service Accounts or self-hosted Connect servers.",
      "toolB": "TruffleHog scans code, git history, and Docker images to detect secrets that are already exposed, using 800+ detectors.",
      "whyItMatters": "Storage/injection and detection/scanning are complementary but distinct security practices with different failure modes.",
      "benefitsWho": "DevOps teams building a defense-in-depth secrets strategy benefit from understanding this distinction."
    },
    {
      "title": "Pricing Model",
      "toolA": "1Password Secrets Automation is included with a 1Password subscription rather than sold as a separate line item, with no dedicated public pricing page.",
      "toolB": "TruffleHog's open-source core is fully free, with a custom-priced Enterprise tier for dashboards, SSO, RBAC, and 20+ integrations.",
      "whyItMatters": "Understanding what's bundled versus separately priced affects total cost of ownership when adopting either tool.",
      "benefitsWho": "Budget planners and procurement teams benefit from clarity on what's already covered by existing subscriptions."
    },
    {
      "title": "CI/CD Integration Approach",
      "toolA": "1Password Secrets Automation has pre-built integrations for GitHub Actions, CircleCI, and Jenkins to sync secrets directly into pipelines, plus Kubernetes support.",
      "toolB": "TruffleHog integrates via GitHub Actions and pre-commit/pre-receive hooks that block secrets from being committed or pushed in the first place.",
      "whyItMatters": "The two tools intervene at different points in the pipeline: injection at runtime versus prevention at commit time.",
      "benefitsWho": "Engineering teams building CI/CD security controls benefit from combining both intervention points."
    },
    {
      "title": "Secret Verification",
      "toolA": "1Password Secrets Automation does not document a feature that verifies secrets are live against the target service; its IDE extensions instead detect exposed secrets before commit.",
      "toolB": "TruffleHog programmatically verifies discovered secrets against the relevant service or API to confirm they're active and eliminate false positives.",
      "whyItMatters": "Live verification tells a team whether a discovered credential is an urgent, active risk or already dead.",
      "benefitsWho": "Incident responders triaging discovered secrets benefit from TruffleHog's verification step."
    },
    {
      "title": "Self-Hosting Options",
      "toolA": "1Password's Connect servers are self-hosted by the customer for caching and control, giving REST API access not available with Service Accounts.",
      "toolB": "TruffleHog's open-source scanner can be run anywhere by the team operating it, with an Enterprise tier offering on-premises or cloud deployment.",
      "whyItMatters": "Self-hosting options matter for teams with strict infrastructure or data residency requirements.",
      "benefitsWho": "Security-conscious enterprises needing infrastructure control benefit from both tools' self-hosting paths."
    }
  ],
  "featureMatrix": [
    {
      "group": "Secrets Handling",
      "rows": [
        {
          "feature": "Secrets vaulting/storage",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Secrets injection into apps/infra",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Secret detection/scanning in code",
          "toolA": "limited",
          "toolB": "available",
          "note": "1Password: IDE extensions detect exposed secrets before commit"
        },
        {
          "feature": "Live credential verification",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Git history / multi-branch scanning",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Integrations & Deployment",
      "rows": [
        {
          "feature": "GitHub Actions integration",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "CircleCI / Jenkins integration",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Kubernetes integration",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Pre-commit / pre-receive hooks",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Self-hosted deployment option",
          "toolA": "available",
          "toolB": "available",
          "note": "1Password Connect servers; TruffleHog Enterprise on-prem"
        }
      ]
    },
    {
      "group": "Team & Enterprise Features",
      "rows": [
        {
          "feature": "REST API access",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "1Password: Connect only, not Service Accounts"
        },
        {
          "feature": "SSO / RBAC",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "TruffleHog Enterprise tier"
        },
        {
          "feature": "Dedicated pricing page",
          "toolA": "unavailable",
          "toolB": "limited",
          "note": "TruffleHog OSS free, Enterprise custom"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "What's the difference between 1Password Secrets Automation and TruffleHog?",
      "answer": "1Password Secrets Automation stores and injects secrets into applications and CI/CD pipelines via Service Accounts or Connect servers. TruffleHog scans code, git history, and Docker images to detect secrets that were already hardcoded or leaked."
    },
    {
      "question": "Does 1Password Secrets Automation scan git history for leaked secrets?",
      "answer": "Not as a core function. It focuses on secure storage and injection of secrets, though its IDE extensions do detect exposed secrets before they're committed."
    },
    {
      "question": "Can TruffleHog store and inject secrets into CI/CD pipelines?",
      "answer": "No, TruffleHog is a scanner and detector, not a secrets vault or injection tool."
    },
    {
      "question": "Do either of these tools cost extra?",
      "answer": "1Password Secrets Automation is included with a 1Password subscription rather than billed separately. TruffleHog's open-source core is free, with Enterprise pricing available on request."
    },
    {
      "question": "Which tool integrates with Kubernetes?",
      "answer": "1Password Secrets Automation documents Kubernetes secrets syncing. TruffleHog does not document a Kubernetes-specific integration."
    },
    {
      "question": "Which tool verifies that a discovered secret is actually live?",
      "answer": "TruffleHog programmatically verifies secrets against the relevant service or API. 1Password Secrets Automation does not document this kind of live verification feature."
    }
  ]
};

export default _1passwordSecretsAutomationVsTrufflehogContent;

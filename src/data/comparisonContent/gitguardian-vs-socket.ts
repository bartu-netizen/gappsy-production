import type { ToolComparisonContent } from './types';

const gitguardianVsSocketContent: ToolComparisonContent = {
  "verdict": "GitGuardian and Socket both sit in the developer security space but solve different problems: GitGuardian finds and remediates exposed secrets and credentials already in code, CI/CD, and non-human identities, while Socket catches malicious or risky open source packages before they're ever installed. Teams worried about leaked credentials will lean toward GitGuardian; teams worried about supply chain attacks via compromised dependencies will lean toward Socket. Many engineering orgs need both, since the two address non-overlapping risk categories.",
  "bestForToolA": "Best for teams whose main risk is credentials leaking into git history, CI/CD pipelines, or developer laptops. GitGuardian's ggshield CLI detects 550+ secret types, and its free Starter plan covers up to 25 developers across GitHub, GitLab, Azure Repos, and Bitbucket.",
  "bestForToolB": "Best for teams whose main risk is the open source dependencies they pull in. Socket's free plan gives unlimited developers and repos with 1,000 scans/month, detects 70+ categories of risky package behavior beyond known CVEs, and automatically blocks malicious packages before they land in a project.",
  "whoNeedsBoth": "Organizations running a mature AppSec program that must both prevent credential leaks (GitGuardian) and vet every third-party package for malicious behavior (Socket) — the two tools cover distinct attack surfaces and neither substitutes for the other.",
  "keyDifferences": [
    {
      "title": "What each tool actually scans for",
      "toolA": "GitGuardian focuses on exposed secrets and credentials in code, CI/CD, and non-human identities (API keys, OAuth tokens, service accounts).",
      "toolB": "Socket focuses on the open source packages themselves, detecting 70+ risk types including malicious behavior beyond just known CVEs.",
      "whyItMatters": "A secrets scanner won't catch a compromised package, and a supply-chain scanner won't catch a hardcoded API key — the two tools protect against fundamentally different breach vectors.",
      "benefitsWho": "Security teams deciding which risk to prioritize first with limited AppSec budget."
    },
    {
      "title": "Free plan structure",
      "toolA": "GitGuardian's free Starter plan supports up to 25 developers with unlimited real-time scanning and up to 500 historical scan detections.",
      "toolB": "Socket's Free plan allows unlimited developers and repos but caps usage at 3 members, 1 repository label, and 1,000 scans/month.",
      "whyItMatters": "GitGuardian's free tier scales by seat count while Socket's scales by usage volume and admin/label limits — larger dev teams may get more mileage from GitGuardian's 25-seat allowance.",
      "benefitsWho": "Small teams and startups evaluating either tool without budget."
    },
    {
      "title": "Version control coverage on lower tiers",
      "toolA": "GitGuardian's free plan limits pull request scanning to GitHub only, while broader multi-VCS support (GitLab, Azure Repos, Bitbucket) is part of its general coverage.",
      "toolB": "Socket reserves multi-platform VCS support (GitLab, Bitbucket, Azure DevOps) for its Enterprise plan; lower tiers are GitHub-centric.",
      "whyItMatters": "Teams not on GitHub may need to budget for a higher tier with either vendor to get full VCS-native PR scanning.",
      "benefitsWho": "Teams using GitLab, Bitbucket, or Azure DevOps as their primary VCS."
    },
    {
      "title": "Advanced governance features",
      "toolA": "GitGuardian reserves Public Secrets Monitoring and Non-Human Identity governance for its Enterprise plan.",
      "toolB": "Socket reserves unlimited scans, API quota, SSO/SAML, and Vanta compliance integration for its Business plan, with full reachability analysis on Enterprise.",
      "whyItMatters": "Both vendors gate their most advanced governance and compliance capabilities behind higher, custom-priced tiers, affecting total cost for regulated or larger organizations.",
      "benefitsWho": "Compliance and security leaders sizing budget for SSO, audit, and identity governance needs."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Detection & Coverage",
      "rows": [
        {
          "feature": "Secrets/credential detection",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Malicious/risky open source package detection",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "CI/CD & container registry scanning",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Non-human identity (API key/OAuth) governance",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "GitGuardian: Enterprise plan only"
        }
      ]
    },
    {
      "group": "Plans & Pricing",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Published price for first paid tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "GitGuardian's Teams/Business tier is custom quote; Socket's Team plan is $25/month per developer"
        },
        {
          "feature": "SSO/SAML support",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Custom-priced Enterprise tier",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Platform & Integration Coverage",
      "rows": [
        {
          "feature": "GitHub PR scanning",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "GitLab/Bitbucket/Azure DevOps support",
          "toolA": "available",
          "toolB": "limited",
          "note": "Socket reserves this for Enterprise"
        },
        {
          "feature": "Slack alerting integration",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "SBOM import/export",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does GitGuardian have a free plan?",
      "answer": "Yes, the Starter plan is free for up to 25 developers with no credit card required."
    },
    {
      "question": "Is Socket free to use?",
      "answer": "Yes, the Free plan offers unlimited developers and repos with 1,000 scans per month."
    },
    {
      "question": "What does GitGuardian's ggshield CLI detect?",
      "answer": "ggshield detects 550+ types of secrets across development tools."
    },
    {
      "question": "How many risk types does Socket detect?",
      "answer": "Socket detects 70+ categories of dependency risk, including malicious behavior, not just known CVEs."
    },
    {
      "question": "Which version control systems do GitGuardian and Socket support?",
      "answer": "GitGuardian supports GitHub, GitLab, Azure Repos, and Bitbucket. Socket's Team and Business plans are GitHub-focused, with GitLab, Bitbucket, and Azure DevOps support reserved for its Enterprise plan."
    },
    {
      "question": "Do GitGuardian and Socket offer SSO?",
      "answer": "Both offer SSO on higher tiers — GitGuardian's Teams (Business) plan includes SAML 2.0, and Socket's Business plan includes SSO/SAML."
    }
  ]
};

export default gitguardianVsSocketContent;

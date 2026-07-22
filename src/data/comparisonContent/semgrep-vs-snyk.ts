import type { ToolComparisonContent } from './types';

const semgrepVsSnykContent: ToolComparisonContent = {
  "verdict": "Semgrep and Snyk both offer freemium SAST and open-source scanning for developers, but they draw the line differently — Semgrep is priced slightly higher per contributor and bundles secrets detection (as an add-on) with reachability-based AI triage memory, while Snyk starts at a lower documented per-developer price and extends coverage into container and infrastructure-as-code scanning that Semgrep's facts don't describe.",
  "bestForToolA": "Teams wanting deep static analysis across 35+ languages with AI-powered triage memory that learns from past decisions and reachability analysis to cut false positives, without needing built-in container or IaC scanning.",
  "bestForToolB": "Teams that want one platform covering code, open source dependencies, containers, and infrastructure-as-code together, with a lower documented entry price and regional data hosting options (US, EU, AU).",
  "whoNeedsBoth": "Security teams sometimes run Semgrep for its semantic secrets detection and AI-triage-driven SAST/SCA depth on application code, while relying on Snyk's dedicated Container and IaC products for cloud infrastructure that Semgrep doesn't cover.",
  "keyDifferences": [
    {
      "title": "Scanning scope",
      "toolA": "Covers Code (SAST), Supply Chain (SCA), and semantic secrets detection.",
      "toolB": "Covers Code (SAST), Open Source (SCA), Container images, and Infrastructure-as-Code.",
      "whyItMatters": "Teams needing container or IaC scanning in the same platform get that natively documented in one tool but not the other.",
      "benefitsWho": "Platform/DevOps teams securing cloud infrastructure (Snyk) vs. application-security teams focused on code and dependencies (Semgrep)."
    },
    {
      "title": "Entry pricing",
      "toolA": "Teams plan starts at $30/month per contributor.",
      "toolB": "Team plan starts at $25/month per contributing developer.",
      "whyItMatters": "A lower documented per-seat starting price matters for teams scaling headcount.",
      "benefitsWho": "Budget-conscious engineering teams comparing per-seat costs."
    },
    {
      "title": "Free tier limits",
      "toolA": "Free Edition covers up to 10 contributors and 10 repositories.",
      "toolB": "Free tier is capped at 5 projects with limited monthly test counts.",
      "whyItMatters": "Small teams or open-source maintainers may fit comfortably under one cap but not the other.",
      "benefitsWho": "Small teams and solo maintainers evaluating free-tier ceilings."
    },
    {
      "title": "Secrets detection availability",
      "toolA": "Semantic secrets detection is available but is a paid $15/month add-on on the Teams plan.",
      "toolB": "No secrets detection feature is documented.",
      "whyItMatters": "Teams that specifically need hardcoded-credential detection have a documented path in one tool only.",
      "benefitsWho": "AppSec teams prioritizing leaked-credential prevention (Semgrep)."
    },
    {
      "title": "AI-assisted triage",
      "toolA": "AI-powered triage memory learns from past decisions to auto-suppress repeat false positives, with AI credits included per plan.",
      "toolB": "Integrates with AI coding assistants (Claude Code, Cursor, Codex) but no native AI triage feature is documented.",
      "whyItMatters": "Reducing manual triage workload is a documented differentiator for one platform.",
      "benefitsWho": "Security teams drowning in alert volume (Semgrep)."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Scanning Coverage",
      "rows": [
        {
          "feature": "Static application security testing (SAST)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Open source / dependency scanning (SCA)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Secrets detection",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Semgrep: paid add-on on Teams plan"
        },
        {
          "feature": "Container image scanning",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Infrastructure-as-code (IaC) scanning",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI-assisted triage/remediation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Reachability analysis to reduce false positives",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Semgrep: 10 contributors/10 repos; Snyk: 5 projects"
        },
        {
          "feature": "Entry paid tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Semgrep $30/mo/contributor; Snyk $25/mo/developer"
        },
        {
          "feature": "Enterprise/custom tier",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Integrations & Ecosystem",
      "rows": [
        {
          "feature": "CI/CD and SCM integrations",
          "toolA": "available",
          "toolB": "available",
          "note": "Semgrep: GitHub/GitLab/Bitbucket/Azure; Snyk: IDE/CLI/SCM"
        },
        {
          "feature": "IDE integrations",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "MCP / agentic AI tool support",
          "toolA": "available",
          "toolB": "available",
          "note": "Semgrep: MCP server for Cursor/Replit; Snyk: Claude Code, Cursor, Codex"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Semgrep and Snyk have free tiers?",
      "answer": "Yes — Semgrep's Free Edition covers up to 10 contributors and 10 repositories, while Snyk's Free tier is capped at 5 projects with no credit card required."
    },
    {
      "question": "How do entry-level paid plans price out?",
      "answer": "Semgrep's Teams plan starts at $30/month per contributor; Snyk's Team plan starts at $25/month per contributing developer."
    },
    {
      "question": "Does either tool scan containers or infrastructure code?",
      "answer": "Snyk explicitly offers Snyk Container and Snyk IaC products; Semgrep's documented features focus on code (SAST), supply chain (SCA), and secrets detection, without a stated container or IaC scanning product."
    },
    {
      "question": "Does either tool detect secrets?",
      "answer": "Semgrep includes semantic secrets detection, though it's a $15/month add-on on the Teams plan; Snyk's facts don't mention a secrets detection feature."
    },
    {
      "question": "Do these tools integrate with AI coding assistants?",
      "answer": "Semgrep offers an MCP server for tools like Cursor and Replit; Snyk integrates with AI coding assistants including Claude Code, Cursor, and Codex."
    }
  ]
};

export default semgrepVsSnykContent;

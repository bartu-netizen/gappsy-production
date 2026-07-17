import type { ToolComparisonContent } from './types';

const activepiecesVsOnedevContent: ToolComparisonContent = {
  "verdict": "activepieces is a business process automation platform that connects everyday tools (like Gmail) across HR, finance, marketing, and sales, priced per active flow starting at $5/month with both cloud and self-hosted deployment. OneDev is a self-hosted DevOps platform unifying Git hosting, issue tracking, pull requests, built-in CI/CD, and package registries, with a fully free Community Edition and a $6/user/month Enterprise tier for HA and security scanning. They're both automation-adjacent but serve different jobs: activepieces automates cross-department workflows, while OneDev is the engineering team's core Git/CI/CD infrastructure.",
  "bestForToolA": "Cross-department teams (HR, finance, marketing, sales) that want to automate workflows across everyday business apps like Gmail, with flexible cloud-or-self-hosted deployment and pay-per-active-flow pricing, fit activepieces best.",
  "bestForToolB": "Engineering teams that want a single self-hosted platform for Git hosting, code review, issue tracking, and built-in CI/CD with package registries (Docker, NPM, Maven, NuGet, PyPI, RubyGems, Helm), fit OneDev best.",
  "whoNeedsBoth": "An engineering-led company could run its Git repositories, CI/CD pipelines, and package registries in OneDev while using activepieces to automate cross-department workflows, like HR onboarding or marketing lead routing, that sit entirely outside the DevOps pipeline.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "activepieces is a general business process automation platform spanning HR, finance, marketing, and sales, connecting apps through a large integrations library called 'pieces' (e.g., Gmail).",
      "toolB": "OneDev is a unified DevOps platform combining Git hosting, issue tracking, pull requests, built-in CI/CD, and package registries in one self-hosted system.",
      "whyItMatters": "These solve fundamentally different problems: cross-functional workflow automation versus software development infrastructure.",
      "benefitsWho": "Business operations teams benefit from activepieces; engineering teams benefit from OneDev."
    },
    {
      "title": "Pricing Model",
      "toolA": "activepieces charges per active flow, with the Standard plan at $5/active flow/month and $0 per execution, plus custom Ultimate annual contracts.",
      "toolB": "OneDev's Community Edition is entirely free; the Enterprise Edition costs $6/user/month with a minimum order of 12 user-months.",
      "whyItMatters": "Usage-based flow pricing and per-user enterprise pricing scale differently depending on team size versus number of automations.",
      "benefitsWho": "Teams running many automations with few users benefit from OneDev's free core tier being a non-factor here; teams comparing cost predictability should note activepieces charges per flow, not per user."
    },
    {
      "title": "Self-Hosting & Cloud Options",
      "toolA": "activepieces explicitly supports both cloud-hosted and self-hosted deployment.",
      "toolB": "OneDev is self-hosted only — no managed cloud offering is documented on the official site.",
      "whyItMatters": "Deployment flexibility affects operational overhead and whether a team can avoid managing infrastructure entirely.",
      "benefitsWho": "Teams wanting a managed option benefit from activepieces' cloud choice; teams already committed to self-hosting benefit equally from OneDev."
    },
    {
      "title": "Built-In CI/CD & Package Registries",
      "toolA": "activepieces has no documented CI/CD engine or package registry — it connects to external tools via its integrations library instead.",
      "toolB": "OneDev bundles a built-in CI/CD engine with a GUI editor and multiple executor types (containers, Kubernetes, agents, bare metal) plus package registries for Docker, NPM, Maven, NuGet, PyPI, RubyGems, and Helm.",
      "whyItMatters": "Native CI/CD and package hosting eliminate the need for separate DevOps tooling, which matters for engineering teams specifically.",
      "benefitsWho": "Engineering teams consolidating their toolchain benefit from OneDev's native CI/CD and registries."
    },
    {
      "title": "AI Features",
      "toolA": "AI capabilities are not documented for activepieces beyond its integration library.",
      "toolB": "OneDev includes 'AI user automation' described as supporting autonomous development work.",
      "whyItMatters": "Teams evaluating AI-assisted automation should check which product actually documents AI capabilities relevant to their workflow.",
      "benefitsWho": "Engineering teams interested in AI-assisted development work benefit from OneDev's documented AI automation."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Platform Purpose",
      "rows": [
        {
          "feature": "Cross-department workflow automation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Git hosting",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Issue tracking / Kanban boards",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Integrations library (e.g. Gmail)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Deployment",
      "rows": [
        {
          "feature": "Free tier / edition",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "OneDev Community Edition is free"
        },
        {
          "feature": "Entry paid tier",
          "toolA": "available",
          "toolB": "available",
          "note": "activepieces $5/active flow/month; OneDev Enterprise $6/user/month (12-month minimum)"
        },
        {
          "feature": "Cloud-hosted option",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "OneDev is self-hosted only"
        },
        {
          "feature": "Self-hosted option",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "DevOps & Automation Depth",
      "rows": [
        {
          "feature": "Built-in CI/CD",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Package registries",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "OneDev: Docker, NPM, Maven, NuGet, PyPI, RubyGems, Helm"
        },
        {
          "feature": "Enterprise governance controls",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "AI automation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "OneDev: AI user automation for autonomous development"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can activepieces replace a CI/CD platform like OneDev?",
      "answer": "No, this isn't documented as an activepieces capability — it's a workflow/business-automation tool, not a CI/CD or Git hosting platform."
    },
    {
      "question": "Is OneDev's Community Edition really free?",
      "answer": "Yes, it includes built-in CI/CD, package registries, code search, SSO/2FA, and LDAP/AD support at no cost."
    },
    {
      "question": "How is activepieces priced?",
      "answer": "Per active flow — the Standard plan is $5/active flow/month with $0 charged per execution, plus a custom Ultimate tier for annual contracts."
    },
    {
      "question": "Does OneDev offer a managed cloud version?",
      "answer": "This is not documented — OneDev appears to be self-hosted only, with no managed cloud offering on its official site."
    },
    {
      "question": "What's the minimum commitment for OneDev Enterprise?",
      "answer": "A minimum order of 12 user-months, at $6/user/month."
    },
    {
      "question": "Which tool integrates with everyday business apps like Gmail?",
      "answer": "activepieces, through its large integrations library referred to as 'pieces.'"
    }
  ]
};

export default activepiecesVsOnedevContent;

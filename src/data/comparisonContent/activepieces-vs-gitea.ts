import type { ToolComparisonContent } from './types';

const activepiecesVsGiteaContent: ToolComparisonContent = {
  "verdict": "Activepieces automates business workflows across SaaS apps, priced per active flow. Gitea is a free, MIT-licensed, self-hosted Git service with built-in CI/CD (Gitea Actions), issue tracking, and support for 20+ package registry formats, aimed at software development teams. These are different categories — business process automation versus a source-control and DevOps platform — so they typically serve different parts of the same organization rather than competing directly.",
  "bestForToolA": "Business/ops teams automating cross-app SaaS workflows, paying per active flow starting at $5/month.",
  "bestForToolB": "Development teams wanting a free, MIT-licensed, self-hosted Git service with unlimited users and repositories, built-in CI/CD compatible with GitHub Actions syntax, and support for 20+ package registry formats including NPM, PyPI, and Maven.",
  "whoNeedsBoth": "A software company could self-host Gitea for its source control and CI/CD while a separate business team uses Activepieces to automate HR or sales workflows via \"pieces\" integrations like Gmail — both plausibly run at the same company for entirely different purposes, though no direct Gitea-Activepieces integration is documented.",
  "keyDifferences": [
    {
      "title": "Category",
      "toolA": "Business/SaaS workflow automation.",
      "toolB": "Self-hosted Git and DevOps platform (source control, CI/CD, packages).",
      "whyItMatters": "These serve fundamentally different roles — business operations versus software delivery.",
      "benefitsWho": "Clarifies which product fits a team's actual job to be done."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Paid, usage-based: $5/active flow/month (Standard), custom Ultimate plan.",
      "toolB": "Core is free (MIT, unlimited users/repos); Gitea Enterprise starts at $9.50/user/month with a one-year commitment, and Gitea Cloud offers a 30-day trial with unpublished ongoing pricing.",
      "whyItMatters": "Gitea's free core lets dev teams start at zero cost, while Activepieces has no documented free tier.",
      "benefitsWho": "Engineering teams on tight budgets benefit from Gitea's free, unlimited self-hosted core."
    },
    {
      "title": "Built-in CI/CD",
      "toolA": "No CI/CD pipeline execution is documented as a feature.",
      "toolB": "Ships Gitea Actions, a CI/CD system closely compatible with GitHub Actions syntax, as a core free feature.",
      "whyItMatters": "Teams wanting integrated CI/CD without a separate tool get it natively from Gitea.",
      "benefitsWho": "Development teams standardizing on GitHub Actions syntax benefit from Gitea Actions' compatibility."
    },
    {
      "title": "Package Management",
      "toolA": "No package-hosting functionality is documented.",
      "toolB": "Documents support for 20+ package registry formats, including NPM, PyPI, and Maven.",
      "whyItMatters": "Teams consolidating source control and package hosting in one tool benefit from Gitea's built-in registry support.",
      "benefitsWho": "Polyglot development teams benefit from Gitea's broad package-format support."
    },
    {
      "title": "Licensing Model",
      "toolA": "No free or open-source tier is documented; the Standard plan starts at $5/active flow/month.",
      "toolB": "The core self-hosted product is free and MIT-licensed with unlimited users and repositories.",
      "whyItMatters": "Open licensing with no user/repo caps removes a common scaling cost for growing engineering teams.",
      "benefitsWho": "Growing engineering teams benefit from Gitea's unlimited free self-hosted core."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Purpose",
      "rows": [
        {
          "feature": "Business/SaaS workflow automation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Git repository hosting",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Issue tracking / project management",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Licensing",
      "rows": [
        {
          "feature": "Free self-hosted core",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "MIT, unlimited users/repos"
        },
        {
          "feature": "Published entry pricing",
          "toolA": "available",
          "toolB": "available",
          "note": "AP $5/active flow/month; Gitea Enterprise $9.50/user/month"
        },
        {
          "feature": "Managed cloud trial",
          "toolA": "available",
          "toolB": "available",
          "note": "Gitea Cloud 30-day trial"
        }
      ]
    },
    {
      "group": "DevOps & Integrations",
      "rows": [
        {
          "feature": "Built-in CI/CD",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Gitea Actions"
        },
        {
          "feature": "Package registry support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "20+ formats"
        },
        {
          "feature": "Cross-platform deployment",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Linux, Windows, macOS, FreeBSD, Kubernetes"
        },
        {
          "feature": "Prebuilt SaaS app integrations",
          "toolA": "available",
          "toolB": "limited",
          "note": "AP \"pieces\" e.g. Gmail; Gitea via webhooks/API with Slack, Discord, Jenkins"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Gitea free?",
      "answer": "Yes, the core self-hosted Gitea service is free under the MIT license with unlimited users and repositories."
    },
    {
      "question": "Is Activepieces free?",
      "answer": "No, it's paid starting at $5 per active flow/month."
    },
    {
      "question": "Does Gitea offer CI/CD?",
      "answer": "Yes, Gitea Actions is a built-in CI/CD system closely compatible with GitHub Actions."
    },
    {
      "question": "What does Gitea Enterprise cost?",
      "answer": "$9.50 per user/month with a one-year commitment."
    },
    {
      "question": "Is there a hosted version of Gitea?",
      "answer": "Yes, Gitea Cloud offers managed hosting with a 30-day free trial; pricing beyond the trial is not published."
    },
    {
      "question": "Can Activepieces host Git repositories or run CI/CD like Gitea?",
      "answer": "No — the facts don't document any source-control or CI/CD capability for Activepieces; it's a SaaS workflow automation tool built around prebuilt app integrations (\"pieces\")."
    }
  ]
};

export default activepiecesVsGiteaContent;

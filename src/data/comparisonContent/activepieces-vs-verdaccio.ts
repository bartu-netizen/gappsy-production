import type { ToolComparisonContent } from './types';

const activepiecesVsVerdaccioContent: ToolComparisonContent = {
  "verdict": "Activepieces is a paid platform for automating business workflows across SaaS apps. Verdaccio is a free, MIT-licensed private npm/yarn/pnpm registry proxy for hosting and caching Node.js packages, run entirely by volunteers with no official paid tier. These are entirely different tool categories — business automation versus developer package-registry infrastructure — so there's no real overlap in what they do.",
  "bestForToolA": "Business/ops teams that want to automate SaaS workflows, such as Gmail-based processes, without engineering involvement.",
  "bestForToolB": "Development teams that need to privately host proprietary npm/yarn/pnpm packages or proxy and cache the public npm registry, at zero cost since Verdaccio is entirely free and MIT-licensed.",
  "whoNeedsBoth": "A software company could run Verdaccio internally to host its private npm packages while using Activepieces to automate unrelated business processes like HR onboarding — the tools would never functionally interact with each other.",
  "keyDifferences": [
    {
      "title": "Category",
      "toolA": "Business workflow automation platform.",
      "toolB": "Private package registry for Node.js ecosystems.",
      "whyItMatters": "These solve completely unrelated problems for completely different teams.",
      "benefitsWho": "Clarifies category fit before evaluation begins."
    },
    {
      "title": "Pricing",
      "toolA": "Paid, usage-based: $5/active flow/month (Standard), custom Ultimate plan.",
      "toolB": "Entirely free with no pricing plans or paid tier at all.",
      "whyItMatters": "Verdaccio has zero licensing cost regardless of usage, unlike Activepieces' per-flow model.",
      "benefitsWho": "Cost-sensitive engineering teams benefit from Verdaccio being completely free."
    },
    {
      "title": "Licensing & Commercial Model",
      "toolA": "A commercial paid product with a self-hosted option, but no free or open-source license documented.",
      "toolB": "MIT-licensed and run entirely by volunteers, with no official paid or hosted commercial tier documented.",
      "whyItMatters": "Verdaccio's volunteer-run model means no vendor support contract exists, which matters for teams needing SLAs.",
      "benefitsWho": "Teams comfortable self-supporting open-source tooling benefit from Verdaccio's MIT license; teams wanting vendor support may prefer Activepieces' paid model."
    },
    {
      "title": "Deployment Tooling",
      "toolA": "Deploys as cloud-hosted or self-hosted, without Kubernetes-specific tooling documented.",
      "toolB": "Ships an official Docker image and a Helm chart specifically for Kubernetes deployment.",
      "whyItMatters": "Teams running Kubernetes get purpose-built deployment tooling from Verdaccio.",
      "benefitsWho": "DevOps teams deploying on Kubernetes benefit from Verdaccio's official Helm chart."
    },
    {
      "title": "Ecosystem Fit",
      "toolA": "Integrates via its \"pieces\" library for SaaS apps like Gmail, unrelated to package management.",
      "toolB": "Purpose-built for npm/yarn/pnpm clients and used by named projects including Nx, pnpm, Angular CLI, and Storybook.",
      "whyItMatters": "Verdaccio's ecosystem fit is proven by well-known projects relying on it in production.",
      "benefitsWho": "JavaScript/TypeScript development teams benefit from Verdaccio's proven fit with npm-ecosystem tooling."
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
          "feature": "Private npm/yarn/pnpm package hosting",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Public registry proxying/caching",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Licensing",
      "rows": [
        {
          "feature": "Free to use",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Paid/enterprise tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Verdaccio has no official paid tier"
        },
        {
          "feature": "Open-source license",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "MIT"
        }
      ]
    },
    {
      "group": "Deployment & Ecosystem",
      "rows": [
        {
          "feature": "Official Docker image",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Kubernetes Helm chart",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Plugin ecosystem for storage backends",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "S3, GCS"
        },
        {
          "feature": "Prebuilt SaaS app integrations",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "\"pieces\" e.g. Gmail"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Verdaccio free?",
      "answer": "Yes, completely free and open source under the MIT license, with no paid tier."
    },
    {
      "question": "Is Activepieces free?",
      "answer": "No, plans start at $5 per active flow/month."
    },
    {
      "question": "What package managers does Verdaccio support?",
      "answer": "npm, yarn, and pnpm."
    },
    {
      "question": "Does Verdaccio have a hosted or managed offering?",
      "answer": "No — it's run entirely by volunteers with no official paid or hosted commercial tier; self-hosting requires managing uptime, storage, and scaling yourself."
    },
    {
      "question": "Can Activepieces host private npm packages like Verdaccio?",
      "answer": "No — the facts don't document any package-registry functionality for Activepieces; it's a SaaS workflow automation tool."
    },
    {
      "question": "How is Verdaccio deployed?",
      "answer": "Directly, via its official Docker image, or on Kubernetes using its Helm chart."
    }
  ]
};

export default activepiecesVsVerdaccioContent;

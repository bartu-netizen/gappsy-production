import type { ToolComparisonContent } from './types';

const activepiecesVsPipedreamContent: ToolComparisonContent = {
  "verdict": "Activepieces publishes a clear per-flow price ($5/month per active flow) and documents both self-hosted and cloud deployment, but its integration catalog isn't quantified beyond an example (Gmail). Pipedream documents a very large integration catalog (3,000+ apps, 10,000+ tools) and an AI Agent Builder, and is now backed by Workday following its November 2025 acquisition, but its current pricing plans could not be verified from the facts reviewed. Deployment control versus integration breadth is the core tradeoff.",
  "bestForToolA": "Teams that want automation self-hosted for data control or cost predictability, with transparent per-active-flow pricing rather than a per-seat fee.",
  "bestForToolB": "Teams that need access to a very large third-party integration catalog (3,000+ apps) or want to build and deploy AI agents quickly, and can tolerate custom-priced or unpublished pricing.",
  "whoNeedsBoth": "Organizations that need self-hosted automation for sensitive internal workflows may run Activepieces there while also using Pipedream for less common third-party SaaS integrations not covered by their self-hosted setup.",
  "keyDifferences": [
    {
      "title": "Pricing transparency",
      "toolA": "Publishes pricing: Standard plan at $5 per active flow/month, Ultimate at custom annual-contract pricing.",
      "toolB": "Current pricing plans and tiers could not be verified from the official pricing page during research; no pricing_plans are documented.",
      "whyItMatters": "Published, usage-based pricing lets teams estimate cost before committing, while unverified pricing requires direct sales contact.",
      "benefitsWho": "Budget-conscious teams and self-serve buyers who want to estimate cost without a sales call."
    },
    {
      "title": "Deployment model",
      "toolA": "Explicitly supports both self-hosted and cloud-hosted deployment.",
      "toolB": "Not documented as offering a self-hosted option in the facts reviewed.",
      "whyItMatters": "Self-hosting matters for teams with data residency, compliance, or cost-control requirements that a cloud-only product can't satisfy.",
      "benefitsWho": "Regulated industries and teams that must keep automation data on their own infrastructure."
    },
    {
      "title": "Integration catalog size",
      "toolA": "Documents a 'pieces' integration library with an example integration (Gmail), but no total count.",
      "toolB": "Documents 3,000+ integrated apps and 10,000+ pre-built tools.",
      "whyItMatters": "A larger, quantified integration catalog reduces the chance a team will need to build custom connectors for common SaaS tools.",
      "benefitsWho": "Teams automating across many different third-party SaaS apps."
    },
    {
      "title": "AI agent building",
      "toolA": "Not documented as a distinct feature in the facts reviewed.",
      "toolB": "Includes an AI Agent Builder for creating and deploying AI agents by prompting, editing, and deploying in seconds.",
      "whyItMatters": "A dedicated AI agent builder lowers the effort to stand up agentic automations compared to assembling one from generic workflow steps.",
      "benefitsWho": "Teams building AI-agent-driven automations rather than traditional trigger-action workflows."
    },
    {
      "title": "Ownership and backing",
      "toolA": "No ownership or acquisition status is documented in the facts reviewed.",
      "toolB": "Acquired by Workday in November 2025, now operating under Workday, per the facts, which adds enterprise backing but also introduces roadmap uncertainty for standalone use cases.",
      "whyItMatters": "Corporate ownership can affect long-term roadmap priorities and enterprise trust/support resources.",
      "benefitsWho": "Enterprise buyers evaluating vendor stability, and independent-tool users concerned about roadmap changes post-acquisition."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment & Access",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Cloud-hosted deployment",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Code-level custom steps (Node.js/Python)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Integrations & AI",
      "rows": [
        {
          "feature": "Quantified integration catalog",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pipedream: 3,000+ apps, 10,000+ tools."
        },
        {
          "feature": "AI Agent Builder",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Enterprise governance controls",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Trust",
      "rows": [
        {
          "feature": "Published pricing plans",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Pipedream pricing could not be verified."
        },
        {
          "feature": "Usage-based pricing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Activepieces: $5/active flow/month."
        },
        {
          "feature": "Compliance certifications (SOC 2, HIPAA, GDPR)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can Activepieces be self-hosted?",
      "answer": "Yes, Activepieces supports both self-hosted and cloud deployment."
    },
    {
      "question": "How is Activepieces priced?",
      "answer": "Usage-based, at $5 per active flow/month on the Standard plan, with a custom annual-contract Ultimate plan for larger needs."
    },
    {
      "question": "How many integrations does Pipedream support?",
      "answer": "3,000+ integrated apps and 10,000+ pre-built tools."
    },
    {
      "question": "Is Pipedream still an independent company?",
      "answer": "No, it was acquired by Workday in November 2025 and now operates under Workday."
    },
    {
      "question": "Where is Pipedream based?",
      "answer": "San Francisco, California, United States."
    },
    {
      "question": "Is Pipedream's current pricing published?",
      "answer": "No, current pricing plans and tiers could not be verified from the official pricing page during this research."
    }
  ]
};

export default activepiecesVsPipedreamContent;

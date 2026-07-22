import type { ToolComparisonContent } from './types';

const medusaVsSyliusContent: ToolComparisonContent = {
  "verdict": "Medusa and Sylius are both MIT-licensed, headless, open-source commerce platforms, but they're built on different stacks for different developer audiences: Medusa is a Node.js/TypeScript platform with a managed Medusa Cloud starting at $29/month and built-in Model Context Protocol (MCP) support for AI/agent integrations, while Sylius is a PHP/Symfony platform with a REST API layer via API Platform and an undisclosed-price Sylius Plus commercial tier. The choice mostly comes down to which language ecosystem a team's engineers already work in, plus whether AI/agent tooling is a priority.",
  "bestForToolA": "Medusa fits JavaScript/TypeScript-first engineering teams who want a modular, MIT-licensed commerce core plus a managed cloud option (from $29/month, priced on infrastructure usage rather than GMV) and native MCP support for AI-agent-driven development.",
  "bestForToolB": "Sylius fits PHP/Symfony development teams, often agencies, who want a mature, MIT-licensed headless framework with a strong testing culture (BDD) and are building for brands like Mytheresa, Carrefour, or Jägermeister that already run on the Symfony ecosystem.",
  "whoNeedsBoth": "There's no practical scenario for running both on the same storefront — they are competing backend frameworks in different languages, so the decision is which stack (Node/TypeScript vs. PHP/Symfony) the engineering team standardizes on.",
  "keyDifferences": [
    {
      "title": "Technology Stack",
      "toolA": "Medusa is built as a modular Node.js/TypeScript commerce platform.",
      "toolB": "Sylius is built on PHP and the Symfony framework, exposing REST APIs via API Platform.",
      "whyItMatters": "The underlying language determines which engineering talent pool and existing codebase a team can reuse.",
      "benefitsWho": "Node/TypeScript teams benefit from Medusa; PHP/Symfony teams benefit from Sylius."
    },
    {
      "title": "Managed Cloud Pricing",
      "toolA": "Medusa Cloud starts at $29/month with no GMV-based fees — pricing scales with infrastructure usage.",
      "toolB": "Sylius Plus (its commercial tier) does not publicly disclose pricing.",
      "whyItMatters": "A visible starting price lets teams budget a managed option immediately, while an undisclosed price requires a sales conversation.",
      "benefitsWho": "Startups and small teams wanting quick, transparent cost estimates for a managed deployment."
    },
    {
      "title": "AI/Agent Tooling",
      "toolA": "Medusa has built-in support for AI/agent integrations via Model Context Protocol (MCP), plus a Cloud CLI and a Development Agent.",
      "toolB": "Sylius's documented feature set does not mention AI or agent-oriented tooling.",
      "whyItMatters": "Teams building AI-assisted commerce workflows or agentic automation get native support from Medusa without custom integration work.",
      "benefitsWho": "Engineering teams experimenting with AI agents or LLM-driven development workflows."
    },
    {
      "title": "GitHub Community Scale",
      "toolA": "Medusa has 35k+ GitHub stars.",
      "toolB": "Sylius's community is described in terms of 7,400+ Slack developers and 700+ contributors rather than star count.",
      "whyItMatters": "Community size affects how easy it is to find documentation, plugins, and third-party support.",
      "benefitsWho": "Teams weighing long-term community support and plugin availability."
    },
    {
      "title": "Testing and Development Culture",
      "toolA": "Medusa's documented strengths center on modular architecture and multi-regional/multi-currency support rather than a specific testing methodology.",
      "toolB": "Sylius emphasizes a Behavior-Driven Development (BDD) testing approach as a core part of its engineering culture.",
      "whyItMatters": "A platform with a documented testing philosophy can signal more predictable code quality for teams building mission-critical stores.",
      "benefitsWho": "Enterprise teams with strict QA requirements may value Sylius's explicit BDD methodology."
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing & Deployment",
      "rows": [
        {
          "feature": "Open-source core license",
          "toolA": "available",
          "toolB": "available",
          "note": "Both MIT-licensed"
        },
        {
          "feature": "Managed cloud option",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Medusa Cloud from $29/mo"
        },
        {
          "feature": "Docker/Kubernetes-ready",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Commerce Capabilities",
      "rows": [
        {
          "feature": "Multi-regional / multi-currency support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Promotion engine",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "B2B and B2C support",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multi-vendor marketplace",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Sylius offers Dafre"
        }
      ]
    },
    {
      "group": "Developer Experience",
      "rows": [
        {
          "feature": "AI/agent integration (MCP)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "REST API",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Via API Platform"
        },
        {
          "feature": "BDD testing framework",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Medusa and Sylius both free?",
      "answer": "Yes, both have free, MIT-licensed open-source cores. Medusa's paid layer is Medusa Cloud (from $29/month), while Sylius's paid layer, Sylius Plus, has undisclosed pricing."
    },
    {
      "question": "Which platform supports AI agents natively?",
      "answer": "Medusa supports the Model Context Protocol (MCP) for AI/agent-driven development, along with a Development Agent and Cloud CLI tools. Sylius does not document AI or agent-oriented features."
    },
    {
      "question": "What programming language is each platform built on?",
      "answer": "Medusa is built on Node.js/TypeScript. Sylius is built on PHP and the Symfony framework, using API Platform for its REST APIs."
    },
    {
      "question": "How does pricing compare for a managed/cloud deployment?",
      "answer": "Medusa Cloud has a published starting price of $29/month, billed on infrastructure usage with no GMV fees. Sylius Plus pricing is not publicly disclosed and requires contacting sales."
    },
    {
      "question": "Which platform has a larger open-source community?",
      "answer": "Medusa reports 35k+ GitHub stars. Sylius reports 7,400+ developers on Slack and 700+ contributors — both are large but measured differently in the available data."
    },
    {
      "question": "Does either platform support B2B or marketplace selling?",
      "answer": "Sylius documents native B2C and B2B support plus a dedicated multi-vendor marketplace product (Dafre) and B2B product (Elesto). Medusa's documented features do not explicitly mention B2B or marketplace-specific tooling."
    }
  ]
};

export default medusaVsSyliusContent;

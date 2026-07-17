import type { ToolComparisonContent } from './types';

const docusaurusVsSpeakeasyContent: ToolComparisonContent = {
  "verdict": "Docusaurus is a free, open-source static site generator for building documentation sites with Markdown/MDX and React, maintained by Meta. Speakeasy generates client SDKs and MCP servers from OpenAPI specs, alongside a separate AI Control Plane for governing AI agent access to company systems. They address different parts of a developer experience — Docusaurus for hosting narrative documentation content, Speakeasy for producing machine-consumable code artifacts from an API spec.",
  "bestForToolA": "Teams that want a completely free, self-hosted documentation site with Markdown/MDX authoring, built-in versioning, localization via git or Crowdin, and Algolia search integration.",
  "bestForToolB": "API providers that want to auto-generate and publish client SDKs and MCP servers from an OpenAPI spec, plus organizations needing to govern AI agent access to internal systems, starting with a free tier of 250 operations per language.",
  "whoNeedsBoth": "A company could publish narrative API guides, tutorials, and versioned documentation on a Docusaurus site while using Speakeasy to auto-generate the client SDKs referenced in those docs, and integrate Speakeasy's Docsite feature (Business plan) alongside the hand-written Docusaurus content.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Docusaurus is a static site generator for building and hosting documentation content written in Markdown/MDX.",
      "toolB": "Speakeasy generates client SDKs and MCP servers from OpenAPI specs, with a separate AI Control Plane for governing AI agent access.",
      "whyItMatters": "One produces human-readable documentation pages; the other produces installable code libraries — different deliverables entirely.",
      "benefitsWho": "Technical writers and developer-relations teams benefit from Docusaurus; API platform teams distributing SDKs benefit from Speakeasy."
    },
    {
      "title": "Cost Model",
      "toolA": "Docusaurus is completely free and open source with no paid tiers documented.",
      "toolB": "Speakeasy is freemium, with a free tier capped at 250 operations per language and a Business plan starting at $720/month ($600/month annual) priced per licensed language.",
      "whyItMatters": "Zero-cost tooling versus usage-capped freemium tooling changes long-term budget planning as usage grows.",
      "benefitsWho": "Budget-constrained open-source projects benefit from Docusaurus being fully free; commercial API teams with growing SDK needs should budget for Speakeasy's paid tiers."
    },
    {
      "title": "Ownership & Maintenance",
      "toolA": "Docusaurus is maintained by Meta Open Source as a self-hosted project requiring teams to handle their own build and deployment.",
      "toolB": "Speakeasy is a commercial product, SOC 2 Type II and ISO 27001 certified, with paid plans that include hosted or managed capabilities like auto-publishing to package managers.",
      "whyItMatters": "Self-hosted open-source projects require in-house build/deploy ownership, while commercial products offer managed capabilities and compliance backing.",
      "benefitsWho": "Teams with existing static-site hosting infrastructure benefit from Docusaurus; teams wanting a managed, compliance-certified vendor benefit from Speakeasy."
    },
    {
      "title": "AI Features",
      "toolA": "Docusaurus's own listed cons state it has no built-in AI features.",
      "toolB": "Speakeasy's AI Control Plane actively inspects and governs AI agent traffic, blocking PII, secrets, and prompt-injection attempts, and supports MCP-based agents like Claude, ChatGPT, Cursor, and GitHub Copilot.",
      "whyItMatters": "Organizations exposing internal systems to AI agents need governance tooling that a plain documentation generator doesn't provide.",
      "benefitsWho": "Security and platform teams governing AI agent access benefit from Speakeasy's AI Control Plane."
    },
    {
      "title": "Content Type Produced",
      "toolA": "Docusaurus produces human-readable documentation sites with versioning, localization (git/Crowdin), and Algolia search.",
      "toolB": "Speakeasy produces machine-consumable artifacts — SDKs and MCP servers — directly from an OpenAPI spec, plus Docsite integration on its Business plan.",
      "whyItMatters": "Narrative documentation and generated client code serve different audiences: human readers versus developers/agents integrating an API.",
      "benefitsWho": "Documentation teams writing guides and tutorials benefit from Docusaurus; developers consuming an API programmatically benefit from Speakeasy's generated SDKs."
    }
  ],
  "featureMatrix": [
    {
      "group": "Documentation & Content",
      "rows": [
        {
          "feature": "Markdown/MDX authoring",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Document versioning",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Built-in localization",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Docusaurus: via git or Crowdin"
        },
        {
          "feature": "Built-in site search",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Docusaurus: Algolia integration"
        },
        {
          "feature": "Docsite integration for generated SDKs",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Speakeasy Business plan"
        }
      ]
    },
    {
      "group": "SDK/Code Generation",
      "rows": [
        {
          "feature": "SDK generation from OpenAPI",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "MCP server generation",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Auto-publish to package manager",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "React component customization",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Pricing & Governance",
      "rows": [
        {
          "feature": "Free / open source",
          "toolA": "available",
          "toolB": "available",
          "note": "Docusaurus: fully free; Speakeasy: free tier, 250 ops/language"
        },
        {
          "feature": "Published paid tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "$720/month Business, per language"
        },
        {
          "feature": "AI agent governance features",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "AI Control Plane, Enterprise"
        },
        {
          "feature": "Compliance certification",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SOC 2 Type II, ISO 27001"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Docusaurus and Speakeasy competitors?",
      "answer": "Not directly — Docusaurus is a static site generator for hosting documentation content, while Speakeasy generates SDKs and MCP servers from an OpenAPI spec; many teams could use both for different parts of their developer experience."
    },
    {
      "question": "Is Docusaurus really free?",
      "answer": "Yes, it's a completely free, open-source project maintained by Meta Open Source, with no paid tiers documented."
    },
    {
      "question": "Does Speakeasy have a free plan?",
      "answer": "Yes, the Free tier includes SDK and MCP generation with 250 operations per language, auto-publishing, and community Slack support."
    },
    {
      "question": "Does Docusaurus have AI features?",
      "answer": "No — Docusaurus's own listed cons state it has no built-in AI features, unlike Speakeasy, whose AI Control Plane governs AI agent access to company systems."
    },
    {
      "question": "Can Docusaurus handle multiple documentation versions and languages?",
      "answer": "Yes, it supports maintaining documentation for multiple versions of a project simultaneously, plus built-in localization via git, Crowdin, or other translation managers."
    },
    {
      "question": "Does Speakeasy integrate with a documentation site?",
      "answer": "Yes, the Business plan ($720/month or $600/month billed annually) includes Docsite integration, which could complement a hand-authored Docusaurus site."
    }
  ]
};

export default docusaurusVsSpeakeasyContent;

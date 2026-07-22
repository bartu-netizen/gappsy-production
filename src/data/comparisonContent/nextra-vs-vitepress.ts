import type { ToolComparisonContent } from './types';

const nextraVsVitepressContent: ToolComparisonContent = {
  "verdict": "Nextra and VitePress are both free, open-source static site generators built for documentation and content sites, but they're built on different frameworks for different ecosystems. Nextra extends Next.js with MDX 3 for teams already in the React/Next.js world, while VitePress extends Vite and Vue for teams in the Vue ecosystem. Both ship with internationalization and produce fast, prerendered static output, but their built-in tooling differs: Nextra bundles full-text search via Pagefind and Shiki syntax highlighting by default, while VitePress is maintained under the official Vue.js GitHub organization and exposes /llms.txt and /llms-full.txt endpoints for LLM-agent access to docs.",
  "bestForToolA": "Teams already building on Next.js/React who want MDX-based docs with automatic Next.js Link/Image optimization, file-system routing with ISR support, and built-in Pagefind search without extra configuration.",
  "bestForToolB": "Vue-centric teams who want a lightweight, Vite-powered docs site with fast dev-server startup, custom Vue-component theming, and documented multi-language support across eight languages including Chinese, Russian, and Japanese.",
  "whoNeedsBoth": "A software vendor maintaining both a Next.js product dashboard and a separate Vue-based component library might use Nextra for the product's developer docs and VitePress for the component library's docs, matching each doc site to the same framework as the underlying codebase.",
  "keyDifferences": [
    {
      "title": "Underlying Framework",
      "toolA": "Nextra is built on Next.js and React, inheriting Server/Client Components, ISR, and automatic Next.js Link/Image optimization.",
      "toolB": "VitePress is built on Vite and Vue, with custom themes built using Vue components.",
      "whyItMatters": "The choice locks a docs site into the same component model and build tooling as the framework it's paired with.",
      "benefitsWho": "Developers who want their documentation stack to match their product's frontend framework rather than maintaining two different tech stacks."
    },
    {
      "title": "Built-in Search",
      "toolA": "Nextra automatically indexes content at build time and provides full-text search powered by Pagefind, per its documented feature list.",
      "toolB": "VitePress's documented feature list does not include a built-in search engine.",
      "whyItMatters": "Search is core to docs usability, and a shipped default saves setup work versus integrating a separate service.",
      "benefitsWho": "Teams that want documentation search working out of the box without integrating a third-party search service."
    },
    {
      "title": "Content Authoring Format",
      "toolA": "Nextra uses MDX 3, letting authors embed React components directly inside Markdown pages.",
      "toolB": "VitePress uses Markdown with Vue components embedded directly, per its feature list.",
      "whyItMatters": "The authoring format determines which component syntax and ecosystem writers need to learn.",
      "benefitsWho": "Technical writers already comfortable with either React/JSX or Vue's single-file component syntax."
    },
    {
      "title": "LLM/AI Documentation Access",
      "toolA": "Nextra's documented feature list does not include an llms.txt-style export.",
      "toolB": "VitePress explicitly documents /llms.txt and /llms-full.txt endpoints for LLM-optimized documentation access.",
      "whyItMatters": "As AI coding assistants and agents increasingly consume docs directly, a documented llms.txt endpoint affects how easily agents can ingest a site's content.",
      "benefitsWho": "Teams optimizing documentation for AI agent consumption in addition to human readers."
    },
    {
      "title": "Syntax Highlighting",
      "toolA": "Nextra documents build-time syntax highlighting powered by the Shiki highlighter with no extra configuration.",
      "toolB": "VitePress's feature list does not explicitly name a syntax highlighter.",
      "whyItMatters": "Code-heavy docs sites benefit from accurate, editor-quality highlighting without manual setup.",
      "benefitsWho": "API reference and SDK documentation authors with heavy code-sample content."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Framework & Authoring",
      "rows": [
        {
          "feature": "Underlying framework",
          "toolA": "available",
          "toolB": "available",
          "note": "Nextra: Next.js/React; VitePress: Vite/Vue"
        },
        {
          "feature": "Content format",
          "toolA": "available",
          "toolB": "available",
          "note": "Nextra: MDX 3; VitePress: Markdown + Vue components"
        },
        {
          "feature": "File-system routing",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Custom theming",
          "toolA": "available",
          "toolB": "available",
          "note": "React components vs Vue components"
        }
      ]
    },
    {
      "group": "Content Features",
      "rows": [
        {
          "feature": "Built-in full-text search",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Nextra uses Pagefind"
        },
        {
          "feature": "Syntax highlighting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Nextra uses Shiki"
        },
        {
          "feature": "Internationalization",
          "toolA": "available",
          "toolB": "available",
          "note": "VitePress documents 8 supported languages"
        },
        {
          "feature": "llms.txt / LLM access endpoints",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Licensing & Ecosystem",
      "rows": [
        {
          "feature": "Pricing",
          "toolA": "available",
          "toolB": "available",
          "note": "Both free; VitePress explicitly MIT-licensed"
        },
        {
          "feature": "Official framework-org maintenance",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "VitePress is under the Vue.js GitHub org"
        },
        {
          "feature": "Official hosting/enterprise support",
          "toolA": "unavailable",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Nextra or VitePress free?",
      "answer": "Both are free and open source; Nextra has no licensing cost and offers an \"Open Source\" plan, while VitePress is free under the MIT License."
    },
    {
      "question": "Does Nextra or VitePress have built-in search?",
      "answer": "Nextra documents built-in full-text search powered by Pagefind, indexed automatically at build time. VitePress's public feature list doesn't document a built-in search engine."
    },
    {
      "question": "Which is better for a Vue-based product?",
      "answer": "VitePress, since it's built on Vite and Vue and is maintained under the official Vue.js GitHub organization, while Nextra is built on Next.js and React."
    },
    {
      "question": "Which is better for AI/LLM-agent-friendly docs?",
      "answer": "VitePress explicitly documents /llms.txt and /llms-full.txt endpoints for LLM access; Nextra's documented facts don't include an equivalent feature."
    },
    {
      "question": "Do both support multiple languages?",
      "answer": "Yes. Nextra organizes pages into locale-specific folders for i18n, and VitePress documents support for eight specific languages including English, Chinese, and Japanese."
    },
    {
      "question": "Which has built-in syntax highlighting?",
      "answer": "Nextra documents build-time syntax highlighting via the Shiki highlighter with no extra configuration; this isn't called out in VitePress's documented feature list."
    }
  ]
};

export default nextraVsVitepressContent;

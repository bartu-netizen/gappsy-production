import type { ToolComparisonContent } from './types';

const readmeVsVitepressContent: ToolComparisonContent = {
  "verdict": "ReadMe and VitePress both produce documentation, but they represent opposite ends of the build-vs-buy spectrum: ReadMe is a commercial API documentation platform with a WYSIWYG editor, interactive API reference generated from an OpenAPI spec, and AI-assisted writing tools, with paid plans starting at $250/month. VitePress is a free, open-source static site generator built on Vite and Vue, aimed at teams that want to hand-author Markdown documentation with full control over the codebase and hosting.",
  "bestForToolA": "ReadMe fits companies publishing API documentation for external developers who want a managed, no-code editing experience, an interactive/testable API reference, and AI features like the AI Writer that drafts doc updates from pull requests — companies like NVIDIA, Amazon, and PagerDuty use it.",
  "bestForToolB": "VitePress fits teams, especially those already using Vue, that want a completely free, open-source, self-hosted documentation site generator with Markdown authoring, custom Vue-based themes, and full control over deployment, without any recurring SaaS cost.",
  "whoNeedsBoth": "A company could use VitePress for its free, developer-facing general product documentation and open-source project docs hosted on its own infrastructure, while using ReadMe specifically for its commercial API reference documentation where the interactive, testable API explorer and AI-assisted update workflow justify the subscription cost.",
  "keyDifferences": [
    {
      "title": "Cost Model",
      "toolA": "ReadMe has a free Starter plan, but its Pro plan costs $250/month billed annually, and Enterprise starts at $3,000+/month.",
      "toolB": "VitePress is entirely free and open source under the MIT License, with no paid tier at all.",
      "whyItMatters": "For teams with tight budgets or open-source projects, VitePress carries zero licensing cost, while ReadMe's paid tiers represent a real recurring SaaS expense.",
      "benefitsWho": "Open-source maintainers and cost-conscious teams choosing a documentation tool with no subscription fee."
    },
    {
      "title": "Editing Experience",
      "toolA": "ReadMe offers a WYSIWYG editor for editing documentation directly in the browser without writing raw markdown or code.",
      "toolB": "VitePress is Markdown-focused authoring, with Vue components embedded directly in Markdown files, requiring developer/Git-based workflows rather than a browser WYSIWYG editor.",
      "whyItMatters": "Non-technical writers may prefer ReadMe's no-code editor, while developer-heavy teams may prefer VitePress's Markdown-and-code workflow.",
      "benefitsWho": "Technical writers without coding background (ReadMe) versus developer teams comfortable with Git-based Markdown workflows (VitePress)."
    },
    {
      "title": "Interactive API Reference",
      "toolA": "ReadMe auto-generates an interactive, testable API reference from an OpenAPI spec, plus a Visual API Designer for building specs without hand-writing them.",
      "toolB": "VitePress has no documented API-reference-specific tooling; it is a general-purpose static site generator for any Markdown content, not API docs specifically.",
      "whyItMatters": "Teams documenting a REST/GraphQL API with live, testable endpoints get that capability from ReadMe but would need to build it themselves with VitePress.",
      "benefitsWho": "API providers who want developers to test endpoints directly from the documentation page."
    },
    {
      "title": "AI Features",
      "toolA": "ReadMe includes an AI Writer that drafts documentation updates from pull requests, an AI Linter that enforces a style guide, and an MCP Server exposing docs to AI assistants.",
      "toolB": "VitePress has no built-in AI features beyond providing /llms.txt and /llms-full.txt endpoints for LLM-optimized documentation access.",
      "whyItMatters": "ReadMe automates content generation and consistency with AI, while VitePress's AI support is limited to making existing content machine-readable for LLMs, not generating or editing it.",
      "benefitsWho": "Teams wanting proactive AI content assistance (ReadMe) versus teams that just want their static docs to be LLM-crawlable (VitePress)."
    },
    {
      "title": "Hosting and Infrastructure Control",
      "toolA": "ReadMe is a hosted SaaS platform; documentation is served from ReadMe's infrastructure.",
      "toolB": "VitePress generates static HTML output that teams can host anywhere, giving full control over infrastructure and deployment.",
      "whyItMatters": "Teams with strict infrastructure or data-residency requirements can self-host VitePress output anywhere, while ReadMe requires relying on its hosted platform.",
      "benefitsWho": "Organizations that need to control exactly where and how documentation is hosted."
    }
  ],
  "featureMatrix": [
    {
      "group": "Authoring & Editing",
      "rows": [
        {
          "feature": "WYSIWYG browser editor",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Markdown authoring",
          "toolA": "limited",
          "toolB": "available",
          "note": "ReadMe supports a Markdown editor on Starter; VitePress is Markdown-first by design."
        },
        {
          "feature": "Custom themes / components",
          "toolA": "limited",
          "toolB": "available",
          "note": "ReadMe: customizable themes. VitePress: fully custom Vue-based themes."
        },
        {
          "feature": "Bi-directional Git sync",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "VitePress content lives directly in the developer's own Git repo."
        }
      ]
    },
    {
      "group": "API-Specific Tooling",
      "rows": [
        {
          "feature": "Interactive/testable API reference from OpenAPI",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Visual API spec designer",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "AI-assisted doc drafting from PRs",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Cost & Deployment",
      "rows": [
        {
          "feature": "Free tier / free forever",
          "toolA": "available",
          "toolB": "available",
          "note": "ReadMe Starter is free; VitePress is entirely free (MIT License)."
        },
        {
          "feature": "Paid plans",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "ReadMe Pro $250/month annual; Enterprise $3,000+/month."
        },
        {
          "feature": "Self-hosted static output",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "llms.txt / LLM-optimized access",
          "toolA": "available",
          "toolB": "available",
          "note": "Both expose LLM-friendly access points."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is VitePress a free alternative to ReadMe?",
      "answer": "In terms of cost, yes — VitePress is entirely free and open source under the MIT License, while ReadMe's Pro plan costs $250/month billed annually. However, VitePress is a general-purpose static site generator without ReadMe's interactive API reference or AI writing features."
    },
    {
      "question": "Can VitePress generate an interactive API reference from an OpenAPI spec?",
      "answer": "This is not a documented VitePress feature. ReadMe explicitly auto-generates an interactive, testable API reference from an OpenAPI spec, which is one of its core differentiators."
    },
    {
      "question": "Does VitePress require using Vue?",
      "answer": "VitePress is built on Vite and Vue, and its custom theming system uses Vue components, so it is best suited to teams already comfortable with the Vue ecosystem."
    },
    {
      "question": "Do both tools support AI/LLM access to documentation?",
      "answer": "Yes, in different ways. VitePress provides /llms.txt and /llms-full.txt endpoints for LLM-optimized access. ReadMe offers an MCP Server that exposes documentation to AI assistants like Claude and Cursor, plus an AI Writer and AI Linter for content creation."
    },
    {
      "question": "Which tool is better for hand-authored developer documentation versus API references?",
      "answer": "VitePress is well suited to hand-authored, Markdown-based developer or project documentation with full hosting control. ReadMe is purpose-built for API documentation specifically, with an interactive reference generated from an OpenAPI spec."
    },
    {
      "question": "Is there a free plan for ReadMe?",
      "answer": "Yes, ReadMe's Starter plan is free and includes a custom domain, bi-directional Git sync, and an interactive API reference. Branching, private docs, and most AI features require the paid Pro plan."
    }
  ]
};

export default readmeVsVitepressContent;

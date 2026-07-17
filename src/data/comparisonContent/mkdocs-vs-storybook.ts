import type { ToolComparisonContent } from './types';

const mkdocsVsStorybookContent: ToolComparisonContent = {
  "verdict": "MkDocs and Storybook are both free, open-source tools but solve entirely different problems: MkDocs turns Markdown files into a documentation website, while Storybook is a frontend workshop for building, testing, and documenting individual UI components in isolation. They aren't substitutes — a docs site and a component workshop typically serve different audiences (readers vs. developers) inside the same product.",
  "bestForToolA": "MkDocs fits teams writing prose-heavy documentation (guides, API references, wikis) who want a single YAML config and plain Markdown authoring, deployable to any static host.",
  "bestForToolB": "Storybook fits frontend teams that need to build, visually test, and document UI components in isolation from the full application, especially teams already in a component-driven React/Vue/etc. workflow.",
  "whoNeedsBoth": "A product team commonly runs both together: MkDocs (or a similar generator) for user-facing or engineering prose documentation, and Storybook as the living component library and interaction-testing workshop referenced by that same documentation.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "MkDocs builds project documentation from Markdown files and a single YAML config file.",
      "toolB": "Storybook is a frontend workshop for building, testing, and documenting UI components in isolation from the rest of the application.",
      "whyItMatters": "Choosing the wrong category of tool means missing core capability entirely — MkDocs cannot render live, interactive components, and Storybook is not designed for long-form prose docs.",
      "benefitsWho": "Technical writers benefit from MkDocs' prose-first model; frontend engineers benefit from Storybook's component-first model."
    },
    {
      "title": "Content Format",
      "toolA": "MkDocs content is authored entirely in Markdown, configured via a single mkdocs.yml file.",
      "toolB": "Storybook content is authored as component 'stories' that render actual live UI, with auto-generated documentation pages derived from those stories.",
      "whyItMatters": "Static Markdown pages and live rendered components require fundamentally different authoring workflows.",
      "benefitsWho": "Writers producing conceptual guides benefit from Markdown; engineers documenting component states/props benefit from live stories."
    },
    {
      "title": "Testing Capabilities",
      "toolA": "MkDocs' feature set has no testing capability; it is a static site generator only.",
      "toolB": "Storybook includes interaction testing (simulating clicks and typing) and visual regression testing support, including via the Chromatic add-on.",
      "whyItMatters": "Teams needing to catch UI regressions automatically require a tool built for that purpose, not a docs generator.",
      "benefitsWho": "QA and frontend engineers responsible for catching visual and interaction regressions before release."
    },
    {
      "title": "AI Tooling",
      "toolA": "MkDocs has no built-in AI or hosted search features, per its documented cons.",
      "toolB": "Storybook has introduced MCP support for integrating with AI-assisted React development tools.",
      "whyItMatters": "Teams adopting AI coding assistants may value native MCP integration for connecting Storybook directly into that workflow.",
      "benefitsWho": "Engineering teams using AI coding assistants alongside component development."
    },
    {
      "title": "Ecosystem Scale",
      "toolA": "MkDocs is a smaller, focused Python-based static site generator without a large documented add-on marketplace beyond plugins and extensions.",
      "toolB": "Storybook reports 77.33 million monthly downloads and 2,282+ contributors, with a strong addon ecosystem for testing, accessibility, and documentation.",
      "whyItMatters": "A larger ecosystem means more pre-built integrations and community support for edge cases.",
      "benefitsWho": "Teams that want broad community tooling and long-term maintenance confidence in a component workshop."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Function",
      "rows": [
        {
          "feature": "Markdown documentation site generation",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Isolated UI component development",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Auto-generated docs from source",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Storybook generates docs pages from component stories."
        },
        {
          "feature": "Live preview / auto-reload while editing",
          "toolA": "available",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Testing & Quality",
      "rows": [
        {
          "feature": "Interaction testing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Visual regression testing",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Deeper visual testing available via the Chromatic add-on."
        },
        {
          "feature": "AI-assisted tooling (MCP)",
          "toolA": "unavailable",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Ecosystem",
      "rows": [
        {
          "feature": "Deployable static output to any host",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Storybook runs as a local dev server; hosting requires separate setup or Chromatic."
        },
        {
          "feature": "Built-in themes",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Addon/plugin ecosystem",
          "toolA": "available",
          "toolB": "available",
          "note": "Storybook's addon ecosystem covers testing, accessibility, and documentation."
        },
        {
          "feature": "Framework-agnostic usage",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do MkDocs and Storybook do the same job?",
      "answer": "No. MkDocs generates a static documentation website from Markdown files, while Storybook is a workshop for building and testing individual UI components in isolation. They serve different parts of a product workflow."
    },
    {
      "question": "Are both tools free?",
      "answer": "Yes, both are free and open source. MkDocs has no paid tier documented, and Storybook's documented pricing plan is 'Open Source' at $0."
    },
    {
      "question": "Can Storybook replace a documentation site like MkDocs?",
      "answer": "Not directly for prose documentation — Storybook's documentation is auto-generated from component stories, which is different from the long-form guides and reference content MkDocs is built for."
    },
    {
      "question": "Does either tool include testing?",
      "answer": "Storybook includes interaction testing and visual testing support (with deeper visual regression testing via the Chromatic add-on). MkDocs has no testing capability documented — it is purely a static site generator."
    },
    {
      "question": "Which tool has AI features?",
      "answer": "Storybook has introduced MCP support for AI-assisted React development. MkDocs' documented cons explicitly note it has no built-in AI features."
    },
    {
      "question": "Would a team use both MkDocs and Storybook?",
      "answer": "Yes, it's common for a product team to run MkDocs (or a similar generator) for written documentation while using Storybook as the component library and testing workshop referenced from that documentation."
    }
  ]
};

export default mkdocsVsStorybookContent;

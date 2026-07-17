import type { ToolComparisonContent } from './types';

const docusaurusVsMkdocsContent: ToolComparisonContent = {
  "verdict": "Docusaurus and MkDocs are both free, open-source static site generators for documentation, but they target different technical comfort levels. Docusaurus, maintained by Meta Open Source, is built on React and MDX and adds versioning, localization, and blogging out of the box, making it suited to projects that want a richer, more app-like docs experience. MkDocs uses plain Markdown and a single mkdocs.yml file with Python tooling, favoring simplicity and speed of setup over built-in React customization or versioning.",
  "bestForToolA": "Docusaurus fits teams that need document versioning across multiple releases, built-in localization via git or Crowdin, and are comfortable extending the site with React components.",
  "bestForToolB": "MkDocs fits teams that want a lightweight docs site configured through a single YAML file, without needing MDX, React, or a Node.js build pipeline.",
  "whoNeedsBoth": "A team could evaluate both when migrating documentation platforms — trialing MkDocs for a quick internal wiki while building a customer-facing versioned docs site in Docusaurus — though most projects settle on one generator rather than running both long-term.",
  "keyDifferences": [
    {
      "title": "Document Versioning",
      "toolA": "Docusaurus has built-in support for maintaining documentation for multiple versions of a project simultaneously.",
      "toolB": "MkDocs' documented feature set does not include native multi-version documentation support.",
      "whyItMatters": "Projects that ship multiple supported releases at once need readers to be able to view docs matching their installed version.",
      "benefitsWho": "Open-source maintainers and SaaS vendors supporting several concurrent product versions."
    },
    {
      "title": "Localization Workflow",
      "toolA": "Docusaurus ships with out-of-the-box internationalization using git, Crowdin, or any translation manager.",
      "toolB": "MkDocs' core feature list does not document a built-in localization workflow; it relies more on Markdown authoring and themes.",
      "whyItMatters": "Teams with a non-English or multi-region audience need a documented path to manage translated content without bolting on custom tooling.",
      "benefitsWho": "Global products and open-source projects with international contributor communities."
    },
    {
      "title": "Customization Approach",
      "toolA": "Docusaurus is built on React and MDX, letting teams extend and customize site layout with React components.",
      "toolB": "MkDocs is configured through a single mkdocs.yml file and ships with 'mkdocs' and 'readthedocs' built-in themes plus support for third-party themes.",
      "whyItMatters": "The right depth of customization depends on whether a team has frontend engineering resources or wants a docs site that 'just works' from config.",
      "benefitsWho": "Frontend-savvy teams benefit from Docusaurus' React model, while teams without a dedicated frontend engineer benefit from MkDocs' simpler YAML config."
    },
    {
      "title": "Content Authoring Format",
      "toolA": "Docusaurus uses MDX, allowing docs and blog posts to embed React components inside Markdown-like content.",
      "toolB": "MkDocs uses plain Markdown authoring, extensible via Markdown extensions and plugins.",
      "whyItMatters": "MDX enables interactive, component-driven documentation pages, while plain Markdown is simpler to write and review without touching code.",
      "benefitsWho": "Product and developer relations teams building interactive docs benefit from MDX; technical writers who just want to write prose benefit from MkDocs' plain Markdown."
    },
    {
      "title": "Built-in Search",
      "toolA": "Docusaurus has official built-in support for Algolia documentation search.",
      "toolB": "MkDocs' documented feature set does not call out a native hosted search integration as a core feature.",
      "whyItMatters": "Search is one of the most-used features on any documentation site, so an officially supported integration reduces setup risk.",
      "benefitsWho": "Documentation teams that want a proven, low-configuration search experience for end users."
    }
  ],
  "featureMatrix": [
    {
      "group": "Authoring & Content",
      "rows": [
        {
          "feature": "Markdown authoring",
          "toolA": "available",
          "toolB": "available",
          "note": "Docusaurus uses MDX (Markdown + React); MkDocs uses plain Markdown."
        },
        {
          "feature": "React component support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Built-in blog",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Document versioning",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Live preview with auto-reload",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Internationalization & Search",
      "rows": [
        {
          "feature": "Built-in localization workflow",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Docusaurus supports git or Crowdin-based localization."
        },
        {
          "feature": "Official Algolia search integration",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Built-in AI features",
          "toolA": "unavailable",
          "toolB": "unavailable",
          "note": "Neither tool documents built-in AI capability."
        }
      ]
    },
    {
      "group": "Deployment & Theming",
      "rows": [
        {
          "feature": "Static HTML output for any host",
          "toolA": "available",
          "toolB": "available",
          "note": "MkDocs explicitly lists GitHub Pages and Amazon S3 as deploy targets."
        },
        {
          "feature": "Built-in themes",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "MkDocs ships 'mkdocs' and 'readthedocs' themes."
        },
        {
          "feature": "Third-party theme support",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Plugin/extension ecosystem",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Docusaurus and MkDocs both free?",
      "answer": "Yes. Docusaurus is free and open source, maintained by Meta Open Source, and MkDocs is also completely free and open source."
    },
    {
      "question": "Which one supports multiple documentation versions?",
      "answer": "Docusaurus explicitly supports maintaining documentation for multiple versions of a project at once. MkDocs' documented feature list does not include native version support."
    },
    {
      "question": "Does either tool require React knowledge?",
      "answer": "Docusaurus is built on React and MDX, so deeper customization requires familiarity with React. MkDocs is configured through a single mkdocs.yml file and plain Markdown, requiring Python tooling instead of React."
    },
    {
      "question": "Which tool has built-in search?",
      "answer": "Docusaurus officially supports Algolia documentation search out of the box. MkDocs' feature list does not document a native hosted search integration."
    },
    {
      "question": "Can I host either site on GitHub Pages?",
      "answer": "Yes for MkDocs, which is explicitly documented as deployable to GitHub Pages, Amazon S3, or any static host. Docusaurus is self-hosted in general, with teams handling their own build and deployment."
    },
    {
      "question": "Which tool is easier to set up for a simple project?",
      "answer": "MkDocs' single YAML config file and plain Markdown authoring are positioned as simpler to learn, while Docusaurus offers more built-in capability (versioning, localization, blog) at the cost of a React/MDX learning curve."
    }
  ]
};

export default docusaurusVsMkdocsContent;

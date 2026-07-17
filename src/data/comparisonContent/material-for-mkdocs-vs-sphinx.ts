import type { ToolComparisonContent } from './types';

const materialForMkdocsVsSphinxContent: ToolComparisonContent = {
  "verdict": "Sphinx is a complete documentation generator that builds pages from markup, while Material for MkDocs is a theme that sits on top of a separate generator (MkDocs) — they operate at different layers of the documentation stack, though both are free, open-source tools popular in the Python ecosystem. Choosing between them is less about picking a winner and more about choosing the Sphinx toolchain versus the MkDocs-plus-Material toolchain.",
  "bestForToolA": "Material for MkDocs suits teams that already use or plan to adopt MkDocs and want fast, offline-capable instant search, 10,000+ built-in icons and emojis, and a Material Design interface available in 60+ languages, free under the MIT license.",
  "bestForToolB": "Sphinx suits projects — especially Python codebases — that need automatic API documentation generated from source docstrings and multi-format output (HTML, PDF via LaTeX, ePub, Texinfo) from a single reStructuredText or MyST source, as used by Python's own official documentation.",
  "whoNeedsBoth": "Not directly — Material for MkDocs is a theme specifically for the MkDocs generator, not for Sphinx, so it can't be applied on top of Sphinx's output. A project must choose the MkDocs-plus-Material stack or the Sphinx stack (using one of Sphinx's own themes) rather than combining them.",
  "keyDifferences": [
    {
      "title": "Tool Layer",
      "toolA": "Material for MkDocs is a theme that requires the separate MkDocs generator to function.",
      "toolB": "Sphinx is a complete documentation generator that parses source and builds output on its own.",
      "whyItMatters": "Understanding which layer of the stack each tool occupies determines what else needs to be installed.",
      "benefitsWho": "Teams already committed to MkDocs benefit from Material's theme; teams wanting an all-in-one generator benefit from Sphinx."
    },
    {
      "title": "Markup Language",
      "toolA": "Material for MkDocs is built for MkDocs, which uses plain Markdown.",
      "toolB": "Sphinx uses reStructuredText or MyST Markdown, which the site itself notes has a steeper learning curve than plain Markdown.",
      "whyItMatters": "Contributor onboarding speed depends heavily on markup familiarity.",
      "benefitsWho": "Teams with contributors unfamiliar with reStructuredText benefit from the plain-Markdown workflow that Material for MkDocs sits on top of."
    },
    {
      "title": "Output Formats",
      "toolA": "Material for MkDocs's documented features (instant search, social cards, icons) focus on HTML/web output, with no PDF or ePub output documented.",
      "toolB": "Sphinx builds to HTML, LaTeX/PDF, ePub, and Texinfo from one source.",
      "whyItMatters": "Teams needing downloadable manuals or offline formats need multi-format build support.",
      "benefitsWho": "Projects that ship printable or offline documentation (e.g., PDF manuals) benefit from Sphinx's multi-format builders."
    },
    {
      "title": "Paid Tier",
      "toolA": "Material for MkDocs has an Insiders sponsorship program that gates some new features behind paid sponsorship before public release.",
      "toolB": "Sphinx has no paid tier of any kind — entirely free.",
      "whyItMatters": "Access to the newest features may require ongoing sponsorship spend on one tool but not the other.",
      "benefitsWho": "Teams wanting early access to cutting-edge theme features benefit from sponsoring MkDocs Insiders."
    },
    {
      "title": "Search",
      "toolA": "Material for MkDocs includes built-in instant, offline-capable client-side search as a core documented feature.",
      "toolB": "Sphinx's documented feature list does not describe a comparable built-in instant, offline client-side search.",
      "whyItMatters": "Fast, offline search significantly improves the documentation reading experience for end users.",
      "benefitsWho": "End users browsing documentation, especially with unreliable connectivity, benefit from Material for MkDocs's instant search."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Documentation Engine",
      "rows": [
        {
          "feature": "Standalone documentation generator",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Material for MkDocs requires MkDocs to function"
        },
        {
          "feature": "Automatic API docs from docstrings",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multi-format output (PDF/ePub/etc.)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Cross-referencing across pages/projects",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Extension ecosystem",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Presentation & UX",
      "rows": [
        {
          "feature": "Instant/offline client-side search",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Built-in icon/emoji library",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "10,000+ icons and emojis"
        },
        {
          "feature": "Responsive Material Design UI",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Language translations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "60+ languages"
        },
        {
          "feature": "Social share card generation",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Licensing & Cost",
      "rows": [
        {
          "feature": "Free / open source",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "License type",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Material for MkDocs: MIT"
        },
        {
          "feature": "Paid early-access tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Material for MkDocs: Insiders, sponsorship-based"
        },
        {
          "feature": "Actively maintained since",
          "toolA": "available",
          "toolB": "available",
          "note": "Material for MkDocs: 2016; Sphinx: 2007"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can I use Material for MkDocs with Sphinx?",
      "answer": "No — Material for MkDocs is built specifically as a theme for the MkDocs generator, not for Sphinx. Using it requires the MkDocs toolchain, not Sphinx."
    },
    {
      "question": "Which has better built-in search?",
      "answer": "Material for MkDocs documents instant, offline-capable client-side search as a core feature. Sphinx's facts don't describe a comparable built-in instant search."
    },
    {
      "question": "Does Sphinx cost anything?",
      "answer": "No, Sphinx is fully free and open-source with no paid tier."
    },
    {
      "question": "What is MkDocs Insiders?",
      "answer": "A sponsorship program for Material for MkDocs that gives sponsors early access to new features before they're released publicly."
    },
    {
      "question": "Which tool is older?",
      "answer": "Sphinx has been maintained since 2007. Material for MkDocs has been maintained by Martin Donath since 2016."
    },
    {
      "question": "Can Sphinx output PDF documentation?",
      "answer": "Yes, Sphinx can build LaTeX output which produces PDF, in addition to HTML, ePub, and Texinfo formats."
    }
  ]
};

export default materialForMkdocsVsSphinxContent;

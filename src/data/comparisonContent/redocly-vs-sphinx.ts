import type { ToolComparisonContent } from './types';

const redoclyVsSphinxContent: ToolComparisonContent = {
  "verdict": "Redocly is a commercial, hosted API documentation platform (Realm) built around the open-source Redoc renderer, aimed at teams that want managed hosting, design-review tooling, and governance features. Sphinx is a free, self-hosted, general-purpose documentation generator best known for powering Python's own documentation, with no built-in API-spec-specific tooling like mock servers or breaking-change detection.",
  "bestForToolA": "Redocly suits API-focused teams that want managed, per-seat hosted documentation with mock servers and design review (Reunite), plus AI search and MCP servers on the $24/seat/month Enterprise plan.",
  "bestForToolB": "Sphinx suits open-source and software projects — like Python and the Linux kernel, both cited as using it — that need a free, self-hosted documentation generator with automatic API docs pulled from source code docstrings and output to multiple formats including HTML and PDF.",
  "whoNeedsBoth": "A Python project could use Sphinx to generate its core reference documentation from docstrings while using Redocly's free, open-source Redoc renderer to render a separate OpenAPI-based REST API reference, since Sphinx is not purpose-built for rendering OpenAPI specs.",
  "keyDifferences": [
    {
      "title": "Cost Model",
      "toolA": "Redocly's hosted Realm platform starts at $10/seat/month (Pro), with no permanent free plan for the hosted product.",
      "toolB": "Sphinx is entirely free and open-source with no paid tier of any kind.",
      "whyItMatters": "Budget-constrained or open-source projects need to know whether a tool requires ongoing spend.",
      "benefitsWho": "Open-source maintainers and cost-sensitive teams benefit from Sphinx's zero-cost model."
    },
    {
      "title": "Hosting",
      "toolA": "Redocly provides managed hosting via Reunite as part of its paid plans.",
      "toolB": "Sphinx has no official hosted or managed service — self-hosting or a static host is required.",
      "whyItMatters": "Managed hosting removes infrastructure overhead but adds recurring cost; self-hosting is free but requires setup and maintenance.",
      "benefitsWho": "Teams without dedicated DevOps resources benefit from Redocly's managed hosting; teams with existing static-hosting infrastructure benefit from Sphinx's flexibility."
    },
    {
      "title": "Source Format & Output",
      "toolA": "Redocly's Redoc renders from OpenAPI, GraphQL, AsyncAPI, and SOAP specs, focused on web documentation output.",
      "toolB": "Sphinx is authored in reStructuredText or MyST Markdown and builds to HTML, LaTeX/PDF, ePub, and Texinfo from a single source.",
      "whyItMatters": "Teams needing offline formats like PDF or ePub need a generator that supports those outputs natively.",
      "benefitsWho": "Projects that need downloadable PDF or ePub manuals benefit from Sphinx's multi-format output."
    },
    {
      "title": "API-Specific Tooling",
      "toolA": "Redocly includes mock servers, design-review diffing (Reunite), and an internal API catalog (Reef).",
      "toolB": "Sphinx has no documented API-spec-specific tooling — it is a general documentation generator, not an API-spec renderer.",
      "whyItMatters": "Teams documenting REST/GraphQL APIs specifically benefit from purpose-built spec tooling like mock servers.",
      "benefitsWho": "API product teams benefit from Redocly's spec-aware features; general software projects benefit from Sphinx's broader applicability."
    },
    {
      "title": "Track Record & Scale",
      "toolA": "Redocly, founded in 2018 and headquartered in Austin, Texas, reports over 212,000 companies using Realm and 1B+ APIs linted.",
      "toolB": "Sphinx has been maintained since 2007 and powers documentation for Python, the Linux kernel, and Project Jupyter.",
      "whyItMatters": "Longevity and adoption at scale signal tool maturity and community support.",
      "benefitsWho": "Teams valuing a long-established, widely adopted open-source tool benefit from Sphinx's track record since 2007."
    }
  ],
  "featureMatrix": [
    {
      "group": "Documentation Generation",
      "rows": [
        {
          "feature": "Multiple output formats (HTML/PDF/ePub)",
          "toolA": "limited",
          "toolB": "available",
          "note": "Sphinx: HTML, LaTeX/PDF, ePub, Texinfo; Redocly is primarily web docs"
        },
        {
          "feature": "Auto-generated API docs from source code",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Sphinx: from docstrings"
        },
        {
          "feature": "OpenAPI/AsyncAPI spec rendering",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Cross-referencing across pages/projects",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Theming/customization",
          "toolA": "available",
          "toolB": "available",
          "note": "Redocly: Reunite branding, custom domain; Sphinx: themes, extensions"
        }
      ]
    },
    {
      "group": "Hosting & Deployment",
      "rows": [
        {
          "feature": "Official managed hosting",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Redocly: Reunite"
        },
        {
          "feature": "Self-hosting required",
          "toolA": "limited",
          "toolB": "available",
          "note": "Redocly Enterprise+ offers single-tenant option"
        },
        {
          "feature": "Custom domain",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "API-Specific Features",
      "rows": [
        {
          "feature": "Mock servers",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Design review / spec diffing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Redocly Reunite"
        },
        {
          "feature": "Internal API catalog/governance",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Redocly Reef, add-on"
        },
        {
          "feature": "AI search / MCP servers",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Redocly Enterprise, $24/seat/month"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Sphinx really free?",
      "answer": "Yes, Sphinx is fully open-source software with no paid tier documented."
    },
    {
      "question": "Does Redocly have a free plan?",
      "answer": "There is no permanent free tier for the hosted Realm platform; Pro starts at $10/seat/month. The underlying Redoc renderer, however, is free to use standalone."
    },
    {
      "question": "Can Sphinx render OpenAPI specs?",
      "answer": "This is not documented as a core Sphinx feature — Sphinx is a general-purpose documentation generator built around reStructuredText/MyST source, not an OpenAPI-specific renderer like Redoc."
    },
    {
      "question": "Does Redocly support output formats like PDF or ePub?",
      "answer": "This is not documented among Redocly's features; its focus is web-based documentation hosting rather than multi-format publishing."
    },
    {
      "question": "Which tool is older?",
      "answer": "Sphinx has been maintained since 2007. Redocly was founded in 2018."
    },
    {
      "question": "Where is Redocly headquartered?",
      "answer": "Redocly is headquartered in Austin, Texas."
    }
  ]
};

export default redoclyVsSphinxContent;

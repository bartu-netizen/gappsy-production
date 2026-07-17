import type { ToolComparisonContent } from './types';

const hoppscotchVsStarlightContent: ToolComparisonContent = {
  "verdict": "Hoppscotch and Starlight are both free, open-source developer tools, but they solve unrelated problems. Hoppscotch is an API development ecosystem for building, testing, and documenting REST, GraphQL, WebSocket, and SSE requests, with real-time collaboration and self-hosting support. Starlight is a documentation site framework built on Astro, with built-in search, internationalization, and SEO defaults for publishing docs sites. One tests APIs; the other publishes documentation.",
  "bestForToolA": "Hoppscotch fits developers and API teams who need to test REST, GraphQL, WebSocket, and SSE endpoints in one interface, collaborate on collections in real time, and optionally self-host instead of using the hosted cloud version.",
  "bestForToolB": "Starlight fits developers or teams building a documentation website who want built-in full-text search, internationalization, and SEO defaults out of the box, and who are comfortable working within Astro and writing content in Markdown, MDX, or Markdoc.",
  "whoNeedsBoth": "A developer tools company could use Hoppscotch internally and with partners to test and collaborate on its API endpoints, then use Starlight to publish the public-facing API documentation site describing those same endpoints — the two would sit side by side in a typical API product's toolchain.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Hoppscotch is an API development ecosystem for building, testing, and documenting HTTP and GraphQL requests, supporting REST, GraphQL, WebSocket, and SSE protocol testing in one interface.",
      "toolB": "Starlight is a documentation site framework for publishing static docs sites, built on top of Astro.",
      "whyItMatters": "These tools address entirely different stages of the developer workflow — testing an API versus publishing documentation about it.",
      "benefitsWho": "API developers benefit from Hoppscotch; teams publishing public or internal docs benefit from Starlight."
    },
    {
      "title": "Underlying Framework",
      "toolA": "Hoppscotch's documented facts do not name a specific underlying web framework; it is offered as a hosted app and a self-hostable deployment.",
      "toolB": "Starlight is explicitly built on top of Astro, so pages ship with minimal client-side JavaScript per its documented pros.",
      "whyItMatters": "Knowing the underlying framework affects how deeply a team can customize the tool and what ecosystem skills are needed to extend it.",
      "benefitsWho": "Teams already using Astro for other sites benefit from Starlight's native fit into that ecosystem."
    },
    {
      "title": "Collaboration vs. Content Publishing",
      "toolA": "Hoppscotch supports real-time collaboration on API collections among team members.",
      "toolB": "Starlight is a content publishing framework with type-safe frontmatter and framework-agnostic UI components (React, Vue, Svelte, Solid), not a real-time collaboration tool.",
      "whyItMatters": "Real-time collaboration matters for teams jointly testing and iterating on API requests, while a docs framework is about publishing finished content.",
      "benefitsWho": "Distributed API teams benefit from Hoppscotch's real-time collaboration; technical writers building a docs site benefit from Starlight's content tooling."
    },
    {
      "title": "Deployment Model",
      "toolA": "Hoppscotch offers both a hosted cloud version and a self-hostable deployment option.",
      "toolB": "Starlight has no official hosted or managed offering, per its documented cons — it must be deployed like any other Astro site (e.g., to a static host).",
      "whyItMatters": "A tool with an official hosted option removes deployment work, while a framework-only tool requires the team to handle its own hosting pipeline.",
      "benefitsWho": "Teams wanting a quick hosted start benefit from Hoppscotch's cloud version; teams already comfortable deploying static sites benefit equally from Starlight since deployment is a one-time setup."
    },
    {
      "title": "Content Format Support",
      "toolA": "Hoppscotch's documented facts focus on request/response testing formats (REST, GraphQL, WebSocket, SSE), not prose content formats.",
      "toolB": "Starlight supports writing content in Markdown, MDX, or Markdoc, with built-in TypeScript-backed frontmatter schema validation.",
      "whyItMatters": "Content format flexibility matters specifically for documentation authoring, which is outside Hoppscotch's scope entirely.",
      "benefitsWho": "Technical writers who want format flexibility and type-safe frontmatter benefit from Starlight."
    }
  ],
  "featureMatrix": [
    {
      "group": "API Testing (Hoppscotch)",
      "rows": [
        {
          "feature": "REST/GraphQL/WebSocket/SSE testing",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Real-time collaboration on collections",
          "toolA": "available",
          "toolB": "unavailable",
          "note": ""
        },
        {
          "feature": "Self-hostable deployment",
          "toolA": "available",
          "toolB": "available",
          "note": "Both can be self-hosted, for different purposes"
        }
      ]
    },
    {
      "group": "Documentation Publishing (Starlight)",
      "rows": [
        {
          "feature": "Built-in full-text search",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Internationalization (i18n)",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Markdown / MDX / Markdoc content support",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "SEO defaults for docs pages",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Type-safe frontmatter",
          "toolA": "unavailable",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Cost & Access",
      "rows": [
        {
          "feature": "Free / open source",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Officially hosted/managed offering",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Starlight has none per documented cons"
        },
        {
          "feature": "Framework-agnostic UI component support",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Starlight: React, Vue, Svelte, Solid"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Hoppscotch and Starlight compete with each other?",
      "answer": "No. Hoppscotch is an API testing and development tool for REST, GraphQL, WebSocket, and SSE requests, while Starlight is a framework for building documentation websites. They serve different, non-overlapping purposes."
    },
    {
      "question": "Are both Hoppscotch and Starlight free?",
      "answer": "Yes. Hoppscotch is open source with both a hosted cloud version and a self-hostable version. Starlight is free and open source, built on Astro, with no paid tier documented."
    },
    {
      "question": "Can Starlight be used to document an API tested in Hoppscotch?",
      "answer": "That is a reasonable combined workflow, though the facts do not document a direct integration between the two — a team would test and iterate on API requests in Hoppscotch, then separately author and publish the documentation describing those endpoints in a Starlight-based docs site."
    },
    {
      "question": "Does Starlight offer a hosted version like Hoppscotch does?",
      "answer": "No. Starlight has no official hosted or managed offering per its documented cons; it must be deployed like any other Astro site. Hoppscotch, by contrast, offers both a hosted cloud version and a self-hostable option."
    },
    {
      "question": "What content formats does Starlight support?",
      "answer": "Starlight supports Markdown, MDX, and Markdoc, with type-safe frontmatter validation backed by TypeScript. This is not a relevant comparison point for Hoppscotch, which is focused on API request testing rather than content authoring."
    }
  ]
};

export default hoppscotchVsStarlightContent;

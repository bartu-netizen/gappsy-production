import type { ToolComparisonContent } from './types';

const craftCmsVsGravContent: ToolComparisonContent = {
  "verdict": "Craft CMS and Grav sit at opposite ends of the cost and architecture spectrum: Grav is completely free and MIT-licensed, stores content as Markdown and YAML files with no database, and ships a built-in Model Context Protocol server for AI agents, while Craft CMS is database-driven under a proprietary Pixel & Tonic license, requires paid Team ($279/project) or Pro ($399/project) licenses for multi-user teams, but offers first-party Craft Cloud managed hosting and a Craft Commerce e-commerce add-on that Grav doesn't document.",
  "bestForToolA": "Craft CMS suits teams that want a managed, push-to-deploy hosting product (Craft Cloud) and integrated e-commerce (Craft Commerce with Stripe) and are willing to pay per-project licensing.",
  "bestForToolB": "Grav suits developers who want a completely free, database-free CMS with Git-version-controllable content and native AI-agent integration via its built-in MCP server.",
  "whoNeedsBoth": "There's no natural single-site scenario for combining them since both are full CMS platforms; an agency might keep both in its toolkit — Grav for free, lightweight, database-free client sites and Craft CMS for larger multi-site or commerce-driven engagements — but would deploy each independently per project.",
  "keyDifferences": [
    {
      "title": "License & Cost Model",
      "toolA": "Craft CMS requires paid Team ($279/project) or Pro ($399/project) licenses for multi-user teams under a proprietary Pixel & Tonic license; only the single-user Solo edition is free.",
      "toolB": "Grav's core is completely free and MIT-licensed with no per-project licensing fees, only optional premium themes/plugins starting at $50.",
      "whyItMatters": "Ongoing license cost adds up across a portfolio of client sites, especially for agencies running many projects.",
      "benefitsWho": "Budget-constrained developers and agencies managing many small sites."
    },
    {
      "title": "Content Storage Architecture",
      "toolA": "Craft CMS is database-driven, using Twig templates or GraphQL to render and query that database.",
      "toolB": "Grav stores content as Markdown and YAML files with no database required, making it Git-version-controllable.",
      "whyItMatters": "A no-database architecture simplifies hosting, backup, and version control for developers who prefer file-based workflows.",
      "benefitsWho": "Developers who want Git-based content workflows without managing a database."
    },
    {
      "title": "AI Agent Integration",
      "toolA": "Craft CMS's facts don't document an MCP server or equivalent AI-agent protocol.",
      "toolB": "Grav includes a built-in Model Context Protocol (MCP) server, allowing AI agents to interact directly with a Grav site.",
      "whyItMatters": "Native MCP support lets AI coding agents and assistants interact with the CMS without custom integration work.",
      "benefitsWho": "Teams building AI-agent-assisted content or development workflows."
    },
    {
      "title": "Managed Hosting",
      "toolA": "Craft CMS offers first-party Craft Cloud hosting with push-to-deploy and a global CDN, from $120/month per project.",
      "toolB": "Grav has no official managed hosting or cloud plan — self-hosting is required.",
      "whyItMatters": "First-party hosting removes the need to separately source infrastructure, at an added monthly cost.",
      "benefitsWho": "Teams that prefer a single vendor for both CMS and hosting versus those comfortable self-hosting for free."
    },
    {
      "title": "Admin Interface Technology",
      "toolA": "Craft's control panel is described with Live Preview and an image editor, and the admin UI is translated into 25 languages.",
      "toolB": "Grav ships a SvelteKit 5 and Tailwind 4 admin panel with instant SPA navigation and real-time collaborative editing.",
      "whyItMatters": "Admin UI technology and language coverage affect editor experience and international team collaboration.",
      "benefitsWho": "Content teams evaluating day-to-day admin usability and localization needs."
    }
  ],
  "featureMatrix": [
    {
      "group": "Architecture & Storage",
      "rows": [
        {
          "feature": "Flat-file (no database) content storage",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Git-version-controllable content",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "GraphQL API",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Built-in MCP server for AI agents",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Admin & Developer Experience",
      "rows": [
        {
          "feature": "Modern JS-framework admin panel",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Grav: SvelteKit 5 + Tailwind 4"
        },
        {
          "feature": "Multi-language interface support",
          "toolA": "available",
          "toolB": "available",
          "note": "Craft: 25-language control panel; Grav: built-in i18n"
        },
        {
          "feature": "Real-time collaborative editing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Content versioning & scheduling",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Cost, Hosting & Ecosystem",
      "rows": [
        {
          "feature": "Completely free for multi-user teams",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Craft's free Solo edition is limited to one user"
        },
        {
          "feature": "First-party managed cloud hosting",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Grav's con list states no official hosting/cloud plan"
        },
        {
          "feature": "E-commerce companion product",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Craft Commerce"
        },
        {
          "feature": "Premium theme/plugin marketplace",
          "toolA": "available",
          "toolB": "available",
          "note": "Craft: Plugin Store; Grav: individually sold premium themes from $50"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is genuinely free for a team, not just a single user?",
      "answer": "Grav's MIT-licensed core is free for unlimited use by any size team. Craft's free Solo edition is capped at one user account, so teams need a paid Team ($279/project) or Pro ($399/project) license."
    },
    {
      "question": "Does either support AI agent integration natively?",
      "answer": "Grav documents a built-in MCP (Model Context Protocol) server for AI agents. Craft CMS's facts don't mention MCP or a comparable AI-agent protocol."
    },
    {
      "question": "Do I need a database to run either CMS?",
      "answer": "Grav needs no database — content is stored as Markdown and YAML files. Craft CMS is database-driven, querying content via Twig templates or GraphQL."
    },
    {
      "question": "Which offers first-party managed hosting?",
      "answer": "Craft Cloud provides managed, push-to-deploy hosting starting at $120/month per project. Grav requires self-hosting, with no official managed hosting or cloud plan documented."
    },
    {
      "question": "How do their admin interfaces differ technically?",
      "answer": "Grav's admin uses SvelteKit 5 and Tailwind 4 with real-time collaborative editing. Craft's control panel doesn't document a comparable modern JS framework but does offer a 25-language translated interface."
    },
    {
      "question": "Which cites larger recognizable organizations as users?",
      "answer": "Grav cites Microsoft, Xbox, Cisco, and the USDA as users on its site. Craft CMS cites 150,000+ sites created and 240 partner agencies without naming specific enterprise clients in the available facts."
    }
  ]
};

export default craftCmsVsGravContent;

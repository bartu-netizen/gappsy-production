import type { ToolComparisonContent } from './types';

const gravVsOctoberCmsContent: ToolComparisonContent = {
  "verdict": "Grav and October CMS are both PHP-based self-hosted CMS platforms with roots in 2014, but they diverge on licensing and architecture: Grav's MIT-licensed core is free forever with a flat-file, no-database architecture and a built-in MCP server for AI agents, while October CMS is built on Laravel with a database-backed model, gives a free full-featured license for only the first year before requiring a $39/year/site license (or an Unlimited Licenses subscription for agencies), and centers extensibility on its own Marketplace of hundreds of plugins and themes.",
  "bestForToolA": "Grav suits developers who want a permanently free, flat-file CMS with Git-friendly content and native AI-agent integration, without any ongoing license cost.",
  "bestForToolB": "October CMS suits Laravel developers who want access to a large plugin and theme Marketplace and reusable page components, and who are comfortable paying $39/year/site (or an agency-wide Unlimited Licenses subscription) after the first free year.",
  "whoNeedsBoth": "An agency comfortable with both Symfony and Laravel ecosystems might choose per-client based on budget — Grav for clients unwilling to pay any ongoing license fee, October CMS for clients who want Marketplace plugins and accept the post-year-one $39/year/site cost — but no single project would run both simultaneously.",
  "keyDifferences": [
    {
      "title": "Licensing Philosophy",
      "toolA": "Grav's core is MIT-licensed and free forever, with no licensing fee ever required.",
      "toolB": "October CMS gives a free full-featured license only for the first year; continuing updates after that require a paid license ($39/year/site) under a proprietary EULA with Responsiv Pty Ltd.",
      "whyItMatters": "Long-term total cost of ownership differs significantly between a permanently free core and one with a recurring per-site fee after year one.",
      "benefitsWho": "Budget-conscious developers and long-running projects sensitive to recurring license costs."
    },
    {
      "title": "Underlying Framework",
      "toolA": "Grav is built on Symfony 7 with Twig 3 templating and a flat-file, no-database architecture.",
      "toolB": "October CMS is built on the Laravel framework, giving developers access to Laravel's conventions and ecosystem, with a database-backed model implied by its reusable 'components' feature.",
      "whyItMatters": "Framework familiarity determines the learning curve and available third-party tooling for a development team.",
      "benefitsWho": "Developers already fluent in either the Symfony or Laravel ecosystem."
    },
    {
      "title": "Content Storage",
      "toolA": "Grav stores content as Markdown and YAML files, requiring no database.",
      "toolB": "October CMS's facts don't document a flat-file mode, relying on Laravel's typical database-backed models.",
      "whyItMatters": "File-based storage simplifies backup, version control, and hosting for smaller sites.",
      "benefitsWho": "Developers who prefer Git-based content workflows over database administration."
    },
    {
      "title": "AI Agent Integration",
      "toolA": "Grav documents a built-in MCP server for AI agent interaction with a Grav site.",
      "toolB": "October CMS's facts don't mention MCP or a comparable AI-agent integration.",
      "whyItMatters": "Native AI-agent protocol support enables assistants to interact with the CMS without custom integration.",
      "benefitsWho": "Teams building AI-agent-assisted development or content workflows."
    },
    {
      "title": "Extension Ecosystem Framing",
      "toolA": "Grav's ecosystem is framed around GitHub stars (15,571+) and individually sold premium themes/plugins (e.g., Helios at $50), with no single unified paid marketplace.",
      "toolB": "October CMS centers on its Marketplace, offering hundreds of plugins and themes, plus reusable page 'components.'",
      "whyItMatters": "A unified marketplace can make discovering and purchasing extensions easier than a scattered community ecosystem.",
      "benefitsWho": "Non-developer site owners wanting a one-stop shop for adding functionality."
    }
  ],
  "featureMatrix": [
    {
      "group": "Architecture",
      "rows": [
        {
          "feature": "Flat-file (no database) architecture",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Built on a modern PHP framework",
          "toolA": "available",
          "toolB": "available",
          "note": "Grav: Symfony 7; October CMS: Laravel"
        },
        {
          "feature": "Git-version-controllable content",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "REST API",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Licensing & Cost Over Time",
      "rows": [
        {
          "feature": "Free forever, no license fee ever",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "October CMS: free year one only, then $39/year/site"
        },
        {
          "feature": "OSI-approved open-source license",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Grav: MIT; October CMS: proprietary EULA"
        },
        {
          "feature": "Publicly viewable source code",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Unlimited-site licensing subscription for agencies",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "October CMS: $26-30/month"
        }
      ]
    },
    {
      "group": "Extensibility & AI",
      "rows": [
        {
          "feature": "Built-in MCP server for AI agents",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Dedicated plugin/theme marketplace",
          "toolA": "limited",
          "toolB": "available",
          "note": "Grav sells premium themes/plugins individually; October CMS has a unified Marketplace"
        },
        {
          "feature": "Reusable page \"components\"",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Automatic update delivery mechanism",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "October CMS: Update Gateway"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does either CMS ever require an ongoing license fee?",
      "answer": "October CMS does, after the first free year, requiring $39/year per site or an Unlimited Licenses subscription for agencies. Grav's core never requires a license fee."
    },
    {
      "question": "Which CMS avoids using a database entirely?",
      "answer": "Grav, via its flat-file Markdown/YAML architecture. October CMS is built on Laravel and its facts describe a database-backed model with no flat-file mode documented."
    },
    {
      "question": "Is either project open source?",
      "answer": "Grav's core is MIT-licensed open source. October CMS's source is publicly viewable on GitHub but distributed under a proprietary EULA with Responsiv Pty Ltd, not an OSI-approved license."
    },
    {
      "question": "Which has a larger dedicated plugin marketplace?",
      "answer": "October CMS's Marketplace lists hundreds of plugins and themes. Grav's ecosystem relies more on GitHub-hosted community plugins plus individually sold premium themes like the Helios theme."
    },
    {
      "question": "Does either support AI agents natively?",
      "answer": "Grav includes a built-in MCP server for AI agent interaction. October CMS's facts don't document an equivalent feature."
    },
    {
      "question": "How does licensing scale for an agency running many sites?",
      "answer": "October CMS offers an Unlimited Licenses subscription ($26/month billed annually or $30/month monthly) covering unlimited sites with Partner Program access. Grav requires no per-site licensing at all since its core is free."
    }
  ]
};

export default gravVsOctoberCmsContent;

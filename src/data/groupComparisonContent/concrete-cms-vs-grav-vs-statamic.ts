import type { GroupComparisonContent } from './types';

const concreteCmsVsGravVsStatamicContent: GroupComparisonContent = {
  "verdict": "Concrete CMS, Grav, and Statamic are all free-to-start, self-hosted content platforms, but they solve very different problems. Concrete CMS is a traditional database-backed CMS built around in-context editing and granular permissions for institutional sites with many contributors. Grav and Statamic both ditch the database in favor of Git-friendly flat files, but Grav stays free forever with revenue coming from optional premium themes, while Statamic gates multi-user access, headless APIs, and multi-site support behind a per-site Pro license. Developers who want maximum portability and zero licensing cost should look at Grav, teams that need a polished editor plus Laravel tooling should weigh Statamic's Pro license, and organizations that need robust built-in permissions without touching code are better served by Concrete CMS.",
  "bestFor": {
    "concrete-cms": "Government, educational, and institutional sites that need strong built-in page permissions and in-context editing without extra plugins.",
    "grav": "Developers and agencies who want a completely free, database-free CMS with Git-native content and no per-site licensing cost.",
    "statamic": "Laravel developers and agencies who want a polished control panel plus flat-file, Git-based content, and are willing to pay a per-site Pro license for multi-user and headless features."
  },
  "highlights": [
    {
      "title": "Two flat-file options, one traditional CMS",
      "description": "Grav and Statamic both store content as Git-trackable Markdown and YAML files with no required database, while Concrete CMS relies on a conventional database-backed architecture more like WordPress or Drupal.",
      "toolSlugs": [
        "grav",
        "statamic",
        "concrete-cms"
      ]
    },
    {
      "title": "Free forever versus per-site licensing",
      "description": "Grav's core CMS, admin panel, and package manager are free for unlimited self-hosted sites, with revenue coming only from optional premium themes. Statamic's Core tier is free only for single-admin sites, and multi-user, headless API, and multi-site features require a $349 Pro license per site.",
      "toolSlugs": [
        "grav",
        "statamic"
      ]
    },
    {
      "title": "Built-in permissions without plugins",
      "description": "Concrete CMS ships a role-based, fine-grained permissions system and full page version history out of the box, a heavier out-of-the-box access-control model than either Grav or Statamic documents in their free tiers.",
      "toolSlugs": [
        "concrete-cms"
      ]
    },
    {
      "title": "Official managed hosting",
      "description": "Concrete CMS is the only one of the three with its own first-party managed hosting plans, starting around $4.99/month, for teams that don't want to self-host at all.",
      "toolSlugs": [
        "concrete-cms"
      ]
    },
    {
      "title": "Headless APIs for developers",
      "description": "Grav ships a free first-party REST API, plus an MCP server for AI agents, on every install, while Statamic's REST and GraphQL APIs are reserved for the paid Pro tier.",
      "toolSlugs": [
        "grav",
        "statamic"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Architecture and Workflow",
      "rows": [
        {
          "feature": "Flat-file, no-database architecture",
          "statuses": {
            "concrete-cms": "unavailable",
            "grav": "available",
            "statamic": "available"
          }
        },
        {
          "feature": "Git-native content workflow",
          "statuses": {
            "concrete-cms": "not-documented",
            "grav": "available",
            "statamic": "available"
          }
        },
        {
          "feature": "Headless REST or GraphQL API",
          "statuses": {
            "concrete-cms": "not-documented",
            "grav": "available",
            "statamic": "limited"
          },
          "note": "Statamic's headless REST and GraphQL API is limited to its paid Pro tier."
        }
      ]
    },
    {
      "group": "Editing and Permissions",
      "rows": [
        {
          "feature": "In-context or live page editing",
          "statuses": {
            "concrete-cms": "available",
            "grav": "not-documented",
            "statamic": "limited"
          },
          "note": "Statamic offers Live Preview rather than fully in-context page editing."
        },
        {
          "feature": "Fine-grained roles and permissions",
          "statuses": {
            "concrete-cms": "available",
            "grav": "not-documented",
            "statamic": "limited"
          },
          "note": "Statamic's Core tier is single-admin only; unlimited users and roles require Pro."
        }
      ]
    },
    {
      "group": "Licensing and Hosting",
      "rows": [
        {
          "feature": "Free tier usable in production",
          "statuses": {
            "concrete-cms": "available",
            "grav": "available",
            "statamic": "limited"
          },
          "note": "Statamic's free Core tier is restricted to a single admin on a single site."
        },
        {
          "feature": "Official managed hosting",
          "statuses": {
            "concrete-cms": "available",
            "grav": "not-documented",
            "statamic": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Concrete CMS, Grav, and Statamic require a database?",
      "answer": "Concrete CMS is a traditional database-backed CMS. Grav is fully flat-file and never requires a database. Statamic is flat-file-first but also supports an optional database-driven mode for teams that prefer it."
    },
    {
      "question": "Which of the three is completely free for production use?",
      "answer": "Concrete CMS's open-source core and Grav's core CMS are both free for unlimited, unrestricted production use. Statamic's Core tier is free only for single-admin, single-site use; anything beyond that requires a paid Pro license."
    },
    {
      "question": "Which one is best for non-technical content editors?",
      "answer": "Concrete CMS is built around in-context editing, letting non-technical editors change text, images, and layout directly on the live page. Statamic pairs a polished control panel with Live Preview, while Grav's admin panel is modern but assumes more comfort with Git, YAML, and the command line."
    },
    {
      "question": "Can I manage multiple sites from one installation?",
      "answer": "Concrete CMS added native multisite support in version 9. Statamic supports multi-site and multilingual setups on its Pro tier. Grav's provided feature set does not document built-in multisite management."
    },
    {
      "question": "How does pricing work if I need a headless API?",
      "answer": "Grav includes a first-party REST API for free on every installation. Statamic's headless REST and GraphQL APIs require the Pro license, priced at $349 for the first year per site with a $99/year renewal. Concrete CMS's developer API is documented but not specifically marketed as a headless REST or GraphQL layer."
    },
    {
      "question": "Does Concrete CMS offer managed hosting?",
      "answer": "Yes, Concrete CMS's maintainer, PortlandLabs, sells managed hosting plans starting around $4.99/month for a Starter tier, in addition to the free self-hosted open-source option. Grav and Statamic don't document an equivalent first-party hosting product in the provided data."
    }
  ]
};

export default concreteCmsVsGravVsStatamicContent;

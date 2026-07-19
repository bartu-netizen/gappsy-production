import type { GroupComparisonContent } from './types';

const craftCmsVsGravVsStatamicContent: GroupComparisonContent = {
  "verdict": "Craft CMS, Grav, and Statamic all target developers who want more control than WordPress offers, but they differ sharply on architecture and licensing. Grav is the only one of the three with a completely free, flat-file, database-free core and no per-project license fee ever. Statamic is flat-file-first with an optional database mode, and its free Core tier is capped at a single admin user, with Pro-tier features like multi-user access and headless APIs priced per site. Craft CMS is database-backed and source-available rather than fully free: its Solo edition is free for one user, while Team and Pro require paid licenses that become free only if the site is hosted on Craft's own Craft Cloud platform. Choose Grav for zero-cost portability, Statamic for a Laravel-native, flat-file workflow with a polished editor UI, and Craft CMS for maximum custom content modeling on bespoke, design-driven sites.",
  "bestFor": {
    "craft-cms": "Agencies and freelance developers building bespoke, design-driven sites who need fully custom content modeling and are open to a per-project license or Craft Cloud hosting.",
    "grav": "Developers who want a permanently free, database-free CMS with Git-native content and no licensing fees at any scale.",
    "statamic": "Laravel developers and agencies who want flat-file, Git-trackable content with a polished control panel, and are willing to pay a per-site Pro license for multi-user and headless needs."
  },
  "highlights": [
    {
      "title": "Only truly free-at-any-scale option",
      "description": "Grav's core CMS, admin panel, and package manager remain free for unlimited self-hosted sites with no license fee ever, while both Craft CMS's Team and Pro editions and Statamic's Pro tier require paid, per-site licenses beyond a single-user free tier.",
      "toolSlugs": [
        "grav",
        "craft-cms",
        "statamic"
      ]
    },
    {
      "title": "Custom content modeling as the core differentiator",
      "description": "Craft CMS is built specifically so developers define custom sections, entry types, and fields per project instead of working within a fixed template system, a flexibility Statamic also offers through Blueprints with 40-plus field types, while Grav's flat-file model is comparatively more file-and-folder-driven.",
      "toolSlugs": [
        "craft-cms",
        "statamic",
        "grav"
      ]
    },
    {
      "title": "License becomes free with official cloud hosting",
      "description": "Craft CMS is the only one of the three where paid Team and Pro licenses become free automatically when a site is hosted on the vendor's own managed platform, Craft Cloud, with hosting itself billed separately.",
      "toolSlugs": [
        "craft-cms"
      ]
    },
    {
      "title": "Git-native content out of the box",
      "description": "Grav and Statamic both store content as Markdown and YAML files that can be version-controlled directly in Git without a database export step, while Craft CMS's content lives in a database by default.",
      "toolSlugs": [
        "grav",
        "statamic"
      ]
    },
    {
      "title": "Headless API access differs by tier",
      "description": "Grav ships a free REST API on every install, while Craft CMS and Statamic both gate their GraphQL APIs behind paid tiers, Team or Pro for Craft and Pro for Statamic.",
      "toolSlugs": [
        "grav",
        "craft-cms",
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
            "craft-cms": "unavailable",
            "grav": "available",
            "statamic": "available"
          }
        },
        {
          "feature": "Git-native content workflow",
          "statuses": {
            "craft-cms": "not-documented",
            "grav": "available",
            "statamic": "available"
          }
        },
        {
          "feature": "Custom or flexible content modeling",
          "statuses": {
            "craft-cms": "available",
            "grav": "not-documented",
            "statamic": "available"
          }
        }
      ]
    },
    {
      "group": "API and Multi-user Access",
      "rows": [
        {
          "feature": "Headless GraphQL or REST API",
          "statuses": {
            "craft-cms": "limited",
            "grav": "available",
            "statamic": "limited"
          },
          "note": "Craft CMS's GraphQL API requires Team or Pro; Statamic's REST and GraphQL API requires Pro."
        },
        {
          "feature": "Free tier usable in production",
          "statuses": {
            "craft-cms": "limited",
            "grav": "available",
            "statamic": "limited"
          },
          "note": "Craft CMS's Solo edition and Statamic's Core tier are both free but limited to a single admin user."
        }
      ]
    },
    {
      "group": "Hosting and Security",
      "rows": [
        {
          "feature": "Official managed hosting with bundled license",
          "statuses": {
            "craft-cms": "available",
            "grav": "not-documented",
            "statamic": "not-documented"
          }
        },
        {
          "feature": "Two-factor authentication or passkeys",
          "statuses": {
            "craft-cms": "available",
            "grav": "not-documented",
            "statamic": "limited"
          },
          "note": "Statamic's two-factor authentication is available on the Pro and Enterprise tiers."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Craft CMS, Grav, and Statamic free to use?",
      "answer": "All three have a free entry point, but with different limits. Grav's core CMS is free for unlimited sites forever. Craft CMS's Solo edition is free but restricted to one user. Statamic's Core tier is free but also limited to a single admin on a single site."
    },
    {
      "question": "Which of these three doesn't need a database?",
      "answer": "Grav never requires a database; it stores all content as flat Markdown and YAML files. Statamic is flat-file-first but also supports an optional database-driven mode. Craft CMS is a conventional database-backed CMS."
    },
    {
      "question": "Do any of these support headless or GraphQL content delivery?",
      "answer": "Yes, all three can serve content headlessly, but access varies. Grav includes a free REST API on every install, while Craft CMS's GraphQL API requires a Team or Pro license and Statamic's REST and GraphQL API requires the Pro tier."
    },
    {
      "question": "What is the licensing model for Craft CMS?",
      "answer": "Craft CMS is source-available under a BSD-3-Clause license, so the code is open to inspect, but production use beyond the free Solo edition requires a paid Team ($279 first year) or Pro ($399 first year) license per project, with $99/year renewals. Those license fees are waived if the site is hosted on Craft Cloud."
    },
    {
      "question": "Which tool is best suited to custom-designed websites rather than blogs?",
      "answer": "Craft CMS is purpose-built for bespoke, design-driven sites through its custom content-type system. Statamic also supports flexible content modeling via Blueprints. Grav leans toward developer-centric, Git-based sites like documentation, blogs, and portfolios."
    },
    {
      "question": "Is there Git-based version control for content in any of these?",
      "answer": "Grav and Statamic both store content as files that can be committed directly to Git. Craft CMS stores content in a database, so it does not offer the same native Git-based content workflow."
    }
  ]
};

export default craftCmsVsGravVsStatamicContent;

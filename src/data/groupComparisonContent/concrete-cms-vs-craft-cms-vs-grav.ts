import type { GroupComparisonContent } from './types';

const concreteCmsVsCraftCmsVsGravContent: GroupComparisonContent = {
  "verdict": "Concrete CMS, Craft CMS, and Grav are all self-hosted, PHP-based content management systems rooted in open-source licensing, but they solve different problems. Concrete CMS leads with in-context editing and built-in permissions for institutional teams that need many contributors. Craft CMS trades a free production license for the most flexible custom content modeling, favored by agencies building bespoke sites. Grav skips the database entirely in favor of Git-versioned flat files, appealing to developers who want a lighter, more portable footprint. None is a drop-in replacement for the others, so the right pick depends more on team structure and hosting philosophy than on raw feature count.",
  "bestFor": {
    "concrete-cms": "Government, nonprofit, and institutional teams that need strong built-in permissions and page-level version history without extra plugins, plus a fully free option for unlimited users.",
    "craft-cms": "Digital agencies and developers building bespoke, design-driven sites who need deep custom content modeling and are willing to pay a per-site license for production use.",
    "grav": "Developers and small teams who want a database-free, Git-native CMS they can version, deploy, and migrate as plain text files."
  },
  "highlights": [
    {
      "title": "Grav is the only one that's fully free for unlimited production sites",
      "description": "Grav's core CMS, Admin 2.0 panel, and package manager are entirely free under the MIT license with no user cap, while Craft's Solo edition is free but limited to a single admin account and Concrete CMS is free but pairs best with optional paid managed hosting.",
      "toolSlugs": [
        "grav",
        "craft-cms",
        "concrete-cms"
      ]
    },
    {
      "title": "Craft CMS offers the deepest custom content modeling",
      "description": "Craft lets developers define custom sections, entry types, and fields per project rather than working within a fixed template system, backed by a GraphQL API and an official plugin store, which is why agencies building highly bespoke sites gravitate toward it.",
      "toolSlugs": [
        "craft-cms"
      ]
    },
    {
      "title": "Concrete CMS bakes in permissions and version history that the others leave to plugins",
      "description": "Fine-grained, role-based permissions and wiki-style page version history ship in Concrete CMS's core, which is valuable for organizations with complex approval workflows and multiple contributor tiers.",
      "toolSlugs": [
        "concrete-cms"
      ]
    },
    {
      "title": "Grav removes the database from the equation entirely",
      "description": "Content lives as Markdown files with YAML frontmatter that can be version-controlled directly in Git and copied between servers without a database export, avoiding the operational overhead of installing and securing MySQL that Concrete CMS and Craft CMS both require.",
      "toolSlugs": [
        "grav"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Cost and Licensing",
      "rows": [
        {
          "feature": "Free for production use with multiple users",
          "statuses": {
            "concrete-cms": "available",
            "craft-cms": "limited",
            "grav": "available"
          },
          "note": "Craft's free Solo edition is capped at a single admin account; Team and Pro licenses cost money unless hosted on Craft Cloud."
        },
        {
          "feature": "Optional managed hosting from the vendor",
          "statuses": {
            "concrete-cms": "available",
            "craft-cms": "available",
            "grav": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Architecture",
      "rows": [
        {
          "feature": "Database-free, flat-file content storage",
          "statuses": {
            "concrete-cms": "unavailable",
            "craft-cms": "unavailable",
            "grav": "available"
          }
        },
        {
          "feature": "Native Git-based content versioning",
          "statuses": {
            "concrete-cms": "unavailable",
            "craft-cms": "unavailable",
            "grav": "available"
          }
        }
      ]
    },
    {
      "group": "Developer and Content Tools",
      "rows": [
        {
          "feature": "GraphQL or REST headless API",
          "statuses": {
            "concrete-cms": "limited",
            "craft-cms": "available",
            "grav": "available"
          },
          "note": "Concrete CMS ships a documented developer API but does not advertise GraphQL specifically; Craft's GraphQL API is available on Team and Pro; Grav offers a REST API plus a Model Context Protocol server."
        },
        {
          "feature": "Custom content type and field modeling",
          "statuses": {
            "concrete-cms": "limited",
            "craft-cms": "available",
            "grav": "limited"
          }
        }
      ]
    },
    {
      "group": "Editing and Governance",
      "rows": [
        {
          "feature": "In-context, on-page editing",
          "statuses": {
            "concrete-cms": "available",
            "craft-cms": "limited",
            "grav": "limited"
          },
          "note": "Craft offers Live Preview rather than direct on-page editing; Grav's Admin 2.0 offers real-time collaborative editing in a separate dashboard."
        },
        {
          "feature": "Fine-grained, role-based permissions",
          "statuses": {
            "concrete-cms": "available",
            "craft-cms": "available",
            "grav": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Concrete CMS, Craft CMS, and Grav actually free?",
      "answer": "Concrete CMS and Grav are free to self-host for unlimited use under the MIT license. Craft CMS's Solo edition is also free, but it is limited to a single admin user; running Craft in production with more users requires a Team license from 279 dollars or a Pro license from 399 dollars for the first year, though those license fees become free if the site is hosted on Craft Cloud."
    },
    {
      "question": "Which of these three requires a database?",
      "answer": "Concrete CMS and Craft CMS both run on a traditional database-backed architecture. Grav is the exception: it stores all content and configuration as Markdown files with YAML frontmatter, so there is no database to install, secure, or migrate."
    },
    {
      "question": "Which CMS is best for an agency building custom client sites?",
      "answer": "Craft CMS is generally the strongest fit, since it lets developers define custom content types, fields, and structures per project rather than working around a fixed template system, and its GraphQL API supports headless front ends."
    },
    {
      "question": "Which CMS is best for organizations that need strict editorial permissions?",
      "answer": "Concrete CMS is built around this use case, with a native role-based permissions system and wiki-style page version history included in its free, open-source core, which is why it is popular with government, education, and enterprise sites."
    },
    {
      "question": "Can all three be self-hosted, or is managed hosting required?",
      "answer": "All three can be fully self-hosted. Concrete CMS and Craft CMS additionally offer optional managed hosting from their respective vendors (Concrete CMS hosting starts around 4.99 dollars per month, and Craft Cloud has its own tier-based pricing). Grav has no first-party managed hosting option and is self-host only."
    },
    {
      "question": "Do any of these support headless or API-based content delivery?",
      "answer": "Yes, in different ways. Craft CMS offers a GraphQL API on its Team and Pro editions, Grav ships a first-party REST API plus a Model Context Protocol server for AI agent access, and Concrete CMS provides a documented developer API through its MVC architecture."
    }
  ]
};

export default concreteCmsVsCraftCmsVsGravContent;

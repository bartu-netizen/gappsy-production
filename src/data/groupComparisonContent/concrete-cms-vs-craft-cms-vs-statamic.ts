import type { GroupComparisonContent } from './types';

const concreteCmsVsCraftCmsVsStatamicContent: GroupComparisonContent = {
  "verdict": "Craft CMS and Statamic are close cousins in spirit: both are source-available, developer-first PHP content platforms sold as per-site licenses with a single-user free tier, aimed at agencies and Laravel-fluent teams building custom sites. Concrete CMS takes a different path, staying free for unlimited users while leaning on built-in permissions and version history rather than a plugin ecosystem. Statamic's flat-file-first storage gives it a Git-workflow advantage that neither of the others fully matches, while Craft CMS still has the broader plugin and GraphQL ecosystem for headless work.",
  "bestFor": {
    "concrete-cms": "Organizations that want a genuinely free CMS for unlimited editors, with permissions and version history included out of the box rather than gated behind a paid tier.",
    "craft-cms": "Agencies wanting the most customizable content modeling and the largest plugin ecosystem for bespoke, PHP-driven builds.",
    "statamic": "Laravel-fluent teams wanting Git-friendly, flat-file content with the option to move to a database-driven mode as a project scales."
  },
  "highlights": [
    {
      "title": "Concrete CMS is the only one that's free for unlimited users in production",
      "description": "Both Craft CMS and Statamic cap their free tiers at a single admin account (Solo and Core, respectively), while Concrete CMS's open-source core has no user limit at all.",
      "toolSlugs": [
        "concrete-cms",
        "craft-cms",
        "statamic"
      ]
    },
    {
      "title": "Statamic and Craft CMS both use per-site licensing with annual renewals",
      "description": "Craft's Team and Pro tiers cost 279 to 399 dollars for the first year with 99 dollar annual renewals, and Statamic's Pro tier follows the same pattern at 349 dollars first year with a 99 dollar renewal, making them a similar buying decision for teams comparing the two.",
      "toolSlugs": [
        "craft-cms",
        "statamic"
      ]
    },
    {
      "title": "Statamic leans harder into flat-file, Git-based workflows",
      "description": "Statamic is explicitly built flat-file-first, storing content as Markdown and YAML that live alongside code and track in Git, while still offering an optional database driver, giving it more Git-native flexibility than Craft's database-only model.",
      "toolSlugs": [
        "statamic"
      ]
    },
    {
      "title": "Concrete CMS bakes in permissions and page history the others treat as paid add-ons",
      "description": "Fine-grained role-based permissions and wiki-style version history ship in Concrete CMS's free core, whereas Statamic reserves unlimited users, roles, and content history for its paid Pro tier and Craft reserves multi-user access for Team and Pro.",
      "toolSlugs": [
        "concrete-cms"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing and Free Tier",
      "rows": [
        {
          "feature": "Free tier includes more than one user",
          "statuses": {
            "concrete-cms": "available",
            "craft-cms": "limited",
            "statamic": "limited"
          },
          "note": "Craft's Solo and Statamic's Core are both capped at a single admin account."
        },
        {
          "feature": "Per-site commercial license required for a multi-user production site",
          "statuses": {
            "concrete-cms": "unavailable",
            "craft-cms": "available",
            "statamic": "available"
          }
        }
      ]
    },
    {
      "group": "Content Storage and Modeling",
      "rows": [
        {
          "feature": "Flat-file, Git-trackable content option",
          "statuses": {
            "concrete-cms": "unavailable",
            "craft-cms": "unavailable",
            "statamic": "available"
          }
        },
        {
          "feature": "Custom field and content-type modeling per project",
          "statuses": {
            "concrete-cms": "limited",
            "craft-cms": "available",
            "statamic": "available"
          }
        }
      ]
    },
    {
      "group": "Headless and API Access",
      "rows": [
        {
          "feature": "Headless REST or GraphQL API",
          "statuses": {
            "concrete-cms": "limited",
            "craft-cms": "available",
            "statamic": "available"
          },
          "note": "Concrete CMS offers a documented developer API rather than a dedicated headless GraphQL layer; Craft's GraphQL API is on Team and Pro, and Statamic's REST/GraphQL API is on Pro."
        }
      ]
    },
    {
      "group": "Editorial and Permissions",
      "rows": [
        {
          "feature": "In-context or live content preview",
          "statuses": {
            "concrete-cms": "available",
            "craft-cms": "available",
            "statamic": "available"
          },
          "note": "Concrete CMS offers true in-context, on-page editing; Craft and Statamic both offer Live Preview rather than direct on-page edits."
        },
        {
          "feature": "Role-based permissions for multiple editors",
          "statuses": {
            "concrete-cms": "available",
            "craft-cms": "available",
            "statamic": "limited"
          },
          "note": "Statamic's roles and unlimited users are gated to the paid Pro tier."
        },
        {
          "feature": "Multisite or multilingual support",
          "statuses": {
            "concrete-cms": "available",
            "craft-cms": "available",
            "statamic": "limited"
          },
          "note": "Statamic's multi-site and multilingual support is part of the paid Pro tier."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Concrete CMS, Craft CMS, and Statamic is completely free for a team of editors?",
      "answer": "Concrete CMS is the only one of the three with no cap on users in its free, open-source core. Craft CMS's free Solo edition and Statamic's free Core tier are both limited to a single admin account, so a multi-editor production site on either requires a paid license."
    },
    {
      "question": "What is the main difference between Craft CMS and Statamic?",
      "answer": "Both are source-available, developer-focused PHP platforms with similar per-site licensing (a free single-user tier, then paid Team/Pro or Core/Pro tiers with annual renewals), but Statamic is flat-file-first, storing content as Git-trackable Markdown and YAML files, while Craft CMS is database-driven with a more established plugin marketplace and GraphQL API."
    },
    {
      "question": "Do any of these three support Git-based content workflows?",
      "answer": "Statamic is purpose-built for this, with flat-file Markdown and YAML content that can be committed and tracked in Git. Concrete CMS and Craft CMS are both database-backed and do not offer a comparable flat-file, Git-native content model."
    },
    {
      "question": "Which is best for a nonprofit or institution with many content editors and no development budget for licenses?",
      "answer": "Concrete CMS, since its permissions system, page version history, and multi-user access are all included in the free, open-source core with no per-seat or per-site license fee."
    },
    {
      "question": "Can I use Craft CMS or Statamic without hosting through the vendor's own cloud service?",
      "answer": "Yes, both can be self-hosted anywhere that runs PHP. Craft's Team and Pro license fees are waived only if the site is hosted on Craft Cloud; self-hosting elsewhere still requires paying the standard license fee."
    },
    {
      "question": "Do all three support headless, API-driven content delivery?",
      "answer": "Craft CMS and Statamic both offer GraphQL and REST APIs on their paid tiers for decoupled front ends. Concrete CMS provides a documented developer API through its MVC architecture but is not positioned as a headless-first platform in the same way."
    }
  ]
};

export default concreteCmsVsCraftCmsVsStatamicContent;

import type { GroupComparisonContent } from './types';

const directusVsStrapiVsVvvebCmsContent: GroupComparisonContent = {
  "verdict": "Directus, Strapi, and Vvveb CMS are all free-to-self-host, API-driven content platforms, but they reflect different building philosophies: Directus wraps an existing SQL database with instant REST and GraphQL APIs and a no-code admin Studio, Strapi is a schema-first, MIT-licensed headless CMS with the largest ecosystem of the three, and Vvveb CMS pairs a drag-and-drop page builder with built-in e-commerce for teams that want a traditional or headless site without extra plugins. Developers with an existing database will lean toward Directus, teams wanting the most established headless CMS ecosystem will pick Strapi, and budget-focused builders wanting an all-in-one free site-and-store solution will prefer Vvveb CMS.",
  "bestFor": {
    "directus": "Development teams that already have a SQL database and want instant REST and GraphQL APIs plus a no-code admin Studio layered on top of it.",
    "strapi": "Developers who want the most established, MIT-licensed open-source headless CMS with a large plugin ecosystem and an optional managed cloud.",
    "vvveb-cms": "Budget-conscious builders who want a completely free, self-hosted CMS with a drag-and-drop page builder and built-in e-commerce."
  },
  "highlights": [
    {
      "title": "Database-first instead of schema-first",
      "description": "Directus connects to an existing SQL database and generates APIs without requiring a data migration, a workflow Strapi and Vvveb CMS do not offer in the same way.",
      "toolSlugs": [
        "directus"
      ]
    },
    {
      "title": "The most established open-source headless CMS",
      "description": "Strapi's MIT license, more than 450 enterprise customers, and significant funding give it the broadest plugin and community ecosystem of the three.",
      "toolSlugs": [
        "strapi"
      ]
    },
    {
      "title": "The only one with built-in e-commerce",
      "description": "Vvveb CMS ships with product variants, subscriptions, and one-page checkout, letting stores skip separate plugins like WooCommerce that Directus and Strapi would need for the same functionality.",
      "toolSlugs": [
        "vvveb-cms"
      ]
    },
    {
      "title": "Free cores, but very different cloud pricing",
      "description": "All three offer a free, self-hosted core, but Directus and Strapi layer on managed cloud and enterprise tiers costing hundreds of dollars a month, while Vvveb CMS has no paid tier documented at all.",
      "toolSlugs": [
        "directus",
        "strapi",
        "vvveb-cms"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Content Architecture",
      "rows": [
        {
          "feature": "Headless REST and GraphQL API",
          "statuses": {
            "directus": "available",
            "strapi": "available",
            "vvveb-cms": "available"
          }
        },
        {
          "feature": "Database-first setup on an existing SQL database",
          "statuses": {
            "directus": "available",
            "strapi": "unavailable",
            "vvveb-cms": "not-documented"
          }
        },
        {
          "feature": "Built-in e-commerce",
          "statuses": {
            "directus": "unavailable",
            "strapi": "unavailable",
            "vvveb-cms": "available"
          }
        },
        {
          "feature": "No-code drag-and-drop visual builder",
          "statuses": {
            "directus": "available",
            "strapi": "limited",
            "vvveb-cms": "available"
          },
          "note": "Directus's Studio and Strapi's admin panel manage content and collections visually, but only Directus and Vvveb CMS offer true no-code, drag-and-drop building."
        }
      ]
    },
    {
      "group": "Deployment and Governance",
      "rows": [
        {
          "feature": "Free self-hosted core",
          "statuses": {
            "directus": "available",
            "strapi": "available",
            "vvveb-cms": "available"
          }
        },
        {
          "feature": "Managed cloud hosting option",
          "statuses": {
            "directus": "available",
            "strapi": "available",
            "vvveb-cms": "not-documented"
          }
        },
        {
          "feature": "SSO (SAML or OIDC)",
          "statuses": {
            "directus": "available",
            "strapi": "limited",
            "vvveb-cms": "unavailable"
          },
          "note": "Strapi offers SSO only as a separate paid add-on rather than a built-in tier feature."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Directus, Strapi, and Vvveb CMS is completely free?",
      "answer": "Vvveb CMS has no paid tier documented at all; its full feature set, including built-in e-commerce, is free and open source. Directus and Strapi both offer a free, self-hosted core but charge for managed cloud hosting and enterprise features."
    },
    {
      "question": "Can any of these work as both a headless and a traditional CMS?",
      "answer": "Vvveb CMS explicitly supports both headless (API-based) and traditional templated CMS modes. Directus and Strapi are primarily headless, API-first platforms rather than traditional page-rendering CMSs."
    },
    {
      "question": "Which has the largest ecosystem of plugins and integrations?",
      "answer": "Strapi has the most established ecosystem among the three, with an MIT open-source license, more than 450 enterprise customers, and a broad plugin and extension marketplace."
    },
    {
      "question": "Do Directus, Strapi, and Vvveb CMS use the same open-source license?",
      "answer": "No. Directus uses a source-available license (MSCL) with some usage restrictions, Strapi's Community edition is MIT licensed, and Vvveb CMS is released under AGPLv3, which requires sharing source code for modified network-deployed versions."
    },
    {
      "question": "Which tool includes e-commerce out of the box?",
      "answer": "Only Vvveb CMS ships with native e-commerce, including product variants, subscriptions, digital downloads, coupons, and one-page checkout. Directus and Strapi would both need custom development or third-party integrations to support a storefront."
    }
  ]
};

export default directusVsStrapiVsVvvebCmsContent;

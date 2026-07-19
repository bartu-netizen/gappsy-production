import type { GroupComparisonContent } from './types';

const coreshopVsEvershopVsMagentoOpenSourceContent: GroupComparisonContent = {
  "verdict": "CoreShop, EverShop, and Magento Open Source are all free-to-self-host, open-source ecommerce platforms, but they target different starting points. CoreShop makes the most sense when a team already runs Pimcore for product data and wants native commerce built on top of it, EverShop suits JavaScript/TypeScript teams that want a lean, modern, headless-capable engine, and Magento Open Source remains the default choice for merchants who need the largest extension marketplace and agency ecosystem even though its total cost of ownership is typically the highest of the three. None of them is a turnkey SaaS store builder, so all three assume in-house or agency development capacity.",
  "bestFor": {
    "coreshop": "Teams already invested in Pimcore's PIM and DAM who want to add native transactional commerce without a separate, disconnected system.",
    "evershop": "JavaScript and TypeScript engineering teams who want a lean, modern, self-hosted commerce engine built on Node.js and GraphQL.",
    "magento-open-source": "Mid-to-large merchants who need the widest extension marketplace and agency ecosystem and can absorb self-hosting and development costs."
  },
  "highlights": [
    {
      "title": "CoreShop's native Pimcore data model",
      "description": "CoreShop builds commerce directly on Pimcore's product information and digital asset management data, avoiding the data duplication that comes from bolting a separate commerce platform onto a PIM system.",
      "toolSlugs": [
        "coreshop"
      ]
    },
    {
      "title": "EverShop's modern TypeScript and GraphQL stack",
      "description": "EverShop is written entirely in TypeScript on Node.js with a GraphQL API, giving JavaScript-fluent teams a codebase and tooling that match the rest of their stack rather than PHP.",
      "toolSlugs": [
        "evershop"
      ]
    },
    {
      "title": "Magento's ecosystem scale",
      "description": "Magento Open Source has the largest developer and agency ecosystem of the three, backed by the Adobe Commerce Marketplace for extensions and a documented upgrade path to Adobe Commerce.",
      "toolSlugs": [
        "magento-open-source"
      ]
    },
    {
      "title": "Diverging licensing paths",
      "description": "CoreShop shifted to an open-core model in April 2025, requiring a paid Commercial License for some enterprise use cases, while EverShop and Magento Open Source keep their core software fully free.",
      "toolSlugs": [
        "coreshop",
        "evershop",
        "magento-open-source"
      ]
    },
    {
      "title": "All three require self-managed hosting",
      "description": "None of these platforms includes managed cloud hosting by default; every deployment needs a team capable of provisioning, securing, and maintaining its own servers.",
      "toolSlugs": [
        "coreshop",
        "evershop",
        "magento-open-source"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Architecture and Hosting",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "statuses": {
            "coreshop": "available",
            "evershop": "available",
            "magento-open-source": "available"
          }
        },
        {
          "feature": "Headless or API-first commerce",
          "statuses": {
            "coreshop": "available",
            "evershop": "available",
            "magento-open-source": "not-documented"
          },
          "note": "CoreShop exposes data via Pimcore DataHub and EverShop via GraphQL; a dedicated headless API was not documented for Magento Open Source in this comparison's source data."
        },
        {
          "feature": "Managed cloud hosting",
          "statuses": {
            "coreshop": "not-documented",
            "evershop": "limited",
            "magento-open-source": "not-documented"
          },
          "note": "EverShop has announced Personal and Professional cloud tiers that were listed as not yet available at the time of research."
        }
      ]
    },
    {
      "group": "Commerce and Catalog",
      "rows": [
        {
          "feature": "Native PIM/DAM integration",
          "statuses": {
            "coreshop": "available",
            "evershop": "unavailable",
            "magento-open-source": "unavailable"
          }
        },
        {
          "feature": "Multi-store and multi-currency support",
          "statuses": {
            "coreshop": "available",
            "evershop": "not-documented",
            "magento-open-source": "available"
          }
        },
        {
          "feature": "WYSIWYG page builder",
          "statuses": {
            "coreshop": "not-documented",
            "evershop": "not-documented",
            "magento-open-source": "available"
          }
        }
      ]
    },
    {
      "group": "Ecosystem and Licensing",
      "rows": [
        {
          "feature": "Free self-hosted core edition",
          "statuses": {
            "coreshop": "available",
            "evershop": "available",
            "magento-open-source": "available"
          }
        },
        {
          "feature": "Extension or module marketplace",
          "statuses": {
            "coreshop": "limited",
            "evershop": "not-documented",
            "magento-open-source": "available"
          },
          "note": "CoreShop's enterprise-oriented bundles require a paid Commercial License purchased through the Pimcore Store."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is CoreShop still open source?",
      "answer": "CoreShop's bundles remain source-available, but since April 2025 it follows an open-core model: the Community edition is free to self-host, while some enterprise use cases require a paid CoreShop Commercial License purchased through the Pimcore Store."
    },
    {
      "question": "What's the main technical difference between EverShop and the other two?",
      "answer": "EverShop is built entirely on Node.js, React, and TypeScript with a GraphQL API, while CoreShop and Magento Open Source are both PHP platforms, CoreShop on Symfony and Pimcore, and Magento on its own modular PHP architecture."
    },
    {
      "question": "Which of these three has the largest ecosystem?",
      "answer": "Magento Open Source has by far the largest global developer and agency ecosystem, along with the Adobe Commerce Marketplace for extensions and a clear upgrade path to Adobe Commerce for enterprise features."
    },
    {
      "question": "Can I build a headless storefront with any of these?",
      "answer": "CoreShop supports headless commerce through Pimcore DataHub and EverShop through its native GraphQL API; a dedicated headless API layer for Magento Open Source was not documented in the source data used for this comparison."
    },
    {
      "question": "Which is the best fit for a catalog already managed in Pimcore?",
      "answer": "CoreShop, since it is built directly on top of Pimcore's product information and digital asset management data model rather than requiring a separate integration."
    },
    {
      "question": "Do any of these three charge license fees?",
      "answer": "The core software is free to self-host for all three, but CoreShop requires a paid Commercial License for certain enterprise use cases, and Magento Open Source has a paid upgrade path to Adobe Commerce starting at roughly $22,000 per year."
    }
  ]
};

export default coreshopVsEvershopVsMagentoOpenSourceContent;

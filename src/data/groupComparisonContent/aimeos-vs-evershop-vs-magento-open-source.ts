import type { GroupComparisonContent } from './types';

const aimeosVsEvershopVsMagentoOpenSourceContent: GroupComparisonContent = {
  "verdict": "All three are free, self-hosted, open-source commerce frameworks rather than turnkey SaaS store builders, so all require development resources to run in production. Aimeos is the leanest and most scale-proven option for PHP teams already using Laravel or TYPO3, EverShop offers the only modern TypeScript/Node.js-native stack of the three for JavaScript-first engineering teams, and Magento Open Source brings by far the largest developer ecosystem and a clear upgrade path to Adobe Commerce, at the cost of a notably higher total cost of ownership. None is a good fit for merchants without in-house or contracted development capacity.",
  "bestFor": {
    "aimeos": "PHP teams, especially those already using Laravel or TYPO3, that need a lightweight, API-first framework built to scale to very large catalogs and multi-vendor marketplaces.",
    "evershop": "JavaScript/TypeScript-fluent engineering teams who want a modern, self-hosted, GraphQL-first commerce stack instead of a legacy PHP platform.",
    "magento-open-source": "Mid-sized to large merchants with development resources and budget for hosting and customization who want the biggest ecosystem of agencies and extensions, plus a future path to Adobe Commerce."
  },
  "highlights": [
    {
      "title": "Aimeos is built for very large catalogs",
      "description": "Aimeos reports fast page rendering around 20ms and is designed to scale from small shops to catalogs of over a billion products, with over 400,000 downloads and 45,000+ GitHub stars.",
      "toolSlugs": [
        "aimeos"
      ]
    },
    {
      "title": "EverShop is the only JavaScript-native stack of the three",
      "description": "EverShop is built entirely on Node.js, TypeScript, React, and GraphQL, aimed at engineering teams that want a commerce platform matching their existing JavaScript tooling instead of PHP.",
      "toolSlugs": [
        "evershop"
      ]
    },
    {
      "title": "Magento Open Source has the deepest ecosystem and an enterprise upgrade path",
      "description": "Magento Open Source benefits from a large global ecosystem of developers and agencies plus access to the Adobe Commerce Marketplace, and offers a clear upgrade path to paid Adobe Commerce for merchants needing B2B features, AI personalization, or managed cloud hosting.",
      "toolSlugs": [
        "magento-open-source"
      ]
    },
    {
      "title": "Commercial support paths differ",
      "description": "Aimeos and Magento Open Source both have established commercial support paths (Aimeos GmbH support, and Adobe Commerce plus partner agencies for Magento), while EverShop's managed cloud tiers were still listed as not yet available at the time of research.",
      "toolSlugs": [
        "aimeos",
        "magento-open-source",
        "evershop"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing and Hosting",
      "rows": [
        {
          "feature": "Free self-hosted core",
          "statuses": {
            "aimeos": "available",
            "evershop": "available",
            "magento-open-source": "available"
          }
        },
        {
          "feature": "Official managed cloud hosting",
          "statuses": {
            "aimeos": "unavailable",
            "evershop": "limited",
            "magento-open-source": "unavailable"
          },
          "note": "EverShop's Personal and Professional cloud tiers were announced but listed as not yet available; Magento's managed cloud path is the separate paid Adobe Commerce Cloud product."
        },
        {
          "feature": "Vendor commercial support option",
          "statuses": {
            "aimeos": "available",
            "evershop": "not-documented",
            "magento-open-source": "available"
          }
        }
      ]
    },
    {
      "group": "Tech Stack and Extensibility",
      "rows": [
        {
          "feature": "REST/GraphQL API",
          "statuses": {
            "aimeos": "available",
            "evershop": "available",
            "magento-open-source": "not-documented"
          }
        },
        {
          "feature": "Marketplace/extension ecosystem",
          "statuses": {
            "aimeos": "not-documented",
            "evershop": "limited",
            "magento-open-source": "available"
          }
        },
        {
          "feature": "Modular architecture without forking core",
          "statuses": {
            "aimeos": "not-documented",
            "evershop": "available",
            "magento-open-source": "available"
          }
        }
      ]
    },
    {
      "group": "Scale and Commerce Features",
      "rows": [
        {
          "feature": "Multi-vendor marketplace support",
          "statuses": {
            "aimeos": "available",
            "evershop": "not-documented",
            "magento-open-source": "not-documented"
          }
        },
        {
          "feature": "Subscription/recurring billing",
          "statuses": {
            "aimeos": "available",
            "evershop": "not-documented",
            "magento-open-source": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Aimeos, EverShop, and Magento Open Source really free?",
      "answer": "The core software is free and open source for all three. However, all three require you to provide and manage your own hosting, and for Magento Open Source in particular, realistic total cost of ownership including hosting, development, and extensions is commonly estimated in the tens to hundreds of thousands of dollars annually for a full implementation."
    },
    {
      "question": "Which platform is best for developers who prefer JavaScript over PHP?",
      "answer": "EverShop is the only one of the three built on a JavaScript/TypeScript stack (Node.js, React, GraphQL). Aimeos and Magento Open Source are both PHP-based."
    },
    {
      "question": "Which platform is proven to scale to the largest product catalogs?",
      "answer": "Aimeos documents scaling to catalogs of over a billion products with roughly 20ms page rendering. Scale claims at that level are not documented for EverShop or Magento Open Source in the available data."
    },
    {
      "question": "Which has the largest ecosystem of extensions and implementation partners?",
      "answer": "Magento Open Source has the largest and most established ecosystem, including the Adobe Commerce Marketplace and a large global network of Magento developers and agencies, reflecting its longer history dating back to 2008."
    },
    {
      "question": "Does any of these offer official managed hosting?",
      "answer": "Not fully, based on available data. EverShop has announced Personal and Professional cloud plans that were still listed as not yet available, Aimeos is self-hosted with optional commercial support from Aimeos GmbH, and Magento Open Source's managed hosting path is the separate paid Adobe Commerce Cloud product."
    },
    {
      "question": "Which of the three is the newest project?",
      "answer": "EverShop is the newest, introduced around 2022 to 2023. Aimeos has been developed since 2015, and the Magento platform traces back to 2008, though it is now maintained by Adobe."
    }
  ]
};

export default aimeosVsEvershopVsMagentoOpenSourceContent;

import type { GroupComparisonContent } from './types';

const aimeosVsCoreshopVsEvershopContent: GroupComparisonContent = {
  "verdict": "Aimeos, CoreShop, and EverShop are all free, self-hosted, open-source e-commerce frameworks built for developers rather than non-technical merchants, but they target different stacks and use cases. Aimeos is the most battle-tested choice for large-scale or multi-vendor marketplace builds on Laravel or TYPO3, CoreShop layers commerce onto Pimcore's product-data platform for agencies already invested in that ecosystem (and shifted to an open-core license in 2025), while EverShop offers a leaner, JavaScript-native alternative for teams that want a Node.js and GraphQL stack instead of PHP. The right pick depends less on raw features and more on which language ecosystem and existing infrastructure a team already has.",
  "bestFor": {
    "aimeos": "PHP teams building large-scale, multi-vendor, or high-volume marketplaces on Laravel or TYPO3",
    "coreshop": "Agencies and enterprises already running Pimcore who want commerce built directly on their existing PIM and DAM data model",
    "evershop": "JavaScript and TypeScript teams who want a modern, self-hosted Node.js, React, and GraphQL commerce stack"
  },
  "highlights": [
    {
      "title": "Aimeos leads on scale and marketplace depth",
      "description": "Aimeos is built to handle catalogs of over a billion products with multi-vendor, multi-channel, and multi-warehouse support, backed by a large community of 400,000+ downloads and 45,000+ GitHub stars.",
      "toolSlugs": [
        "aimeos"
      ]
    },
    {
      "title": "CoreShop ties commerce directly to Pimcore's data model",
      "description": "Rather than bolting commerce onto a separate system, CoreShop extends Pimcore's product information management and digital asset management directly into order, payment, and shipping workflows, ideal for organizations that already manage complex product data in Pimcore.",
      "toolSlugs": [
        "coreshop"
      ]
    },
    {
      "title": "EverShop brings a JavaScript-native alternative",
      "description": "Built entirely on Node.js, React, TypeScript, and GraphQL, EverShop appeals to teams that want a modern type-safe codebase rather than PHP, though it remains an early-stage, community-driven project.",
      "toolSlugs": [
        "evershop"
      ]
    },
    {
      "title": "Licensing paths have diverged",
      "description": "Aimeos and EverShop keep their self-hosted cores fully free and open source, while CoreShop moved to an open-core model in April 2025 that requires a commercial license for certain enterprise deployments.",
      "toolSlugs": [
        "aimeos",
        "coreshop",
        "evershop"
      ]
    },
    {
      "title": "Community maturity varies widely",
      "description": "Aimeos has the largest and most established community by far, CoreShop's community is smaller and centered tightly on the Pimcore ecosystem, and EverShop's community is newer, having gone public via Show HN in 2023.",
      "toolSlugs": [
        "aimeos",
        "coreshop",
        "evershop"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Commerce and Platform Capabilities",
      "rows": [
        {
          "feature": "Multi-vendor marketplace support",
          "statuses": {
            "aimeos": "available",
            "coreshop": "not-documented",
            "evershop": "not-documented"
          }
        },
        {
          "feature": "Headless REST or GraphQL API",
          "statuses": {
            "aimeos": "available",
            "coreshop": "available",
            "evershop": "available"
          }
        },
        {
          "feature": "Subscription and recurring billing",
          "statuses": {
            "aimeos": "available",
            "coreshop": "not-documented",
            "evershop": "not-documented"
          }
        },
        {
          "feature": "Native admin panel included",
          "statuses": {
            "aimeos": "not-documented",
            "coreshop": "available",
            "evershop": "available"
          }
        }
      ]
    },
    {
      "group": "Deployment and Licensing",
      "rows": [
        {
          "feature": "Docker-based deployment documented",
          "statuses": {
            "aimeos": "not-documented",
            "coreshop": "not-documented",
            "evershop": "available"
          }
        },
        {
          "feature": "Free to self-host without a commercial license",
          "statuses": {
            "aimeos": "available",
            "coreshop": "limited",
            "evershop": "available"
          },
          "note": "CoreShop's Community usage stays free, but its April 2025 open-core shift requires a CoreShop Commercial License for certain enterprise deployments."
        },
        {
          "feature": "Official managed or hosted cloud option",
          "statuses": {
            "aimeos": "unavailable",
            "coreshop": "unavailable",
            "evershop": "limited"
          },
          "note": "EverShop has announced Personal and Professional cloud tiers, but they are not yet available."
        },
        {
          "feature": "Vendor-backed commercial support",
          "statuses": {
            "aimeos": "available",
            "coreshop": "available",
            "evershop": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is best for building a multi-vendor marketplace?",
      "answer": "Aimeos is the strongest fit, with built-in multi-vendor, multi-channel, and multi-warehouse support designed to scale to very large catalogs."
    },
    {
      "question": "Do I need Pimcore to use CoreShop?",
      "answer": "Yes. CoreShop is built as a commerce layer on top of Pimcore's product information management and digital asset management platform, so it is intended for teams already using or evaluating Pimcore."
    },
    {
      "question": "Is EverShop ready for production use?",
      "answer": "EverShop's self-hosted, open-source core is free and functional today, but it remains an early-stage, community-driven project, and its announced managed cloud hosting tiers are not yet available."
    },
    {
      "question": "Is CoreShop still fully open source?",
      "answer": "CoreShop's bundle source code remains publicly viewable, but as of April 2025 it moved to an open-core model alongside Pimcore, meaning certain enterprise deployments require a paid CoreShop Commercial License."
    },
    {
      "question": "Which platform fits a JavaScript or TypeScript team best?",
      "answer": "EverShop, since it is built natively on Node.js, React, TypeScript, and GraphQL, unlike the PHP-based Aimeos and CoreShop."
    },
    {
      "question": "Are Aimeos and EverShop free to run in production?",
      "answer": "Yes, both keep their self-hosted core software free with no licensing fees, while commercial support (for Aimeos) or managed hosting (for EverShop, once available) are optional paid add-ons."
    }
  ]
};

export default aimeosVsCoreshopVsEvershopContent;

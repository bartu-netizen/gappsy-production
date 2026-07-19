import type { GroupComparisonContent } from './types';

const aimeosVsSCartVsTheliaContent: GroupComparisonContent = {
  "verdict": "Aimeos, s-cart, and Thelia are all free, open-source, self-hosted PHP e-commerce platforms, but they sit at very different points on the scale and ambition spectrum. Aimeos is built for large multi-vendor catalogs and enterprise-grade performance, s-cart is a lightweight Laravel-based cart aimed at individuals, small businesses, and students who want a no-cost storefront with built-in CMS features, and Thelia leans into Symfony-based B2B and omnichannel retail functionality with deep roots in the French market. There is little overlap in target audience, so the right choice depends heavily on project scale and existing framework familiarity.",
  "bestFor": {
    "aimeos": "Teams building large-scale or multi-vendor marketplaces on Laravel or TYPO3",
    "s-cart": "Individuals, small businesses, and students who want a free, lightweight Laravel storefront with built-in CMS features",
    "thelia": "Symfony-based merchants needing B2B pricing, omnichannel fulfillment, and a strong presence in French-speaking markets"
  },
  "highlights": [
    {
      "title": "Aimeos targets enterprise scale",
      "description": "With multi-vendor, multi-channel, and multi-warehouse support plus catalogs designed to scale past a billion products, Aimeos is aimed at ambitious, high-volume builds backed by a 45,000+ star community.",
      "toolSlugs": [
        "aimeos"
      ]
    },
    {
      "title": "s-cart is built for lightweight, low-cost storefronts",
      "description": "s-cart pairs a Laravel-based shopping cart with built-in CMS capabilities and multi-supplier support, aimed at individuals, small businesses, and students who want a free, no-frills store.",
      "toolSlugs": [
        "s-cart"
      ]
    },
    {
      "title": "Thelia leads on B2B and omnichannel depth",
      "description": "Thelia ships client-specific B2B pricing, click-and-collect and drive pickup, and barcode-scanning order picking, plus roughly 300 community and commercial modules, out of the box.",
      "toolSlugs": [
        "thelia"
      ]
    },
    {
      "title": "Support and backing differ significantly",
      "description": "Aimeos offers commercial support through Aimeos GmbH and Thelia is backed by agency OpenStudio and its partners, while s-cart is a purely community-run project with no disclosed company or vendor support contract.",
      "toolSlugs": [
        "aimeos",
        "thelia",
        "s-cart"
      ]
    },
    {
      "title": "Framework choice splits the field",
      "description": "Aimeos and s-cart both offer a Laravel path, giving PHP teams a familiar framework choice, while Thelia is built entirely on Symfony.",
      "toolSlugs": [
        "aimeos",
        "s-cart",
        "thelia"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Commerce and Platform Capabilities",
      "rows": [
        {
          "feature": "Multi-vendor or multi-supplier marketplace support",
          "statuses": {
            "aimeos": "available",
            "s-cart": "available",
            "thelia": "not-documented"
          }
        },
        {
          "feature": "Built-in CMS or content management",
          "statuses": {
            "aimeos": "not-documented",
            "s-cart": "available",
            "thelia": "not-documented"
          }
        },
        {
          "feature": "B2B storefronts with client-specific pricing",
          "statuses": {
            "aimeos": "not-documented",
            "s-cart": "not-documented",
            "thelia": "available"
          }
        },
        {
          "feature": "Headless REST or GraphQL API",
          "statuses": {
            "aimeos": "available",
            "s-cart": "available",
            "thelia": "available"
          }
        }
      ]
    },
    {
      "group": "Deployment and Support",
      "rows": [
        {
          "feature": "Multi-store and multi-currency support",
          "statuses": {
            "aimeos": "not-documented",
            "s-cart": "available",
            "thelia": "available"
          }
        },
        {
          "feature": "Free to self-host with no licensing fee",
          "statuses": {
            "aimeos": "available",
            "s-cart": "available",
            "thelia": "available"
          }
        },
        {
          "feature": "Official commercial or vendor support available",
          "statuses": {
            "aimeos": "available",
            "s-cart": "unavailable",
            "thelia": "available"
          },
          "note": "s-cart is community-run with no disclosed company or paid support contract."
        },
        {
          "feature": "Community or commercial module marketplace",
          "statuses": {
            "aimeos": "not-documented",
            "s-cart": "not-documented",
            "thelia": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is easiest for a small business or student to start with?",
      "answer": "s-cart, since it is a lightweight, free Laravel-based storefront built to be accessible for individuals, small businesses, and students."
    },
    {
      "question": "Which platforms support multi-vendor marketplaces?",
      "answer": "Aimeos and s-cart both support multi-vendor or multi-supplier setups; Thelia does not document native multi-vendor marketplace functionality."
    },
    {
      "question": "Which of these has official commercial support?",
      "answer": "Aimeos, through Aimeos GmbH, and Thelia, through OpenStudio and its partner agencies, both offer paid support. s-cart is community-run with no disclosed vendor or support contract."
    },
    {
      "question": "Are all three tools free to use?",
      "answer": "Yes, Aimeos, s-cart, and Thelia are all free, open-source, self-hosted platforms with no licensing fees for their core software."
    },
    {
      "question": "Which is best for B2B wholesale features?",
      "answer": "Thelia, with built-in client-specific pricing, payment terms, and omnichannel fulfillment like click-and-collect and barcode-scanning order picking."
    },
    {
      "question": "What frameworks do these platforms run on?",
      "answer": "Aimeos runs on Laravel or TYPO3, s-cart runs on Laravel, and Thelia runs on Symfony."
    }
  ]
};

export default aimeosVsSCartVsTheliaContent;

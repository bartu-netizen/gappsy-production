import type { GroupComparisonContent } from './types';

const aimeosVsCoreshopVsSCartContent: GroupComparisonContent = {
  "verdict": "Aimeos, CoreShop, and s-cart are all free-to-self-host PHP e-commerce frameworks aimed at developers rather than non-technical store owners, but they differ sharply in scale target and licensing purity. Aimeos is built to scale to very large catalogs and marketplaces, CoreShop layers commerce on top of Pimcore's product-data platform but shifted to an open-core license in 2025, and s-cart is a simpler, fully free Laravel cart with CMS features baked in. None offers a managed SaaS from its own vendor, so the choice comes down to which framework and licensing model a team is already comfortable with.",
  "bestFor": {
    "aimeos": "PHP, Laravel, or TYPO3 agencies building large-scale stores, marketplaces, or subscription commerce that need to scale past a billion products.",
    "coreshop": "Teams already invested in Pimcore for product information and digital asset management who want commerce layered on the same unified, structured data model.",
    "s-cart": "Developers and smaller teams who want a fully free (not open-core) Laravel shopping cart with built-in CMS and multi-store features out of the box."
  },
  "highlights": [
    {
      "title": "Purpose-built for massive catalogs",
      "description": "Aimeos reports fast page rendering around 20ms and is designed to scale from small shops to catalogs of over a billion products, backed by 400,000+ downloads and 45,000+ GitHub stars.",
      "toolSlugs": [
        "aimeos"
      ]
    },
    {
      "title": "Commerce layered on enterprise PIM/DAM",
      "description": "CoreShop is built directly on Pimcore's product information and digital asset management data model, making it a strong fit for complex, high-SKU catalogs, though its April 2025 shift to an open-core license means some enterprise use cases now need a paid Commercial License.",
      "toolSlugs": [
        "coreshop"
      ]
    },
    {
      "title": "Simplest, fully free Laravel option",
      "description": "s-cart has no open-core split, remains entirely free and open source, and bundles CMS capabilities, multi-store, multi-language, and multi-currency support directly into the core product.",
      "toolSlugs": [
        "s-cart"
      ]
    },
    {
      "title": "All require self-hosting and framework expertise",
      "description": "None of the three offers a first-party managed hosting option; Aimeos and s-cart use Laravel-style tooling while CoreShop requires Symfony and Pimcore knowledge.",
      "toolSlugs": [
        "aimeos",
        "coreshop",
        "s-cart"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing and Framework",
      "rows": [
        {
          "feature": "Free to self-host with no commercial license required",
          "statuses": {
            "aimeos": "available",
            "coreshop": "limited",
            "s-cart": "available"
          },
          "note": "CoreShop's core bundles are source-available, but a separate Commercial License is required for certain enterprise use cases since April 2025."
        },
        {
          "feature": "Native Laravel integration",
          "statuses": {
            "aimeos": "available",
            "coreshop": "unavailable",
            "s-cart": "available"
          },
          "note": "CoreShop is built on Symfony, not Laravel."
        }
      ]
    },
    {
      "group": "Commerce Capabilities",
      "rows": [
        {
          "feature": "Multi-vendor or marketplace support",
          "statuses": {
            "aimeos": "available",
            "coreshop": "not-documented",
            "s-cart": "available"
          }
        },
        {
          "feature": "Multi-currency and multi-store support",
          "statuses": {
            "aimeos": "not-documented",
            "coreshop": "available",
            "s-cart": "available"
          }
        },
        {
          "feature": "Subscription and recurring billing",
          "statuses": {
            "aimeos": "available",
            "coreshop": "not-documented",
            "s-cart": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Platform and Integration",
      "rows": [
        {
          "feature": "Headless REST or GraphQL API",
          "statuses": {
            "aimeos": "available",
            "coreshop": "available",
            "s-cart": "available"
          },
          "note": "Aimeos exposes both JSON REST and GraphQL; CoreShop exposes data via Pimcore DataHub; s-cart provides a secured API layer."
        },
        {
          "feature": "Built-in CMS or content pages",
          "statuses": {
            "aimeos": "not-documented",
            "coreshop": "available",
            "s-cart": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is truly 100 percent free with no paid license tier?",
      "answer": "Aimeos and s-cart remain fully free and open source. CoreShop moved to an open-core license in April 2025, so certain enterprise deployments require a paid Commercial License."
    },
    {
      "question": "Which is best for very large product catalogs?",
      "answer": "Aimeos, which reports fast rendering and is built to scale to catalogs of over a billion products."
    },
    {
      "question": "Which one integrates natively with a PIM/DAM system?",
      "answer": "CoreShop, which is built directly on Pimcore's product information and digital asset management platform."
    },
    {
      "question": "Do any of these offer managed hosting from the vendor?",
      "answer": "No. All three are self-hosted frameworks; Aimeos additionally offers optional paid commercial support through Aimeos GmbH."
    },
    {
      "question": "Which one is built on Laravel rather than Symfony?",
      "answer": "Aimeos (available as a Laravel extension) and s-cart (built natively on Laravel). CoreShop is built on Symfony."
    }
  ]
};

export default aimeosVsCoreshopVsSCartContent;

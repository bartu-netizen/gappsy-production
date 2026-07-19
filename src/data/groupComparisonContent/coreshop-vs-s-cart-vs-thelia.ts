import type { GroupComparisonContent } from './types';

const coreshopVsSCartVsTheliaContent: GroupComparisonContent = {
  "verdict": "CoreShop, s-cart, and Thelia are all self-hosted, PHP-framework-based e-commerce platforms for developers who want full code ownership rather than a hosted SaaS storefront, but they target different buyers. Thelia stands out for B2B pricing and omnichannel fulfillment features with a mature module ecosystem, CoreShop is the default choice for teams already running Pimcore for product data, and s-cart is the simplest, fully free Laravel option. None publishes a managed cloud plan of its own, so the decision generally comes down to existing framework investment and required commerce complexity.",
  "bestFor": {
    "coreshop": "Organizations already running Pimcore for product information and digital asset management that want to add transactional commerce on the same unified data model.",
    "s-cart": "Developers who want a fully free, non-open-core Laravel shopping cart with built-in CMS and multi-store support.",
    "thelia": "Merchants and agencies needing strong B2B pricing tools, omnichannel fulfillment such as click-and-collect, and a mature module marketplace."
  },
  "highlights": [
    {
      "title": "Deepest B2B and omnichannel feature set",
      "description": "Thelia natively supports client-specific B2B pricing and payment terms, click-and-collect and drive fulfillment, and in-store order picking with barcode scanning, backed by around 300 community and commercial modules and more than 7,000 reported live sites.",
      "toolSlugs": [
        "thelia"
      ]
    },
    {
      "title": "Commerce built on a PIM/DAM foundation",
      "description": "CoreShop's tight coupling with Pimcore's product data model makes it well suited to complex, high-SKU catalogs, though its April 2025 open-core license shift means some enterprise use cases now require a paid Commercial License.",
      "toolSlugs": [
        "coreshop"
      ]
    },
    {
      "title": "Simplest fully free Laravel alternative",
      "description": "s-cart avoids the open-core licensing complexity of CoreShop, remaining entirely free while bundling CMS, multi-store, and multi-currency support directly into the core product.",
      "toolSlugs": [
        "s-cart"
      ]
    },
    {
      "title": "All are self-hosted, developer-oriented platforms",
      "description": "None of the three offers a first-party managed SaaS; CoreShop and Thelia both require Symfony expertise while s-cart requires Laravel expertise.",
      "toolSlugs": [
        "coreshop",
        "s-cart",
        "thelia"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Licensing and Framework",
      "rows": [
        {
          "feature": "Fully free open-source, no commercial license tier",
          "statuses": {
            "coreshop": "limited",
            "s-cart": "available",
            "thelia": "available"
          },
          "note": "CoreShop requires a paid Commercial License for certain enterprise use cases since April 2025; Thelia is LGPL-licensed with no such split."
        },
        {
          "feature": "Built on the Symfony framework",
          "statuses": {
            "coreshop": "available",
            "s-cart": "unavailable",
            "thelia": "available"
          },
          "note": "s-cart is built on Laravel instead."
        }
      ]
    },
    {
      "group": "Commerce and Store Management",
      "rows": [
        {
          "feature": "Multi-store or multisite management",
          "statuses": {
            "coreshop": "available",
            "s-cart": "available",
            "thelia": "available"
          }
        },
        {
          "feature": "B2B-specific pricing and payment terms",
          "statuses": {
            "coreshop": "not-documented",
            "s-cart": "not-documented",
            "thelia": "available"
          }
        },
        {
          "feature": "Omnichannel fulfillment (click-and-collect, in-store pickup)",
          "statuses": {
            "coreshop": "not-documented",
            "s-cart": "not-documented",
            "thelia": "available"
          }
        }
      ]
    },
    {
      "group": "Platform, API and Ecosystem",
      "rows": [
        {
          "feature": "Headless REST API",
          "statuses": {
            "coreshop": "available",
            "s-cart": "available",
            "thelia": "available"
          }
        },
        {
          "feature": "Module or extension marketplace",
          "statuses": {
            "coreshop": "not-documented",
            "s-cart": "available",
            "thelia": "available"
          },
          "note": "Thelia's marketplace has roughly 300 modules; s-cart uses a plugin architecture for payments, shipping, and tax."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these has the largest module or extension ecosystem?",
      "answer": "Thelia, with roughly 300 community and commercial modules covering payments, shipping, and marketing."
    },
    {
      "question": "Is CoreShop still open source?",
      "answer": "Its bundles remain source-available and free for many self-hosted use cases, but since April 2025 CoreShop uses an open-core model where certain enterprise deployments require a paid Commercial License purchased through the Pimcore Store."
    },
    {
      "question": "Which platform is best for B2B wholesale selling?",
      "answer": "Thelia, which supports client-specific pricing, payment terms, and delivery terms for wholesale customers natively."
    },
    {
      "question": "Do any of these require Pimcore to run?",
      "answer": "Only CoreShop, which is built as the commerce layer on top of Pimcore's PIM and DAM platform. s-cart and Thelia do not require Pimcore."
    },
    {
      "question": "Which one uses Laravel instead of Symfony?",
      "answer": "s-cart is built on Laravel. CoreShop and Thelia are both built on Symfony."
    }
  ]
};

export default coreshopVsSCartVsTheliaContent;

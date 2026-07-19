import type { GroupComparisonContent } from './types';

const evershopVsMagentoOpenSourceVsSCartContent: GroupComparisonContent = {
  "verdict": "EverShop, Magento Open Source, and s-cart are all free, self-hosted, open-source ecommerce platforms aimed at developers rather than non-technical merchants. EverShop offers a modern Node.js, TypeScript, and GraphQL stack for JavaScript-fluent teams, Magento Open Source brings by far the largest ecosystem and marketplace at the cost of higher implementation complexity, and s-cart is the lightest of the three, a Laravel-based PHP platform with built-in CMS features but a much smaller community.",
  "bestFor": {
    "evershop": "JavaScript and TypeScript teams who want a modern, headless-capable commerce engine built on Node.js and GraphQL.",
    "magento-open-source": "Merchants needing the largest extension marketplace, biggest agency ecosystem, and a clear upgrade path to enterprise features.",
    "s-cart": "Small teams already comfortable with Laravel who want a lightweight, no-license-cost PHP commerce platform with built-in CMS features."
  },
  "highlights": [
    {
      "title": "Three different backend stacks",
      "description": "EverShop runs on Node.js and TypeScript, Magento Open Source runs on its own modular PHP architecture, and s-cart is built on the Laravel PHP framework, so the choice often comes down to which language a team's existing engineers already know.",
      "toolSlugs": [
        "evershop",
        "magento-open-source",
        "s-cart"
      ]
    },
    {
      "title": "Free self-hosted core across all three",
      "description": "None of these platforms charges a software license fee for its self-hosted core edition, though all three still require the merchant to provide and maintain their own hosting.",
      "toolSlugs": [
        "evershop",
        "magento-open-source",
        "s-cart"
      ]
    },
    {
      "title": "Magento's ecosystem scale sets it apart",
      "description": "Magento Open Source's marketplace, agency network, and long enterprise track record go well beyond what either EverShop or s-cart currently offer.",
      "toolSlugs": [
        "magento-open-source"
      ]
    },
    {
      "title": "Different extensibility models",
      "description": "EverShop uses a modular extension system with a GraphQL API, s-cart offers secured API access with an extensible plugin architecture, and Magento relies on its established marketplace of third-party extensions.",
      "toolSlugs": [
        "evershop",
        "s-cart",
        "magento-open-source"
      ]
    },
    {
      "title": "s-cart bundles CMS features alongside commerce",
      "description": "Unlike EverShop or Magento Open Source as documented here, s-cart includes built-in CMS capabilities alongside its core catalog, order, and customer management tools.",
      "toolSlugs": [
        "s-cart"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Architecture",
      "rows": [
        {
          "feature": "Documented API access for integrations",
          "statuses": {
            "evershop": "available",
            "magento-open-source": "not-documented",
            "s-cart": "available"
          },
          "note": "EverShop exposes a GraphQL API and s-cart offers secured API access; a dedicated API was not documented for Magento Open Source in this comparison's source data."
        },
        {
          "feature": "Self-hosted deployment",
          "statuses": {
            "evershop": "available",
            "magento-open-source": "available",
            "s-cart": "available"
          }
        },
        {
          "feature": "Plugin or module extension system",
          "statuses": {
            "evershop": "available",
            "magento-open-source": "available",
            "s-cart": "available"
          }
        }
      ]
    },
    {
      "group": "Commerce Features",
      "rows": [
        {
          "feature": "Multi-store and multi-currency support",
          "statuses": {
            "evershop": "not-documented",
            "magento-open-source": "available",
            "s-cart": "available"
          }
        },
        {
          "feature": "Built-in CMS capabilities",
          "statuses": {
            "evershop": "not-documented",
            "magento-open-source": "not-documented",
            "s-cart": "available"
          }
        },
        {
          "feature": "Role-based admin permissions",
          "statuses": {
            "evershop": "not-documented",
            "magento-open-source": "not-documented",
            "s-cart": "available"
          }
        }
      ]
    },
    {
      "group": "Ecosystem and Maturity",
      "rows": [
        {
          "feature": "Established extension marketplace",
          "statuses": {
            "evershop": "not-documented",
            "magento-open-source": "available",
            "s-cart": "limited"
          },
          "note": "s-cart releases are distributed via Packagist and SourceForge rather than through a formal marketplace like Magento's."
        },
        {
          "feature": "Managed or cloud hosting option",
          "statuses": {
            "evershop": "limited",
            "magento-open-source": "not-documented",
            "s-cart": "not-documented"
          },
          "note": "EverShop has announced cloud plans that were listed as not yet available at the time of research."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are EverShop, Magento Open Source, and s-cart all free to use?",
      "answer": "Yes, all three offer a fully free, self-hosted core edition with no software license fee; costs come from hosting, development, and any paid extensions you choose to add."
    },
    {
      "question": "What's the main technical difference between EverShop and the other two?",
      "answer": "EverShop is built on Node.js, TypeScript, and GraphQL, while Magento Open Source and s-cart are both PHP platforms, Magento on its own framework and s-cart on Laravel."
    },
    {
      "question": "Which has the biggest community and ecosystem?",
      "answer": "Magento Open Source, by a wide margin, given its long history, large global developer and agency network, and established extension marketplace."
    },
    {
      "question": "Is s-cart suited to large, high-SKU enterprise catalogs?",
      "answer": "s-cart is a lightweight platform with a smaller ecosystem than Magento Open Source, so it tends to fit smaller catalogs better than the enterprise-scale deployments Magento's ecosystem is built around."
    },
    {
      "question": "Do any of these three offer managed cloud hosting?",
      "answer": "EverShop has announced Personal and Professional cloud tiers that were listed as not yet available at the time of research; Magento Open Source and s-cart do not offer an official managed hosting option for their free editions."
    },
    {
      "question": "Which platform has a built-in CMS?",
      "answer": "s-cart includes CMS capabilities alongside its core commerce features, which was not documented as a built-in feature for EverShop or Magento Open Source in this comparison's source data."
    }
  ]
};

export default evershopVsMagentoOpenSourceVsSCartContent;

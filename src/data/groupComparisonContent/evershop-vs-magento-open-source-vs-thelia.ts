import type { GroupComparisonContent } from './types';

const evershopVsMagentoOpenSourceVsTheliaContent: GroupComparisonContent = {
  "verdict": "EverShop, Magento Open Source, and Thelia are all free, self-hosted, open-source ecommerce platforms, but they diverge in stack and specialty. EverShop offers a modern Node.js, TypeScript, and GraphQL foundation, Magento Open Source brings the largest global ecosystem at the cost of a heavier implementation, and Thelia, built on Symfony, stands out for strong built-in B2B and omnichannel retail features, particularly in French-speaking markets.",
  "bestFor": {
    "evershop": "JavaScript and TypeScript-fluent teams that want a modern, headless-capable commerce engine.",
    "magento-open-source": "Merchants who need the largest global ecosystem of developers, agencies, and extensions and have resources for a larger implementation.",
    "thelia": "Merchants needing strong B2B, click-and-collect, and omnichannel retail features out of the box, especially in French-speaking markets."
  },
  "highlights": [
    {
      "title": "Thelia's built-in B2B and omnichannel tooling",
      "description": "Thelia ships with B2B storefronts with custom pricing, click-and-collect and drive fulfillment, and order picking with barcode scanning, a more retail-operations-focused feature set than either EverShop or Magento Open Source as documented here.",
      "toolSlugs": [
        "thelia"
      ]
    },
    {
      "title": "EverShop's modern stack diverges from PHP",
      "description": "EverShop is built on Node.js, TypeScript, and GraphQL, while both Magento Open Source and Thelia come from the PHP world, with Thelia specifically built on the Symfony framework.",
      "toolSlugs": [
        "evershop",
        "magento-open-source",
        "thelia"
      ]
    },
    {
      "title": "Magento's ecosystem scale dwarfs the other two",
      "description": "Magento Open Source's marketplace and global agency network are considerably larger than either EverShop's or Thelia's, reflecting its longer history and Adobe's backing.",
      "toolSlugs": [
        "magento-open-source"
      ]
    },
    {
      "title": "All three keep the core software free",
      "description": "EverShop, Magento Open Source, and Thelia all offer a free, self-hosted core edition with no software license fee, though hosting, development, and premium modules cost extra for each.",
      "toolSlugs": [
        "evershop",
        "magento-open-source",
        "thelia"
      ]
    },
    {
      "title": "Thelia and Magento share a PHP heritage, EverShop does not",
      "description": "Thelia's Symfony foundation puts it in the same broad PHP ecosystem as Magento Open Source, while EverShop's Node.js and TypeScript stack appeals to a different pool of engineering talent.",
      "toolSlugs": [
        "thelia",
        "magento-open-source",
        "evershop"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Architecture",
      "rows": [
        {
          "feature": "Documented REST or GraphQL API",
          "statuses": {
            "evershop": "available",
            "magento-open-source": "not-documented",
            "thelia": "available"
          }
        },
        {
          "feature": "Self-hosted deployment",
          "statuses": {
            "evershop": "available",
            "magento-open-source": "available",
            "thelia": "available"
          }
        },
        {
          "feature": "Module or extension marketplace",
          "statuses": {
            "evershop": "not-documented",
            "magento-open-source": "available",
            "thelia": "available"
          },
          "note": "Thelia lists around 300 community and commercial modules; Magento draws on the larger Adobe Commerce Marketplace."
        }
      ]
    },
    {
      "group": "Commerce Capabilities",
      "rows": [
        {
          "feature": "B2B storefronts with custom pricing",
          "statuses": {
            "evershop": "not-documented",
            "magento-open-source": "not-documented",
            "thelia": "available"
          }
        },
        {
          "feature": "Multi-store or multisite management",
          "statuses": {
            "evershop": "not-documented",
            "magento-open-source": "available",
            "thelia": "available"
          }
        },
        {
          "feature": "Omnichannel fulfillment (click and collect)",
          "statuses": {
            "evershop": "not-documented",
            "magento-open-source": "not-documented",
            "thelia": "available"
          }
        }
      ]
    },
    {
      "group": "Ecosystem and Support",
      "rows": [
        {
          "feature": "Managed or cloud hosting option",
          "statuses": {
            "evershop": "limited",
            "magento-open-source": "not-documented",
            "thelia": "not-documented"
          },
          "note": "EverShop has announced cloud plans that were listed as not yet available at the time of research."
        },
        {
          "feature": "Primary documentation in English",
          "statuses": {
            "evershop": "available",
            "magento-open-source": "available",
            "thelia": "limited"
          },
          "note": "Thelia's documentation and community resources are stronger in French than in English."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Thelia only usable in French?",
      "answer": "No, Thelia is a self-hosted open-source platform that can be deployed anywhere, but its documentation and community resources are stronger in French than in English, which is worth weighing for non-French-speaking teams."
    },
    {
      "question": "Which of the three offers the strongest B2B feature set out of the box?",
      "answer": "Thelia, which includes B2B storefronts with custom pricing, click-and-collect fulfillment, and barcode-based order picking as built-in features."
    },
    {
      "question": "What language and framework does each platform use?",
      "answer": "EverShop is built on Node.js and TypeScript with a GraphQL API. Magento Open Source uses its own modular PHP architecture, and Thelia is built on the Symfony PHP framework."
    },
    {
      "question": "Are there license fees for any of these platforms?",
      "answer": "No, all three offer a free, self-hosted core edition. Costs come from hosting, development, and any paid modules or extensions you add."
    },
    {
      "question": "Which has the largest extension marketplace?",
      "answer": "Magento Open Source, through the Adobe Commerce Marketplace, though Thelia also offers a marketplace of around 300 community and commercial modules."
    },
    {
      "question": "Do any of these provide managed hosting?",
      "answer": "None offers an official first-party managed hosting service for its free self-hosted core in the source data used for this comparison; EverShop's cloud tiers were announced but listed as not yet available."
    }
  ]
};

export default evershopVsMagentoOpenSourceVsTheliaContent;

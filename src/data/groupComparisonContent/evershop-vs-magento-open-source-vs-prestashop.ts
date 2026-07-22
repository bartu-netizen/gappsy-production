import type { GroupComparisonContent } from './types';

const evershopVsMagentoOpenSourceVsPrestashopContent: GroupComparisonContent = {
  "verdict": "All three are open-source, self-hostable ecommerce platforms with a genuinely free core edition, but they target different teams and growth stages. EverShop is the only modern JavaScript and TypeScript stack of the three, appealing to JS-native engineering teams, though its managed cloud tiers were still listed as not yet available at time of research. PrestaShop pairs a free self-hosted edition with an official, affordably priced managed Hosted plan and the largest documented community and partner network of the three. Magento Open Source offers the deepest extensibility and the clearest formal enterprise upgrade path through Adobe Commerce, but it also carries by far the highest realistic total cost of ownership once hosting, development, and extensions are included.",
  "bestFor": {
    "evershop": "JavaScript and TypeScript-fluent engineering teams who want a modern, headless-capable, self-hosted commerce engine built on Node.js, React, and GraphQL rather than a PHP-based legacy platform.",
    "magento-open-source": "Mid-size to large merchants with dedicated development resources who need deep extensibility today and a credible formal enterprise upgrade path to Adobe Commerce as they scale.",
    "prestashop": "Small to mid-sized merchants and agencies, especially in Europe, who want the option of free self-hosting or an affordable official managed Hosted plan, backed by a large modules marketplace and certified partner network."
  },
  "highlights": [
    {
      "title": "EverShop is the only JavaScript-native stack",
      "description": "EverShop is built entirely on Node.js, TypeScript, React, and GraphQL, while both Magento Open Source and PrestaShop are PHP-based platforms, making EverShop the natural fit for teams that want their commerce engine to match a modern JS toolchain.",
      "toolSlugs": [
        "evershop"
      ]
    },
    {
      "title": "Managed hosting availability differs sharply",
      "description": "PrestaShop sells an official managed Hosted plan from about $24 to $29 per month today; EverShop has announced Cloud plans priced at $10 and $20 per month that were still listed as not yet available at time of research; Magento Open Source has no managed hosting tier of its own, only the far pricier Adobe Commerce upgrade.",
      "toolSlugs": [
        "prestashop",
        "evershop",
        "magento-open-source"
      ]
    },
    {
      "title": "Magento Open Source carries the highest total cost of ownership",
      "description": "Even though the Magento Open Source license is free, realistic full implementations are commonly estimated between $122,000 and $450,000 or more per year once hosting, custom development, and extensions are included, reflecting its enterprise and large-merchant target audience.",
      "toolSlugs": [
        "magento-open-source"
      ]
    },
    {
      "title": "PrestaShop has the largest documented community and partner network",
      "description": "PrestaShop reports more than 250,000 active stores, over 1 million community members, and 150-plus certified agency partners, a materially larger ecosystem than EverShop's newer open-source community.",
      "toolSlugs": [
        "prestashop"
      ]
    },
    {
      "title": "Only Magento and PrestaShop document a formal enterprise upgrade tier",
      "description": "Magento Open Source can upgrade to Adobe Commerce, which adds B2B features, AI personalization, and a 99.99 percent uptime SLA, and PrestaShop offers a custom-priced Enterprise edition; EverShop does not document a comparable enterprise tier beyond its Cloud plans.",
      "toolSlugs": [
        "magento-open-source",
        "prestashop"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Platform and Architecture",
      "rows": [
        {
          "feature": "Free, self-hosted core edition",
          "statuses": {
            "evershop": "available",
            "magento-open-source": "available",
            "prestashop": "available"
          }
        },
        {
          "feature": "Modern JavaScript and TypeScript stack",
          "statuses": {
            "evershop": "available",
            "magento-open-source": "unavailable",
            "prestashop": "unavailable"
          },
          "note": "Magento Open Source and PrestaShop are both PHP-based platforms."
        },
        {
          "feature": "GraphQL API for headless storefronts",
          "statuses": {
            "evershop": "available",
            "magento-open-source": "not-documented",
            "prestashop": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Hosting and Enterprise Path",
      "rows": [
        {
          "feature": "Official managed or hosted plan",
          "statuses": {
            "evershop": "limited",
            "magento-open-source": "unavailable",
            "prestashop": "available"
          },
          "note": "EverShop's Cloud tiers are priced ($10 and $20 per month) but were documented as not yet available at time of research; Magento Open Source has no managed hosting tier of its own."
        },
        {
          "feature": "Formal enterprise upgrade tier",
          "statuses": {
            "evershop": "not-documented",
            "magento-open-source": "available",
            "prestashop": "available"
          },
          "note": "Magento Open Source upgrades to Adobe Commerce; PrestaShop offers a custom-priced Enterprise edition."
        }
      ]
    },
    {
      "group": "Ecosystem and Extensibility",
      "rows": [
        {
          "feature": "Named extension or module marketplace",
          "statuses": {
            "evershop": "not-documented",
            "magento-open-source": "available",
            "prestashop": "available"
          }
        },
        {
          "feature": "Certified agency or partner network",
          "statuses": {
            "evershop": "not-documented",
            "magento-open-source": "not-documented",
            "prestashop": "available"
          },
          "note": "PrestaShop documents more than 150 certified agency partners."
        },
        {
          "feature": "Built-in VAT and GDPR compliance tooling",
          "statuses": {
            "evershop": "not-documented",
            "magento-open-source": "not-documented",
            "prestashop": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is free to self-host?",
      "answer": "All three. EverShop, Magento Open Source, and PrestaShop each offer a genuinely free, self-hosted core edition with no license fee, though the operator must supply their own hosting, database, and technical maintenance."
    },
    {
      "question": "Which one uses a modern JavaScript stack instead of PHP?",
      "answer": "EverShop, built entirely on Node.js, TypeScript, React, and GraphQL. Magento Open Source and PrestaShop are both PHP-based platforms."
    },
    {
      "question": "Is there an official managed hosting option for any of these?",
      "answer": "PrestaShop sells PrestaShop Hosted from about $24 to $29 per month. EverShop has announced Cloud plans at $10 and $20 per month that were still listed as not yet available at time of research. Magento Open Source has no managed hosting tier of its own, only the separately priced Adobe Commerce upgrade."
    },
    {
      "question": "Which platform has the largest community and partner ecosystem?",
      "answer": "PrestaShop, with more than 250,000 active stores, over 1 million community members, and 150-plus certified agency partners documented."
    },
    {
      "question": "Which is the most expensive to run at scale?",
      "answer": "Magento Open Source. Even with a free software license, realistic full implementations are commonly estimated between $122,000 and $450,000 or more per year once hosting, custom development, and extensions are included."
    },
    {
      "question": "Is there an enterprise upgrade path if we outgrow the free edition?",
      "answer": "Magento Open Source can upgrade to Adobe Commerce, starting from about $22,000 per year, and PrestaShop offers a custom-priced Enterprise edition. EverShop does not document a separate enterprise tier beyond its Cloud plans."
    }
  ]
};

export default evershopVsMagentoOpenSourceVsPrestashopContent;

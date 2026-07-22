import type { GroupComparisonContent } from './types';

const ecwidVsMagentoOpenSourceVsPrestashopContent: GroupComparisonContent = {
  "verdict": "Ecwid, Magento Open Source, and PrestaShop solve the same problem, selling online, from very different starting points. Ecwid is a low-friction, fully hosted SaaS widget that plugs into an existing website starting at $5 a month, while Magento Open Source and PrestaShop are both self-hosted, free-to-download platforms that trade a lower software price for a much higher implementation and maintenance burden. Between the two open-source options, Magento carries the larger global ecosystem and enterprise upgrade path, while PrestaShop offers an official managed Hosted tier and a strong European community for merchants who want a middle ground.",
  "bestFor": {
    "ecwid": "Small businesses that already have a website, blog, or social presence and want to add a store without rebuilding their site.",
    "magento-open-source": "Mid-to-large merchants with development resources who need deep customization and can absorb a significant total cost of ownership.",
    "prestashop": "Merchants who want self-hosted control with an optional official managed hosting path and strong support in European markets."
  },
  "highlights": [
    {
      "title": "Ecwid's embeddable widget model",
      "description": "Ecwid is designed to be added into an existing WordPress, Wix, Squarespace, or custom site rather than replacing it, a structurally different approach from the self-hosted, build-your-own-site model of Magento Open Source and PrestaShop.",
      "toolSlugs": [
        "ecwid"
      ]
    },
    {
      "title": "Two self-hosted platforms, different scale",
      "description": "Magento Open Source and PrestaShop are both free, self-hosted, PHP-based platforms, but Magento's ecosystem and typical implementation scale skew toward larger merchants, while PrestaShop serves a wide range from small shops to enterprise retailers.",
      "toolSlugs": [
        "magento-open-source",
        "prestashop"
      ]
    },
    {
      "title": "Only PrestaShop offers an official managed hosting tier",
      "description": "PrestaShop Hosted bundles hosting, installation, and VAT/GDPR compliance tools starting at roughly $24 to $29 per month, an option Magento Open Source does not offer directly for its free edition.",
      "toolSlugs": [
        "prestashop"
      ]
    },
    {
      "title": "Ecwid's no-transaction-fee pricing versus open-source TCO",
      "description": "Ecwid charges no setup or transaction fees on any tier, while Magento Open Source and PrestaShop carry no software license fee but require merchants to fund hosting, development, and extensions separately.",
      "toolSlugs": [
        "ecwid",
        "magento-open-source",
        "prestashop"
      ]
    },
    {
      "title": "Established extension marketplaces on both open-source platforms",
      "description": "The Adobe Commerce Marketplace and the PrestaShop Addons Marketplace both give merchants access to large libraries of third-party modules and themes beyond the core platform.",
      "toolSlugs": [
        "magento-open-source",
        "prestashop"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Hosting",
      "rows": [
        {
          "feature": "Self-hosted deployment option",
          "statuses": {
            "ecwid": "unavailable",
            "magento-open-source": "available",
            "prestashop": "available"
          }
        },
        {
          "feature": "Officially managed hosting",
          "statuses": {
            "ecwid": "available",
            "magento-open-source": "not-documented",
            "prestashop": "available"
          },
          "note": "Ecwid is fully cloud-hosted by design; PrestaShop offers an optional PrestaShop Hosted plan; Magento Open Source itself has no first-party managed hosting tier."
        },
        {
          "feature": "Free-to-download core software",
          "statuses": {
            "ecwid": "unavailable",
            "magento-open-source": "available",
            "prestashop": "available"
          }
        }
      ]
    },
    {
      "group": "Commerce and Merchandising",
      "rows": [
        {
          "feature": "Multi-store and multi-currency support",
          "statuses": {
            "ecwid": "not-documented",
            "magento-open-source": "available",
            "prestashop": "available"
          }
        },
        {
          "feature": "WYSIWYG visual page builder",
          "statuses": {
            "ecwid": "not-documented",
            "magento-open-source": "available",
            "prestashop": "not-documented"
          }
        },
        {
          "feature": "Built-in point-of-sale integration",
          "statuses": {
            "ecwid": "available",
            "magento-open-source": "not-documented",
            "prestashop": "not-documented"
          },
          "note": "Ecwid's POS integration is available on its top Unlimited plan."
        }
      ]
    },
    {
      "group": "Ecosystem",
      "rows": [
        {
          "feature": "Extension or app marketplace",
          "statuses": {
            "ecwid": "available",
            "magento-open-source": "available",
            "prestashop": "available"
          }
        },
        {
          "feature": "Certified agency or partner network",
          "statuses": {
            "ecwid": "not-documented",
            "magento-open-source": "available",
            "prestashop": "available"
          },
          "note": "PrestaShop lists over 150 certified partners; Magento has a large established global agency ecosystem."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of the three is cheapest to get started with?",
      "answer": "Ecwid has the lowest predictable starting cost at $5 per month with no transaction fees. Magento Open Source and PrestaShop's core software is free, but merchants still need to budget for hosting, development, and extensions, which usually makes their real starting cost higher."
    },
    {
      "question": "Can I self-host Ecwid the way I would Magento or PrestaShop?",
      "answer": "No. Ecwid is a cloud-only SaaS product with no self-hosted edition, while Magento Open Source and PrestaShop are both designed to be downloaded and run on infrastructure the merchant controls."
    },
    {
      "question": "Which has the larger extension ecosystem, Magento or PrestaShop?",
      "answer": "Both maintain large marketplaces, the Adobe Commerce Marketplace and PrestaShop Addons respectively, but Magento's global developer and agency ecosystem is generally larger given Adobe's backing and longer enterprise track record."
    },
    {
      "question": "Do Magento Open Source or PrestaShop charge a license fee?",
      "answer": "No, the core software for both is free to download and self-host. Costs come from hosting, custom development, and paid extensions or themes rather than a software license."
    },
    {
      "question": "Which platform is the best fit for a merchant who already has a website?",
      "answer": "Ecwid, since it is built to embed into an existing website, blog, or social page rather than requiring a full site rebuild the way Magento Open Source or PrestaShop implementations typically do."
    },
    {
      "question": "Is there a managed hosting option if I don't want to self-host?",
      "answer": "Ecwid is fully managed by default, and PrestaShop offers an official PrestaShop Hosted plan from about $24 to $29 per month. Magento Open Source has no equivalent first-party managed hosting tier for its free edition."
    }
  ]
};

export default ecwidVsMagentoOpenSourceVsPrestashopContent;

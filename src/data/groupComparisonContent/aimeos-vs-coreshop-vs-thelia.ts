import type { GroupComparisonContent } from './types';

const aimeosVsCoreshopVsTheliaContent: GroupComparisonContent = {
  "verdict": "Aimeos, CoreShop, and Thelia are all free, open-source, self-hosted PHP e-commerce platforms aimed at developers and agencies rather than no-code merchants, but each has carved out a different specialty. Aimeos focuses on scale and marketplace features across Laravel or TYPO3, CoreShop builds commerce directly on top of Pimcore's product-data platform (now under an open-core license), and Thelia bundles strong B2B and omnichannel retail features, such as click-and-collect and barcode-scanned order picking, with an especially deep footprint in the French market. The choice largely comes down to existing framework investment and how much B2B or omnichannel functionality is needed out of the box.",
  "bestFor": {
    "aimeos": "PHP teams building large-scale or multi-vendor marketplaces on Laravel or TYPO3",
    "coreshop": "Agencies and enterprises already running Pimcore who want commerce unified with their product-data platform",
    "thelia": "Symfony-based merchants needing built-in B2B pricing, omnichannel fulfillment, and a strong presence in French-speaking markets"
  },
  "highlights": [
    {
      "title": "Aimeos wins on marketplace scale",
      "description": "With multi-vendor, multi-channel, and multi-warehouse support plus catalogs designed to scale past a billion products, Aimeos is built for high-volume or marketplace-style stores.",
      "toolSlugs": [
        "aimeos"
      ]
    },
    {
      "title": "CoreShop is the commerce layer for Pimcore",
      "description": "CoreShop turns Pimcore's PIM and DAM strengths into a full transactional store, making it the natural choice for organizations with complex, centrally managed product data.",
      "toolSlugs": [
        "coreshop"
      ]
    },
    {
      "title": "Thelia leads on B2B and omnichannel retail features",
      "description": "Thelia ships client-specific B2B pricing and payment terms, click-and-collect and drive pickup, and barcode-scanning order picking out of the box, features aimed squarely at omnichannel and wholesale retail.",
      "toolSlugs": [
        "thelia"
      ]
    },
    {
      "title": "Licensing has split into two camps",
      "description": "Aimeos and Thelia remain fully open source and free to self-host, while CoreShop moved to an open-core model in April 2025 that requires a paid CoreShop Commercial License for certain enterprise deployments.",
      "toolSlugs": [
        "aimeos",
        "coreshop",
        "thelia"
      ]
    },
    {
      "title": "Adoption and community differ sharply",
      "description": "Aimeos has by far the largest global community with 400,000+ downloads and 45,000+ GitHub stars, Thelia reports over 7,000 live sites concentrated mostly in French-speaking markets, and CoreShop's community stays smaller and centered on the Pimcore ecosystem.",
      "toolSlugs": [
        "aimeos",
        "thelia",
        "coreshop"
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
            "thelia": "not-documented"
          }
        },
        {
          "feature": "B2B storefronts with client-specific pricing",
          "statuses": {
            "aimeos": "not-documented",
            "coreshop": "not-documented",
            "thelia": "available"
          }
        },
        {
          "feature": "Omnichannel fulfillment (click-and-collect, in-store pickup)",
          "statuses": {
            "aimeos": "not-documented",
            "coreshop": "not-documented",
            "thelia": "available"
          }
        },
        {
          "feature": "Headless REST or GraphQL API",
          "statuses": {
            "aimeos": "available",
            "coreshop": "available",
            "thelia": "available"
          }
        }
      ]
    },
    {
      "group": "Deployment and Licensing",
      "rows": [
        {
          "feature": "Free to self-host without a commercial license",
          "statuses": {
            "aimeos": "available",
            "coreshop": "limited",
            "thelia": "available"
          },
          "note": "CoreShop's April 2025 open-core shift requires a CoreShop Commercial License for certain enterprise deployments."
        },
        {
          "feature": "Community or commercial module marketplace",
          "statuses": {
            "aimeos": "not-documented",
            "coreshop": "not-documented",
            "thelia": "available"
          }
        },
        {
          "feature": "Multi-store or multisite management from one install",
          "statuses": {
            "aimeos": "not-documented",
            "coreshop": "available",
            "thelia": "available"
          }
        },
        {
          "feature": "Vendor or agency commercial support available",
          "statuses": {
            "aimeos": "available",
            "coreshop": "available",
            "thelia": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which platform is best for B2B wholesale selling with custom pricing?",
      "answer": "Thelia, which includes built-in B2B storefronts with client-specific pricing policies and payment terms."
    },
    {
      "question": "Which tool has the largest community?",
      "answer": "Aimeos, with more than 400,000 downloads and over 45,000 GitHub stars, well ahead of CoreShop's smaller Pimcore-centric community and Thelia's roughly 7,000 live sites."
    },
    {
      "question": "Is Thelia usable outside France?",
      "answer": "The core software is not region-locked, but documentation and community resources are strongest in French, and most of Thelia's 7,000+ live sites are concentrated in French-speaking markets."
    },
    {
      "question": "Do I need Pimcore to use CoreShop?",
      "answer": "Yes, CoreShop extends Pimcore's product information and digital asset management data model into a commerce layer, so it assumes an existing or planned Pimcore deployment."
    },
    {
      "question": "Are all three tools free to use?",
      "answer": "Aimeos and Thelia are fully open source and free to self-host. CoreShop's core also remains self-hostable, but its April 2025 open-core licensing change requires a paid CoreShop Commercial License for certain enterprise deployments."
    },
    {
      "question": "Which is best for omnichannel retail with in-store pickup?",
      "answer": "Thelia, which natively supports click-and-collect, drive or curbside pickup, and barcode-scanning order picking."
    }
  ]
};

export default aimeosVsCoreshopVsTheliaContent;

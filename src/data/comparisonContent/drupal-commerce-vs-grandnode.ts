import type { ToolComparisonContent } from './types';

const drupalCommerceVsGrandnodeContent: ToolComparisonContent = {
  "verdict": "Drupal Commerce is a commerce module built into the Drupal CMS, best suited to content-driven sites that need product selling layered onto pages already using Drupal's media library and layout builder. GrandNode is a standalone ASP.NET Core platform with explicit multi-vendor marketplace, B2B, and booking/reservation features, aimed at merchants who need those specific business models without a CMS underneath. Both are free and open source, but they target different technology stacks (PHP/Drupal versus .NET) and different commerce shapes.",
  "bestForToolA": "Teams that already run or plan to run a Drupal site and want commerce integrated with Drupal's content tools, custom fields, and Search API rather than a separate platform.",
  "bestForToolB": "Merchants who specifically need B2B customer grouping and custom pricing, a multi-vendor marketplace, or booking/reservation-based products, built on the ASP.NET Core/.NET stack.",
  "whoNeedsBoth": "No typical scenario exists for running both simultaneously — they are competing foundations for the same storefront. The only overlap would be a business unit on Drupal Commerce spinning up a separate marketplace or booking site on GrandNode because Drupal Commerce doesn't document that functionality.",
  "keyDifferences": [
    {
      "title": "Technology Stack",
      "toolA": "Drupal Commerce is a PHP-based module running inside the Drupal CMS.",
      "toolB": "GrandNode is built on ASP.NET Core / .NET and released under the GPL-3 license.",
      "whyItMatters": "The hosting stack determines which developers and infrastructure a team needs to run and maintain the store.",
      "benefitsWho": "PHP/Drupal teams benefit from Drupal Commerce; .NET teams benefit from GrandNode."
    },
    {
      "title": "Multi-Vendor Marketplace",
      "toolA": "Drupal Commerce's documented features focus on multi-site, multi-language, multi-currency, and layout tooling; marketplace functionality is not documented.",
      "toolB": "GrandNode includes explicit multi-vendor marketplace functionality for running multi-vendor storefronts.",
      "whyItMatters": "Marketplace models require vendor onboarding, split payouts, and vendor-scoped catalogs that a single-seller platform doesn't need to support.",
      "benefitsWho": "Businesses building a multi-vendor marketplace rather than a single-seller storefront."
    },
    {
      "title": "B2B Store Management",
      "toolA": "Drupal Commerce documents custom fields and layouts but no dedicated B2B customer grouping or tiered pricing feature.",
      "toolB": "GrandNode explicitly supports B2C and B2B store management with customer grouping and custom pricing.",
      "whyItMatters": "B2B buyers often need negotiated pricing tiers and account-based access that consumer-only platforms don't model directly.",
      "benefitsWho": "Wholesale and B2B sellers who need customer-group-specific pricing out of the box."
    },
    {
      "title": "Booking & Reservation Products",
      "toolA": "Not documented as a Drupal Commerce feature.",
      "toolB": "GrandNode supports booking/reservation-based products such as accommodations and services.",
      "whyItMatters": "Selling time-bound services (rentals, appointments, stays) requires dedicated inventory logic that standard product catalogs don't provide.",
      "benefitsWho": "Businesses selling bookable services or accommodations alongside physical goods."
    },
    {
      "title": "Cross-Channel Integration",
      "toolA": "Documents general third-party API integrations via Drupal's event system, but no named marketplace channel integrations.",
      "toolB": "GrandNode explicitly integrates with channels such as Amazon and eBay, including inventory sync.",
      "whyItMatters": "Sellers who also list on third-party marketplaces need inventory to stay synchronized automatically to avoid overselling.",
      "benefitsWho": "Merchants who sell simultaneously on Amazon, eBay, and their own storefront."
    }
  ],
  "featureMatrix": [
    {
      "group": "Platform & Architecture",
      "rows": [
        {
          "feature": "Bundled CMS / content management",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Headless commerce API",
          "toolA": "available",
          "toolB": "available",
          "note": "GrandNode documents a dedicated headless API architecture"
        },
        {
          "feature": "Multi-site support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Search / faceted filtering",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Commerce Business Models",
      "rows": [
        {
          "feature": "B2B store management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Multi-vendor marketplace",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Booking / reservation system",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Digital products / e-learning",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Support, Integrations & Cost",
      "rows": [
        {
          "feature": "Free open-source core",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Paid consulting / support packages",
          "toolA": "available",
          "toolB": "available",
          "note": "Drupal Commerce via Centarro; GrandNode offers optional premium support with pricing not published"
        },
        {
          "feature": "Cross-channel integration (Amazon, eBay)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Drupal Commerce free?",
      "answer": "Yes, Drupal Commerce is free and open source, with paid consulting available separately through Centarro."
    },
    {
      "question": "Is GrandNode free?",
      "answer": "Yes, GrandNode's core platform is free and open source under the GPL-3 license, with optional paid support packages."
    },
    {
      "question": "Which platform supports multi-vendor marketplaces?",
      "answer": "GrandNode explicitly documents multi-vendor marketplace functionality; this is not documented for Drupal Commerce."
    },
    {
      "question": "Does either platform handle B2B pricing?",
      "answer": "GrandNode documents B2C and B2B store management with customer grouping and custom pricing; this is not documented as a Drupal Commerce feature."
    },
    {
      "question": "What technology stack does each require?",
      "answer": "Drupal Commerce requires PHP and Drupal CMS knowledge, while GrandNode requires ASP.NET Core / .NET development expertise."
    },
    {
      "question": "Can either sync inventory with Amazon or eBay?",
      "answer": "GrandNode documents cross-channel integration with Amazon and eBay including inventory sync; this is not documented for Drupal Commerce."
    }
  ]
};

export default drupalCommerceVsGrandnodeContent;

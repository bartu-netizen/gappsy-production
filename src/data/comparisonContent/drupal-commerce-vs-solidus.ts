import type { ToolComparisonContent } from './types';

const drupalCommerceVsSolidusContent: ToolComparisonContent = {
  "verdict": "Drupal Commerce is an e-commerce module bolted onto the Drupal CMS, so it fits stores that need commerce woven into content-heavy pages using Drupal's media library, layout builder, and Search API. Solidus is a standalone Ruby on Rails commerce framework with a native subscriptions engine and both REST and GraphQL APIs, built for developers who want a dedicated commerce codebase rather than a CMS add-on. Both are free and open source at the core, but they assume different teams: PHP/Drupal shops versus Ruby on Rails shops.",
  "bestForToolA": "Organizations already running Drupal (or wanting deep content management via Drupal's media library, layout builder, and Search API) that want commerce added to an existing content-driven site, maintained by Centarro since 2010.",
  "bestForToolB": "Ruby on Rails teams building a dedicated commerce application who want a native subscriptions engine and a choice between REST and GraphQL APIs, or who want the option to move to the fully hosted Solidus Cloud (Enterprise) tier later.",
  "whoNeedsBoth": "There isn't a realistic scenario for running both together long-term — they're alternative foundations for the same job (Drupal-based versus Rails-based commerce). The closest overlap is a team migrating a Drupal Commerce site to Solidus (or vice versa) running both temporarily during a rebuild.",
  "keyDifferences": [
    {
      "title": "Underlying Platform",
      "toolA": "Drupal Commerce is a module that runs on top of the Drupal CMS, inheriting Drupal's media library, layout builder, and Search API for product pages.",
      "toolB": "Solidus is a standalone Ruby on Rails framework forked from Spree in 2015; it has no bundled CMS layer of its own.",
      "whyItMatters": "The choice determines whether commerce is layered onto an existing content platform or built as a dedicated Rails application from scratch.",
      "benefitsWho": "Content-heavy publishers and multi-site organizations already invested in Drupal benefit from Drupal Commerce; greenfield Rails teams benefit from Solidus."
    },
    {
      "title": "Native Subscriptions",
      "toolA": "Drupal Commerce's documented features cover multi-site/multi-currency support, promotions, and coupon management, but a native subscriptions engine is not documented.",
      "toolB": "Solidus ships a native subscriptions engine designed for curated boxes and recurring purchase models.",
      "whyItMatters": "Recurring-revenue merchants need subscription billing logic built in rather than bolted on through third-party modules.",
      "benefitsWho": "Subscription box and recurring-purchase businesses evaluating Solidus's built-in engine."
    },
    {
      "title": "API Architecture",
      "toolA": "Drupal Commerce integrates with third-party applications via APIs and Drupal's event system, but a dedicated GraphQL API is not documented.",
      "toolB": "Solidus offers both REST and GraphQL APIs for building custom frontends and integrations.",
      "whyItMatters": "Teams building headless or decoupled storefronts often need GraphQL specifically for efficient, flexible data fetching.",
      "benefitsWho": "Developers building custom or headless storefronts who want a documented GraphQL option in Solidus."
    },
    {
      "title": "Managed Hosting Path",
      "toolA": "Drupal Commerce's paid option is consulting and development services through maintainer Centarro, not a packaged hosted product.",
      "toolB": "Solidus offers Solidus Cloud (Enterprise) as a separate, fully hosted plan with 24/7 support and unlimited usage, though its price is not publicly listed.",
      "whyItMatters": "Teams that eventually want to offload hosting and support need to know whether a packaged managed tier exists.",
      "benefitsWho": "Growing merchants who may want to hand off infrastructure and support to Solidus Cloud rather than self-host indefinitely."
    },
    {
      "title": "Content & Search Tooling",
      "toolA": "Drupal Commerce integrates with Drupal's Search API for keyword search and faceted filtering, and lets merchants configure custom fields and layouts through Drupal's field and layout systems.",
      "toolB": "Solidus documents merchandising and personalization using first-party data, upsells, and content integration, but not a dedicated faceted search API.",
      "whyItMatters": "Stores with large, content-rich catalogs need robust search and layout tooling out of the box.",
      "benefitsWho": "Catalog-heavy merchants and content teams who rely on Drupal's Search API and layout builder for product discovery."
    }
  ],
  "featureMatrix": [
    {
      "group": "Platform & Architecture",
      "rows": [
        {
          "feature": "Bundled CMS / content management",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Drupal Commerce runs inside Drupal; Solidus is commerce-only"
        },
        {
          "feature": "Multi-site support",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "REST API",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "GraphQL API",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Search API / faceted filtering",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Commerce Capabilities",
      "rows": [
        {
          "feature": "Native subscriptions engine",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Promotions and coupon codes",
          "toolA": "available",
          "toolB": "available",
          "note": "Solidus supports custom promotion rules beyond simple discount codes"
        },
        {
          "feature": "Multi-language / multi-currency",
          "toolA": "available",
          "toolB": "available",
          "note": "Solidus documents internationalization as a distinct feature"
        },
        {
          "feature": "Custom fields and page layouts",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Support, Hosting & Cost",
      "rows": [
        {
          "feature": "Free open-source core",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Fully hosted enterprise tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Solidus Cloud (Enterprise); price not published"
        },
        {
          "feature": "Paid consulting / support",
          "toolA": "available",
          "toolB": "available",
          "note": "Drupal Commerce via Centarro; Solidus Cloud includes 24/7 support"
        },
        {
          "feature": "Recent active release documented",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Commerce Core 3.2.0 released September 2025"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Drupal Commerce free?",
      "answer": "Yes, Drupal Commerce is free and open source; paid consulting and development services are available separately through maintainer Centarro."
    },
    {
      "question": "Is Solidus free?",
      "answer": "Yes, Solidus is a free, open-source framework that can be self-hosted; a separate paid Solidus Cloud (Enterprise) tier exists for fully hosted deployments."
    },
    {
      "question": "Does Solidus support subscription commerce?",
      "answer": "Yes, Solidus includes a native subscriptions engine for curated boxes and recurring purchase models, which is not documented as a Drupal Commerce feature."
    },
    {
      "question": "Do I need Drupal to use Drupal Commerce?",
      "answer": "Yes, Drupal Commerce is a module that runs on top of the Drupal content management system, unlike Solidus, which is a standalone Ruby on Rails framework."
    },
    {
      "question": "Which one offers a fully managed hosting option?",
      "answer": "Solidus offers Solidus Cloud (Enterprise) as a fully hosted plan with 24/7 support; Drupal Commerce's paid offering is consulting through Centarro rather than a packaged hosting product."
    },
    {
      "question": "What programming stack does each require?",
      "answer": "Drupal Commerce requires PHP and Drupal CMS knowledge, while Solidus requires Ruby on Rails development expertise."
    }
  ]
};

export default drupalCommerceVsSolidusContent;

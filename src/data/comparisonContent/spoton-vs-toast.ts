import type { ToolComparisonContent } from './types';

const spotonVsToastContent: ToolComparisonContent = {
  "verdict": "SpotOn and Toast both bundle POS, payments, online ordering, and payroll into a single vendor relationship, but they are built from different starting points. Toast, founded in 2012, is purpose built specifically for restaurants, with a dedicated Kitchen Display System, an offline mode that keeps orders and payments running during an internet outage, and a free Starter Kit tier that gives food trucks and small single-location restaurants a no-monthly-fee way to run a modern cloud POS, in exchange for higher processing rates. SpotOn, founded in 2017, casts a wider net across restaurants, bars, and retail or service businesses like salons, and leans on commission-free ordering, a white-labeled guest app called GoTo Place, and dedicated sales support to help less technical operators get set up. Neither company publishes full pricing without a quote or contract review, and both push merchants toward multi-year commitments on their lowest-cost tiers. Toast is the stronger fit when a business is restaurant-only and wants proven, restaurant-specific workflows plus a genuinely free entry point. SpotOn is the stronger fit when a business needs one platform to cover both food service and retail or service verticals, or wants a dedicated rep guiding onboarding rather than a self-serve setup. The right choice depends more on business type and support preference than on any single missing feature.",
  "bestForToolA": "SpotOn fits multi-vertical operators, such as a business running both a restaurant and a retail or salon location, that want one vendor plus dedicated sales and support during setup.",
  "bestForToolB": "Toast fits restaurant-only operators, including food trucks and new single-location restaurants, that want a proven restaurant-specific POS and a genuinely free entry-level tier.",
  "whoNeedsBoth": "A multi-concept operator with both a full-service restaurant and a separate retail or non-restaurant service business might run Toast for restaurant locations and SpotOn for the non-restaurant side, or compare quotes location by location since neither vendor publishes full pricing upfront.",
  "keyDifferences": [
    {
      "title": "Core vertical focus",
      "toolA": "SpotOn markets itself for restaurants and retail or service businesses like salons.",
      "toolB": "Toast is built specifically for restaurants, from full-service to quick-service.",
      "whyItMatters": "A tool designed for one vertical often has deeper workflows for that vertical than a generalist platform.",
      "benefitsWho": "Restaurant-only operators lean toward Toast; businesses spanning food and retail or services lean toward SpotOn."
    },
    {
      "title": "Entry-level pricing",
      "toolA": "SpotOn's lowest published tier is 0 dollars per station per month but requires a 2-year term and higher processing rates.",
      "toolB": "Toast offers a free Starter Kit software tier for up to two terminals at one location, also with a higher processing rate.",
      "whyItMatters": "Free or no-monthly-fee tiers change the real cost of getting started for very small or new operators.",
      "benefitsWho": "Cash-constrained new restaurants and food trucks benefit most from Toast's free tier structure."
    },
    {
      "title": "Founding and company age",
      "toolA": "SpotOn was founded in 2017 and is headquartered in San Francisco.",
      "toolB": "Toast was founded in 2012 and is headquartered in Boston.",
      "whyItMatters": "A longer operating history in the restaurant vertical can translate into more mature, restaurant-specific tooling.",
      "benefitsWho": "Buyers prioritizing vendor maturity in food service may weight this toward Toast."
    },
    {
      "title": "Offline order and payment processing",
      "toolA": "SpotOn's provided materials do not document an offline mode.",
      "toolB": "Toast has a documented Offline Mode that keeps orders and card payments running during an internet outage and syncs once connectivity returns.",
      "whyItMatters": "Internet outages are common in physical retail and restaurant locations, and losing the ability to take payments directly costs sales.",
      "benefitsWho": "Locations with unreliable internet service benefit from Toast's documented offline handling."
    },
    {
      "title": "Guest-facing versus manager-facing mobile apps",
      "toolA": "SpotOn's GoTo Place app is a white-labeled, guest-facing ordering app tied to the business's own branding.",
      "toolB": "Toast Now is a mobile app for owners and managers to check sales, manage shifts, and toggle ordering channels remotely.",
      "whyItMatters": "A branded guest ordering app supports direct-to-consumer marketing, while a manager app supports day-to-day operations oversight.",
      "benefitsWho": "Businesses wanting their own branded ordering app benefit from SpotOn; managers wanting remote oversight benefit from Toast Now."
    },
    {
      "title": "Business financing model",
      "toolA": "SpotOn offers financing so merchants can spread hardware purchase costs over time.",
      "toolB": "Toast Capital offers restaurant financing based on a location's own sales history rather than a traditional credit check.",
      "whyItMatters": "Hardware financing addresses upfront equipment cost, while revenue-based financing addresses broader working capital needs.",
      "benefitsWho": "Merchants needing help affording terminals benefit from SpotOn's approach; restaurants needing working capital benefit from Toast Capital."
    },
    {
      "title": "Inventory and vendor invoice tracking",
      "toolA": "SpotOn's provided feature set does not document dedicated inventory or vendor invoice management.",
      "toolB": "Toast includes xtraCHEF-powered tools for tracking food costs, vendor invoices, and stock levels.",
      "whyItMatters": "Food cost and inventory tracking directly affects restaurant margins and is a common pain point in food service.",
      "benefitsWho": "Restaurants focused on tightening food cost control benefit from Toast's xtraCHEF tools."
    },
    {
      "title": "Accounting and e-commerce integrations",
      "toolA": "SpotOn documents an OAuth-based API and partner integrations with tools such as QuickBooks and Shopify.",
      "toolB": "Toast's provided materials tag API support but do not name specific third-party accounting or e-commerce integration partners.",
      "whyItMatters": "Named integration partners give buyers concrete confirmation that a specific accounting or e-commerce stack will connect.",
      "benefitsWho": "Merchants already using QuickBooks or Shopify have clearer integration confirmation with SpotOn."
    },
    {
      "title": "Interface language support",
      "toolA": "SpotOn's provided materials do not document supported interface languages.",
      "toolB": "Toast's POS and kitchen display interfaces support English, Spanish, French, and Chinese, set at the device level.",
      "whyItMatters": "Multilingual staff need an interface they can read accurately during service to avoid order errors.",
      "benefitsWho": "Restaurants with non-English-speaking kitchen or front-of-house staff benefit from Toast's documented language support."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core POS and Ordering",
      "rows": [
        {
          "feature": "POS terminals and hardware",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Kitchen display integration",
          "toolA": "available",
          "toolB": "available",
          "note": "Toast documents a dedicated Kitchen Display System; SpotOn mentions kitchen display integration alongside table and menu management"
        },
        {
          "feature": "Commission-free online ordering",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Table management",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Reservation and guest management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Documented as SpotOn Reserve"
        }
      ]
    },
    {
      "group": "Payments, Hardware, and Financing",
      "rows": [
        {
          "feature": "Built-in card processing",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Hardware financing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Revenue-based business financing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented as Toast Capital"
        },
        {
          "feature": "Bring-your-own or third-party hardware",
          "toolA": "not-documented",
          "toolB": "unavailable",
          "note": "Toast's own FAQ states its terminals run only Toast software"
        },
        {
          "feature": "Offline order and payment processing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Marketing and Guest Engagement",
      "rows": [
        {
          "feature": "Email and SMS marketing campaigns",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Loyalty programs",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Gift cards",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Branded guest-facing ordering app",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "SpotOn's GoTo Place app; Toast Now is manager-facing rather than a guest app"
        },
        {
          "feature": "Online review management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Labor and Payroll",
      "rows": [
        {
          "feature": "Staff scheduling",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Payroll processing",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Tip management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Labor law compliance tools",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Reporting and Inventory",
      "rows": [
        {
          "feature": "Sales and labor reporting dashboards",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Multi-location reporting",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Food cost and vendor invoice tracking",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented as xtraCHEF-powered tools"
        }
      ]
    },
    {
      "group": "Platform and Mobile Access",
      "rows": [
        {
          "feature": "iOS and Android mobile app",
          "toolA": "available",
          "toolB": "available",
          "note": "SpotOn is tagged for iOS and Android; Toast Now is documented as an iOS and Android app"
        },
        {
          "feature": "Multi-language interface",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Toast documents English, Spanish, French, and Chinese"
        },
        {
          "feature": "Web-based dashboard",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Integrations and Developer Tools",
      "rows": [
        {
          "feature": "OAuth-based developer API",
          "toolA": "available",
          "toolB": "available",
          "note": "SpotOn describes a developer center and OAuth API; Toast is tagged for API access without named details"
        },
        {
          "feature": "Named accounting integrations, for example QuickBooks",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Named e-commerce integrations, for example Shopify",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Third-party delivery app integration",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Documented under Toast's Online Ordering and Delivery feature"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, SpotOn or Toast?",
      "answer": "Toast has the clearer low-cost entry point, with a free Starter Kit software tier and a Point of Sale plan starting at 69 dollars a month, while SpotOn's cheapest published tier is 0 dollars per station but requires a 2-year term, and its month-to-month tier runs 55 dollars per station; both also add card-processing fees and hardware costs on top."
    },
    {
      "question": "Is Toast or SpotOn better for a brand-new restaurant just getting started?",
      "answer": "Toast's free Starter Kit tier lowers the barrier for a new single-location restaurant or food truck, though it carries a higher processing rate, while SpotOn's comparable 0-dollar tier requires a 2-year commitment, so the better fit depends on whether the operator prioritizes flexibility or a longer-term rate lock-in."
    },
    {
      "question": "Can SpotOn or Toast keep taking orders and payments if the internet goes down?",
      "answer": "Toast documents an Offline Mode that keeps orders and card payments processing during an outage and syncs once connectivity returns; SpotOn's provided materials do not document an equivalent offline capability."
    },
    {
      "question": "Does SpotOn or Toast support staff who don't speak English?",
      "answer": "Toast documents interface support for English, Spanish, French, and Chinese at the device level; SpotOn's provided materials do not document supported interface languages."
    },
    {
      "question": "Which is better for a retail or salon business rather than a restaurant, SpotOn or Toast?",
      "answer": "SpotOn is the better documented fit, since its materials explicitly describe use by restaurants, bars, and retail or service businesses like salons, while Toast's materials describe it as a restaurant-specific platform."
    },
    {
      "question": "Do both SpotOn and Toast support restaurants with multiple locations?",
      "answer": "Yes, both document multi-location support: SpotOn's reporting and analytics cover single-location and multi-location businesses, and Toast Web centralizes reporting, menu management, and labor tracking across all sites for restaurant groups."
    }
  ]
};

export default spotonVsToastContent;

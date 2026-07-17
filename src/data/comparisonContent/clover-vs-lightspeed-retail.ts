import type { ToolComparisonContent } from './types';

const cloverVsLightspeedRetailContent: ToolComparisonContent = {
  "verdict": "Clover and Lightspeed Retail solve different problems even though both are point-of-sale systems. Clover is built around Fiserv payment processing bundled with hardware, and it flexes across retail, restaurant, and service businesses through its App Market rather than deep built-in retail tooling. Pricing and contracts are set by whichever bank or reseller sells the account, so costs and terms are inconsistent and require a custom quote. Lightspeed Retail is a cloud-based platform built specifically for retailers with complex inventory, offering purchase order management, vendor catalogs, multi-location stock transfers, and integrated eCommerce out of the box, with transparent published pricing starting at 89 dollars a month billed annually. A single-location shop or restaurant that wants one connected hardware and payments provider, sourced through a familiar bank, may prefer Clover. A retailer managing product variants, multiple locations, or an online store alongside physical stock will likely find Lightspeed Retail's inventory and eCommerce depth a better native fit. Neither tool is a strict upgrade over the other; the right choice depends on whether the buyer prioritizes payments-plus-hardware flexibility across business types or retail-specific inventory and multi-location depth.",
  "bestForToolA": "Clover fits retail, restaurant, or service businesses that want payments, hardware, and POS bundled together through a bank or reseller, especially those already banking with a Clover partner.",
  "bestForToolB": "Lightspeed Retail fits retailers with complex product variants, multiple store locations, or an online store that need deep inventory, purchase order, and eCommerce tools natively in the POS.",
  "whoNeedsBoth": "A multi-location retailer that also runs a full-service restaurant concept under the same ownership could end up running Lightspeed Retail for the retail side and Clover for the restaurant side, since each is more purpose-built for its respective format.",
  "keyDifferences": [
    {
      "title": "Core business focus",
      "toolA": "Clover spans retail, restaurant, and service businesses with dedicated plans for each",
      "toolB": "Lightspeed Retail is purpose-built for retail, with the provided facts noting it is less suited to restaurants or service providers",
      "whyItMatters": "Buyers running a restaurant or service business need software designed for that workflow, not adapted from a retail base",
      "benefitsWho": "Multi-format businesses benefit from Clover; pure retailers benefit from Lightspeed Retail's retail-first design"
    },
    {
      "title": "Pricing transparency",
      "toolA": "Clover software plans start around 14.95 dollars per month, but hardware, processing rates, and full plan pricing require a custom quote from a reseller or bank",
      "toolB": "Lightspeed Retail publishes clear tiered pricing starting at 89 dollars per month billed annually across Basic, Core, and Plus plans",
      "whyItMatters": "Buyers comparing total cost of ownership can budget confidently with published tiers, while custom-quote pricing requires sales conversations to know true cost",
      "benefitsWho": "Buyers who want upfront cost clarity benefit from Lightspeed Retail; those open to negotiating through a bank relationship may not mind Clover's quote-based model"
    },
    {
      "title": "Payment processing structure",
      "toolA": "Clover hardware and merchant accounts are tied to Fiserv processing, limiting easy switching to another processor",
      "toolB": "Lightspeed Retail offers its own integrated payments option within the POS, reducing the need to reconcile a separate provider",
      "whyItMatters": "Processor lock-in affects long-term flexibility and negotiating power on processing rates",
      "benefitsWho": "Merchants who value staying with a single processing relationship may accept Clover's model; those wanting an integrated but less restrictive option may prefer Lightspeed Retail"
    },
    {
      "title": "Inventory depth",
      "toolA": "Clover tracks items, categories, stock levels, and variants from the POS or web dashboard",
      "toolB": "Lightspeed Retail tracks stock across product variants like size and color, manages matrices, and provides low-stock alerts plus purchase order and vendor management",
      "whyItMatters": "Retailers with complex catalogs need deeper variant and vendor tooling than a general-purpose POS may offer",
      "benefitsWho": "Retailers with large or variant-heavy catalogs benefit from Lightspeed Retail's dedicated purchase order and vendor tools"
    },
    {
      "title": "Multi-location support",
      "toolA": "Clover's provided facts describe reporting and dashboard access but do not document dedicated multi-location stock transfer or rollup tooling beyond the Custom or Enterprise plan mentioning multi-location support",
      "toolB": "Lightspeed Retail explicitly supports viewing inventory and sales across multiple locations, transferring stock between stores, and consolidated company-wide reporting",
      "whyItMatters": "Growing retail chains need to move inventory between stores and see performance across locations in one view",
      "benefitsWho": "Multi-location retailers benefit from Lightspeed Retail's built-in cross-store tools"
    },
    {
      "title": "eCommerce integration",
      "toolA": "Not documented as a core Clover feature in the provided facts; online ordering is described specifically for restaurant use cases",
      "toolB": "Lightspeed Retail syncs online store inventory and orders with in-store stock as a built-in feature",
      "whyItMatters": "Retailers selling both online and in-store need inventory to stay in sync to avoid overselling",
      "benefitsWho": "Omnichannel retailers benefit from Lightspeed Retail's built-in eCommerce sync"
    },
    {
      "title": "Hardware options",
      "toolA": "Clover offers countertop Station, compact Mini, handheld Flex, and mobile Go devices across service styles",
      "toolB": "Lightspeed Retail runs on an iPad-based or browser-accessible checkout interface with a mobile companion app for scanning and stock counts",
      "whyItMatters": "Businesses with varied service styles such as tableside or on-the-go checkout may need dedicated hardware form factors",
      "benefitsWho": "Businesses wanting varied purpose-built hardware benefit from Clover; those comfortable with iPad and browser setups benefit from Lightspeed Retail's simpler hardware footprint"
    },
    {
      "title": "Offline capability",
      "toolA": "Clover explicitly supports offline mode, continuing to accept payments during internet outages and syncing once connectivity returns",
      "toolB": "Not documented in the provided Lightspeed Retail facts",
      "whyItMatters": "Businesses in areas with unreliable internet need assurance that sales can continue uninterrupted",
      "benefitsWho": "Merchants concerned about connectivity reliability benefit from Clover's documented offline mode"
    },
    {
      "title": "App marketplace versus native suite",
      "toolA": "Clover extends functionality through the Clover App Market, a marketplace of first- and third-party apps for loyalty, online ordering, and gift cards",
      "toolB": "Lightspeed Retail includes loyalty programs, customer profiles, and eCommerce as native built-in capabilities without a separate app marketplace model",
      "whyItMatters": "Marketplace-based extensibility can mean added costs and integration complexity compared to features that ship built-in",
      "benefitsWho": "Businesses wanting a single vendor with native features benefit from Lightspeed Retail; those wanting a customizable, app-driven ecosystem benefit from Clover"
    },
    {
      "title": "API and developer access",
      "toolA": "Clover provides a developer API used by partners and developers to build custom integrations and App Market listings",
      "toolB": "Lightspeed Retail offers API access and integrations, with direct API access specifically available on higher-tier plans like Plus",
      "whyItMatters": "Businesses building custom workflows need to know whether API access is included broadly or gated to premium tiers",
      "benefitsWho": "Developers on a budget may prefer Clover's more broadly available API; larger retailers already on higher tiers get Lightspeed Retail's Plus-level API access as part of a fuller feature set"
    }
  ],
  "featureMatrix": [
    {
      "group": "Point of sale and checkout",
      "rows": [
        {
          "feature": "Touchscreen or tablet checkout",
          "toolA": "available",
          "toolB": "available",
          "note": "Clover runs on its own hardware line; Lightspeed Retail is iPad-based or browser-accessible"
        },
        {
          "feature": "Offline transaction mode",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Only Clover's facts document offline payment continuity"
        },
        {
          "feature": "Returns and exchanges handling",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Explicitly documented for Lightspeed Retail"
        }
      ]
    },
    {
      "group": "Inventory and vendor management",
      "rows": [
        {
          "feature": "Item, category, and stock tracking",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Product variant matrices (size and color)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Clover mentions variants generally but not detailed matrix management"
        },
        {
          "feature": "Purchase order and vendor management",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Low-stock alerts",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Multi-location operations",
      "rows": [
        {
          "feature": "Multi-location reporting rollup",
          "toolA": "limited",
          "toolB": "available",
          "note": "Clover's Custom or Enterprise plan mentions multi-location support without detail; Lightspeed Retail documents this explicitly across plans"
        },
        {
          "feature": "Stock transfers between stores",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Payments and eCommerce",
      "rows": [
        {
          "feature": "Integrated payment processing",
          "toolA": "available",
          "toolB": "available",
          "note": "Clover via Fiserv; Lightspeed via its own integrated payments"
        },
        {
          "feature": "Built-in eCommerce sync",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Clover documents online ordering for restaurants, not general retail eCommerce"
        },
        {
          "feature": "Accounting software integration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Clover names QuickBooks sync specifically"
        }
      ]
    },
    {
      "group": "Customer engagement",
      "rows": [
        {
          "feature": "Loyalty or rewards programs",
          "toolA": "limited",
          "toolB": "available",
          "note": "Available via Clover App Market add-on versus native in Lightspeed Retail"
        },
        {
          "feature": "Customer profile and purchase history",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Staff and operations",
      "rows": [
        {
          "feature": "Employee permissions and timeclock",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Explicitly documented for Clover"
        },
        {
          "feature": "Custom user roles and SSO",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Available on Lightspeed Retail Plus plan"
        }
      ]
    },
    {
      "group": "Reporting and analytics",
      "rows": [
        {
          "feature": "Sales and item performance reporting",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Advanced forecasting and custom reporting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Available on higher Lightspeed Retail plans"
        }
      ]
    },
    {
      "group": "Extensibility",
      "rows": [
        {
          "feature": "Third-party app marketplace",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Clover App Market is a named feature"
        },
        {
          "feature": "Developer API access",
          "toolA": "available",
          "toolB": "limited",
          "note": "Lightspeed Retail's direct API access is on higher-tier plans"
        },
        {
          "feature": "Mobile companion app for stock tasks",
          "toolA": "limited",
          "toolB": "available",
          "note": "Clover offers a mobile app for reporting; Lightspeed Retail's mobile app is built for barcode scanning and stock counts"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Clover or Lightspeed Retail?",
      "answer": "Lightspeed Retail has clearer published pricing starting at 89 dollars per month billed annually, while Clover's software plans start around 14.95 dollars per month but require a custom quote for hardware and processing, so true cost comparison depends on the specific Clover reseller or bank offer."
    },
    {
      "question": "Is Clover or Lightspeed Retail better for a restaurant?",
      "answer": "Clover is the better documented fit for restaurants, offering dedicated Counter Service and Table Service plans, tableside handheld devices, and online ordering integration, while Lightspeed Retail's facts note it is less suited to non-retail businesses like restaurants."
    },
    {
      "question": "Can Lightspeed Retail do everything Clover does for payments and hardware variety?",
      "answer": "Not exactly. Lightspeed Retail includes its own integrated payments but runs primarily on iPad-based or browser checkout, while Clover offers a wider range of purpose-built hardware form factors including countertop, mini, handheld, and mobile devices."
    },
    {
      "question": "Which has better inventory management for retail, Clover or Lightspeed Retail?",
      "answer": "Lightspeed Retail has deeper documented retail inventory tools, including variant matrices, low-stock alerts, and dedicated purchase order and vendor management, whereas Clover's facts describe more general item, category, and stock-level tracking."
    },
    {
      "question": "Does Clover or Lightspeed Retail support multiple store locations?",
      "answer": "Lightspeed Retail explicitly documents multi-location support with stock transfers between stores and consolidated company-wide reporting, while Clover only references multi-location support at the Custom or Enterprise contact-sales tier without further detail."
    },
    {
      "question": "Which is easier to get an exact price for, Clover or Lightspeed Retail?",
      "answer": "Lightspeed Retail is easier to price upfront since its Basic, Core, and Plus plans have published monthly prices, while Clover's final cost depends on a custom quote from the reseller or partner bank handling the account."
    }
  ]
};

export default cloverVsLightspeedRetailContent;

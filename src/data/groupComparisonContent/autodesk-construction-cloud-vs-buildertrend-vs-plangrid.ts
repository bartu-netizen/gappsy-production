import type { GroupComparisonContent } from './types';

const autodeskConstructionCloudVsBuildertrendVsPlangridContent: GroupComparisonContent = {
  "verdict": "These three sit at different points of one construction-management story: PlanGrid was the original field-focused blueprint app, Autodesk bought it in 2018 and folded it into the much larger Autodesk Construction Cloud (now rebranding as Autodesk Forma), while Buildertrend grew independently as a purpose-built platform for homebuilders and remodelers. Autodesk Construction Cloud wins on BIM coordination, clash detection, and integration depth for large general contractors, Buildertrend wins on transparent pricing and homeowner-facing client communication, and PlanGrid's offline blueprint markup remains its signature strength even though it is no longer sold as a standalone product. There is no universal winner here; the right choice depends on whether you need enterprise BIM tooling, residential client management, or simply the most reliable way to mark up drawings on a job site.",
  "bestFor": {
    "autodesk-construction-cloud": "Large general contractors and enterprises that need BIM coordination, clash detection, and a 400-plus integration ecosystem spanning design through construction.",
    "buildertrend": "Residential homebuilders and remodelers that want transparent, published pricing and a strong homeowner client portal alongside job costing.",
    "plangrid": "Field crews and legacy PlanGrid users who need offline-capable blueprint markup, though new buyers are effectively evaluating Autodesk Build today."
  },
  "highlights": [
    {
      "title": "PlanGrid is now part of Autodesk Construction Cloud",
      "description": "Autodesk acquired PlanGrid for USD 875 million in 2018 and has since folded its blueprint and field-collaboration technology into Autodesk Build. PlanGrid is no longer sold as a standalone product, so buyers searching for it today are effectively evaluating Autodesk Construction Cloud (soon Autodesk Forma).",
      "toolSlugs": [
        "autodesk-construction-cloud",
        "plangrid"
      ]
    },
    {
      "title": "Buildertrend is the only one with public, published pricing",
      "description": "Buildertrend lists three flat, company-wide tiers (Essential, Advanced, Complete) starting at $339/month, while both Autodesk Construction Cloud and PlanGrid require a sales conversation for a custom quote.",
      "toolSlugs": [
        "buildertrend"
      ]
    },
    {
      "title": "Autodesk brings BIM coordination at enterprise scale",
      "description": "Autodesk Construction Cloud includes model-based clash detection, cost management, and over 400 pre-built integrations, capabilities aimed at large commercial and infrastructure projects rather than residential builds.",
      "toolSlugs": [
        "autodesk-construction-cloud"
      ]
    },
    {
      "title": "PlanGrid's offline mobile markup remains its calling card",
      "description": "PlanGrid's mobile app was built around viewing and marking up large-format drawings on a job site without connectivity, with changes syncing automatically once reconnected, a feature that carries over into Autodesk Build today.",
      "toolSlugs": [
        "plangrid"
      ]
    },
    {
      "title": "Buildertrend is built specifically for homebuilder-client relationships",
      "description": "Its selections management and client portal let homeowners choose finishes and track progress, a workflow neither Autodesk Construction Cloud nor PlanGrid is built around.",
      "toolSlugs": [
        "buildertrend"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Field and Document Management",
      "rows": [
        {
          "feature": "Blueprint markup and version control",
          "statuses": {
            "autodesk-construction-cloud": "available",
            "buildertrend": "not-documented",
            "plangrid": "available"
          },
          "note": "PlanGrid's blueprint markup capability now lives inside Autodesk Build."
        },
        {
          "feature": "RFIs, submittals and daily field reports",
          "statuses": {
            "autodesk-construction-cloud": "available",
            "buildertrend": "available",
            "plangrid": "available"
          }
        },
        {
          "feature": "Offline mobile access for job sites",
          "statuses": {
            "autodesk-construction-cloud": "not-documented",
            "buildertrend": "limited",
            "plangrid": "available"
          },
          "note": "Offline viewing and markup with auto-sync has always been PlanGrid's signature feature."
        }
      ]
    },
    {
      "group": "Financials and Client Management",
      "rows": [
        {
          "feature": "Job costing, budgeting and estimating",
          "statuses": {
            "autodesk-construction-cloud": "available",
            "buildertrend": "available",
            "plangrid": "not-documented"
          }
        },
        {
          "feature": "Client or homeowner portal",
          "statuses": {
            "autodesk-construction-cloud": "not-documented",
            "buildertrend": "available",
            "plangrid": "not-documented"
          }
        },
        {
          "feature": "Accounting integrations (QuickBooks, Xero)",
          "statuses": {
            "autodesk-construction-cloud": "not-documented",
            "buildertrend": "available",
            "plangrid": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Platform and Pricing",
      "rows": [
        {
          "feature": "BIM model coordination and clash detection",
          "statuses": {
            "autodesk-construction-cloud": "available",
            "buildertrend": "unavailable",
            "plangrid": "unavailable"
          }
        },
        {
          "feature": "Transparent, published pricing",
          "statuses": {
            "autodesk-construction-cloud": "unavailable",
            "buildertrend": "available",
            "plangrid": "unavailable"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is PlanGrid still available as a standalone product?",
      "answer": "No. Autodesk acquired PlanGrid in 2018 and has folded its blueprint and field-management technology into Autodesk Build, part of Autodesk Construction Cloud. Prospective buyers searching for PlanGrid today are effectively evaluating Autodesk Build rather than a separately purchasable PlanGrid subscription."
    },
    {
      "question": "What's the core difference between Autodesk Construction Cloud and Buildertrend?",
      "answer": "Autodesk Construction Cloud is built for large general contractors and enterprises needing BIM coordination, clash detection, and deep integration with design tools. Buildertrend is purpose-built for residential homebuilders and remodelers, emphasizing client communication, selections, and job costing rather than BIM."
    },
    {
      "question": "Which of these three has the most transparent pricing?",
      "answer": "Buildertrend is the only one with published pricing tiers (Essential, Advanced, Complete, starting at $339/month). Both Autodesk Construction Cloud and PlanGrid (now Autodesk Build) require contacting sales for a custom quote."
    },
    {
      "question": "Does Buildertrend include BIM model coordination like Autodesk Construction Cloud?",
      "answer": "No. Buildertrend's feature set covers scheduling, client communication, estimating, and job costing, but it does not offer BIM model coordination or clash detection, which are core Autodesk Construction Cloud capabilities."
    },
    {
      "question": "Is Autodesk Construction Cloud changing its name?",
      "answer": "Yes. As of March 2026, Autodesk announced that Autodesk Construction Cloud is being rebranded as Autodesk Forma, unifying construction management with Autodesk's broader design platform, while the core product functionality stays the same."
    }
  ]
};

export default autodeskConstructionCloudVsBuildertrendVsPlangridContent;

import type { ToolComparisonContent } from './types';

const _7shiftsVsHomebaseContent: ToolComparisonContent = {
  "verdict": "7shifts and Homebase both started in 2014 and both offer a free plan plus tiered paid plans, but they are built for different shaped businesses. 7shifts is purpose built around restaurant operations specifically, with tip pooling, a manager log book, and labor cost forecasting tied to POS sales data, plus compliance alerts aimed at predictive scheduling rules that affect food service. Homebase is built more broadly for hourly, shift based small businesses across restaurants, retail, salons, and gyms, bundling scheduling, time tracking, messaging, hiring, PTO management, and an add-on payroll service that runs directly off tracked hours. For a single-location restaurant that lives and dies by POS-driven labor forecasting and tip distribution, 7shifts speaks that language more directly. For an hourly-workforce business outside food service, or one that wants scheduling and payroll tracking under one login without piecing together a restaurant-specific tool, Homebase is the more natural fit. Pricing structures are close in shape, both per-location with free entry tiers, though Homebase discloses transparent pricing up through its top All-in-one tier while 7shifts moves to custom pricing at its top tier. Neither is a generic enterprise HR platform, and both gate compliance, hiring, and forecasting features behind higher-priced tiers, so the deciding factor is less about raw feature count and more about which vertical and pricing transparency fits the buyer.",
  "bestForToolA": "7shifts is the better fit for restaurants and food service operators who want tip pooling, POS-tied labor forecasting, and shift-swap tools built specifically around restaurant workflows.",
  "bestForToolB": "Homebase is the better fit for hourly, shift-based small businesses outside pure food service, such as retail, salons, and gyms, that want scheduling, time tracking, and payroll bundled under one plan.",
  "whoNeedsBoth": "A multi-concept operator running both a restaurant and a non-restaurant hourly business, such as retail alongside food service, might use 7shifts for its restaurant locations and Homebase for the rest rather than forcing one tool to cover both.",
  "keyDifferences": [
    {
      "title": "Core industry focus",
      "toolA": "7shifts is built specifically for restaurants and food service, with tip pooling and per-shift labor cost tracking baked into its core features.",
      "toolB": "Homebase targets a wider range of hourly, shift-based small businesses including restaurants, retail, salons, and gyms.",
      "whyItMatters": "A tool tuned to one vertical usually maps more directly onto that industry terminology and workflows, while a broader tool can serve operators outside food service without a mismatch.",
      "benefitsWho": "Single-industry restaurant operators benefit from 7shifts' specificity, while multi-industry or non-restaurant hourly businesses benefit from Homebase's breadth."
    },
    {
      "title": "Entry-level paid pricing",
      "toolA": "7shifts paid plans start at roughly 30 dollars per month per location on the Entree tier.",
      "toolB": "Homebase paid plans start at 24 dollars per month per location on the Essentials tier.",
      "whyItMatters": "For multi-location operators, a lower starting price per location compounds into meaningful savings as locations are added.",
      "benefitsWho": "Budget-conscious multi-location businesses benefit from Homebase's lower entry price, though feature sets at each tier differ so price alone should not be the only comparison."
    },
    {
      "title": "Top-tier pricing transparency",
      "toolA": "7shifts' top tier, The Works, is custom priced rather than publicly listed.",
      "toolB": "Homebase's top tier, All-in-one, is listed at 96 dollars per month per location.",
      "whyItMatters": "Published pricing lets buyers budget and compare without a sales call, while custom pricing usually means negotiation and less upfront certainty.",
      "benefitsWho": "Buyers who want fast, self-serve budgeting benefit from Homebase's transparent top-tier pricing."
    },
    {
      "title": "Payroll handling",
      "toolA": "7shifts offers payroll integrations and, in some markets, a payroll add-on, but is not primarily a payroll platform.",
      "toolB": "Homebase offers an integrated payroll add-on that runs directly off already-tracked hours.",
      "whyItMatters": "Businesses that want scheduling and payroll to share the same hours data with less manual re-entry benefit from tighter payroll integration.",
      "benefitsWho": "Small businesses wanting one connected system for hours and pay benefit from Homebase's approach, while restaurants already committed to a separate payroll provider may be fine with 7shifts' lighter integration."
    },
    {
      "title": "Tip management",
      "toolA": "7shifts includes Tip Pooling and Manager Log Book as a core listed feature for calculating and distributing tips by house rules.",
      "toolB": "Homebase does not list tip pooling as a core feature, and its cons note tip management as an extra-fee add-on.",
      "whyItMatters": "Tip distribution is central to restaurant labor operations, so having it built into the core plan versus paying extra changes total cost and setup complexity.",
      "benefitsWho": "Restaurants with complex tip-pooling rules benefit from 7shifts' native handling of tips."
    },
    {
      "title": "Labor cost forecasting depth",
      "toolA": "7shifts' Labor Cost Forecasting compares scheduled labor hours against POS sales data, available starting on the Gourmet tier.",
      "toolB": "Homebase's Labor Cost Management dashboards compare scheduled and actual labor hours against sales, available on the All-in-one tier.",
      "whyItMatters": "Both tie labor to sales, but each gates this behind its own higher-priced tier, so the real cost of forecasting should be compared at the tier where it unlocks, not the entry price.",
      "benefitsWho": "Operators focused on hitting labor-cost percentage targets benefit from either tool, but only once they are on the tier that includes forecasting."
    },
    {
      "title": "Named POS partners",
      "toolA": "7shifts documentation describes POS integrations generally without naming specific partners.",
      "toolB": "Homebase documentation names specific POS integrations including Square, Clover, and Toast.",
      "whyItMatters": "Confirming a specific POS partner integration before buying reduces the risk of discovering a gap after signing up.",
      "benefitsWho": "Businesses already running Square, Clover, or Toast can confirm Homebase compatibility directly, while 7shifts buyers should verify their specific POS with the vendor."
    },
    {
      "title": "Compliance and HR scope",
      "toolA": "7shifts' Compliance Alerts focus on overtime risk and predictive scheduling or fair workweek requirements.",
      "toolB": "Homebase's HR and Compliance Tools add document storage and general labor-law compliance guidance alongside PTO policy tracking.",
      "whyItMatters": "Businesses that need broader HR documentation on top of scheduling compliance may need more than overtime alerts alone.",
      "benefitsWho": "Restaurants mainly worried about overtime and predictive scheduling rules benefit from 7shifts' focused alerts, while businesses wanting basic HR document storage too benefit from Homebase's broader HR toolset."
    },
    {
      "title": "API access",
      "toolA": "7shifts is tagged with API access as part of its platform.",
      "toolB": "Homebase documentation does not list API access as a tag or feature.",
      "whyItMatters": "API availability matters for businesses wanting custom integrations beyond the built-in POS and payroll connections.",
      "benefitsWho": "Operators or developers needing custom integrations benefit from 7shifts' documented API access; this should be confirmed directly with Homebase if needed."
    }
  ],
  "featureMatrix": [
    {
      "group": "Scheduling and Shift Management",
      "rows": [
        {
          "feature": "Drag and drop schedule builder",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Shift swap requests",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Schedule templates and auto-scheduling",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Homebase documentation specifically mentions reusable templates and auto-scheduling"
        },
        {
          "feature": "Employee availability settings",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "7shifts explicitly lists employee-set availability alongside shift swaps"
        }
      ]
    },
    {
      "group": "Time Tracking",
      "rows": [
        {
          "feature": "Mobile app clock-in",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "GPS-enabled clock-in",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "POS or tablet terminal clock-in",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Overtime alerts",
          "toolA": "available",
          "toolB": "available",
          "note": "7shifts frames this under Compliance Alerts, Homebase under Time Clock and Time Tracking"
        }
      ]
    },
    {
      "group": "Team Communication",
      "rows": [
        {
          "feature": "In-app shift messaging",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Group chat and team-wide announcements",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Homebase explicitly names group chat and announcements as a feature"
        }
      ]
    },
    {
      "group": "Payroll and HR",
      "rows": [
        {
          "feature": "Payroll processing",
          "toolA": "limited",
          "toolB": "available",
          "note": "7shifts offers payroll integrations and an add-on in some markets rather than a bundled payroll service"
        },
        {
          "feature": "Paid time off request and approval",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "HR document storage and compliance guidance",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Hiring and Onboarding",
      "rows": [
        {
          "feature": "Job posting and applicant tracking",
          "toolA": "available",
          "toolB": "available",
          "note": "Gated to higher-priced tiers on both platforms"
        },
        {
          "feature": "New-hire onboarding paperwork",
          "toolA": "available",
          "toolB": "available",
          "note": "7shifts on The Works tier, Homebase on the All-in-one tier"
        }
      ]
    },
    {
      "group": "Labor Cost and Tips",
      "rows": [
        {
          "feature": "Labor cost forecasting versus sales",
          "toolA": "available",
          "toolB": "available",
          "note": "7shifts from the Gourmet tier up, Homebase on the All-in-one tier"
        },
        {
          "feature": "Labor and attendance reporting dashboards",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Built-in tip pooling and distribution",
          "toolA": "available",
          "toolB": "limited",
          "note": "Homebase treats tip management as an extra-fee add-on rather than a core listed feature"
        }
      ]
    },
    {
      "group": "POS Integrations",
      "rows": [
        {
          "feature": "POS integration for sales and labor data",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Named POS partners disclosed",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Homebase names Square, Clover, and Toast specifically"
        }
      ]
    },
    {
      "group": "Platform and Access",
      "rows": [
        {
          "feature": "iOS and Android mobile apps",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Web-based manager dashboard",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Homebase documentation focuses on mobile, POS or tablet, and web clock-in rather than a described manager web dashboard"
        },
        {
          "feature": "API access",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "7shifts is tagged with api; no equivalent tag is documented for Homebase"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, 7shifts or Homebase?",
      "answer": "Homebase's entry-level paid plan starts lower at 24 dollars per month per location on its Essentials tier, compared to 7shifts' Entree tier starting around 30 dollars per month per location, though both offer free plans for a single location and both gate their most advanced features behind higher-priced tiers."
    },
    {
      "question": "Is 7shifts or Homebase better for restaurants specifically?",
      "answer": "7shifts is built specifically around restaurant workflows like tip pooling, manager log books, and POS-tied labor forecasting, making it more purpose-fit for restaurant operations than Homebase, which serves a broader mix of hourly, shift-based businesses."
    },
    {
      "question": "Can Homebase do what 7shifts does?",
      "answer": "Homebase covers the same core scheduling, time tracking, and messaging functions as 7shifts and adds integrated payroll and broader HR tools, but it does not list a dedicated tip-pooling feature the way 7shifts does."
    },
    {
      "question": "Does either tool include payroll?",
      "answer": "Homebase offers payroll as an integrated add-on that runs directly off tracked hours, while 7shifts offers payroll integrations and, in some markets, a payroll add-on, but neither is primarily a standalone payroll platform."
    },
    {
      "question": "Which tool has a free plan?",
      "answer": "Both 7shifts and Homebase offer a free plan for a single location with a small or capped team, covering basic scheduling, time tracking, and team messaging, with more advanced features reserved for paid tiers."
    },
    {
      "question": "Which tool is easier for a non-restaurant small business to use?",
      "answer": "Homebase is designed for hourly, shift-based businesses across restaurants, retail, salons, and gyms, while 7shifts is built specifically around restaurant terminology and workflows, making Homebase the more natural fit for non-restaurant businesses."
    }
  ]
};

export default _7shiftsVsHomebaseContent;

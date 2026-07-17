import type { ToolComparisonContent } from './types';

const baserowVsGristContent: ToolComparisonContent = {
  "verdict": "Baserow and Grist are both open-source, self-hostable no-code database tools positioned as Airtable alternatives, but they emphasize different layers of the stack: Baserow bundles a Database Builder with a dedicated Application Builder for publishing front-end portals to a custom domain, plus an Automation Builder and Dashboards, while Grist centers on a spreadsheet-database hybrid with Python-syntax formulas, row/column/table-level Access rules, and portable single-file SQLite documents. Baserow's cloud is GDPR, HIPAA, and SOC 2 Type II compliant; Grist's core (grist-core) is a single OSI-approved Apache 2.0 license versus Baserow's open-core MIT-plus-paid-addon model.",
  "bestForToolA": "Baserow fits teams that want to build an actual front-end app or client portal on top of their data using its Application Builder, and that value 65+ templates and 2,000 automation credits already on the Free plan.",
  "bestForToolB": "Grist fits teams that think in spreadsheet formulas and need granular data permissions, since its Python-syntax/Excel-compatible formulas and row-, column-, and table-level Access rules suit sensitive or mixed-trust datasets.",
  "whoNeedsBoth": "A data team could use Grist's Access rules and Python-syntax formulas to model and lock down a sensitive core dataset, then use Baserow's Application Builder to publish a simplified, public-facing intake portal built from a separate, less sensitive Baserow base.",
  "keyDifferences": [
    {
      "title": "Application & Portal Building",
      "toolA": "Baserow's Application Builder lets teams build front-end apps and portals on top of their data without code, publishable to a custom domain.",
      "toolB": "Grist's facts document linked grid/card/calendar/chart views and native forms, but no dedicated front-end application or portal builder.",
      "whyItMatters": "Teams that need to expose data through a branded, standalone web app rather than just an internal spreadsheet-style view need this capability natively.",
      "benefitsWho": "Teams building customer- or partner-facing portals rather than purely internal tracking tools."
    },
    {
      "title": "Formula Language",
      "toolA": "Baserow's documented features center on automation credits and views rather than a named spreadsheet formula language.",
      "toolB": "Grist supports Python-syntax formulas in calculated columns alongside common Excel-compatible functions.",
      "whyItMatters": "Analysts who already know Python or Excel formulas can express complex calculated logic directly in Grist without learning a new automation model.",
      "benefitsWho": "Data analysts and spreadsheet power users who rely on formula-driven calculations."
    },
    {
      "title": "Data Access Rules",
      "toolA": "Baserow's role-based permissions and custom roles are limited to the Advanced ($18/user/month annual) and Enterprise tiers, with audit logs also gated there.",
      "toolB": "Grist includes row-, column-, and table-level Access rules as a named feature for controlling who can see or edit data.",
      "whyItMatters": "Organizations with mixed-trust collaborators (e.g. external guests) need granular permission control without paying for the top pricing tier.",
      "benefitsWho": "Teams managing shared datasets with varying levels of internal and external trust."
    },
    {
      "title": "Automation Credit Scaling",
      "toolA": "Baserow's Automation Builder is metered by automation credits: 2,000 on Free, 100,000 on Premium, 500,000 on Advanced, up to 2,000,000 on Enterprise.",
      "toolB": "Grist gates automations as a feature on the Business plan ($24/user/month annual, minimum 5 users) rather than metering them by credit.",
      "whyItMatters": "Heavy automation users need to understand whether cost scales by usage volume (Baserow's credits) or by plan tier and seat minimums (Grist).",
      "benefitsWho": "Ops and automation-heavy teams evaluating total cost of scaling workflow automation."
    },
    {
      "title": "Free Tier Data Limits",
      "toolA": "Baserow's Free plan includes 3,000 rows per workspace, 2GB storage, and 65+ templates.",
      "toolB": "Grist's Free plan includes 5,000 records per document, 100 AI Assistant credits as a one-time lifetime allotment, and 2 guests per document.",
      "whyItMatters": "The two free tiers cap different units (per-workspace vs per-document), which changes how far a small team can go before hitting a paywall.",
      "benefitsWho": "Small teams and solo builders evaluating how much they can accomplish before upgrading."
    }
  ],
  "featureMatrix": [
    {
      "group": "Data & Views",
      "rows": [
        {
          "feature": "Core view types (grid, kanban, gallery, calendar)",
          "toolA": "available",
          "toolB": "limited",
          "note": "Baserow documents Grid/Gallery/Kanban/Calendar/Timeline/Form/Survey; Grist documents grid/card/calendar/chart widgets only"
        },
        {
          "feature": "Timeline & Survey views",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Spreadsheet formula language (Python/Excel-style)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Application/portal builder with custom domain publishing",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Automation & AI",
      "rows": [
        {
          "feature": "Workflow automation builder (triggers, branches, conditions, loops)",
          "toolA": "available",
          "toolB": "limited",
          "note": "Grist's 'automations' feature is Business-plan only"
        },
        {
          "feature": "AI assistant on Free plan",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Baserow's Kuma AI requires a paid plan; Grist Free includes 100 lifetime AI credits"
        },
        {
          "feature": "Credit-metered automation system",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Baserow: 2,000 (Free) to 2,000,000 (Enterprise) automation credits"
        }
      ]
    },
    {
      "group": "Deployment & Access",
      "rows": [
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "available",
          "note": "Baserow via Docker/Cloudron/Railway/Elestio/Heroku/AWS; Grist via Docker Community Edition"
        },
        {
          "feature": "Formal compliance certifications (GDPR, HIPAA, SOC 2 Type II)",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Row/column/table-level access rules",
          "toolA": "limited",
          "toolB": "available",
          "note": "Baserow's role-based permissions/custom roles are Advanced/Enterprise only"
        },
        {
          "feature": "Desktop app",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Grist has desktop apps for Linux, macOS, and Windows"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Baserow or Grist offer a free self-hosted option?",
      "answer": "Both do. Baserow's MIT-licensed core can be self-hosted via Docker, Docker Compose, Helm, or one-click deploys on Cloudron, Railway, Elestio, and Heroku. Grist's Apache 2.0 grist-core powers a free, self-hostable Community Edition, and organizations under $1M in annual revenue can request free hosted activation keys."
    },
    {
      "question": "Which tool has more generous free-tier limits?",
      "answer": "It depends on what you're measuring. Baserow's Free plan allows 3,000 rows per workspace and 2GB storage; Grist's Free plan allows 5,000 records per document but only 2 guests per document and a one-time 100 AI Assistant credits (not renewing monthly)."
    },
    {
      "question": "Does either tool support writing formulas like a spreadsheet?",
      "answer": "Grist does, with Python-syntax formulas plus common Excel-compatible functions in calculated columns. Baserow's documented feature set doesn't describe an equivalent formula language, relying instead on its Automation Builder and credit system."
    },
    {
      "question": "Can I build a customer-facing web app on top of my data?",
      "answer": "Baserow's Application Builder is designed for this, letting teams build and publish front-end apps or portals to a custom domain. Grist's facts don't document a comparable application-building feature."
    },
    {
      "question": "Which tool gives stronger control over who can see or edit specific data?",
      "answer": "Grist's Access rules provide row-, column-, and table-level permissions as a standard feature. Baserow's equivalent role-based permissions and custom roles are reserved for the Advanced ($18/user/month annual) and Enterprise tiers."
    },
    {
      "question": "What AI features does each include, and at what cost?",
      "answer": "Baserow's Kuma AI assistant builds data structures and automations from natural-language descriptions, but requires a paid plan. Grist's AI Assistant is available from the Free plan (100 lifetime credits), scaling to 100 credits/month on Pro and 2,000 credits/month on Business."
    }
  ]
};

export default baserowVsGristContent;

import type { ToolComparisonContent } from './types';

const bubbleVsNocodbContent: ToolComparisonContent = {
  "verdict": "Bubble is a full visual application builder that combines a database, workflow logic, and a pixel-level frontend editor to produce complete, hosted web (and app-store) applications with no code. NocoDB is fundamentally a no-code database layer: it turns spreadsheets or an existing Postgres/MySQL database into a collaborative, view-based interface with auto-generated REST APIs, and it can be fully self-hosted for free. They overlap on 'no-code' branding but solve different problems — building an app from scratch versus operating on structured data you already have or want a spreadsheet-style front end for.",
  "bestForToolA": "Startup founders and no-code agencies building a complete, standalone web or mobile app (custom logic, user auth, app-store deployment) fit Bubble's visual page editor, workflow engine, and built-in relational database best.",
  "bestForToolB": "Teams that already run data in Postgres/MySQL, or want a free, unlimited-seat self-hosted spreadsheet-style database with Grid, Kanban, Gallery, and Calendar views, fit NocoDB's Community Edition and auto-generated REST APIs best.",
  "whoNeedsBoth": "A no-code agency could build the customer-facing application in Bubble while using NocoDB, self-hosted and connected to the same underlying Postgres database, as an internal admin/data-editing interface for the ops team.",
  "keyDifferences": [
    {
      "title": "Core Building Model",
      "toolA": "Bubble is a full visual app builder combining a drag-and-drop page editor, a built-in relational database, and a visual workflow engine for backend/frontend logic.",
      "toolB": "NocoDB turns spreadsheets or an existing SQL database into a collaborative app with Grid, Gallery, Form, Kanban, and Calendar views over the same underlying data — it is a data layer, not a page/frontend builder.",
      "whyItMatters": "Choosing the wrong category means either overpaying for app-building power you don't need or hitting a wall trying to build a custom frontend in a data tool.",
      "benefitsWho": "Founders building a full product benefit from Bubble; teams needing a fast data interface benefit from NocoDB."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Bubble prices paid plans around monthly Workload Unit allotments: Starter $29/month (175,000 Workload Units), Growth $119/month (250,000 Workload Units), Team $349/month (500,000 Workload Units).",
      "toolB": "NocoDB Cloud prices per seat: Plus $12/seat/month annual, Business $24/seat/month annual, Scale $45/seat/month annual (minimum 3 seats) — with a free, unlimited-seat self-hosted Community Edition as an alternative.",
      "whyItMatters": "Workload Unit pricing scales with app usage/complexity, while per-seat pricing scales with headcount, so cost predictability depends on which variable grows faster for a given team.",
      "benefitsWho": "Teams with heavy app logic but few users benefit from NocoDB's seat model; teams with many end users but a small build team benefit from Bubble's usage-based model."
    },
    {
      "title": "Self-Hosting",
      "toolA": "Bubble apps run only on Bubble's own infrastructure — there is no self-hosted deployment option documented.",
      "toolB": "NocoDB offers a free, self-hosted Community Edition deployable via Docker or binary installers for macOS, Linux, and Windows.",
      "whyItMatters": "Self-hosting affects data residency, long-term cost control, and vendor lock-in risk.",
      "benefitsWho": "Organizations with data-residency or infrastructure-control requirements benefit from NocoDB's self-hosting option."
    },
    {
      "title": "Database Flexibility",
      "toolA": "Bubble uses its own built-in proprietary relational database defined through custom data types and fields inside the platform.",
      "toolB": "NocoDB can point directly at an existing Postgres or MySQL database instead of migrating data into its own storage.",
      "whyItMatters": "Teams with existing production databases avoid a risky data migration if the tool can connect to what's already there.",
      "benefitsWho": "Teams with an existing SQL database benefit from NocoDB's connect-in-place model."
    },
    {
      "title": "App Store / Mobile Deployment",
      "toolA": "Bubble supports packaging and deploying apps to the iOS App Store and Google Play on eligible paid plans.",
      "toolB": "App store or native mobile deployment is not documented for NocoDB.",
      "whyItMatters": "Teams that need a native mobile presence, not just a responsive web view, need this capability from day one.",
      "benefitsWho": "Founders targeting mobile app stores benefit from Bubble's deployment path."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Building & Data",
      "rows": [
        {
          "feature": "Visual frontend/page editor",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Bubble offers drag-and-drop, pixel-level layout control"
        },
        {
          "feature": "Built-in relational database",
          "toolA": "available",
          "toolB": "available",
          "note": "NocoDB can also connect to an existing Postgres/MySQL DB instead"
        },
        {
          "feature": "Visual workflow/logic engine",
          "toolA": "available",
          "toolB": "limited",
          "note": "NocoDB offers automation runs (e.g. 100/month on free plan) rather than a full workflow engine"
        },
        {
          "feature": "Auto-generated REST APIs",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "NocoDB: every base gets REST APIs, webhooks, and an SDK"
        },
        {
          "feature": "Multiple data views (Grid/Kanban/Calendar/Gallery)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "limited",
          "toolB": "available",
          "note": "Bubble free plan lacks custom domains/production deployment; NocoDB free cloud plan capped at 1,000 records/1GB"
        },
        {
          "feature": "Free self-hosted tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "NocoDB Community Edition: unlimited records/storage/seats"
        },
        {
          "feature": "Entry paid plan price",
          "toolA": "available",
          "toolB": "available",
          "note": "Bubble Starter $29/month; NocoDB Plus $12/seat/month annual"
        },
        {
          "feature": "Enterprise/custom tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "NocoDB Enterprise adds SCIM, SSO, air-gapped installation"
        }
      ]
    },
    {
      "group": "Access Control & Integrations",
      "rows": [
        {
          "feature": "User authentication for end users",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Bubble: native sign-up, login, roles, permissions"
        },
        {
          "feature": "Role-based access control",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "NocoDB: five user roles"
        },
        {
          "feature": "Plugin/integration marketplace",
          "toolA": "available",
          "toolB": "available",
          "note": "Bubble plugin/template marketplace; NocoDB App Store (Slack, Discord, AWS SES/S3, SMTP)"
        },
        {
          "feature": "App store (iOS/Android) deployment",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Bubble on eligible paid plans"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can Bubble connect to an existing database the way NocoDB does?",
      "answer": "Bubble's documented data approach is its own built-in relational database plus an API Connector for external REST APIs; connecting directly to an existing SQL database as NocoDB does is not documented as a Bubble feature."
    },
    {
      "question": "Is NocoDB a full app builder like Bubble?",
      "answer": "No. NocoDB is primarily a spreadsheet-style interface over data — Grid, Gallery, Form, Kanban, and Calendar views plus auto-generated APIs — rather than a visual frontend/page builder."
    },
    {
      "question": "Which is cheaper for a solo builder to start with?",
      "answer": "NocoDB's self-hosted Community Edition is free with unlimited records, storage, and seats. Bubble's free plan exists for learning and prototyping but doesn't support custom domains or production deployment, so a real launch requires the $29/month Starter plan."
    },
    {
      "question": "Does either tool support building a mobile app?",
      "answer": "Bubble supports packaging and deploying apps to the iOS App Store and Google Play on eligible paid plans. Mobile or app store deployment is not documented for NocoDB."
    },
    {
      "question": "Do both tools offer a free plan?",
      "answer": "Yes. Bubble's free plan is limited to learning/prototyping with no custom domain or production deployment. NocoDB offers both a free cloud plan (1,000 records, 1GB storage) and a fully free, unlimited self-hosted Community Edition."
    },
    {
      "question": "Which one is self-hostable?",
      "answer": "NocoDB has a documented free self-hosted Community Edition via Docker or binary installers. Bubble does not document a self-hosting option — apps run on Bubble's own infrastructure."
    }
  ]
};

export default bubbleVsNocodbContent;

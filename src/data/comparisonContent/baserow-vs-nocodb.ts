import type { ToolComparisonContent } from './types';

const baserowVsNocodbContent: ToolComparisonContent = {
  "verdict": "Baserow and NocoDB are both open-core, self-hostable no-code database platforms positioned as Airtable alternatives, but they diverge on licensing and core capability. Baserow's core is MIT-licensed and adds a dedicated Application Builder and Automation Builder for turning data into front-end apps and workflows. NocoDB can connect directly to an existing Postgres or MySQL database instead of migrating data, but its self-hosted Community Edition moved from AGPLv3 to the source-available Sustainable Use License, which drew criticism from parts of the self-hosting community.",
  "bestForToolA": "Baserow fits teams that want a genuinely MIT-licensed open-source core plus built-in application and automation builders to turn spreadsheet data into front-end apps and workflows without separate tools.",
  "bestForToolB": "NocoDB fits teams with an existing Postgres or MySQL database who want a spreadsheet-style interface layered directly on top of it without migrating data, or who want an unlimited-record self-hosted Community Edition.",
  "whoNeedsBoth": "A team could use NocoDB to expose an existing production Postgres database as a spreadsheet-style interface for non-technical staff, while using Baserow separately to build a new internal application and automation workflow that doesn't need to live inside that production database — the two solve different problems (retrofitting access to existing data vs. building new no-code apps).",
  "keyDifferences": [
    {
      "title": "Self-Hosted License",
      "toolA": "Baserow's core is released under the MIT license, with premium/enterprise features offered as a separate source-available open-core add-on.",
      "toolB": "NocoDB's self-hosted Community Edition moved from AGPLv3 to the Sustainable Use License, a source-available (not OSI-approved open-source) license, which drew criticism from parts of the self-hosting community.",
      "whyItMatters": "License choice affects what self-hosters can legally build, modify, and redistribute.",
      "benefitsWho": "Open-source purists and self-hosters who care about OSI-approved licensing."
    },
    {
      "title": "Connecting to Existing Databases",
      "toolA": "No equivalent feature is documented; Baserow stores data in its own database rather than connecting to an existing one.",
      "toolB": "NocoDB can point directly at an existing Postgres or MySQL database instead of migrating data into its own storage.",
      "whyItMatters": "Connecting to a live database avoids data-migration risk and keeps a single source of truth.",
      "benefitsWho": "Teams that already run production Postgres or MySQL databases and want a no-code layer on top."
    },
    {
      "title": "Application & Automation Builders",
      "toolA": "Baserow includes a dedicated Application Builder (publishable front-end apps/portals on custom domains) and an Automation Builder with triggers, branches, conditions, and loops.",
      "toolB": "No equivalent app-builder or branching-automation-builder feature is documented; NocoDB's automation is limited to counted 'automation runs' per plan.",
      "whyItMatters": "A dedicated app builder lets non-developers ship internal tools without a separate front-end framework.",
      "benefitsWho": "Ops and internal-tools teams building lightweight apps directly on top of their data."
    },
    {
      "title": "Free Tier Depth",
      "toolA": "Baserow's Free plan includes 3,000 rows per workspace, 2GB storage, 2,000 automation credits, 500 external app users, and 65+ templates.",
      "toolB": "NocoDB's Free (Cloud) plan includes 3 editor seats, 10 commenter seats, 1,000 records, 1GB storage, 100 automation runs, and 1,000 API calls/month.",
      "whyItMatters": "Baserow's cloud free tier is workspace-capped rather than seat-capped, while NocoDB's cloud free tier caps both seats and records more tightly.",
      "benefitsWho": "Small teams deciding which free tier fits their expected usage pattern."
    },
    {
      "title": "Self-Hosted Record Limits",
      "toolA": "Baserow doesn't list a distinct self-hosted-only pricing tier; its Free plan's 3,000-rows-per-workspace cap applies regardless of hosting, with Enterprise scaling to 1,000,000 rows.",
      "toolB": "NocoDB's self-hosted Community Edition offers unlimited records, storage, and seats, but caps to 6 views.",
      "whyItMatters": "Unlimited self-hosted records let teams scale without hitting a plan ceiling once they're managing their own infrastructure.",
      "benefitsWho": "Teams self-hosting at scale who don't want to pay per-record limits."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Database Features",
      "rows": [
        {
          "feature": "Multiple views (Grid/Gallery/Kanban/Calendar/Form)",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Connect to existing Postgres/MySQL database",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Auto-generated REST APIs per base",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "NocoDB: REST APIs, webhooks, and an SDK on every base."
        },
        {
          "feature": "Role-based access control",
          "toolA": "limited",
          "toolB": "available",
          "note": "Baserow: custom roles limited to Advanced/Enterprise tiers. NocoDB: 5 built-in roles."
        }
      ]
    },
    {
      "group": "No-Code Builders",
      "rows": [
        {
          "feature": "Front-end Application Builder",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Automation Builder (triggers/branches/conditions)",
          "toolA": "available",
          "toolB": "limited",
          "note": "NocoDB counts 'automation runs' per plan but doesn't document a branching automation builder."
        },
        {
          "feature": "AI assistant (natural-language generation)",
          "toolA": "available",
          "toolB": "available",
          "note": "Baserow: Kuma AI (paid). NocoDB: AI on Business/Scale tiers."
        },
        {
          "feature": "Chart-based dashboards",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Licensing & Self-Hosting",
      "rows": [
        {
          "feature": "MIT-licensed core",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "NocoDB moved to the Sustainable Use License."
        },
        {
          "feature": "Free self-hosted edition",
          "toolA": "available",
          "toolB": "available",
          "note": "NocoDB's Community Self-Hosted plan offers unlimited records/seats but 6 views."
        },
        {
          "feature": "SAML SSO",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "NocoDB: Business (Cloud) plan and above."
        },
        {
          "feature": "Air-gapped installation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "NocoDB: Enterprise (Cloud) plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool can connect directly to an existing database instead of migrating data?",
      "answer": "NocoDB, which can point at an existing Postgres or MySQL database rather than requiring data import."
    },
    {
      "question": "Is Baserow's self-hosted version fully open source?",
      "answer": "Yes, its core is released under the MIT license, though premium and enterprise features are offered as a separate source-available open-core add-on."
    },
    {
      "question": "What license does NocoDB's self-hosted edition use?",
      "answer": "The Sustainable Use License, a source-available license, after the project moved away from AGPLv3 — this is not an OSI-approved open-source license."
    },
    {
      "question": "Does either tool include an AI assistant?",
      "answer": "Yes. Baserow's Kuma AI assistant (available on paid plans) can generate data structures and automations from natural-language descriptions, and NocoDB offers single- and multi-provider AI options on its Business and Scale plans."
    },
    {
      "question": "Which tool has an application builder for front-end apps?",
      "answer": "Baserow, via its dedicated Application Builder, which publishes front-end apps and portals to a custom domain."
    },
    {
      "question": "What are the starting prices for each tool?",
      "answer": "Baserow starts at $10/user/month billed annually; NocoDB starts at $12/user/month billed annually. Both also offer unlimited-seat, self-hosted free options — Baserow through flexible self-hosting, NocoDB through its Community Self-Hosted plan."
    }
  ]
};

export default baserowVsNocodbContent;

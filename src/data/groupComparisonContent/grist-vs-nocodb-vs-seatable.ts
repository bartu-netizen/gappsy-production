import type { GroupComparisonContent } from './types';

const gristVsNocodbVsSeatableContent: GroupComparisonContent = {
  "verdict": "Grist, NocoDB, and SeaTable all compete as open, self-hostable alternatives to Airtable, but each leans on a different core differentiator. NocoDB stands apart by connecting directly to an existing production SQL database rather than requiring a data migration, Grist pairs a familiar spreadsheet grid with real Python-based formulas and cell-level access control, and SeaTable leans hardest into GDPR-friendly positioning with cloud data hosted exclusively in Germany. Grist and NocoDB both ship genuinely free, unlimited self-hosted cores, while SeaTable's self-hosting option is a paid on-premises license.",
  "bestFor": {
    "grist": "Teams that want spreadsheet-familiar editing backed by a real relational data model, Python-based formulas, and cell-level permissions, with the option to self-host a fully open-source Apache-licensed core for free.",
    "nocodb": "Developers and teams who want to turn an existing production MySQL, Postgres, or SQL Server database into a no-code spreadsheet interface without migrating data into a separate silo.",
    "seatable": "European organizations with strict GDPR or data-residency requirements that want cloud data stored exclusively in German data centers, plus Python scripting for advanced customization."
  },
  "highlights": [
    {
      "title": "NocoDB connects to databases you already run",
      "description": "Unlike most no-code database tools, NocoDB turns an existing MySQL, Postgres, or SQL Server database into a smart spreadsheet interface instead of requiring data to live in a proprietary datastore.",
      "toolSlugs": [
        "nocodb"
      ]
    },
    {
      "title": "Grist pairs a spreadsheet feel with real Python formulas and cell-level control",
      "description": "Grist formulas are written in real Python rather than a proprietary formula language, and permissions can be restricted down to specific rows, columns, or individual cells.",
      "toolSlugs": [
        "grist"
      ]
    },
    {
      "title": "SeaTable leads on European data residency",
      "description": "SeaTable Cloud data is stored exclusively in German data centers, a positioning built specifically around GDPR and data-sovereignty requirements.",
      "toolSlugs": [
        "seatable"
      ]
    },
    {
      "title": "Free self-hosted cores differ in what 'free' means",
      "description": "Grist's Community Edition and NocoDB's Community edition are both free, open-source, and unlimited in records, storage, and seats when self-hosted. SeaTable's self-hosted Server option is instead a paid on-premises license tiered by user count.",
      "toolSlugs": [
        "grist",
        "nocodb",
        "seatable"
      ]
    },
    {
      "title": "Cloud free-tier limits vary widely",
      "description": "Grist's cloud Free plan allows up to 5,000 records per document, SeaTable's free plan allows up to 25 users with 10,000 rows, and NocoDB's Cloud Free plan is capped at 1,000 records.",
      "toolSlugs": [
        "grist",
        "nocodb",
        "seatable"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Self-Hosting and Licensing",
      "rows": [
        {
          "feature": "Free self-hosted core with unlimited records and seats",
          "statuses": {
            "grist": "available",
            "nocodb": "available",
            "seatable": "limited"
          },
          "note": "SeaTable's on-premises Server licenses are paid and tiered by organization size, unlike Grist's Apache 2.0 core and NocoDB's fair-code Community edition."
        },
        {
          "feature": "Generous cloud free-tier record allowance",
          "statuses": {
            "grist": "available",
            "nocodb": "limited",
            "seatable": "available"
          },
          "note": "Grist's cloud Free plan allows 5,000 records per document and SeaTable's allows 10,000 rows across up to 25 users; NocoDB's Cloud Free plan is capped at 1,000 records."
        }
      ]
    },
    {
      "group": "Data Model and Customization",
      "rows": [
        {
          "feature": "Connects directly to an existing external SQL database",
          "statuses": {
            "grist": "not-documented",
            "nocodb": "available",
            "seatable": "not-documented"
          }
        },
        {
          "feature": "Code-based formulas or scripting",
          "statuses": {
            "grist": "available",
            "nocodb": "not-documented",
            "seatable": "available"
          },
          "note": "Grist uses real Python-based formulas; SeaTable supports Python scripting extensions."
        },
        {
          "feature": "Cell- or row-level granular access control",
          "statuses": {
            "grist": "available",
            "nocodb": "limited",
            "seatable": "not-documented"
          },
          "note": "Grist supports permissions down to individual cells; NocoDB documents row-level security on higher paid tiers."
        }
      ]
    },
    {
      "group": "Views and AI",
      "rows": [
        {
          "feature": "Multiple view types (grid, kanban, calendar, gallery, gantt, etc.)",
          "statuses": {
            "grist": "available",
            "nocodb": "available",
            "seatable": "limited"
          },
          "note": "SeaTable documents 'views and forms' generically without enumerating specific view types the way Grist and NocoDB do."
        },
        {
          "feature": "Built-in AI assistant",
          "statuses": {
            "grist": "available",
            "nocodb": "not-documented",
            "seatable": "available"
          },
          "note": "Grist's AI Assistant helps write formulas and build views; SeaTable meters AI features through monthly AI credits."
        }
      ]
    },
    {
      "group": "Enterprise Access",
      "rows": [
        {
          "feature": "SSO/SAML for enterprise access",
          "statuses": {
            "grist": "available",
            "nocodb": "available",
            "seatable": "available"
          },
          "note": "Grist and SeaTable document SAML SSO on their Enterprise tiers; NocoDB documents SAML SSO starting on its Cloud Business plan."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is truly free to self-host without limits?",
      "answer": "Grist's Community Edition and NocoDB's Community edition are both free, open-source, and unlimited in records, storage, and seats when self-hosted. SeaTable's self-hosting option is instead a paid on-premises Server license tiered by user count."
    },
    {
      "question": "Can I connect these tools to a database I already have?",
      "answer": "NocoDB is built specifically for this: it turns an existing production MySQL, Postgres, or SQL Server database into a spreadsheet-style interface without requiring migration. Grist and SeaTable are not documented as connecting to external SQL databases as their primary data source."
    },
    {
      "question": "Which has the largest cloud free tier?",
      "answer": "Grist's cloud Free plan allows up to 5,000 records per document and SeaTable's free plan allows up to 25 users with 10,000 rows and 2 GB storage. NocoDB's Cloud Free plan is more limited at 1,000 records and 1 GB storage."
    },
    {
      "question": "Which is best for GDPR or European data residency requirements?",
      "answer": "SeaTable is built specifically around this, storing SeaTable Cloud data exclusively in German data centers. Grist and NocoDB can address data residency through self-hosting on infrastructure the customer controls."
    },
    {
      "question": "Do all three support formulas or scripting?",
      "answer": "Grist uses real Python-based formulas directly in the spreadsheet grid, and SeaTable supports Python scripting extensions for advanced customization. NocoDB's documented features center on automations and scripting for workflows rather than Python-based formulas."
    },
    {
      "question": "Which tool has a built-in AI assistant?",
      "answer": "Grist includes an AI Assistant that helps write formulas, clean data, or build new views from natural-language prompts. SeaTable meters AI-assisted features through a monthly AI credit allowance. AI features are not documented for NocoDB."
    }
  ]
};

export default gristVsNocodbVsSeatableContent;

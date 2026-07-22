import type { GroupComparisonContent } from './types';

const appsmithVsGristVsNocodbContent: GroupComparisonContent = {
  "verdict": "Appsmith, Grist, and NocoDB are all open-source, self-hostable no-code platforms, but they solve different problems. Appsmith is a low-code app builder for assembling custom internal tools and dashboards from databases and APIs with a JavaScript escape hatch, while Grist and NocoDB are closer to Airtable-style spreadsheet-databases. Grist embeds a genuine relational data model with Python formulas beneath a spreadsheet interface, and NocoDB instead layers a spreadsheet UI directly on top of an existing production SQL database without requiring data migration.",
  "bestFor": {
    "appsmith": "Engineering and IT teams building custom internal admin panels and dashboards on top of existing databases and APIs",
    "grist": "Teams that want a spreadsheet-like editing experience backed by a real relational data model and Python-based formulas",
    "nocodb": "Teams that want a no-code interface layered directly on top of an existing production SQL database without migrating data"
  },
  "highlights": [
    {
      "title": "Free, self-hosted open-source core on all three",
      "description": "Each tool ships a genuinely free community edition that can be self-hosted with no artificial feature caps for basic use.",
      "toolSlugs": [
        "appsmith",
        "grist",
        "nocodb"
      ]
    },
    {
      "title": "Full custom app builder with code escape hatches",
      "description": "Appsmith provides a drag-and-drop UI builder plus a JavaScript layer for logic that goes beyond what a spreadsheet-style tool can express.",
      "toolSlugs": [
        "appsmith"
      ]
    },
    {
      "title": "Real relational data model with Python formulas",
      "description": "Grist keeps a familiar spreadsheet grid on the surface while enforcing data types and relationships underneath, with formulas written in real Python.",
      "toolSlugs": [
        "grist"
      ]
    },
    {
      "title": "Connects directly to existing production databases",
      "description": "NocoDB turns an existing MySQL, Postgres, or SQL Server database into a spreadsheet-style interface without requiring the data to move.",
      "toolSlugs": [
        "nocodb"
      ]
    },
    {
      "title": "Granular access control",
      "description": "Grist restricts permissions down to individual rows, columns, or cells, and NocoDB adds row-level security on paid tiers.",
      "toolSlugs": [
        "grist",
        "nocodb"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Data Model",
      "rows": [
        {
          "feature": "Full drag-and-drop app or UI builder for custom internal tools",
          "statuses": {
            "appsmith": "available",
            "grist": "limited",
            "nocodb": "limited"
          },
          "note": "Grist and NocoDB support page layouts and dashboards over their data, but neither is a general-purpose app builder like Appsmith."
        },
        {
          "feature": "Connects directly to an existing production SQL database",
          "statuses": {
            "appsmith": "available",
            "grist": "not-documented",
            "nocodb": "available"
          },
          "note": "Appsmith connects to databases as a data source for app building; NocoDB's core differentiator is turning an existing database into its interface without migration."
        }
      ]
    },
    {
      "group": "Customization",
      "rows": [
        {
          "feature": "Custom scripting or formula language beyond the visual builder",
          "statuses": {
            "appsmith": "available",
            "grist": "available",
            "nocodb": "available"
          },
          "note": "Appsmith uses JavaScript, Grist uses real Python formulas, and NocoDB supports automations and scripting."
        },
        {
          "feature": "AI-assisted features",
          "statuses": {
            "appsmith": "available",
            "grist": "available",
            "nocodb": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Self-Hosting and Access Control",
      "rows": [
        {
          "feature": "Free, open-source self-hosted core",
          "statuses": {
            "appsmith": "available",
            "grist": "available",
            "nocodb": "available"
          }
        },
        {
          "feature": "Row or cell-level access control",
          "statuses": {
            "appsmith": "not-documented",
            "grist": "available",
            "nocodb": "available"
          },
          "note": "Grist restricts access down to the cell level; NocoDB adds row-level security on its Cloud Scale tier."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is best for building a custom internal admin panel?",
      "answer": "Appsmith, which provides a drag-and-drop UI builder plus JavaScript customization for logic that a spreadsheet-database tool can't express."
    },
    {
      "question": "Which is closest to a spreadsheet replacement?",
      "answer": "Grist, which keeps a familiar grid editing experience while enforcing a real relational data model and offering Python-based formulas underneath."
    },
    {
      "question": "Which tool works directly on top of an existing database without migrating data?",
      "answer": "NocoDB, whose core differentiator is turning an existing MySQL, Postgres, or SQL Server database into a spreadsheet-style interface in place."
    },
    {
      "question": "Are all three free to self-host?",
      "answer": "Yes, all three publish a free, open-source community edition that can be self-hosted without per-user licensing costs."
    },
    {
      "question": "Which offers the most granular access control?",
      "answer": "Grist, which can restrict permissions down to specific rows, columns, or individual cells; NocoDB offers row-level security on its higher-priced Cloud Scale tier."
    },
    {
      "question": "Which tools use Python, and which use JavaScript?",
      "answer": "Grist's formulas are written in real Python. Appsmith relies on JavaScript for custom logic in its app builder. NocoDB supports automations and scripting without documenting Python specifically as its scripting language."
    }
  ]
};

export default appsmithVsGristVsNocodbContent;

import type { GroupComparisonContent } from './types';

const baserowVsGristVsNocodbContent: GroupComparisonContent = {
  "verdict": "Baserow, Grist, and NocoDB are all open-source, self-hostable Airtable alternatives that pair a spreadsheet-style interface with real database structure underneath. Baserow stays closest to a classic Airtable experience with an added AI field type, Grist differentiates through Python-based formulas and cell-level permissions, and NocoDB stands apart by connecting directly to an existing production SQL database instead of requiring data to be recreated inside it.",
  "bestFor": {
    "baserow": "Teams wanting an Airtable-like interface with an open-source, self-hostable core and a built-in AI field type",
    "grist": "Teams wanting a real relational data model with Python-based formulas and granular cell-level permissions",
    "nocodb": "Teams that want a spreadsheet interface wrapped directly around an existing production SQL database"
  },
  "highlights": [
    {
      "title": "Free, self-hosted open-source core on all three",
      "description": "Each platform ships a genuinely free, self-hostable community edition, so teams can run any of them without per-user licensing costs.",
      "toolSlugs": [
        "baserow",
        "grist",
        "nocodb"
      ]
    },
    {
      "title": "AI field type built into tables",
      "description": "Baserow lets users generate or analyze data with AI models directly inside a table field, without a separate AI tool.",
      "toolSlugs": [
        "baserow"
      ]
    },
    {
      "title": "Python-based formulas",
      "description": "Grist formulas are written in real Python rather than a proprietary spreadsheet language, giving more powerful and transparent logic.",
      "toolSlugs": [
        "grist"
      ]
    },
    {
      "title": "Connects directly to existing SQL databases",
      "description": "NocoDB turns an existing MySQL, Postgres, or SQL Server database into a smart spreadsheet interface without requiring a data migration.",
      "toolSlugs": [
        "nocodb"
      ]
    },
    {
      "title": "Multiple views over the same data",
      "description": "All three support grid, gallery, kanban, and calendar-style views so teams can work with the same underlying data in different layouts.",
      "toolSlugs": [
        "baserow",
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
          "feature": "Multiple view types (grid, gallery, kanban, calendar)",
          "statuses": {
            "baserow": "available",
            "grist": "available",
            "nocodb": "available"
          }
        },
        {
          "feature": "Connects directly to an existing production SQL database",
          "statuses": {
            "baserow": "not-documented",
            "grist": "not-documented",
            "nocodb": "available"
          }
        }
      ]
    },
    {
      "group": "Automation and AI",
      "rows": [
        {
          "feature": "AI-powered field or assistant features",
          "statuses": {
            "baserow": "available",
            "grist": "available",
            "nocodb": "not-documented"
          }
        },
        {
          "feature": "No-code automation builder",
          "statuses": {
            "baserow": "available",
            "grist": "available",
            "nocodb": "available"
          }
        }
      ]
    },
    {
      "group": "Access Control and Integration",
      "rows": [
        {
          "feature": "Row or cell-level permissions",
          "statuses": {
            "baserow": "available",
            "grist": "available",
            "nocodb": "available"
          },
          "note": "Grist restricts access down to the cell level; Baserow and NocoDB offer row-level or advanced permissions on paid tiers."
        },
        {
          "feature": "REST API and webhooks",
          "statuses": {
            "baserow": "available",
            "grist": "available",
            "nocodb": "available"
          }
        }
      ]
    },
    {
      "group": "Self-Hosting",
      "rows": [
        {
          "feature": "Free, open-source self-hosted core",
          "statuses": {
            "baserow": "available",
            "grist": "available",
            "nocodb": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is closest to Airtable in look and feel?",
      "answer": "Baserow, which is explicitly positioned as an open-source alternative to Airtable with a familiar spreadsheet-like interface over a relational database backend."
    },
    {
      "question": "Which tool connects directly to an existing SQL database without migrating data?",
      "answer": "NocoDB, whose core differentiator is turning an existing MySQL, Postgres, or SQL Server database into a spreadsheet-style interface in place."
    },
    {
      "question": "Which one uses real Python for formulas?",
      "answer": "Grist, whose formulas are written in real Python rather than a proprietary spreadsheet formula language."
    },
    {
      "question": "Are all three free to self-host?",
      "answer": "Yes, Baserow, Grist, and NocoDB each publish a free, open-source community edition that can be self-hosted."
    },
    {
      "question": "Which has AI features on its free tier?",
      "answer": "Baserow includes an AI field type, and Grist's free cloud plan includes a lifetime allotment of 100 AI Assistant credits; NocoDB does not document AI features on its free tier."
    },
    {
      "question": "Which offers the most granular data permissions?",
      "answer": "Grist offers cell-level access control, while Baserow and NocoDB provide row-level or advanced permissions primarily on their paid tiers."
    }
  ]
};

export default baserowVsGristVsNocodbContent;

import type { GroupComparisonContent } from './types';

const baserowVsGristVsSeatableContent: GroupComparisonContent = {
  "verdict": "Baserow, Grist, and SeaTable are all Airtable-style spreadsheet-databases with self-hosting options, but each leans on a different differentiator. Baserow pairs an Airtable-like interface with a fully open-source self-hosted core and an AI field type, Grist adds Python-based formulas and cell-level permissions on top of a similarly open-source foundation, and SeaTable instead emphasizes Germany-hosted, GDPR-conscious cloud data and a notably generous 25-user free tier, though its self-hosted option is a paid license rather than free open source.",
  "bestFor": {
    "baserow": "Teams wanting Airtable-like UX with a free, open-source self-hosted core and a built-in AI field type",
    "grist": "Teams wanting Python-based formulas and cell-level access control under a familiar spreadsheet interface",
    "seatable": "European teams that need GDPR-conscious, Germany-hosted cloud data along with a generous free tier for small groups"
  },
  "highlights": [
    {
      "title": "Free, open-source self-hosting",
      "description": "Baserow and Grist both publish free, open-source community editions for self-hosting; SeaTable's self-hosted server option is a paid license instead.",
      "toolSlugs": [
        "baserow",
        "grist"
      ]
    },
    {
      "title": "AI field type built into tables",
      "description": "Baserow lets users generate or analyze data with AI models directly inside a table field.",
      "toolSlugs": [
        "baserow"
      ]
    },
    {
      "title": "Python-based formulas",
      "description": "Grist formulas are written in real Python rather than a proprietary spreadsheet language, enabling more transparent and powerful logic.",
      "toolSlugs": [
        "grist"
      ]
    },
    {
      "title": "Germany-hosted, GDPR-focused cloud",
      "description": "SeaTable Cloud data is stored exclusively in German data centers, a positioning aimed at GDPR-conscious European buyers.",
      "toolSlugs": [
        "seatable"
      ]
    },
    {
      "title": "Generous free-tier user count",
      "description": "SeaTable's free plan supports up to 25 users at no cost, more generous on user count than Baserow's or Grist's free tiers.",
      "toolSlugs": [
        "seatable"
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
            "seatable": "not-documented"
          },
          "note": "SeaTable supports custom views and forms but its published feature list does not explicitly enumerate the same view-type set as Baserow and Grist."
        },
        {
          "feature": "Python-based formulas or scripting",
          "statuses": {
            "baserow": "not-documented",
            "grist": "available",
            "seatable": "available"
          }
        }
      ]
    },
    {
      "group": "Hosting and Compliance",
      "rows": [
        {
          "feature": "Free, open-source self-hosted core",
          "statuses": {
            "baserow": "available",
            "grist": "available",
            "seatable": "unavailable"
          },
          "note": "SeaTable's on-premises server licenses are paid by user tier, not a free open-source release like Baserow's or Grist's."
        },
        {
          "feature": "Region-specific data residency (Germany-hosted cloud)",
          "statuses": {
            "baserow": "not-documented",
            "grist": "not-documented",
            "seatable": "available"
          }
        }
      ]
    },
    {
      "group": "Automation and AI",
      "rows": [
        {
          "feature": "AI-assisted features",
          "statuses": {
            "baserow": "available",
            "grist": "available",
            "seatable": "available"
          }
        },
        {
          "feature": "No-code automation builder",
          "statuses": {
            "baserow": "available",
            "grist": "available",
            "seatable": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is closest to Airtable in look and feel?",
      "answer": "Baserow, which is explicitly positioned as an open-source alternative to Airtable with a familiar spreadsheet-like interface over a relational database."
    },
    {
      "question": "Which is most GDPR-friendly for European teams?",
      "answer": "SeaTable, whose cloud data is stored exclusively in German data centers and which markets itself directly at GDPR-conscious European buyers."
    },
    {
      "question": "Are all three genuinely free and open source to self-host?",
      "answer": "Baserow and Grist both publish free, open-source community editions for self-hosting. SeaTable's self-hosted option is a paid on-premises server license rather than a free open-source release."
    },
    {
      "question": "Which offers the largest free tier for a small team?",
      "answer": "SeaTable, whose free cloud plan supports up to 25 users at no cost, more generous on user count than either Baserow's or Grist's free tiers."
    },
    {
      "question": "Which tools use Python?",
      "answer": "Grist's formulas are written in real Python, and SeaTable supports Python scripting extensions. Baserow does not document Python as part of its no-code interface."
    },
    {
      "question": "Which has AI features built into the product?",
      "answer": "Baserow includes an AI field type, Grist includes an AI Assistant with a free lifetime credit allotment, and SeaTable meters AI use through monthly AI credits scaled by plan."
    }
  ]
};

export default baserowVsGristVsSeatableContent;

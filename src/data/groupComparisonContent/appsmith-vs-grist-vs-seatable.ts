import type { GroupComparisonContent } from './types';

const appsmithVsGristVsSeatableContent: GroupComparisonContent = {
  "verdict": "Appsmith, Grist, and SeaTable are all no-code or low-code platforms with self-hosting options, but they target different needs. Appsmith is a low-code app builder for custom internal tools and dashboards, while Grist and SeaTable are closer to Airtable-style spreadsheet-databases. Grist differentiates through Python-based formulas and a self-funded, privacy-first company culture, and SeaTable differentiates through Germany-hosted cloud data aimed at GDPR-conscious European buyers plus a generous 25-user free tier.",
  "bestFor": {
    "appsmith": "Engineering and IT teams building custom internal admin panels and dashboards on top of existing databases and APIs",
    "grist": "Teams that want a real relational data model with Python-based formulas and a fully open-source self-hosting option",
    "seatable": "European teams that need GDPR-conscious, Germany-hosted cloud data along with a generous free tier for small groups"
  },
  "highlights": [
    {
      "title": "Full custom app builder with code escape hatches",
      "description": "Appsmith provides a drag-and-drop UI builder plus JavaScript customization for building complete internal applications, not just data views.",
      "toolSlugs": [
        "appsmith"
      ]
    },
    {
      "title": "Python-based formulas",
      "description": "Grist formulas are written in real Python rather than a proprietary spreadsheet language, and its core engine is fully open source.",
      "toolSlugs": [
        "grist"
      ]
    },
    {
      "title": "Germany-hosted, GDPR-focused cloud",
      "description": "SeaTable Cloud data is stored exclusively in German data centers, a positioning aimed squarely at European buyers with data-residency requirements.",
      "toolSlugs": [
        "seatable"
      ]
    },
    {
      "title": "Generous free tier for small teams",
      "description": "SeaTable's free plan supports up to 25 users at no cost, more generous on user count than either Appsmith's or Grist's free tiers.",
      "toolSlugs": [
        "seatable"
      ]
    },
    {
      "title": "Self-hosting across all three",
      "description": "Every tool offers a self-hosted deployment path, though only Appsmith and Grist provide a free, fully open-source self-hosted core.",
      "toolSlugs": [
        "appsmith",
        "grist",
        "seatable"
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
            "seatable": "limited"
          },
          "note": "Grist and SeaTable support custom views and page layouts over their data but are not general-purpose app builders like Appsmith."
        },
        {
          "feature": "Python-based formulas or scripting",
          "statuses": {
            "appsmith": "unavailable",
            "grist": "available",
            "seatable": "available"
          },
          "note": "Appsmith's custom logic layer is JavaScript, not Python; Grist's formula language is Python and SeaTable supports Python scripting extensions."
        }
      ]
    },
    {
      "group": "Hosting and Compliance",
      "rows": [
        {
          "feature": "Free, open-source self-hosted core",
          "statuses": {
            "appsmith": "available",
            "grist": "available",
            "seatable": "unavailable"
          },
          "note": "SeaTable's on-premises server option is a paid license by user-tier, not a free open-source community edition like Appsmith's or Grist's."
        },
        {
          "feature": "Region-specific data residency (Germany-hosted cloud)",
          "statuses": {
            "appsmith": "not-documented",
            "grist": "not-documented",
            "seatable": "available"
          }
        }
      ]
    },
    {
      "group": "Access and AI",
      "rows": [
        {
          "feature": "AI-assisted features",
          "statuses": {
            "appsmith": "available",
            "grist": "available",
            "seatable": "available"
          },
          "note": "SeaTable meters AI use through monthly AI credits that scale with plan tier."
        },
        {
          "feature": "Cell or row-level access control",
          "statuses": {
            "appsmith": "not-documented",
            "grist": "available",
            "seatable": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is best for building a custom internal admin panel?",
      "answer": "Appsmith, which provides a drag-and-drop UI builder plus JavaScript customization, unlike the more data-view-focused Grist and SeaTable."
    },
    {
      "question": "Which is most GDPR-friendly for European teams?",
      "answer": "SeaTable, whose cloud data is stored exclusively in German data centers and which markets itself directly at GDPR-conscious European buyers."
    },
    {
      "question": "Are all three genuinely free and open source to self-host?",
      "answer": "Appsmith and Grist both publish free, open-source community editions for self-hosting. SeaTable's self-hosted option is a paid on-premises server license rather than a free open-source release."
    },
    {
      "question": "Which offers the largest free tier for a small team?",
      "answer": "SeaTable, whose free cloud plan supports up to 25 users at no cost, more generous on user count than Appsmith's or Grist's free tiers."
    },
    {
      "question": "Which tools use Python?",
      "answer": "Grist's formulas are written in real Python, and SeaTable supports Python scripting extensions for advanced customization. Appsmith relies on JavaScript instead."
    },
    {
      "question": "Which offers the most granular data access control?",
      "answer": "Grist, which can restrict permissions down to specific rows, columns, or individual cells; this level of control is not documented for Appsmith or SeaTable."
    }
  ]
};

export default appsmithVsGristVsSeatableContent;

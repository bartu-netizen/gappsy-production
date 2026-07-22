import type { ToolComparisonContent } from './types';

const mathesarVsTeableContent: ToolComparisonContent = {
  "verdict": "Mathesar and Teable both put a spreadsheet-style interface over PostgreSQL, but they solve different problems: Mathesar is a 100% GPLv3, nonprofit-maintained (Mathesar Foundation) UI layer that connects to and operates directly on an existing Postgres database using its native permissions, with no pricing tiers at all; Teable is a standalone freemium no-code platform with its own Postgres backend, seat-based pricing from Free through $20/seat/month (Business), and AI features like AI fields, AI chat, and the CuppyClaw agent. Mathesar is still in Public Beta and has not reached a 1.0 release, while Teable documents ISO 9001 and ISO 27001 certifications.",
  "bestForToolA": "Mathesar fits teams that already run a production PostgreSQL database and want a free, nonprofit-backed UI for non-SQL-fluent staff to view and edit that exact data using native Postgres permissions.",
  "bestForToolB": "Teable fits teams starting a new no-code project who want AI-assisted app building and views like Kanban, Gallery, and Calendar without first needing an existing Postgres database, and who accept per-seat pricing as they scale past the Free plan's 1,000-row limit.",
  "whoNeedsBoth": "A team could use Mathesar as a free internal admin UI directly on its production Postgres database for engineers and support staff, while a separate business team uses Teable to spin up its own no-code app with AI-assisted fields for a project unrelated to that core database.",
  "keyDifferences": [
    {
      "title": "Relationship to Postgres",
      "toolA": "Mathesar is explicitly a UI layer that connects to and operates directly on an existing PostgreSQL database using Postgres's native schemas and permissions.",
      "toolB": "Teable is also Postgres-backed, but functions as a standalone no-code platform with its own accounts, seats, and credit system rather than requiring you to bring an existing database.",
      "whyItMatters": "Teams with an existing production database need a tool that respects that schema and permission model rather than duplicating data into a new system.",
      "benefitsWho": "Engineering teams that want a lightweight admin UI on top of a database they already run."
    },
    {
      "title": "Pricing Structure",
      "toolA": "Mathesar has no pricing tiers documented at all — it's entirely free with no paid plans.",
      "toolB": "Teable is freemium: Free (1,000 rows, 1GB attachments), Pro ($10/seat/month annual), Business ($20/seat/month annual), plus a proprietary Enterprise Edition.",
      "whyItMatters": "Budget-constrained teams need to know whether a tool has any recurring cost at all versus one that scales with seats and usage.",
      "benefitsWho": "Cost-sensitive teams and nonprofits evaluating total cost of ownership."
    },
    {
      "title": "Maturity & Release Status",
      "toolA": "Mathesar is in Public Beta and has not reached a stable 1.0 release, per its own documentation, though it describes itself as stable enough for production.",
      "toolB": "Teable's facts don't carry an equivalent beta caveat and instead document ISO 9001 and ISO 27001 certifications.",
      "whyItMatters": "Risk-averse teams may weight formal certifications and release maturity differently when choosing infrastructure to depend on.",
      "benefitsWho": "IT and compliance teams evaluating production readiness."
    },
    {
      "title": "AI-Assisted Features",
      "toolA": "Mathesar's documented feature set (spreadsheet-like interface, forms, query builders, schema management) does not mention AI-assisted features.",
      "toolB": "Teable includes AI fields, AI chat, a natural-language app builder, and the CuppyClaw AI agent starting on its Free plan.",
      "whyItMatters": "Teams wanting AI-assisted app or query building need a platform where that's a native feature, not a gap.",
      "benefitsWho": "Non-technical users who want AI help building views, fields, or automations."
    },
    {
      "title": "Governance",
      "toolA": "Mathesar is maintained by the nonprofit Mathesar Foundation, a 501(c)(3), with a 100% open-source GPLv3 codebase and no proprietary edition.",
      "toolB": "Teable splits into an AGPL-3.0 Community Edition and a separate proprietary Enterprise Edition.",
      "whyItMatters": "Organizations with open-source procurement policies may require a project with no proprietary components anywhere in its stack.",
      "benefitsWho": "Open-source-only procurement environments and nonprofit or public-sector buyers."
    }
  ],
  "featureMatrix": [
    {
      "group": "Data Access & Setup",
      "rows": [
        {
          "feature": "Works directly on an existing (bring-your-own) Postgres database",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Native Postgres permission model",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Docker self-hosting",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "One-click deploy (Railway, Sealos, Zeabur)",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Views, Forms & AI",
      "rows": [
        {
          "feature": "Spreadsheet-style grid interface",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Kanban/Gallery/Calendar views",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Forms for data collection",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "AI fields, AI chat, and app builder",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Licensing & Cost",
      "rows": [
        {
          "feature": "Fully open source with no proprietary edition",
          "toolA": "available",
          "toolB": "limited",
          "note": "Teable CE is AGPL-3.0; Enterprise Edition is proprietary"
        },
        {
          "feature": "Free plan/tier available",
          "toolA": "available",
          "toolB": "available",
          "note": "Mathesar has no pricing tiers at all; Teable Free caps at 1,000 rows"
        },
        {
          "feature": "Stated stable (non-beta) release status",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Mathesar is explicitly Public Beta, pre-1.0"
        },
        {
          "feature": "Paid enterprise tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Mathesar has no paid tiers documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do I need an existing PostgreSQL database to use either tool?",
      "answer": "Yes for Mathesar — it's a UI layer that connects to and operates directly on an existing Postgres database. Teable manages its own Postgres backend as part of the platform rather than requiring you to bring one."
    },
    {
      "question": "Is either tool completely free?",
      "answer": "Mathesar is completely free with no pricing tiers documented at all. Teable is freemium, with a Free plan and paid Pro, Business, and Enterprise tiers."
    },
    {
      "question": "Which tool is more production-ready?",
      "answer": "Mathesar describes itself as in Public Beta and not yet at a stable 1.0 release, though it says it's stable enough for production use. Teable's facts don't include an equivalent beta caveat and instead cite ISO 9001 and ISO 27001 certifications."
    },
    {
      "question": "Does either include AI features?",
      "answer": "Teable does, with AI fields, AI chat, a natural-language app builder, and the CuppyClaw AI agent from the Free plan. Mathesar's documented features (spreadsheet interface, forms, query builders) don't include AI-assisted capabilities."
    },
    {
      "question": "How do the two handle scale?",
      "answer": "Both rely on PostgreSQL, but Teable documents explicit row ceilings by plan (up to 1,000,000 rows on Business), while Mathesar's scalability is described as following PostgreSQL's own capabilities without stated row limits since it operates on your existing database."
    },
    {
      "question": "Which is fully open source?",
      "answer": "Mathesar is 100% GPLv3 with no proprietary tier, maintained by the nonprofit Mathesar Foundation. Teable's Community Edition is AGPL-3.0, but its Enterprise Edition is proprietary."
    }
  ]
};

export default mathesarVsTeableContent;

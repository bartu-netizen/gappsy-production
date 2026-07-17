import type { ToolComparisonContent } from './types';

const gristVsSeatableContent: ToolComparisonContent = {
  "verdict": "Grist and SeaTable are both freemium spreadsheet-database hybrids with genuine self-hosting options, but they differ on data residency and scripting depth: SeaTable is built around EU-hosted cloud infrastructure (certified German data centers) or on-premises deployment, including a permanently free 3-user on-premises license, with built-in Python script execution against data; Grist's grist-core is a single Apache 2.0 open-source license with Python-syntax formulas, row/column/table Access rules, and portable SQLite documents plus desktop apps for Linux, macOS, and Windows. SeaTable's own codebase mixes licenses (dtable-server is proprietary), while Grist's core license is uniformly open.",
  "bestForToolA": "Grist suits teams that want a single OSI-licensed open-source core, Python-syntax spreadsheet formulas, and a desktop app for offline work on Linux, macOS, or Windows.",
  "bestForToolB": "SeaTable suits EU-based or EU-regulated organizations that need certified German data-center hosting or a genuinely free on-premises option for up to 3 users, plus built-in Python scripting for custom data workflows.",
  "whoNeedsBoth": "An EU-based organization with strict data-residency requirements might run SeaTable on-premises or in its EU cloud for regulated data, while using Grist's desktop app and portable SQLite documents for ad hoc, offline analysis that doesn't need to leave a single analyst's laptop.",
  "keyDifferences": [
    {
      "title": "Data Residency & Hosting Model",
      "toolA": "Grist is headquartered in New York City, USA, with Community Edition self-hosting and no explicit EU-hosting guarantee documented.",
      "toolB": "SeaTable is headquartered in Mainz, Germany, and its cloud plans are hosted in certified German data centers within the EU, with Dedicated Cloud and on-premises options for direct data-location control.",
      "whyItMatters": "Organizations bound by EU data-residency or GDPR requirements need documented proof of where data physically lives.",
      "benefitsWho": "EU-based companies and public-sector organizations with data-sovereignty obligations."
    },
    {
      "title": "Open-Source Licensing Purity",
      "toolA": "Grist's core repository (grist-core) is released entirely under the Apache License 2.0, a single OSI-approved license.",
      "toolB": "SeaTable's components use mixed licenses: dtable-web, dtable-events, and thumbnail-server are Apache 2.0, seaf-server is AGPLv3, and dtable-server itself is proprietary.",
      "whyItMatters": "Teams with open-source procurement or audit requirements need clarity on whether the entire stack, not just parts of it, is open source.",
      "benefitsWho": "Engineering teams and procurement reviewers with open-source compliance policies."
    },
    {
      "title": "Built-In Scripting",
      "toolA": "Grist's computation model is expressed through Python-syntax formulas in calculated columns rather than a general-purpose scripting engine.",
      "toolB": "SeaTable includes built-in Python script execution against data, scaling from 100 script runs/month on Free to 1,000/user/month on Enterprise, alongside separate automation rules.",
      "whyItMatters": "Teams needing custom multi-step data processing logic beyond per-column formulas benefit from a dedicated scripting layer.",
      "benefitsWho": "Technical teams building custom data workflows beyond simple calculated fields."
    },
    {
      "title": "AI Credit Structure",
      "toolA": "Grist's AI Assistant gives 100 lifetime credits on the Free plan, then 100 credits/month on Pro ($8/user/month annual) and 2,000 credits/month on Business.",
      "toolB": "SeaTable's AI credits scale from 12.5/month on Free to 500/user/month on Enterprise, plus an optional self-hosted AI server for GDPR-compliant deployments.",
      "whyItMatters": "The credit scale and renewal cadence determine how much ongoing AI-assisted work a team can do without upgrading.",
      "benefitsWho": "Teams planning to rely on AI-assisted automation as a recurring part of their workflow."
    },
    {
      "title": "Entry-Level Paid Pricing",
      "toolA": "Grist's Pro plan starts at $8/user/month billed annually ($10/user/month monthly), with up to 100,000 records per document.",
      "toolB": "SeaTable's Plus plan starts at €7/user/month billed annually (€9/user/month monthly), with up to 50,000 rows and 50GB storage.",
      "whyItMatters": "Currency and included limits differ, which matters for budgeting across regions.",
      "benefitsWho": "Finance and procurement teams comparing total cost across currencies and plan limits."
    }
  ],
  "featureMatrix": [
    {
      "group": "Views & Data Model",
      "rows": [
        {
          "feature": "Kanban/Gallery/Timeline/Calendar views",
          "toolA": "limited",
          "toolB": "available",
          "note": "Grist documents card/calendar/chart widgets; SeaTable explicitly names all four"
        },
        {
          "feature": "Linked records/views between bases or documents",
          "toolA": "available",
          "toolB": "available",
          "note": "Grist: multiple linked views; SeaTable: linked records between bases"
        },
        {
          "feature": "Spreadsheet formula language",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Pre-built templates",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Automation, Scripting & AI",
      "rows": [
        {
          "feature": "Built-in Python script execution",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SeaTable: 100 runs/month (Free) to 1,000/user (Enterprise)"
        },
        {
          "feature": "AI assistant/credits",
          "toolA": "available",
          "toolB": "available",
          "note": "Grist: 100 lifetime (Free); SeaTable: 12.5/month (Free)"
        },
        {
          "feature": "Self-hosted AI server for GDPR compliance",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Hosting & Compliance",
      "rows": [
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "available",
          "note": "Grist: Docker Community Edition; SeaTable: on-premises server licenses"
        },
        {
          "feature": "EU-certified data center cloud hosting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Single OSI-approved open-source license across core",
          "toolA": "available",
          "toolB": "limited",
          "note": "SeaTable's dtable-server component is proprietary"
        },
        {
          "feature": "Desktop app",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Grist: Linux, macOS, Windows"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool guarantees EU data hosting?",
      "answer": "SeaTable explicitly hosts its cloud plans in certified German data centers within the EU and offers Dedicated Cloud with regional selection. Grist, headquartered in New York City, doesn't document an equivalent EU-specific hosted tier."
    },
    {
      "question": "Is either tool fully open source?",
      "answer": "Grist's core (grist-core) is entirely Apache 2.0 licensed. SeaTable's stack is mixed: some components are Apache 2.0, seaf-server is AGPLv3, but dtable-server is proprietary, so it isn't a single fully open-source codebase."
    },
    {
      "question": "Which has more free-tier automation or scripting capability?",
      "answer": "SeaTable's Free plan includes 100 Python script runs per month plus automation rules. Grist's automation features are documented mainly at the Business-plan level, with computation instead expressed through Python-syntax column formulas."
    },
    {
      "question": "How do the free plans compare on rows and storage?",
      "answer": "SeaTable's Free plan includes 10,000 rows, 2GB storage, and 3,000 API calls. Grist's Free plan includes 5,000 records per document with 30-day backups, but doesn't list a separate storage cap in the facts."
    },
    {
      "question": "Which offers a genuinely free self-hosted option long-term?",
      "answer": "SeaTable offers a permanently free on-premises license for up to 3 users. Grist's Community Edition is also free to self-host with unlimited users, and eligible organizations under $1M in annual revenue can request free hosted activation keys."
    },
    {
      "question": "What's the starting price for a paid plan on each?",
      "answer": "SeaTable's Plus plan starts at €7/user/month billed annually. Grist's Pro plan starts at $8/user/month billed annually."
    }
  ]
};

export default gristVsSeatableContent;

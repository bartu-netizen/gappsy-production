import type { ToolComparisonContent } from './types';

const affineVsObsidianContent: ToolComparisonContent = {
  "verdict": "AFFiNE and Obsidian both let you own your notes locally, but they're built around different core models: AFFiNE unifies docs, whiteboards, and structured databases in one workspace with an optional paid AI add-on, while Obsidian is a plain-text Markdown app centered on backlinks and a graph view, with sync and publishing sold as separate unbundled add-ons. Which is better depends on whether you want an all-in-one Notion-and-Miro-style workspace or a portable, Markdown-first personal knowledge base.",
  "bestForToolA": "Teams or individuals wanting a single workspace that combines Notion-style docs, Miro-style whiteboards, and databases, especially if they want an optional AI add-on for writing and planning.",
  "bestForToolB": "Writers and personal-knowledge-management users who want their notes stored as local, portable plain-text Markdown files with backlinks and a graph view, paying only for the specific add-ons (Sync, Publish) they actually need.",
  "whoNeedsBoth": "A researcher could keep long-term reference notes in Obsidian for its plain-text portability and backlink graph, while using AFFiNE's whiteboards and databases for visual project planning and structured tracking — different tools for archival notes versus visual, structured collaboration.",
  "keyDifferences": [
    {
      "title": "Core Workspace Model",
      "toolA": "AFFiNE combines docs, whiteboards (Canvas), and structured databases/tables in one unified workspace.",
      "toolB": "Obsidian focuses on Markdown notes with bidirectional linking, a graph view, and its own Canvas for diagramming, but doesn't document a native structured database/table feature.",
      "whyItMatters": "Users needing structured databases alongside notes get that natively in AFFiNE, while Obsidian users would rely on community plugins (not covered in these facts) for database-like functionality.",
      "benefitsWho": "Teams wanting an all-in-one Notion+Miro-style workspace favor AFFiNE; writers/PKM users wanting plain Markdown files with linking favor Obsidian."
    },
    {
      "title": "File Storage Model",
      "toolA": "AFFiNE is described as privacy-focused and local-first, but its free plan is built around 10 GB of cloud storage rather than plain-text file ownership as the core pitch.",
      "toolB": "Obsidian stores notes as local plain-text Markdown files that you fully control.",
      "whyItMatters": "Obsidian's plain-Markdown-file promise is an explicit lock-in-avoidance selling point; long-term format portability differs between the two.",
      "benefitsWho": "Users prioritizing long-term data portability and vendor independence favor Obsidian."
    },
    {
      "title": "AI Features",
      "toolA": "AFFiNE offers an optional AI add-on for writing, visualization, and planning at $8.90/month, billed annually.",
      "toolB": "No AI features are documented for Obsidian.",
      "whyItMatters": "Teams wanting built-in AI assistance for content creation have a documented paid path only in AFFiNE.",
      "benefitsWho": "Users who want AI writing/planning assistance directly inside their notes app."
    },
    {
      "title": "Sync/Collaboration Pricing",
      "toolA": "AFFiNE's Pro plan ($6.75/month, annual) bundles 100 GB storage, up to 10 workspace members, and 30-day version history together.",
      "toolB": "Obsidian's Sync add-on alone costs $4/user/month (annual) just for cross-device sync, end-to-end encryption, version history, and shared vault collaboration, separate from the always-free core app.",
      "whyItMatters": "AFFiNE bundles collaboration and storage into one paid tier, while Obsidian keeps its core app entirely free and charges only for the specific add-ons a user needs.",
      "benefitsWho": "Solo users who only want local notes save more with Obsidian's unbundled model; small teams wanting bundled storage and collaboration may prefer AFFiNE's Pro plan."
    },
    {
      "title": "Licensing for Organizational Use",
      "toolA": "AFFiNE offers a Team plan ($10/seat/month, 10+ seat minimum) and a custom Enterprise tier with commercial source licensing and OEM/white-label options, plus a self-hosted MIT-licensed editor.",
      "toolB": "Obsidian requires a separate Commercial License ($50/user/year) for organizational or commercial use of the otherwise-free app.",
      "whyItMatters": "Businesses must budget for compliance licensing differently depending on which tool they choose.",
      "benefitsWho": "Organizations planning company-wide rollout need to account for Obsidian's Commercial License or AFFiNE's Team/Enterprise seat pricing."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Workspace",
      "rows": [
        {
          "feature": "Whiteboard/canvas",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Structured databases/tables",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Bidirectional linking/backlinks",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Graph view",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Local plain-text file storage",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "AFFiNE: 10GB cloud storage, 3 members; Obsidian: unlimited local notes, no feature limits"
        },
        {
          "feature": "Entry paid plan",
          "toolA": "available",
          "toolB": "available",
          "note": "AFFiNE Pro $6.75/mo annual; Obsidian Sync $4/user/mo annual"
        },
        {
          "feature": "Lifetime/one-time purchase option",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "AFFiNE Believer plan: $499.99 one-time, 1TB"
        },
        {
          "feature": "Team plan",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "AFFiNE Team: $10/seat/month, 10+ seats; Obsidian instead sells a Commercial License"
        }
      ]
    },
    {
      "group": "Platform & Extensibility",
      "rows": [
        {
          "feature": "Plugin ecosystem",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Obsidian: thousands of community plugins/themes, open API"
        },
        {
          "feature": "Mobile apps (iOS/Android)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "AFFiNE: MIT-licensed self-hosted editor"
        },
        {
          "feature": "AI features",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "AFFiNE AI add-on: $8.90/month annual"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is AFFiNE free?",
      "answer": "Yes, AFFiNE has a free-forever plan with unlimited local workspaces, 10 GB of cloud storage, and up to 3 workspace members."
    },
    {
      "question": "Is Obsidian free?",
      "answer": "Yes, the core app is free with no sign-up required and no feature limits; paid add-ons cover Sync and Publish."
    },
    {
      "question": "Does either have AI features?",
      "answer": "AFFiNE offers a paid AI add-on ($8.90/month, billed annually) for writing, visualization, and planning; Obsidian doesn't document AI features."
    },
    {
      "question": "Which one stores notes as local files?",
      "answer": "Obsidian stores notes as local plain-text Markdown files; AFFiNE's storage model is described as local-first but its paid plans are built around cloud storage tiers ranging from 10GB (free) to 1TB (lifetime Believer plan)."
    },
    {
      "question": "What does commercial or organizational use cost?",
      "answer": "Obsidian requires a separate Commercial License at $50/user/year for organizational use; AFFiNE offers a Team plan at $10/seat/month (10+ seat minimum) and a custom Enterprise tier with commercial licensing."
    },
    {
      "question": "Can I self-host either tool?",
      "answer": "AFFiNE documents an MIT-licensed self-hosted editor option; Obsidian's facts don't document a self-hosting option — it's a local desktop/mobile app with optional paid cloud Sync and Publish add-ons."
    }
  ]
};

export default affineVsObsidianContent;

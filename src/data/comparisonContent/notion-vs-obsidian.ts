import type { ToolComparisonContent } from './types';

const notionVsObsidianContent: ToolComparisonContent = {
  "verdict": "Notion is a cloud-hosted, freemium all-in-one workspace (Free through $20/member/month Business, plus custom Enterprise) that stores data in its own databases and adds AI Custom Agents and Q&A over team content. Obsidian is a free, local-first Markdown note app whose entire core is free with no feature limits, and which only charges for optional add-ons — $4/user/month Sync and $8/site/month Publish — while notes remain plain-text files the user controls. Notion is built for connected team collaboration in the cloud; Obsidian is built for individual, local-first note ownership with deep extensibility.",
  "bestForToolA": "Teams that want a connected, cloud-based workspace combining docs, wikis, tasks, and databases with configurable AI agents, paying per member ($10 Plus or $20 Business).",
  "bestForToolB": "Individuals who want to own their notes as local plain-text Markdown files, extend the app via its open plugin API and thousands of community plugins, and only pay if they need optional Sync ($4/user/month) or Publish ($8/site/month).",
  "whoNeedsBoth": "A person could keep a private, local Obsidian vault (using the free core app and plugin ecosystem) for personal notes and knowledge management while using Notion for team-facing collaborative docs and databases at work — a realistic split between individual-local and team-cloud needs.",
  "keyDifferences": [
    {
      "title": "Data Storage Model",
      "toolA": "Notion stores content in its own cloud-hosted block-based pages and databases.",
      "toolB": "Obsidian stores notes as local plain-text Markdown files that the user controls, explicitly avoiding lock-in.",
      "whyItMatters": "Local plain-text storage means notes remain readable and portable even if the app disappears, unlike a proprietary cloud database.",
      "benefitsWho": "Users concerned about data portability and long-term ownership benefit from Obsidian's local file model."
    },
    {
      "title": "Free Plan Depth",
      "toolA": "Notion has a free plan, but paid tiers (Plus $10, Business $20/member/month) add collaboration limits, admin controls, and advanced features.",
      "toolB": "Obsidian's entire core app is free with no feature limits at all — payment is only required for optional Sync, Publish, or organizational Commercial License add-ons.",
      "whyItMatters": "A feature-complete free core versus a free tier that gates advanced features changes how much value is available before paying.",
      "benefitsWho": "Individual users who never need cloud sync or web publishing get the most value from Obsidian's unrestricted free core."
    },
    {
      "title": "Extensibility",
      "toolA": "Notion offers flexible database views (table, board, calendar, timeline) and configurable AI Custom Agents.",
      "toolB": "Obsidian has an open plugin API and thousands of community plugins and themes for deep customization.",
      "whyItMatters": "Plugin-based extensibility lets individual power users tailor the tool precisely to their workflow, beyond what built-in views offer.",
      "benefitsWho": "Power users who want to customize their note-taking environment benefit from Obsidian's plugin ecosystem."
    },
    {
      "title": "Collaboration",
      "toolA": "Notion is built natively for team collaboration in a shared cloud workspace.",
      "toolB": "Obsidian's collaboration is limited to what the paid Sync add-on enables, including \"shared vault collaboration.\"",
      "whyItMatters": "Teams that need many people editing shared content simultaneously need native collaboration, not an add-on.",
      "benefitsWho": "Teams benefit from Notion's native collaboration; individuals or small groups needing occasional shared access can use Obsidian's Sync add-on."
    },
    {
      "title": "Commercial/Organizational Licensing",
      "toolA": "Notion's paid Business plan ($20/member/month) already covers organizational/team usage.",
      "toolB": "Obsidian requires a separate $50/user/year Commercial License for organizational use, on top of the free core app.",
      "whyItMatters": "Organizations need to budget for a distinct commercial license with Obsidian, which isn't required with Notion's standard team plans.",
      "benefitsWho": "Finance and procurement teams evaluating total cost of ownership for organizational deployment."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Editing & Organization",
      "rows": [
        {
          "feature": "Block-based pages/databases",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Local plain-text file storage",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Graph view of note relationships",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "AI Q&A over content",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "Collaboration & Sync",
      "rows": [
        {
          "feature": "Cross-device sync",
          "toolA": "available",
          "toolB": "available",
          "note": "Obsidian's Sync is a paid add-on at $4/user/month (annual)"
        },
        {
          "feature": "Shared/team collaboration",
          "toolA": "available",
          "toolB": "limited",
          "note": "Obsidian's Sync plan includes shared vault collaboration"
        },
        {
          "feature": "Web publishing",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Publish add-on, $8/site/month (annual)"
        }
      ]
    },
    {
      "group": "Pricing & Licensing",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Notion Free plan vs Obsidian's core app, fully free with no feature limits"
        },
        {
          "feature": "Paid per-member team plan",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Plus $10, Business $20/member/month"
        },
        {
          "feature": "Commercial/organizational license required",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "$50/user/year for organizational use"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Notion free?",
      "answer": "Yes — Notion has a free plan; paid Plus, Business, and Enterprise plans add collaboration limits, admin controls, and advanced features."
    },
    {
      "question": "Is Obsidian free?",
      "answer": "Yes, the core app is free with no sign-up required and no feature limits; paid add-ons only cover Sync and Publish."
    },
    {
      "question": "Where does Obsidian store notes?",
      "answer": "As local plain-text Markdown files that the user controls."
    },
    {
      "question": "Does Notion have AI features?",
      "answer": "Yes — including AI-assisted writing, Q&A over your own Notion content, and configurable Custom Agents."
    },
    {
      "question": "Can Obsidian be extended with plugins?",
      "answer": "Yes, via an open API and a large community plugin and theme ecosystem."
    },
    {
      "question": "Does Obsidian require a paid license for business use?",
      "answer": "Yes — a $50/user/year Commercial License is required for organizational use, separate from the free core app."
    }
  ]
};

export default notionVsObsidianContent;

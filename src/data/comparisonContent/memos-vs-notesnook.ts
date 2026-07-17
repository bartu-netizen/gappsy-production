import type { ToolComparisonContent } from './types';

const memosVsNotesnookContent: ToolComparisonContent = {
  "verdict": "Memos and Notesnook both handle personal note capture but occupy different ends of the hosting and pricing spectrum. Memos is entirely free and open source with no paid tier, but requires self-hosting (a single ~20MB Docker image, with SQLite, MySQL, or PostgreSQL) since there's no official cloud version. Notesnook is freemium with a hosted cloud service by default, end-to-end encryption using XChaCha20-Poly1305 and Argon2, and paid tiers from Essential (€2.11/month) through Believer (€9.51/month) for more storage.",
  "bestForToolA": "Memos fits people who want a lightweight, titleless, timeline-first Markdown capture tool they self-host themselves, with REST and gRPC APIs for integrations and zero telemetry by default.",
  "bestForToolB": "Notesnook fits people who want a hosted, end-to-end encrypted note app with structured notebooks and tags, rich editing (tables, formulas, code blocks), and the option to self-host just the sync server instead of the whole app.",
  "whoNeedsBoth": "A privacy-conscious user could self-host Memos for quick, throwaway daily logs while keeping structured, encrypted long-term notes in Notesnook - the two aren't documented to sync with each other, so this would mean maintaining two separate note stores.",
  "keyDifferences": [
    {
      "title": "Pricing Model",
      "toolA": "Memos is completely free and open source (MIT license) with no paid tier documented at all.",
      "toolB": "Notesnook is freemium, with paid Essential (€2.11/month), Pro (€7.39/month), and Believer (€9.51/month) tiers for more storage and features.",
      "whyItMatters": "Whether a paid tier exists at all shapes long-term costs, especially as storage needs grow.",
      "benefitsWho": "Self-hosters who never want a subscription benefit from Memos' fully free model."
    },
    {
      "title": "Hosting Requirement",
      "toolA": "Memos requires self-hosting with no official cloud version - deployed as a single ~20MB Docker image, using SQLite by default or MySQL/PostgreSQL for larger setups.",
      "toolB": "Notesnook offers a hosted cloud service by default, with self-hosting the sync server as an optional alternative.",
      "whyItMatters": "Whether hosting is mandatory or optional determines how much server-management burden falls on the user.",
      "benefitsWho": "Users without server infrastructure benefit from Notesnook's default hosted cloud; sysadmins who want full control benefit from Memos' self-hosted-only model."
    },
    {
      "title": "Encryption",
      "toolA": "Built-in note encryption is not documented for Memos; privacy instead relies on self-hosted infrastructure control and zero telemetry by default.",
      "toolB": "Notesnook encrypts notes on-device before syncing, using XChaCha20-Poly1305 and Argon2.",
      "whyItMatters": "Client-side encryption protects notes even if the sync provider's servers are compromised.",
      "benefitsWho": "Users storing sensitive information in the cloud benefit from Notesnook's documented end-to-end encryption."
    },
    {
      "title": "Note Structure",
      "toolA": "Memos is deliberately minimal - a timeline of quick notes with no folders, templates, or titles.",
      "toolB": "Notesnook supports structured organization with notebooks, tags (up to 500 on the Essential plan), and rich editing (tables, task lists, formulas, code blocks).",
      "whyItMatters": "A minimal timeline suits fast capture, while structured notebooks and rich editing suit longer, organized reference material.",
      "benefitsWho": "Users journaling quick daily thoughts benefit from Memos' timeline model; users building organized reference notes benefit from Notesnook's notebooks and rich editor."
    },
    {
      "title": "API Access",
      "toolA": "Memos documents both REST and gRPC APIs for building integrations and automations.",
      "toolB": "A public API is not documented for Notesnook in the available facts.",
      "whyItMatters": "A documented API enables developers to build custom tools and automations on top of the note data.",
      "benefitsWho": "Developers wanting to script or integrate their notes elsewhere benefit from Memos' REST and gRPC APIs."
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment & Hosting",
      "rows": [
        {
          "feature": "Self-hosting required",
          "toolA": "available",
          "toolB": "limited",
          "note": "Memos requires it; Notesnook's sync server is optionally self-hostable"
        },
        {
          "feature": "Official hosted/cloud version",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Lightweight single-binary/Docker deployment",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Memos: ~20MB Docker image"
        },
        {
          "feature": "Database backend choice (SQLite/MySQL/PostgreSQL)",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Organization & Editing",
      "rows": [
        {
          "feature": "Folders/notebooks",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Memos has no folders by design"
        },
        {
          "feature": "Tagging",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Titles required for notes",
          "toolA": "unavailable",
          "toolB": "not-documented",
          "note": "Memos notes are titleless by design"
        },
        {
          "feature": "Rich editing (tables, formulas, code blocks)",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Security & Extensibility",
      "rows": [
        {
          "feature": "End-to-end encryption",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "REST/gRPC API",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Zero telemetry by default",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Password-protected vault",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Free-tier storage cap documented",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Notesnook: 50MB/month"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Memos really free with no upsell?",
      "answer": "Yes, Memos is completely free and open source under the MIT license with no paid tiers at all, but self-hosting is required since there's no official cloud version."
    },
    {
      "question": "Does Notesnook have a free plan?",
      "answer": "Yes, capped at 50MB/month storage, 50 notebooks, and 50 tags on the free tier."
    },
    {
      "question": "Can I use Memos without running my own server?",
      "answer": "No - Memos has no official hosted or cloud version, so self-hosting via Docker or a standalone binary is required."
    },
    {
      "question": "Which has an API for building integrations?",
      "answer": "Memos documents both REST and gRPC APIs. A public API is not documented for Notesnook."
    },
    {
      "question": "Which encrypts notes end-to-end?",
      "answer": "Notesnook, using XChaCha20-Poly1305 and Argon2. Built-in encryption is not documented for Memos."
    },
    {
      "question": "How large is the Memos deployment footprint?",
      "answer": "A single Go binary in an approximately 20MB Docker image, supporting SQLite by default or MySQL/PostgreSQL for larger deployments."
    }
  ]
};

export default memosVsNotesnookContent;

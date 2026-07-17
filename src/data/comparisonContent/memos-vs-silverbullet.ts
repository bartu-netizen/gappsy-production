import type { ToolComparisonContent } from './types';

const memosVsSilverbulletContent: ToolComparisonContent = {
  "verdict": "Memos and SilverBullet are both free, open-source, self-hosted Markdown tools, but they're built for different workflows. Memos is a timeline-first app for quick, titleless notes with REST/gRPC APIs and zero telemetry; SilverBullet is a full Markdown wiki with wiki-style bidirectional linking, a built-in query language (SLIQ), and Space Lua scripting for treating notes as a programmable, queryable database.",
  "bestForToolA": "Memos fits people who want a lightweight, single-binary deployment for quick daily-log-style Markdown notes with a choice of SQLite, MySQL, or PostgreSQL as the backend.",
  "bestForToolB": "SilverBullet fits people who want to build an interconnected, queryable knowledge base with bidirectional links, page templates, and in-note scripting, rather than a simple note timeline.",
  "whoNeedsBoth": "Someone could use Memos as a fast-capture inbox for daily notes and periodically move structured, interlinked material into SilverBullet where SLIQ queries and Space Lua scripting can operate on it - though no documented integration connects the two, so migration would be manual.",
  "keyDifferences": [
    {
      "title": "Note Model",
      "toolA": "Memos is a timeline-first log of quick, titleless Markdown notes with no folders or templates.",
      "toolB": "SilverBullet is a full Markdown wiki with wiki-style bidirectional linking, page templates, and outlining - built for structured, interconnected knowledge bases.",
      "whyItMatters": "A timeline suits rapid, low-friction capture, while a linked wiki suits deliberately structured, cross-referenced knowledge.",
      "benefitsWho": "Users journaling quick daily thoughts benefit from Memos; users building an interconnected personal wiki benefit from SilverBullet."
    },
    {
      "title": "Programmability",
      "toolA": "A query language or in-note scripting is not documented for Memos, which instead offers REST and gRPC APIs for external integrations.",
      "toolB": "SilverBullet includes a built-in query language (SLIQ) to query notes like a lightweight database, plus Space Lua scripting for dynamic content and automation.",
      "whyItMatters": "In-note querying and scripting let users build dynamic, database-like views without leaving the app.",
      "benefitsWho": "Power users who want to treat their notes as structured data benefit from SilverBullet's SLIQ query language and Space Lua scripting."
    },
    {
      "title": "Deployment Footprint",
      "toolA": "Memos runs as a single Go binary in an approximately 20MB Docker image, with SQLite by default or MySQL/PostgreSQL for larger deployments.",
      "toolB": "SilverBullet also deploys as a single binary or Docker container, but no database backend choice is documented in the facts.",
      "whyItMatters": "Database backend flexibility matters for teams anticipating larger-scale, multi-user deployments.",
      "benefitsWho": "Self-hosters planning to scale beyond a single-user SQLite setup benefit from Memos' MySQL/PostgreSQL support."
    },
    {
      "title": "Bidirectional Linking",
      "toolA": "Bidirectional linking between notes is not documented for Memos, which organizes content via tags and full-text search instead.",
      "toolB": "SilverBullet supports wiki-style bidirectional linking natively in its live-preview Markdown editor.",
      "whyItMatters": "Bidirectional links let users navigate and discover related notes without manual tagging alone.",
      "benefitsWho": "Users building a network of interconnected ideas benefit from SilverBullet's native bidirectional linking."
    },
    {
      "title": "Task Management",
      "toolA": "Dedicated task-list features are not documented for Memos, which focuses on freeform Markdown timeline entries.",
      "toolB": "SilverBullet has built-in support for task lists and outlining directly inside notes.",
      "whyItMatters": "Native task-list support lets a notes app double as a lightweight to-do system.",
      "benefitsWho": "Users who want to mix task tracking with note-taking in one tool benefit from SilverBullet's built-in task management."
    }
  ],
  "featureMatrix": [
    {
      "group": "Note Structure & Linking",
      "rows": [
        {
          "feature": "Bidirectional linking",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Timeline/log-style capture",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Page templates",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Tagging",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Full-text search",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Automation & Querying",
      "rows": [
        {
          "feature": "Built-in database-style query language",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "SilverBullet's SLIQ"
        },
        {
          "feature": "In-note scripting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SilverBullet's Space Lua"
        },
        {
          "feature": "REST/gRPC API",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Task lists/outlining",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Access",
      "rows": [
        {
          "feature": "Single-binary/Docker deployment",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Database backend choice (SQLite/MySQL/PostgreSQL)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Zero telemetry by default",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Browser-based editor",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Official hosted cloud version",
          "toolA": "unavailable",
          "toolB": "unavailable"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do either of these have a query language for notes?",
      "answer": "SilverBullet has SLIQ, a built-in query language for treating notes as structured data. This isn't documented for Memos."
    },
    {
      "question": "Which is better for quick, unstructured daily notes?",
      "answer": "Memos, which is purpose-built as a timeline-first, titleless capture tool with no folders or templates."
    },
    {
      "question": "Which supports scripting inside notes?",
      "answer": "SilverBullet, via its Space Lua scripting environment for dynamic content and automation."
    },
    {
      "question": "Do either offer a hosted cloud version?",
      "answer": "No - both require self-hosting; neither documents an official hosted or cloud option."
    },
    {
      "question": "What database backends does Memos support?",
      "answer": "SQLite by default, with MySQL or PostgreSQL available for larger deployments."
    },
    {
      "question": "Is either app free?",
      "answer": "Yes, both Memos and SilverBullet are completely free and open source under the MIT license, with no paid tier."
    }
  ]
};

export default memosVsSilverbulletContent;

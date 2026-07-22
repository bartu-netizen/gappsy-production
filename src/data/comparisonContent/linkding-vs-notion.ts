import type { ToolComparisonContent } from './types';

const linkdingVsNotionContent: ToolComparisonContent = {
  "verdict": "Linkding is a narrow, self-hosted bookmark manager built to run in a single Docker container and do one job well: save, tag, and archive links. Notion is a broad, AI-powered workspace combining docs, wikis, project management, and databases that teams use to run their company. Comparing them head-to-head only makes sense if you're weighing 'a dedicated free bookmark tool' against 'a general workspace that could also hold bookmarks as a database.'",
  "bestForToolA": "Linkding fits self-hosters who want a free, minimal, single-purpose bookmark archive with automatic metadata fetching, website archiving, and a REST API, without paying for or configuring a broader workspace.",
  "bestForToolB": "Notion fits individuals or teams who need one connected workspace for docs, wikis, task tracking, and databases with flexible views (table, board, calendar, timeline) and built-in AI writing and Q&A.",
  "whoNeedsBoth": "A team could use Linkding as a lightweight, self-hosted link archive for research and reference material while running actual project docs, task tracking, and internal wikis in Notion — Linkding's REST API could even feed saved links into a Notion database.",
  "keyDifferences": [
    {
      "title": "Scope of the Product",
      "toolA": "Linkding does one thing: bookmark storage, tagging, and archiving, with features like automatic metadata fetching and website archiving via local snapshots or the Internet Archive.",
      "toolB": "Notion combines block-based pages, flexible databases, docs, wikis, and project management into a single connected workspace.",
      "whyItMatters": "A single-purpose tool is simpler to adopt and operate but can't replace a full workspace, while an all-in-one tool requires more setup investment to structure well.",
      "benefitsWho": "Teams that already have a project/docs tool and just need bookmarks benefit from Linkding's focus; teams starting from scratch benefit from Notion's breadth."
    },
    {
      "title": "Pricing",
      "toolA": "Linkding has no pricing plans documented — it is free, open-source software you self-host.",
      "toolB": "Notion is freemium: a Free plan, then Plus at $10 per member/month, Business at $20 per member/month, and custom Enterprise pricing.",
      "whyItMatters": "Per-seat SaaS pricing scales cost with team size, while a free self-hosted tool has no per-seat cost but requires hosting.",
      "benefitsWho": "Cost-sensitive solo users benefit from Linkding's free model; growing teams needing collaboration features accept Notion's per-seat pricing for the added functionality."
    },
    {
      "title": "AI Features",
      "toolA": "Linkding does not document any AI features.",
      "toolB": "Notion includes AI-assisted writing, Q&A over a team's own Notion content, and configurable AI Custom Agents that automate specific workspace workflows.",
      "whyItMatters": "AI-assisted writing and Q&A can meaningfully speed up documentation and research synthesis work inside a workspace, which a bookmark manager isn't built to do.",
      "benefitsWho": "Teams wanting AI-assisted content creation and search benefit from Notion; this dimension is not relevant to Linkding's use case."
    },
    {
      "title": "Hosting and Data Control",
      "toolA": "Linkding requires self-hosting (single Docker container with SQLite) with no official managed cloud version; users are responsible for their own backups and updates.",
      "toolB": "Notion is a fully hosted SaaS product with no self-hosting option documented.",
      "whyItMatters": "Self-hosting gives full data control but adds operational responsibility, while a managed SaaS removes that burden but ties data to the vendor's infrastructure.",
      "benefitsWho": "Privacy- or compliance-conscious self-hosters benefit from Linkding; teams that don't want to run infrastructure benefit from Notion."
    },
    {
      "title": "Collaboration Depth",
      "toolA": "Linkding supports multiple user accounts with bookmark sharing between users, but has no native mobile apps and relies on browser extensions and the web UI.",
      "toolB": "Notion supports team-wide collaboration across docs, databases, and project views, with Business and Enterprise tiers adding admin controls and advanced collaboration features.",
      "whyItMatters": "Real-time, structured team collaboration across many content types requires more built-in tooling than a bookmark manager offers.",
      "benefitsWho": "Cross-functional teams benefit from Notion's collaboration depth; small groups just sharing links benefit from Linkding's simpler multi-user model."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Content Types",
      "rows": [
        {
          "feature": "Bookmark management with metadata",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Linkding auto-fetches title, description, icon, preview image"
        },
        {
          "feature": "Block-based pages / docs",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Flexible database views (table/board/calendar/timeline)",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Website archiving / offline snapshots",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "AI & Automation",
      "rows": [
        {
          "feature": "AI-assisted writing",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "AI Q&A over your own content",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Configurable AI agents",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Notion's AI Custom Agents"
        },
        {
          "feature": "REST API",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Access & Deployment",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Linkding: fully free; Notion: Free plan then $10-$20/member/month"
        },
        {
          "feature": "Self-hosting",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Linkding requires it"
        },
        {
          "feature": "Multi-user support",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Browser extensions",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Linkding: Firefox and Chrome"
        },
        {
          "feature": "Enterprise/admin controls",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Notion Business/Enterprise tiers"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Linkding a replacement for Notion?",
      "answer": "No — Linkding only manages bookmarks (saving, tagging, archiving). Notion is a broad workspace covering docs, wikis, task tracking, and databases. They're not interchangeable."
    },
    {
      "question": "Which one is free?",
      "answer": "Linkding is entirely free and open source with no pricing plans. Notion has a Free plan but paid tiers start at $10 per member/month for Plus and $20 per member/month for Business."
    },
    {
      "question": "Does Linkding have AI features like Notion?",
      "answer": "No AI features are documented for Linkding. Notion includes AI-assisted writing, Q&A over your workspace content, and configurable AI Custom Agents."
    },
    {
      "question": "Can I self-host either tool?",
      "answer": "Linkding requires self-hosting via a single Docker container with SQLite. Notion does not document a self-hosting option — it's a hosted SaaS product only."
    },
    {
      "question": "Can I use both together?",
      "answer": "Yes. You could keep a dedicated, self-hosted bookmark archive in Linkding for research links while running project docs, wikis, and team collaboration in Notion, potentially syncing saved links into a Notion database via Linkding's REST API."
    },
    {
      "question": "Which has native mobile apps?",
      "answer": "Linkding does not document native mobile apps and relies on browser extensions and its web UI. Notion's mobile app support is not detailed in the available facts, but its broader platform is built for cross-device team use."
    }
  ]
};

export default linkdingVsNotionContent;

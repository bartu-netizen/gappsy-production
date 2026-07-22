import type { ToolComparisonContent } from './types';

const notionVsWallabagContent: ToolComparisonContent = {
  "verdict": "Notion is a broad, AI-powered workspace for docs, wikis, project management, and databases that teams use to run their company. wallabag is a narrow, self-hostable read-it-later app built specifically to archive web pages for offline reading. They rarely compete directly — Notion organizes and creates work, wallabag saves and preserves articles you find elsewhere.",
  "bestForToolA": "Notion fits teams needing one connected workspace with flexible database views, AI-assisted writing, and AI Q&A over their own content, priced from a Free plan up to $20 per member/month for Business.",
  "bestForToolB": "wallabag fits readers who want a self-hostable (or third-party hosted) archive of saved articles with offline reading, RSS reader and e-reader support, and dedicated migration tools from Pocket and Omnivore.",
  "whoNeedsBoth": "A researcher could save and read long-form articles offline in wallabag, then bring key excerpts and analysis into a Notion database or wiki page as part of a larger knowledge-management workspace.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "Notion combines block-based pages, flexible database views, docs, wikis, and project management for teams running work end-to-end.",
      "toolB": "wallabag exists to archive web pages for later, offline reading, with multi-platform apps, browser extensions, RSS reader, and e-reader support.",
      "whyItMatters": "A read-it-later tool and a company workspace solve fundamentally different problems, so picking between them depends on whether you're organizing team work or archiving articles to read.",
      "benefitsWho": "Teams running projects and documentation benefit from Notion; individuals building a personal reading archive benefit from wallabag."
    },
    {
      "title": "Hosting Requirement",
      "toolA": "Notion is a fully hosted SaaS workspace with no self-hosting option documented.",
      "toolB": "wallabag requires self-hosting or a third-party host to use, unlike a fully managed read-it-later service.",
      "whyItMatters": "Self-hosting gives control over data and cost but adds operational responsibility that a managed SaaS removes.",
      "benefitsWho": "Teams that don't want to manage infrastructure benefit from Notion; privacy-focused individuals comfortable self-hosting benefit from wallabag."
    },
    {
      "title": "Migration Tooling",
      "toolA": "Notion's documented facts do not mention dedicated migration tools from other read-it-later or bookmarking services.",
      "toolB": "wallabag provides dedicated migration guides for moving an existing library from both Pocket and Omnivore, not just a generic import.",
      "whyItMatters": "Purpose-built migration tools reduce the friction of switching services and preserve reading history and tags.",
      "benefitsWho": "Users switching away from Pocket or Omnivore benefit specifically from wallabag's migration guides."
    },
    {
      "title": "AI Features",
      "toolA": "Notion includes AI-assisted writing, Q&A over a team's own Notion content, and configurable AI Custom Agents.",
      "toolB": "wallabag does not document any AI features — its focus is archiving and offline reading.",
      "whyItMatters": "AI-assisted writing and search are relevant to content creation and knowledge work, not to a tool whose job is preserving articles as-is.",
      "benefitsWho": "Teams wanting AI-assisted drafting and search benefit from Notion; this dimension doesn't apply to wallabag's use case."
    },
    {
      "title": "Reading Platform Support",
      "toolA": "Notion's facts do not document RSS reader or e-reader integration.",
      "toolB": "wallabag documents apps, browser extensions, RSS reader support, and e-reader compatibility for offline reading across devices.",
      "whyItMatters": "Dedicated e-reader and RSS support matters specifically for people who read saved long-form content away from a screen with notifications.",
      "benefitsWho": "Heavy readers who use e-readers or RSS feeds benefit from wallabag's platform coverage."
    }
  ],
  "featureMatrix": [
    {
      "group": "Content Capture & Reading",
      "rows": [
        {
          "feature": "Save/archive web pages for later reading",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Offline reading of saved content",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "RSS reader support",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "E-reader support",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Migration tools from other services",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "wallabag: dedicated guides from Pocket and Omnivore"
        }
      ]
    },
    {
      "group": "Workspace & AI",
      "rows": [
        {
          "feature": "Block-based pages / docs",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Flexible database views",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "AI-assisted writing",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "AI Q&A over your content",
          "toolA": "available",
          "toolB": "unavailable"
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
          "note": "Notion Free plan; wallabag freemium"
        },
        {
          "feature": "Self-hosting",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "wallabag requires self-hosting or a third-party host"
        },
        {
          "feature": "Browser extension",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Enterprise/admin controls",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Notion Business/Enterprise tiers"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are Notion and wallabag direct competitors?",
      "answer": "Not really. Notion is a broad workspace for docs, wikis, and project management, while wallabag is a focused read-it-later app for archiving web pages. They serve different jobs."
    },
    {
      "question": "Is wallabag free like Notion's free plan?",
      "answer": "wallabag is freemium and requires self-hosting or a third-party host to use — there's no fully managed free tier. Notion offers a hosted Free plan directly, with paid Plus ($10/member/month) and Business ($20/member/month) tiers."
    },
    {
      "question": "Can I migrate my saved articles into wallabag?",
      "answer": "Yes — wallabag provides dedicated migration guides for moving an existing library from Pocket or Omnivore, not just a generic import tool."
    },
    {
      "question": "Does wallabag have AI features like Notion?",
      "answer": "No AI features are documented for wallabag. Notion includes AI-assisted writing, Q&A over your own content, and configurable AI Custom Agents."
    },
    {
      "question": "Can I read wallabag articles on an e-reader?",
      "answer": "Yes, wallabag documents e-reader and RSS reader support for offline reading across devices, which is not documented for Notion."
    },
    {
      "question": "Should I use both tools?",
      "answer": "It can make sense: archive and read long-form articles offline in wallabag, then summarize or reference key material inside a Notion workspace alongside your other docs and project work."
    }
  ]
};

export default notionVsWallabagContent;

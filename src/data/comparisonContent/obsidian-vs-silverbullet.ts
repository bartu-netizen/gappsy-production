import type { ToolComparisonContent } from './types';

const obsidianVsSilverbulletContent: ToolComparisonContent = {
  "verdict": "Obsidian and SilverBullet are both Markdown-based note tools built around bidirectional linking, but they take opposite approaches to hosting and monetization. Obsidian is a local-first app with a free, full-featured core plus separately priced Sync ($4-5/user/month) and Publish ($8-10/site/month) add-ons and a $50/user/year Commercial License for organizations; SilverBullet is entirely free and open source (MIT), fundamentally self-hosted and browser-based, with a built-in query language (SLIQ) and Space Lua scripting instead of a plugin marketplace.",
  "bestForToolA": "Obsidian fits users who want a local-first Markdown app with a large third-party plugin ecosystem, a visual Canvas for diagramming, and optional paid Sync/Publish services rather than running their own server.",
  "bestForToolB": "SilverBullet fits users comfortable self-hosting who want to query their notes like a database via SLIQ and script automation directly inside notes with Space Lua, without ever paying a subscription or commercial license.",
  "whoNeedsBoth": "There's no documented complementary scenario - both are primary note-taking systems built on Markdown and linking, so a user would choose Obsidian for its plugin ecosystem and optional hosted services or SilverBullet for its free, self-hosted, queryable approach rather than running both as their main system.",
  "keyDifferences": [
    {
      "title": "Pricing & Monetization",
      "toolA": "Obsidian's core app is free, but Sync costs $4/user/month (annual) or $5/user/month (monthly), Publish costs $8/site/month (annual) or $10/site/month (monthly), and a Commercial License for organizational use is $50/user/year.",
      "toolB": "SilverBullet is entirely free and open source (MIT license) with no paid tier or commercial license requirement of any kind.",
      "whyItMatters": "Optional paid add-ons let casual users stay free while organizations pay for convenience, versus a tool that's free for every use case including commercial ones.",
      "benefitsWho": "Organizations that want official commercial licensing and hosted sync may prefer Obsidian; users who never want to pay, including for commercial use, benefit from SilverBullet."
    },
    {
      "title": "Deployment Model",
      "toolA": "Obsidian is local-first, storing plain-text Markdown files on-device, with optional paid cloud Sync for cross-device access.",
      "toolB": "SilverBullet is fundamentally self-hosted and browser-based, requiring users to run their own server (single binary or Docker) to access notes.",
      "whyItMatters": "Local-first apps work offline by default, while browser-based self-hosted apps require maintaining a running server.",
      "benefitsWho": "Users who want notes available offline without server setup benefit from Obsidian's local-first model; users who want browser access from any device to their own server benefit from SilverBullet."
    },
    {
      "title": "Extensibility",
      "toolA": "Obsidian has a large plugin ecosystem with thousands of community plugins and themes, built on an open API.",
      "toolB": "SilverBullet offers built-in Space Lua scripting and a query language (SLIQ) baked into the core app rather than a third-party plugin marketplace.",
      "whyItMatters": "A large plugin marketplace offers ready-made extensions, while built-in scripting offers deeper native customization without third-party dependencies.",
      "benefitsWho": "Users who want ready-made community add-ons benefit from Obsidian's plugin ecosystem; developers who want to script directly benefit from SilverBullet's built-in Space Lua."
    },
    {
      "title": "Querying Notes as Data",
      "toolA": "A native query language is not documented for Obsidian; search and the graph view are the primary discovery tools.",
      "toolB": "SilverBullet's built-in SLIQ query language lets users query notes like a lightweight database.",
      "whyItMatters": "A query language enables database-style views (e.g., filtering notes by custom criteria) without external plugins.",
      "benefitsWho": "Users who want to build dynamic, structured views of their notes benefit from SilverBullet's SLIQ."
    },
    {
      "title": "Visual/Diagramming Tools",
      "toolA": "Obsidian includes a Canvas feature, a visual space for brainstorming and diagramming.",
      "toolB": "A canvas or diagramming feature is not documented for SilverBullet.",
      "whyItMatters": "Visual canvases support spatial thinking and diagramming that plain Markdown text can't easily replicate.",
      "benefitsWho": "Visual thinkers and brainstorming teams benefit from Obsidian's Canvas feature."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Editing & Linking",
      "rows": [
        {
          "feature": "Local Markdown file storage",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Bidirectional linking",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Graph view",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Canvas/visual diagramming",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Live-preview Markdown editor",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Deployment & Pricing",
      "rows": [
        {
          "feature": "Free core app with no feature limits",
          "toolA": "available",
          "toolB": "available"
        },
        {
          "feature": "Self-hosting required",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Paid sync add-on",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Obsidian Sync: $4-5/user/month"
        },
        {
          "feature": "Paid publishing add-on",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Obsidian Publish: $8-10/site/month"
        },
        {
          "feature": "Commercial/organizational license",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Obsidian: $50/user/year"
        }
      ]
    },
    {
      "group": "Extensibility & Tools",
      "rows": [
        {
          "feature": "Community plugin ecosystem",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Built-in query language",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "SilverBullet's SLIQ"
        },
        {
          "feature": "In-app scripting",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "SilverBullet's Space Lua"
        },
        {
          "feature": "Task management/outlining",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Open plugin API for developers",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Obsidian really free?",
      "answer": "Yes, the core app is free with no feature limits; Sync and Publish are separate optional paid add-ons."
    },
    {
      "question": "Do I need to run my own server for either tool?",
      "answer": "SilverBullet requires self-hosting (single binary or Docker). Obsidian is local-first and doesn't require a server, though its optional Sync and Publish services are hosted by Obsidian."
    },
    {
      "question": "Which has a bigger plugin ecosystem?",
      "answer": "Obsidian, with thousands of community plugins and themes built on an open API. A plugin marketplace isn't documented for SilverBullet."
    },
    {
      "question": "Can I query my notes like a database?",
      "answer": "SilverBullet's built-in SLIQ query language supports this. A native query language isn't documented for Obsidian."
    },
    {
      "question": "What does Obsidian's Commercial License cost?",
      "answer": "$50/user/year for organizational use."
    },
    {
      "question": "Does SilverBullet have a paid tier for more features?",
      "answer": "No, SilverBullet is entirely free and open source under the MIT license, with no paid tier documented."
    }
  ]
};

export default obsidianVsSilverbulletContent;

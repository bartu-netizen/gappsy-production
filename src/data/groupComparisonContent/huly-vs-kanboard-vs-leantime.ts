import type { GroupComparisonContent } from './types';

const hulyVsKanboardVsLeantimeContent: GroupComparisonContent = {
  "verdict": "Huly, Kanboard, and Leantime are all open-source, self-hostable project management tools that can be run at zero cost, but they solve different problems. Huly is the most ambitious, bundling issue tracking, docs, chat, and video into one connected workspace for teams that want to replace several SaaS tools at once, at the cost of needing more server resources to run well. Kanboard stays deliberately minimal, offering a fast, lightweight Kanban board on a PHP/SQLite stack for technical teams who don't want collaboration extras. Leantime sits in between, adding goal- and motivation-based planning, including built-in Lean Canvas and SWOT tools, with an explicit focus on ADHD- and neurodivergent-friendly workflows, plus an easy-to-buy managed cloud option if self-hosting isn't wanted.",
  "bestFor": {
    "huly": "Teams that want a single open-source workspace combining issue tracking, docs, chat, and video instead of stitching together separate tools.",
    "kanboard": "Developers and sysadmins who want the lightest possible self-hosted Kanban board with no bloat and low hosting cost.",
    "leantime": "Non-project-manager founders, neurodivergent-led teams, or anyone who wants goal-first planning with the option of a managed cloud plan instead of self-hosting."
  },
  "highlights": [
    {
      "title": "Huly bundles the most into one workspace",
      "description": "Huly combines issue tracking, a team planner, docs, built-in chat, and native video rooms in a single unified data model, aiming to replace Linear, Notion, and Slack-style tools at once.",
      "toolSlugs": [
        "huly"
      ]
    },
    {
      "title": "Kanboard is the lightest to run",
      "description": "Kanboard's PHP/SQLite stack has no heavy infrastructure requirements, making it the cheapest and simplest of the three to self-host on modest hardware.",
      "toolSlugs": [
        "kanboard"
      ]
    },
    {
      "title": "Leantime is built around ADHD- and neurodivergent-friendly workflows",
      "description": "Leantime was created specifically to reduce cognitive overwhelm, with goal- and motivation-based planning plus built-in Lean Canvas and SWOT tools rather than pure task lists.",
      "toolSlugs": [
        "leantime"
      ]
    },
    {
      "title": "Managed cloud options differ",
      "description": "Huly and Leantime both sell a paid, vendor-hosted cloud tier for teams that don't want to self-host, while Kanboard has no official managed offering, only third-party hosts like Elestio.",
      "toolSlugs": [
        "huly",
        "leantime",
        "kanboard"
      ]
    },
    {
      "title": "Self-hosting requirements vary a lot",
      "description": "Huly's stack (CockroachDB, Elasticsearch, Redpanda, MinIO) recommends 16 GB RAM for production, while Kanboard runs comfortably on cheap PHP hosting most self-hosters already have.",
      "toolSlugs": [
        "huly",
        "kanboard"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Task Management",
      "rows": [
        {
          "feature": "Kanban board",
          "statuses": {
            "huly": "available",
            "kanboard": "available",
            "leantime": "available"
          }
        },
        {
          "feature": "Gantt / timeline view",
          "statuses": {
            "huly": "not-documented",
            "kanboard": "available",
            "leantime": "available"
          }
        },
        {
          "feature": "Time tracking",
          "statuses": {
            "huly": "not-documented",
            "kanboard": "available",
            "leantime": "available"
          }
        }
      ]
    },
    {
      "group": "Collaboration and Docs",
      "rows": [
        {
          "feature": "Built-in docs / wiki",
          "statuses": {
            "huly": "available",
            "kanboard": "not-documented",
            "leantime": "available"
          }
        },
        {
          "feature": "Built-in chat / messaging",
          "statuses": {
            "huly": "available",
            "kanboard": "not-documented",
            "leantime": "not-documented"
          }
        },
        {
          "feature": "Native video / conferencing",
          "statuses": {
            "huly": "available",
            "kanboard": "unavailable",
            "leantime": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Deployment and Extensibility",
      "rows": [
        {
          "feature": "Vendor-managed cloud option",
          "statuses": {
            "huly": "available",
            "kanboard": "unavailable",
            "leantime": "available"
          }
        },
        {
          "feature": "AI-assisted task management",
          "statuses": {
            "huly": "not-documented",
            "kanboard": "not-documented",
            "leantime": "limited"
          },
          "note": "Available only on Leantime's paid Cloud Pro and Enterprise plans, not in the open-source Community Edition."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Huly, Kanboard, and Leantime is completely free to self-host?",
      "answer": "All three can be self-hosted for free: Huly's full self-hosted stack, Kanboard's entire open-source release, and Leantime's Community Edition are all available at no cost, with no user limits on Kanboard or Huly's self-hosted install."
    },
    {
      "question": "Do any of these tools include built-in chat or video calls?",
      "answer": "Only Huly does. It has native instant messaging, group channels, and audio/video conferencing rooms built into the platform. Kanboard has no native chat or video, and Leantime only offers notification integrations with tools like Slack and Discord rather than built-in chat."
    },
    {
      "question": "Which tool needs the most server resources to self-host?",
      "answer": "Huly is the heaviest, with a stack built on CockroachDB, Elasticsearch, Redpanda, and MinIO that recommends 4-plus vCPUs and 16 GB RAM for production. Kanboard is the lightest, running on a simple PHP/SQLite, MySQL, or PostgreSQL stack, with Leantime somewhere in between."
    },
    {
      "question": "Is Leantime's ADHD-friendly design just marketing, or does it change the product?",
      "answer": "It shapes the core workflow: Leantime is built around goal- and motivation-based planning, reduced cognitive load in the interface, and built-in Lean Canvas and SWOT strategy tools, rather than the pure task-hierarchy approach used by most Kanban and issue trackers."
    },
    {
      "question": "Can I avoid self-hosting entirely with any of these?",
      "answer": "Huly and Leantime both sell managed cloud plans, Huly from about $19.99 per month flat and Leantime Cloud Pro from $8 to $10 per user per month, for teams that don't want to run their own servers. Kanboard has no official vendor-hosted cloud, though third-party hosts offer managed Kanboard instances starting around $14 per month."
    }
  ]
};

export default hulyVsKanboardVsLeantimeContent;

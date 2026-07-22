import type { ToolComparisonContent } from './types';

const notionVsTaskwarriorContent: ToolComparisonContent = {
  "verdict": "Notion is a freemium, all-in-one visual workspace combining docs, wikis, databases, and AI-assisted task tracking for teams, priced from a free plan up through $20/member/month on Business and custom Enterprise pricing. Taskwarrior is a completely free, open-source, command-line-only task manager (MIT license, in development since 2006) built for individual power users who want a fast, scriptable to-do list rather than a team workspace. One is a collaborative, cloud-based workspace with AI features; the other is a single-user, terminal-based tool with an urgency-scoring algorithm and no GUI.",
  "bestForToolA": "Teams that want tasks living alongside docs, wikis, and databases in one connected workspace, with AI-assisted writing/Q&A and flexible views (table, board, calendar, timeline).",
  "bestForToolB": "Individual command-line users and GTD practitioners who want a free, fast, scriptable task manager with an urgency-scoring algorithm and no GUI overhead.",
  "whoNeedsBoth": "A developer could track personal to-dos in Taskwarrior from the terminal while using Notion separately for team-facing project docs and databases at work — the two don't overlap in interface or audience, so pairing them for different jobs (personal CLI tasks vs. team workspace) is realistic.",
  "keyDifferences": [
    {
      "title": "Interface",
      "toolA": "Notion is a graphical, block-based workspace where any page can embed databases, tasks, images, or other pages.",
      "toolB": "Taskwarrior's core product is a command-line utility; it does not ship a built-in GUI, per its own documented cons.",
      "whyItMatters": "The interface determines who can realistically use the tool day to day — visual workspace users versus terminal-comfortable power users.",
      "benefitsWho": "Non-technical team members benefit from Notion's visual interface; developers and sysadmins benefit from Taskwarrior's scriptable CLI."
    },
    {
      "title": "Pricing",
      "toolA": "Notion offers a free plan, then paid Plus ($10/member/month), Business ($20/member/month), and custom Enterprise pricing.",
      "toolB": "Taskwarrior is completely free and open source under the MIT license with no pricing plans at all.",
      "whyItMatters": "Per-seat SaaS pricing scales with team size, while a free CLI tool has zero licensing cost regardless of usage.",
      "benefitsWho": "Budget-conscious individuals benefit from Taskwarrior; teams needing collaboration features accept Notion's per-member cost."
    },
    {
      "title": "Collaboration Model",
      "toolA": "Notion is built as a connected, multi-user workspace for teams.",
      "toolB": "Taskwarrior documents syncing tasks across a user's own devices, but no team collaboration features.",
      "whyItMatters": "Teams that need shared visibility into tasks and documents need real multi-user collaboration, not just personal device sync.",
      "benefitsWho": "Teams and cross-functional groups benefit from Notion; solo users benefit from Taskwarrior's simpler single-user sync."
    },
    {
      "title": "AI Features",
      "toolA": "Notion includes AI-assisted writing and Q&A over a team's own content, plus configurable AI Custom Agents that automate specific workflows.",
      "toolB": "Taskwarrior has no AI features documented.",
      "whyItMatters": "AI-assisted Q&A and automation can save time synthesizing information across a large connected workspace, which a personal task list doesn't need.",
      "benefitsWho": "Teams managing large volumes of documents and tasks who want AI assistance surfacing information."
    },
    {
      "title": "Task Prioritization Logic",
      "toolA": "Notion offers flexible database views (table, board, calendar, timeline) for organizing tasks, but no documented automatic priority-scoring algorithm.",
      "toolB": "Taskwarrior automatically prioritizes tasks using a documented urgency algorithm based on due dates, tags, and other attributes.",
      "whyItMatters": "An automatic urgency score removes the manual work of deciding what to do next, which pure view-based organization doesn't do by itself.",
      "benefitsWho": "GTD practitioners and individuals who want the tool itself to surface what's most urgent, rather than manually sorting views."
    }
  ],
  "featureMatrix": [
    {
      "group": "Interface & Collaboration",
      "rows": [
        {
          "feature": "Graphical interface",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Taskwarrior ships no built-in GUI"
        },
        {
          "feature": "Command-line interface",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Multi-user team collaboration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Taskwarrior documents device sync, not team collaboration"
        }
      ]
    },
    {
      "group": "Task & Data Organization",
      "rows": [
        {
          "feature": "Flexible views (table/board/calendar/timeline)",
          "toolA": "available",
          "toolB": "limited",
          "note": "Taskwarrior offers filters and customizable reports, not visual boards/calendars"
        },
        {
          "feature": "Automatic urgency/priority scoring",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Recurring tasks",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Configurable recurrence rules"
        }
      ]
    },
    {
      "group": "Pricing & Extensibility",
      "rows": [
        {
          "feature": "Free tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Notion Free plan vs Taskwarrior fully free"
        },
        {
          "feature": "Paid team plans",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Plus $10, Business $20/member/month, Enterprise custom"
        },
        {
          "feature": "Scripting/hooks extensibility",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Hooks API and User Defined Attributes (UDAs)"
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
      "question": "Is Taskwarrior free?",
      "answer": "Yes, Taskwarrior is free and open-source software released under the MIT license."
    },
    {
      "question": "Does Notion have AI features?",
      "answer": "Yes — including AI-assisted writing, Q&A over your own Notion content, and configurable Custom Agents."
    },
    {
      "question": "Does Taskwarrior have a graphical user interface?",
      "answer": "No — Taskwarrior's core product is a command-line utility; it does not ship a built-in GUI."
    },
    {
      "question": "Can Taskwarrior sync tasks across multiple devices?",
      "answer": "Yes, Taskwarrior supports syncing tasks across devices, though setup via Taskserver requires additional configuration."
    },
    {
      "question": "Which tool is better for team collaboration?",
      "answer": "Notion is built as a connected workspace for teams; Taskwarrior does not document team collaboration features, only personal task management and device sync."
    }
  ]
};

export default notionVsTaskwarriorContent;

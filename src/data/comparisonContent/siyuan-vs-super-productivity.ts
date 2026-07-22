import type { ToolComparisonContent } from './types';

const siyuanVsSuperProductivityContent: ToolComparisonContent = {
  "verdict": "SiYuan and Super Productivity solve different problems: SiYuan is a block-based personal knowledge management app with backlinks, a knowledge graph, and spaced-repetition flashcards, while Super Productivity is a task manager with time tracking and a Pomodoro timer built in. SiYuan is freemium, with a free core and one-time paid PRO ($64) or Subscription ($148) tiers unlocking official cloud sync; Super Productivity is entirely free with no paid tier at all.",
  "bestForToolA": "SiYuan fits people building a connected knowledge base who want block-level editing, a graph view of note relationships, and built-in FSRS flashcard review for studying their notes.",
  "bestForToolB": "Super Productivity fits people who need to manage and time-track discrete tasks and to-do items, especially those who want Kanban/Eisenhower boards and direct sync with issue trackers like Jira or GitHub.",
  "whoNeedsBoth": "Someone doing knowledge work could keep reference notes and study flashcards in SiYuan while tracking daily task execution and Pomodoro sessions in Super Productivity - the two serve genuinely different layers (knowledge base vs. task execution) rather than overlapping.",
  "keyDifferences": [
    {
      "title": "Core Purpose",
      "toolA": "SiYuan is a block-level personal knowledge management app built around bidirectional linking and a knowledge graph.",
      "toolB": "Super Productivity is a to-do list and time-tracking app built around task boards, Pomodoro sessions, and issue-tracker sync.",
      "whyItMatters": "Choosing the right category prevents forcing a task tool to act as a knowledge base or vice versa.",
      "benefitsWho": "Anyone deciding whether they need a notes system or a task-execution system benefits from this distinction."
    },
    {
      "title": "Pricing Model",
      "toolA": "SiYuan's free tier has no official cloud storage, sync, or backup; PRO ($64 one-time) and Subscription ($148 one-time) tiers add third-party or official cloud sync.",
      "toolB": "Super Productivity is free and open source under the MIT license with no paid tier documented at all.",
      "whyItMatters": "Whether a paid tier exists at all affects long-term budgeting, especially for cloud sync needs.",
      "benefitsWho": "Budget-conscious users who never want to pay for sync benefit from Super Productivity's fully free model; users wanting official managed cloud sync may accept SiYuan's one-time fee."
    },
    {
      "title": "Knowledge Management Features",
      "toolA": "SiYuan documents bidirectional linking, a knowledge graph, FSRS spaced-repetition flashcards, database/table views, and PDF annotation.",
      "toolB": "None of these note-linking, graph, or flashcard features are documented for Super Productivity.",
      "whyItMatters": "Deep knowledge-linking features are essential for building a long-term reference base, not just tracking to-dos.",
      "benefitsWho": "Researchers, students, and writers who need to connect and review ideas over time benefit from SiYuan's knowledge tools."
    },
    {
      "title": "Task & Time Tracking Features",
      "toolA": "Time tracking and Pomodoro features are not documented for SiYuan.",
      "toolB": "Super Productivity has built-in time tracking, a Pomodoro timer and focus mode, Kanban/Eisenhower boards, and integrations with Jira, GitHub, GitLab, Linear, and more.",
      "whyItMatters": "Native time tracking and issue-tracker sync remove the need for a separate task app alongside a notes app.",
      "benefitsWho": "Developers and freelancers logging billable or focus time benefit from Super Productivity's task and time-tracking features."
    },
    {
      "title": "Deployment & Sync",
      "toolA": "SiYuan runs self-hosted or via Docker, with third-party S3/WebDAV sync on the PRO tier and official cloud sync/8GB storage on the Subscription tier.",
      "toolB": "Super Productivity syncs data across devices via Dropbox, WebDAV, or CalDAV without requiring user registration, and has no official cloud tier at all.",
      "whyItMatters": "How sync is delivered - paid official cloud vs. free user-configured backends - affects setup effort and ongoing cost.",
      "benefitsWho": "Users who want a maintained official sync service may prefer SiYuan's paid tiers; users who prefer configuring their own free backend benefit from Super Productivity's approach."
    }
  ],
  "featureMatrix": [
    {
      "group": "Knowledge Capture & Organization",
      "rows": [
        {
          "feature": "Bidirectional linking/backlinks",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Knowledge graph view",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Spaced-repetition flashcards",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "SiYuan uses the FSRS algorithm"
        },
        {
          "feature": "PDF annotation",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Database/table views",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Task & Time Management",
      "rows": [
        {
          "feature": "Subtask management",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Time tracking",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Pomodoro timer",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Issue tracker integrations",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Jira, GitHub, GitLab, Gitea, OpenProject, Linear, ClickUp, Azure DevOps"
        },
        {
          "feature": "Kanban/Eisenhower boards",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Platforms & Sync",
      "rows": [
        {
          "feature": "Self-hosting / Docker deployment",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Free tier available",
          "toolA": "available",
          "toolB": "available",
          "note": "SiYuan free tier excludes official cloud sync"
        },
        {
          "feature": "Paid cloud sync tier",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "SiYuan PRO $64 one-time / Subscription $148 one-time"
        },
        {
          "feature": "Native mobile apps",
          "toolA": "available",
          "toolB": "available",
          "note": "SiYuan: iOS/Android/HarmonyOS; SP: iOS/Android"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Are SiYuan and Super Productivity solving the same problem?",
      "answer": "No - SiYuan is a personal knowledge management app focused on linked notes and a knowledge graph, while Super Productivity is a task manager with time tracking and Pomodoro sessions."
    },
    {
      "question": "Does Super Productivity have a paid tier?",
      "answer": "No, Super Productivity is completely free and open source under the MIT license, with no paid tier documented."
    },
    {
      "question": "What does SiYuan's paid tier unlock?",
      "answer": "The PRO tier ($64 one-time) adds third-party S3/WebDAV sync and backup. The Subscription tier ($148 one-time) adds official cloud sync, 8GB of official cloud storage, cloud asset hosting, and a cloud inbox."
    },
    {
      "question": "Does SiYuan support Pomodoro or time tracking?",
      "answer": "That's not documented in the facts - SiYuan's documented features center on block editing, linking, flashcards, and PDF annotation rather than time tracking."
    },
    {
      "question": "Does Super Productivity support bidirectional linking or a graph view like SiYuan?",
      "answer": "No such feature is documented for Super Productivity; its focus is task boards, subtasks, and time tracking rather than note linking."
    },
    {
      "question": "Which tool supports flashcards for spaced repetition?",
      "answer": "SiYuan, via its built-in flashcard review using the FSRS spaced-repetition algorithm. This isn't documented for Super Productivity."
    }
  ]
};

export default siyuanVsSuperProductivityContent;

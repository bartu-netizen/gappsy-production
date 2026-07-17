import type { ToolComparisonContent } from './types';

const superProductivityVsTaskwarriorContent: ToolComparisonContent = {
  "verdict": "Super Productivity and Taskwarrior are both completely free, open-source task managers, but they're built for opposite ends of the interface spectrum. Super Productivity is a graphical app with Kanban boards, an Eisenhower matrix, built-in time tracking, and a Pomodoro timer, plus direct integrations with issue trackers like Jira, GitHub, and Linear. Taskwarrior is a command-line-only tool dating back to 2006 that uses an urgency-scoring algorithm to auto-prioritize tasks and is extended through user-defined attributes (UDAs) and a hooks API rather than a GUI or plugin marketplace.",
  "bestForToolA": "Super Productivity fits people who want a visual, all-in-one workspace combining task boards, time tracking, and Pomodoro focus sessions, especially developers who want tasks synced from Jira, GitHub, GitLab, or Linear.",
  "bestForToolB": "Taskwarrior fits command-line-native power users and GTD practitioners who want a fast, scriptable task tool they can extend with custom attributes and hooks, without needing a graphical interface.",
  "whoNeedsBoth": "A developer could track deep-work sessions and sprint boards visually in Super Productivity while using Taskwarrior's urgency algorithm and hooks API to script personal task automation from the terminal - though the two aren't documented to interoperate, so tasks would need to be maintained separately in each.",
  "keyDifferences": [
    {
      "title": "Interface Paradigm",
      "toolA": "Super Productivity is a graphical app with Kanban boards, an Eisenhower matrix, compact lists, and custom layouts.",
      "toolB": "Taskwarrior's core product is a command-line utility; it does not ship a built-in GUI, requiring comfort with the terminal.",
      "whyItMatters": "The interface determines both the learning curve and whether the tool suits visual planners versus keyboard-driven workflows.",
      "benefitsWho": "Visual planners and non-technical users benefit from Super Productivity's GUI; terminal-native developers benefit from Taskwarrior's CLI speed."
    },
    {
      "title": "Time Tracking & Focus Tools",
      "toolA": "Super Productivity has built-in time tracking with keyboard shortcuts, detailed work logs, a Pomodoro timer, and a focus mode to reduce distractions.",
      "toolB": "Time tracking and Pomodoro features are not documented as part of Taskwarrior's feature set.",
      "whyItMatters": "Combining task management with time tracking in one tool avoids needing a separate timer or logging app.",
      "benefitsWho": "Freelancers and deep-work practitioners who need to log hours per task benefit from Super Productivity's built-in time tracking."
    },
    {
      "title": "Task Prioritization Logic",
      "toolA": "Task prioritization in Super Productivity is manual, via boards, due dates, and subtasks; no automated urgency algorithm is documented.",
      "toolB": "Taskwarrior automatically prioritizes tasks using an urgency algorithm based on due dates, tags, and other attributes.",
      "whyItMatters": "An automated urgency score removes the need to manually re-sort a growing task list every day.",
      "benefitsWho": "Power users managing large, complex task lists benefit from Taskwarrior's automated urgency scoring."
    },
    {
      "title": "Issue Tracker Integrations",
      "toolA": "Super Productivity imports and syncs tasks from Jira, GitHub, GitLab, Gitea, OpenProject, Linear, ClickUp, and Azure DevOps.",
      "toolB": "Direct issue-tracker integrations are not documented for Taskwarrior; extensibility instead comes through its hooks API and UDAs.",
      "whyItMatters": "Native integrations save engineering teams from manually re-entering tickets as personal tasks.",
      "benefitsWho": "Software teams already using Jira, GitHub, or Linear benefit from Super Productivity's direct issue-tracker sync."
    },
    {
      "title": "Mobile App Availability",
      "toolA": "Super Productivity runs natively on Windows, macOS, Linux, Android, iOS, and as a web app.",
      "toolB": "Native mobile apps are not part of the core Taskwarrior project.",
      "whyItMatters": "Native mobile access determines whether a user can manage tasks away from a desktop or terminal.",
      "benefitsWho": "Users who need to check or add tasks from a phone benefit from Super Productivity's native Android and iOS apps."
    }
  ],
  "featureMatrix": [
    {
      "group": "Task Management Core",
      "rows": [
        {
          "feature": "Subtasks",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Recurring/repeating tasks",
          "toolA": "available",
          "toolB": "available",
          "note": "Taskwarrior uses configurable recurrence rules"
        },
        {
          "feature": "Tags for categorization",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Taskwarrior has user-defined and built-in virtual tags"
        },
        {
          "feature": "Time tracking",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Pomodoro timer / focus mode",
          "toolA": "available",
          "toolB": "unavailable"
        }
      ]
    },
    {
      "group": "Interface & Platforms",
      "rows": [
        {
          "feature": "Graphical user interface",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Taskwarrior ships no built-in GUI"
        },
        {
          "feature": "Command-line interface",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Native mobile apps (iOS/Android)",
          "toolA": "available",
          "toolB": "unavailable"
        },
        {
          "feature": "Web app",
          "toolA": "available",
          "toolB": "not-documented"
        }
      ]
    },
    {
      "group": "Extensibility & Integrations",
      "rows": [
        {
          "feature": "Issue tracker integrations (Jira, GitHub, GitLab, etc.)",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Custom fields/attributes",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Taskwarrior's User Defined Attributes (UDAs)"
        },
        {
          "feature": "Hooks/scripting or plugin system",
          "toolA": "available",
          "toolB": "available",
          "note": "SP: plugin system; Taskwarrior: hooks API"
        },
        {
          "feature": "Cross-device sync",
          "toolA": "available",
          "toolB": "available",
          "note": "SP via Dropbox/WebDAV/CalDAV, no account; Taskwarrior via Taskserver setup"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Super Productivity have a command-line interface?",
      "answer": "That's not documented in the facts - Super Productivity is described as a graphical to-do and time-tracking app across desktop, mobile, and web."
    },
    {
      "question": "Is Taskwarrior free to use?",
      "answer": "Yes, Taskwarrior is free and open-source software released under the MIT license, with development dating back to 2006."
    },
    {
      "question": "Which tool has a built-in Pomodoro timer?",
      "answer": "Super Productivity has a built-in Pomodoro timer and focus mode; this isn't documented as a Taskwarrior feature."
    },
    {
      "question": "Does Taskwarrior have native mobile apps?",
      "answer": "No - native mobile apps are not part of the core Taskwarrior project, unlike Super Productivity's Android and iOS apps."
    },
    {
      "question": "Can I sync tasks from Jira into either tool?",
      "answer": "Super Productivity documents direct import and sync from Jira, GitHub, GitLab, Gitea, OpenProject, Linear, ClickUp, and Azure DevOps. This isn't documented for Taskwarrior, though its hooks API allows custom scripting."
    },
    {
      "question": "How does each tool handle syncing across devices?",
      "answer": "Super Productivity syncs via Dropbox, WebDAV, or CalDAV without requiring user registration. Taskwarrior supports syncing too, but via its Taskserver component, which requires additional configuration."
    }
  ]
};

export default superProductivityVsTaskwarriorContent;

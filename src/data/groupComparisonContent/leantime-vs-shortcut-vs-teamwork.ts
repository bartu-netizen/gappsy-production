import type { GroupComparisonContent } from './types';

const leantimeVsShortcutVsTeamworkContent: GroupComparisonContent = {
  "verdict": "Leantime, Shortcut, and Teamwork all track tasks and projects, but they optimize for different buyers: Leantime is a free, self-hosted, neurodivergent-friendly alternative to commercial PM software, Shortcut is purpose-built for software engineering teams shipping code, and Teamwork bundles project tracking with the time tracking and invoicing that client-services agencies need. None is a drop-in replacement for the others once a team's core workflow (open-source self-hosting, sprint-based dev work, or billable client projects) is decided, so the right pick depends heavily on who is actually running the projects.",
  "bestFor": {
    "leantime": "Small teams, freelancers, and neurodivergent-led organizations that want a free, self-hosted, goal-first PM tool without per-seat SaaS costs.",
    "shortcut": "Software engineering teams that want lightweight Kanban and sprint-style Iterations tied directly to GitHub, GitLab, and Slack.",
    "teamwork": "Agencies and consultancies that need project planning, time tracking, and client invoicing combined in one connected system."
  },
  "highlights": [
    {
      "title": "Leantime is the only genuinely free, self-hosted option",
      "description": "Leantime's Community Edition is free and open source under AGPLv3 with no user limits, while Shortcut and Teamwork only offer free tiers capped at 10 and 5 users respectively.",
      "toolSlugs": [
        "leantime"
      ]
    },
    {
      "title": "Shortcut is purpose-built for engineering workflows",
      "description": "Shortcut combines Stories, sprint-style Iterations, and native GitHub, GitLab, Figma, and Slack integrations in a lighter interface than general PM tools, aimed specifically at software teams.",
      "toolSlugs": [
        "shortcut"
      ]
    },
    {
      "title": "Teamwork is the only one built for client billing",
      "description": "Teamwork pairs project and task tracking with native time tracking, budgeting, and invoicing that syncs to Xero and QuickBooks, a workflow Leantime and Shortcut do not offer.",
      "toolSlugs": [
        "teamwork"
      ]
    },
    {
      "title": "All three ship an AI assistant on paid plans",
      "description": "Leantime Cloud Pro and Teamwork's paid plans include built-in AI features (AI-powered task management and Teamwork AI respectively), while Shortcut's public feature set does not document a comparable AI assistant.",
      "toolSlugs": [
        "leantime",
        "teamwork",
        "shortcut"
      ]
    },
    {
      "title": "Leantime designs explicitly for neurodivergent users",
      "description": "Leantime markets goal- and motivation-based workflows built to reduce cognitive load for ADHD, autism, and dyslexia, a design angle neither Shortcut nor Teamwork addresses.",
      "toolSlugs": [
        "leantime"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Planning and Tracking",
      "rows": [
        {
          "feature": "Kanban boards",
          "statuses": {
            "leantime": "available",
            "shortcut": "available",
            "teamwork": "available"
          }
        },
        {
          "feature": "Gantt or timeline views",
          "statuses": {
            "leantime": "available",
            "shortcut": "not-documented",
            "teamwork": "available"
          },
          "note": "Shortcut offers Roadmaps and Objectives but does not document a dedicated Gantt chart view."
        },
        {
          "feature": "Built-in time tracking",
          "statuses": {
            "leantime": "available",
            "shortcut": "not-documented",
            "teamwork": "available"
          }
        }
      ]
    },
    {
      "group": "Team and Client Collaboration",
      "rows": [
        {
          "feature": "Client billing and invoicing",
          "statuses": {
            "leantime": "unavailable",
            "shortcut": "unavailable",
            "teamwork": "available"
          }
        },
        {
          "feature": "Native GitHub or GitLab integration",
          "statuses": {
            "leantime": "not-documented",
            "shortcut": "available",
            "teamwork": "not-documented"
          }
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI-assisted task management",
          "statuses": {
            "leantime": "available",
            "shortcut": "not-documented",
            "teamwork": "available"
          },
          "note": "Leantime's AI features are Cloud Pro-only; Teamwork AI is included on paid plans."
        }
      ]
    },
    {
      "group": "Deployment and Pricing",
      "rows": [
        {
          "feature": "Free self-hosted or open-source edition",
          "statuses": {
            "leantime": "available",
            "shortcut": "unavailable",
            "teamwork": "unavailable"
          }
        },
        {
          "feature": "Free hosted plan",
          "statuses": {
            "leantime": "unavailable",
            "shortcut": "available",
            "teamwork": "available"
          },
          "note": "Leantime's free tier is the self-hosted Community Edition rather than a hosted free plan; Shortcut's free plan covers up to 10 users and Teamwork's covers up to 5 users and 5 projects."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these tools is best for software development teams?",
      "answer": "Shortcut is the most purpose-built option, combining Kanban Stories, sprint-style Iterations, and native GitHub, GitLab, and Figma integrations designed specifically around how engineering teams plan and ship code."
    },
    {
      "question": "Is there a free, self-hosted alternative among these three?",
      "answer": "Yes. Leantime's Community Edition is free, open source under AGPLv3, and has no user limits, as long as the team is comfortable deploying and maintaining it on their own infrastructure."
    },
    {
      "question": "Which tool handles client billing and invoicing?",
      "answer": "Teamwork is the only one of the three built around billable client work, with native time tracking, budgeting, and invoicing that syncs to Xero and QuickBooks."
    },
    {
      "question": "Do Leantime, Shortcut, and Teamwork offer AI features?",
      "answer": "Leantime Cloud Pro and Teamwork's paid plans both include AI assistants for task management and workflow suggestions. Shortcut's publicly documented feature set does not include a comparable AI assistant."
    },
    {
      "question": "Which is the cheapest way to get started?",
      "answer": "Leantime's self-hosted Community Edition is free with no user cap, making it the lowest-cost entry point for teams willing to self-host. For hosted options, Shortcut and Teamwork both offer free tiers for small teams (up to 10 and 5 users respectively) before paid plans start."
    },
    {
      "question": "Is any of these three designed for neurodivergent users specifically?",
      "answer": "Leantime is explicitly marketed as friendly to neurodivergent users, including people with ADHD, autism, and dyslexia, with goal- and motivation-based workflows built to reduce cognitive load. Shortcut and Teamwork do not make this a specific design focus."
    }
  ]
};

export default leantimeVsShortcutVsTeamworkContent;

import type { GroupComparisonContent } from './types';

const hulyVsKanboardVsShortcutContent: GroupComparisonContent = {
  "verdict": "Huly and Kanboard are both open source and self-hostable, but Huly bundles issue tracking with docs, chat, and video into one connected workspace while Kanboard stays deliberately minimal, a single kanban board with automation rules and nothing more. Shortcut takes a different path entirely as a polished, closed-source SaaS built specifically for software teams, adding sprint-style Iterations and native GitHub and GitLab sync that neither open-source option documents.",
  "bestFor": {
    "huly": "Teams wanting a self-hosted, all-in-one alternative that replaces separate issue tracking, docs, chat, and video tools.",
    "kanboard": "Developers and sysadmins who want the lightest possible self-hosted kanban board with no paid tiers.",
    "shortcut": "Software teams that want a polished managed SaaS tool with sprint planning and native GitHub or GitLab workflows."
  },
  "highlights": [
    {
      "title": "Open source and self-hostable",
      "description": "Huly and Kanboard can both be deployed on a team's own infrastructure at no licensing cost, an option Shortcut does not offer.",
      "toolSlugs": [
        "huly",
        "kanboard"
      ]
    },
    {
      "title": "All-in-one workspace",
      "description": "Huly combines issue tracking, docs, chat, and video conferencing in a single connected data model, replacing several separate tools.",
      "toolSlugs": [
        "huly"
      ]
    },
    {
      "title": "Minimal, lightweight footprint",
      "description": "Kanboard is a deliberately feature-light PHP and SQLite application that runs on modest hardware without extra modules to configure.",
      "toolSlugs": [
        "kanboard"
      ]
    },
    {
      "title": "Sprint-style Iterations for software teams",
      "description": "Shortcut organizes work into Iterations with velocity tracking, a planning structure purpose-built for engineering teams.",
      "toolSlugs": [
        "shortcut"
      ]
    },
    {
      "title": "Native GitHub and GitLab sync",
      "description": "Huly and Shortcut both offer two-way issue and pull request synchronization with GitHub, tying project tracking directly to code.",
      "toolSlugs": [
        "huly",
        "shortcut"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment and Openness",
      "rows": [
        {
          "feature": "Self-hosted deployment",
          "statuses": {
            "huly": "available",
            "kanboard": "available",
            "shortcut": "unavailable"
          }
        },
        {
          "feature": "Open-source codebase",
          "statuses": {
            "huly": "available",
            "kanboard": "available",
            "shortcut": "unavailable"
          }
        }
      ]
    },
    {
      "group": "Collaboration Modules",
      "rows": [
        {
          "feature": "Built-in docs or knowledge base",
          "statuses": {
            "huly": "available",
            "kanboard": "not-documented",
            "shortcut": "available"
          }
        },
        {
          "feature": "Built-in chat or video conferencing",
          "statuses": {
            "huly": "available",
            "kanboard": "not-documented",
            "shortcut": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Development Workflow",
      "rows": [
        {
          "feature": "Sprint or iteration planning",
          "statuses": {
            "huly": "not-documented",
            "kanboard": "not-documented",
            "shortcut": "available"
          }
        },
        {
          "feature": "Native GitHub two-way sync",
          "statuses": {
            "huly": "available",
            "kanboard": "not-documented",
            "shortcut": "available"
          },
          "note": "Kanboard supports GitHub as an OAuth2 login provider but does not document two-way issue or pull request sync."
        }
      ]
    },
    {
      "group": "Pricing",
      "rows": [
        {
          "feature": "Usable free tier",
          "statuses": {
            "huly": "available",
            "kanboard": "available",
            "shortcut": "available"
          }
        },
        {
          "feature": "Published per-user SaaS pricing",
          "statuses": {
            "huly": "unavailable",
            "kanboard": "unavailable",
            "shortcut": "available"
          },
          "note": "Huly's hosted tiers are flat monthly fees rather than per-user, and Kanboard has no official vendor-run SaaS."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Can all three of these be self-hosted?",
      "answer": "Huly and Kanboard can both be self-hosted for free using Docker. Shortcut is SaaS only and does not offer a self-hosted deployment option."
    },
    {
      "question": "Which of the three is the lightest weight to run?",
      "answer": "Kanboard, since it runs on a simple PHP and SQLite stack with minimal server requirements compared to Huly's multi-service architecture."
    },
    {
      "question": "Does Huly include built-in video calls?",
      "answer": "Yes. Huly includes native audio and video conferencing rooms as part of its all-in-one workspace, alongside chat and docs."
    },
    {
      "question": "Which tool is built specifically for software teams' sprints?",
      "answer": "Shortcut, through its Iterations feature, which provides sprint-style planning cycles with velocity and progress tracking."
    },
    {
      "question": "Is there a free option for each tool?",
      "answer": "Yes. Huly offers a free hosted plan and free self-hosting, Kanboard is entirely free to self-host, and Shortcut has a free plan for teams up to 10 users."
    },
    {
      "question": "Which tools integrate natively with GitHub for two-way issue sync?",
      "answer": "Huly and Shortcut both document native two-way GitHub issue and pull request synchronization; Kanboard offers GitHub login but not issue sync."
    }
  ]
};

export default hulyVsKanboardVsShortcutContent;

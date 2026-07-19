import type { GroupComparisonContent } from './types';

const hulyVsKanboardVsTaigaContent: GroupComparisonContent = {
  "verdict": "All three tools are open source and self-hostable, but each targets a different sweet spot: Huly bundles issue tracking with docs, chat, and video for a single all-in-one workspace, Kanboard stays a deliberately minimal single-board kanban tool, and Taiga sits between the two with purpose-built Scrum ceremonies like backlog grooming, sprint planning, and epics layered on top of Kanban.",
  "bestFor": {
    "huly": "Teams wanting an open-source all-in-one workspace that replaces several separate SaaS tools.",
    "kanboard": "Developers who want the simplest, lightest self-hosted kanban board with no feature paywalls.",
    "taiga": "Agile teams that specifically run Scrum ceremonies, such as backlog grooming and sprint planning, and want that structure available open source."
  },
  "highlights": [
    {
      "title": "Fully open source and self-hostable",
      "description": "Huly, Kanboard, and Taiga can all be deployed on a team's own infrastructure at no licensing cost, making them fits for privacy- or cost-conscious teams.",
      "toolSlugs": [
        "huly",
        "kanboard",
        "taiga"
      ]
    },
    {
      "title": "All-in-one workspace",
      "description": "Huly combines issue tracking, docs, chat, and video conferencing into a single connected data model rather than requiring separate tools.",
      "toolSlugs": [
        "huly"
      ]
    },
    {
      "title": "Minimalist single-board simplicity",
      "description": "Kanboard offers one configurable kanban board per project with automation rules, without the broader collaboration modules the other two include.",
      "toolSlugs": [
        "kanboard"
      ]
    },
    {
      "title": "Purpose-built Scrum backlog and sprints",
      "description": "Taiga provides dedicated backlog management, sprint planning, and epics specifically for teams running formal Scrum workflows.",
      "toolSlugs": [
        "taiga"
      ]
    },
    {
      "title": "Official managed cloud as an alternative to self-hosting",
      "description": "Huly and Taiga both offer vendor-run hosted plans for teams that want the software without managing servers; Kanboard relies on third-party hosts instead.",
      "toolSlugs": [
        "huly",
        "taiga"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Deployment",
      "rows": [
        {
          "feature": "Self-hosted deployment option",
          "statuses": {
            "huly": "available",
            "kanboard": "available",
            "taiga": "available"
          }
        },
        {
          "feature": "Free self-hosting with no license fee",
          "statuses": {
            "huly": "available",
            "kanboard": "available",
            "taiga": "available"
          }
        }
      ]
    },
    {
      "group": "Agile Planning",
      "rows": [
        {
          "feature": "Scrum backlog and sprint planning",
          "statuses": {
            "huly": "not-documented",
            "kanboard": "not-documented",
            "taiga": "available"
          }
        },
        {
          "feature": "Epics for roadmap-level grouping",
          "statuses": {
            "huly": "not-documented",
            "kanboard": "not-documented",
            "taiga": "available"
          }
        }
      ]
    },
    {
      "group": "Collaboration Modules",
      "rows": [
        {
          "feature": "Built-in docs, chat, or video",
          "statuses": {
            "huly": "available",
            "kanboard": "not-documented",
            "taiga": "not-documented"
          }
        },
        {
          "feature": "Event-triggered task automation",
          "statuses": {
            "huly": "not-documented",
            "kanboard": "available",
            "taiga": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Managed Cloud Pricing",
      "rows": [
        {
          "feature": "Official vendor-hosted cloud plan",
          "statuses": {
            "huly": "available",
            "kanboard": "unavailable",
            "taiga": "available"
          },
          "note": "Kanboard has no official vendor cloud; third-party hosts sell managed Kanboard instances instead."
        },
        {
          "feature": "Free cloud tier",
          "statuses": {
            "huly": "available",
            "kanboard": "unavailable",
            "taiga": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is purpose-built for Scrum?",
      "answer": "Taiga, which offers a dedicated backlog, sprint planning, and epics alongside its Kanban board, unlike Huly and Kanboard, which do not document Scrum-specific ceremonies."
    },
    {
      "question": "Are all three free to self-host?",
      "answer": "Yes. Huly, Kanboard, and Taiga are all open source and can be self-hosted at no licensing cost, though each has different server requirements."
    },
    {
      "question": "Does Kanboard offer an official cloud version?",
      "answer": "No. Kanboard has no vendor-run cloud plan; teams that do not want to self-host can use third-party managed hosting providers instead."
    },
    {
      "question": "Which tool bundles chat and video calls with task tracking?",
      "answer": "Huly, which includes native instant messaging and audio and video conferencing rooms alongside its issue tracker and docs."
    },
    {
      "question": "What license is each tool released under?",
      "answer": "Huly uses the EPL-2.0 license, Kanboard uses the permissive MIT License, and Taiga is released under AGPL-3.0-or-later."
    },
    {
      "question": "Which tool has automation rules for moving tasks between statuses?",
      "answer": "Kanboard, through its automatic actions that trigger on events like a task moving columns or changing color, without needing external workflow tools."
    }
  ]
};

export default hulyVsKanboardVsTaigaContent;

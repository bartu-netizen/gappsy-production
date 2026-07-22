import type { GroupComparisonContent } from './types';

const portfoleonVsRoadmunkVsSleekplanContent: GroupComparisonContent = {
  "verdict": "Portfoleon and Roadmunk are internal-facing roadmap and portfolio planning tools for product managers and PMOs, while Sleekplan centers on collecting and prioritizing customer feedback through a public feedback board, roadmap, and changelog. All three help a team communicate what is being built and why, but the buyer differs: enterprise portfolio planning versus customer-facing feedback management.",
  "bestFor": {
    "portfoleon": "PMOs and enterprise product teams that need multi-level portfolio rollups and OKR-linked roadmaps at a lower price point, with a usable free tier",
    "roadmunk": "teams in the Jira and Tempo ecosystem that want multiple roadmap visualization formats, timeline, swimlane, and Kanban, plus built-in prioritization scoring",
    "sleekplan": "small SaaS teams that want an all-in-one customer feedback board, public roadmap, changelog, and CSAT/NPS surveys with AI-assisted triage"
  },
  "highlights": [
    {
      "title": "Free tiers differ significantly",
      "description": "Portfoleon's free plan supports up to 10 users, 2 portfolios, and 5 boards indefinitely, Sleekplan's Indie plan offers unlimited feedback and subscribers on a single-admin workspace, and Roadmunk has no permanent free plan, only a 14-day trial on paid tiers.",
      "toolSlugs": [
        "portfoleon",
        "sleekplan",
        "roadmunk"
      ]
    },
    {
      "title": "Sleekplan automates feedback triage with AI",
      "description": "Sleekplan's Sleek Intelligence feature uses AI to read incoming conversations and reviews, auto-file feature requests and bug reports, merge duplicates, and auto-vote on existing items, a capability not documented for Portfoleon or Roadmunk.",
      "toolSlugs": [
        "sleekplan"
      ]
    },
    {
      "title": "Roadmunk offers the most roadmap view formats",
      "description": "Roadmunk lets teams build roadmaps as timelines, swimlanes, or Kanban boards and has operated inside Tempo's Jira-adjacent Strategic Roadmaps suite since its 2021 acquisition, giving it deeper backlog integrations than Portfoleon or Sleekplan document.",
      "toolSlugs": [
        "roadmunk"
      ]
    },
    {
      "title": "Portfoleon is built for portfolio-of-portfolios strategy work",
      "description": "Portfoleon's linked boards, custom fields, dependencies, and drafts-and-revisions workflow are purpose-built for rolling individual roadmaps up into company-wide portfolio views, rather than for collecting customer-facing feedback.",
      "toolSlugs": [
        "portfoleon"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Roadmap Planning",
      "rows": [
        {
          "feature": "Multiple roadmap view formats (timeline, swimlane, Kanban)",
          "statuses": {
            "portfoleon": "limited",
            "roadmunk": "available",
            "sleekplan": "not-documented"
          },
          "note": "Portfoleon documents drag-and-drop timeline boards specifically, not swimlane or Kanban views."
        },
        {
          "feature": "Portfolio-level rollups across multiple roadmaps",
          "statuses": {
            "portfoleon": "available",
            "roadmunk": "available",
            "sleekplan": "unavailable"
          },
          "note": "Roadmunk's portfolio views are gated to its Business tier and above."
        }
      ]
    },
    {
      "group": "Feedback and Prioritization",
      "rows": [
        {
          "feature": "Public customer feedback board with voting",
          "statuses": {
            "portfoleon": "unavailable",
            "roadmunk": "limited",
            "sleekplan": "available"
          },
          "note": "Roadmunk's feedback and request management is a paid-tier add-on, not a core feature like Sleekplan's."
        },
        {
          "feature": "Built-in prioritization scoring framework",
          "statuses": {
            "portfoleon": "not-documented",
            "roadmunk": "available",
            "sleekplan": "not-documented"
          }
        },
        {
          "feature": "Public changelog for release announcements",
          "statuses": {
            "portfoleon": "not-documented",
            "roadmunk": "not-documented",
            "sleekplan": "available"
          }
        },
        {
          "feature": "AI-assisted feedback triage",
          "statuses": {
            "portfoleon": "unavailable",
            "roadmunk": "unavailable",
            "sleekplan": "available"
          }
        }
      ]
    },
    {
      "group": "Pricing and Access",
      "rows": [
        {
          "feature": "Permanent free tier",
          "statuses": {
            "portfoleon": "available",
            "roadmunk": "unavailable",
            "sleekplan": "available"
          }
        },
        {
          "feature": "API access",
          "statuses": {
            "portfoleon": "not-documented",
            "roadmunk": "not-documented",
            "sleekplan": "available"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which tool is best for enterprise portfolio management across multiple product lines?",
      "answer": "Portfoleon and Roadmunk both offer portfolio-level rollups; Portfoleon is purpose-built around linked portfolio and OKR boards, while Roadmunk gates its portfolio views to its Business tier and above."
    },
    {
      "question": "Which is best for collecting and prioritizing customer feature requests?",
      "answer": "Sleekplan, since its feedback board, roadmap, and changelog are built specifically around customer input. Roadmunk offers feedback management as an add-on to its core roadmapping tool, while Portfoleon does not document a customer feedback board."
    },
    {
      "question": "Do any of these tools have a genuinely free plan?",
      "answer": "Portfoleon and Sleekplan both offer usable, indefinite free tiers. Roadmunk has no permanent free plan, only a 14-day free trial on its paid tiers."
    },
    {
      "question": "Does any of these platforms use AI to help manage feedback?",
      "answer": "Only Sleekplan, through its Sleek Intelligence feature, which auto-files, deduplicates, and votes on incoming feedback."
    },
    {
      "question": "Which of these integrates most closely with Jira?",
      "answer": "Roadmunk, which has operated within Tempo's Jira-adjacent Strategic Roadmaps suite since being acquired by Tempo in 2021."
    },
    {
      "question": "Which is the cheapest way to get started with paid features?",
      "answer": "Sleekplan's Starter plan begins at $13/month billed yearly, undercutting Roadmunk's $19/user/month Starter plan and Portfoleon's $24/user/month Roadmapping plan."
    }
  ]
};

export default portfoleonVsRoadmunkVsSleekplanContent;

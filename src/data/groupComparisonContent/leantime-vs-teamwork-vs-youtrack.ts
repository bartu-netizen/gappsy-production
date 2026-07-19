import type { GroupComparisonContent } from './types';

const leantimeVsTeamworkVsYoutrackContent: GroupComparisonContent = {
  "verdict": "Leantime, Teamwork, and YouTrack all offer a free tier, but they target different teams: Leantime is a free, self-hostable open-source tool built with neurodivergent-friendly workflows and strategic planning tools like Lean Canvas, Teamwork bundles project management with the time tracking and client billing agencies need, and YouTrack pairs JetBrains-grade issue tracking with a fully featured free plan for up to 10 users. Self-hosting is only realistic with Leantime or YouTrack's Server edition, while Teamwork is SaaS-only and leans hardest into client-facing billing.",
  "bestFor": {
    "leantime": "Small teams, including neurodivergent-friendly teams, that want a free, self-hostable open-source project management tool with built-in strategic planning features.",
    "teamwork": "Agencies and client-services teams that need project management combined with time tracking, budgeting, and client billing in one system.",
    "youtrack": "Software and cross-functional teams that want JetBrains-backed issue tracking with a full-featured free plan for up to 10 users."
  },
  "highlights": [
    {
      "title": "Built for Neurodivergent Workflows",
      "description": "Leantime is explicitly designed with ADHD and neurodivergent-friendly workflows in mind, alongside strategic planning tools like Lean Canvas and SWOT that go beyond a typical task board.",
      "toolSlugs": [
        "leantime"
      ]
    },
    {
      "title": "Client Billing Baked In",
      "description": "Teamwork bundles time tracking, budgeting, and client invoicing directly into its project management core, a combination most competitors sell as separate tools.",
      "toolSlugs": [
        "teamwork"
      ]
    },
    {
      "title": "A Free Plan With No Feature Cliff",
      "description": "YouTrack's free tier supports up to 10 users with the complete feature set on Cloud or Server, rather than a stripped-down trial version of the paid product.",
      "toolSlugs": [
        "youtrack"
      ]
    },
    {
      "title": "Self-Hosting Is Only Possible With Two of the Three",
      "description": "Leantime and YouTrack both offer self-hosted deployment options for teams that want full data control, while Teamwork is a SaaS-only platform.",
      "toolSlugs": [
        "leantime",
        "youtrack"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Planning",
      "rows": [
        {
          "feature": "Kanban board",
          "statuses": {
            "leantime": "available",
            "teamwork": "available",
            "youtrack": "available"
          }
        },
        {
          "feature": "Gantt or timeline view",
          "statuses": {
            "leantime": "available",
            "teamwork": "available",
            "youtrack": "available"
          }
        }
      ]
    },
    {
      "group": "Collaboration and Knowledge",
      "rows": [
        {
          "feature": "Built-in time tracking",
          "statuses": {
            "leantime": "available",
            "teamwork": "available",
            "youtrack": "available"
          }
        },
        {
          "feature": "Knowledge base or project wiki",
          "statuses": {
            "leantime": "available",
            "teamwork": "not-documented",
            "youtrack": "available"
          }
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "AI-assisted task or issue features",
          "statuses": {
            "leantime": "limited",
            "teamwork": "available",
            "youtrack": "available"
          },
          "note": "Leantime's AI-powered task management is a Cloud-only feature and is not included in the free self-hosted Community Edition."
        }
      ]
    },
    {
      "group": "Deployment and Access",
      "rows": [
        {
          "feature": "Self-hosted deployment option",
          "statuses": {
            "leantime": "available",
            "teamwork": "unavailable",
            "youtrack": "available"
          }
        },
        {
          "feature": "Free plan with full feature access",
          "statuses": {
            "leantime": "available",
            "teamwork": "available",
            "youtrack": "available"
          }
        },
        {
          "feature": "Client billing and invoicing",
          "statuses": {
            "leantime": "not-documented",
            "teamwork": "available",
            "youtrack": "not-documented"
          }
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Leantime, Teamwork, or YouTrack is free to use?",
      "answer": "Leantime's self-hosted Community Edition is free and unrestricted under an AGPLv3 license. Teamwork offers a free plan for up to 5 users and 5 projects, and YouTrack offers a free plan for up to 10 users with the complete feature set."
    },
    {
      "question": "Can any of these three be self-hosted?",
      "answer": "Leantime and YouTrack both support self-hosted deployment, Leantime through its open-source Community Edition and YouTrack through its Server edition. Teamwork is only available as a hosted SaaS product."
    },
    {
      "question": "Which tool is best suited to agencies that bill clients for their time?",
      "answer": "Teamwork is purpose-built for this, combining project views with native time tracking, budgeting, and client invoicing in one system. Neither Leantime nor YouTrack documents built-in client billing features."
    },
    {
      "question": "Do Leantime, Teamwork, and YouTrack all include AI features?",
      "answer": "All three document some AI capability: Leantime offers AI-powered task management on its Cloud plans, Teamwork includes Teamwork AI, and YouTrack offers AI text-to-issue conversion and a writing assistant."
    },
    {
      "question": "Which is the better fit for a general software engineering team versus an agency?",
      "answer": "YouTrack leans toward software and cross-functional engineering teams with its issue-tracking roots at JetBrains, while Teamwork is built specifically around client-facing agency work. Leantime sits in between, aimed at teams of any type that want a free, strategy-focused planning tool."
    }
  ]
};

export default leantimeVsTeamworkVsYoutrackContent;

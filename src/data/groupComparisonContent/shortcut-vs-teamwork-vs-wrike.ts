import type { GroupComparisonContent } from './types';

const shortcutVsTeamworkVsWrikeContent: GroupComparisonContent = {
  "verdict": "Shortcut, Teamwork, and Wrike all manage projects and tasks, but they are built for different operating models: Shortcut is a lightweight tracker purpose-built for software engineering teams, Teamwork bundles project tracking with the time tracking and invoicing agencies bill clients on, and Wrike is a broader cross-functional work management platform with deep Gantt charts, configurable dashboards, and native AI Agents included on every plan. Teams that need dependency-heavy scheduling or Adobe Creative Cloud integration will lean toward Wrike, while dev teams and client-services shops are better served by the other two's narrower focus.",
  "bestFor": {
    "shortcut": "Software engineering teams that want lightweight Kanban Stories and sprint-style Iterations tied to GitHub, GitLab, and Slack.",
    "teamwork": "Agencies and consultancies that need project planning combined with time tracking, budgeting, and client invoicing.",
    "wrike": "Cross-functional teams that need deep Gantt chart dependency tracking, configurable dashboards, and built-in AI across every plan."
  },
  "highlights": [
    {
      "title": "Wrike bundles AI Agents into every plan at no extra cost",
      "description": "As of January 2026, Wrike includes AI Agents and an AI Priority Inbox across all plans, including Free, a move it positions against competitors that charge extra for comparable AI add-ons.",
      "toolSlugs": [
        "wrike"
      ]
    },
    {
      "title": "Shortcut stays narrowly focused on software teams",
      "description": "Shortcut combines Stories, sprint-style Iterations, and native GitHub, GitLab, and Figma integrations in a lighter interface aimed specifically at engineering workflows rather than general cross-functional work.",
      "toolSlugs": [
        "shortcut"
      ]
    },
    {
      "title": "Teamwork is the only one built for client billing",
      "description": "Teamwork pairs task tracking with native time tracking, budgeting, and invoicing that syncs to Xero and QuickBooks, a workflow neither Shortcut nor Wrike offers out of the box.",
      "toolSlugs": [
        "teamwork"
      ]
    },
    {
      "title": "Wrike has by far the deepest integration catalog",
      "description": "Wrike connects to more than 400 external tools, including an especially deep, bidirectional Adobe Creative Cloud integration, well beyond the integration lists Shortcut and Teamwork publish.",
      "toolSlugs": [
        "wrike"
      ]
    },
    {
      "title": "All three offer a free tier, with different limits",
      "description": "Shortcut's free plan covers up to 10 users, Teamwork's covers up to 5 users and 5 projects, and Wrike's free plan supports unlimited users but only basic boards and tables.",
      "toolSlugs": [
        "shortcut",
        "teamwork",
        "wrike"
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
            "shortcut": "available",
            "teamwork": "available",
            "wrike": "available"
          }
        },
        {
          "feature": "Gantt charts with dependency tracking",
          "statuses": {
            "shortcut": "not-documented",
            "teamwork": "available",
            "wrike": "available"
          },
          "note": "Wrike's Gantt charts include automatic critical path recalculation; Shortcut documents Roadmaps and Objectives rather than a dedicated Gantt view."
        },
        {
          "feature": "Resource and capacity management",
          "statuses": {
            "shortcut": "not-documented",
            "teamwork": "available",
            "wrike": "available"
          },
          "note": "Gated to Teamwork's Accelerate plan and Wrike's Business plan or higher."
        }
      ]
    },
    {
      "group": "Team and Client Collaboration",
      "rows": [
        {
          "feature": "Client billing and invoicing",
          "statuses": {
            "shortcut": "unavailable",
            "teamwork": "available",
            "wrike": "unavailable"
          }
        },
        {
          "feature": "Native GitHub integration",
          "statuses": {
            "shortcut": "available",
            "teamwork": "not-documented",
            "wrike": "available"
          }
        }
      ]
    },
    {
      "group": "AI and Automation",
      "rows": [
        {
          "feature": "Built-in AI assistant",
          "statuses": {
            "shortcut": "not-documented",
            "teamwork": "available",
            "wrike": "available"
          },
          "note": "Wrike includes AI Agents and Priority Inbox on every plan including Free; Teamwork AI is included on paid plans; Shortcut's public feature set does not document a comparable AI assistant."
        }
      ]
    },
    {
      "group": "Deployment and Pricing",
      "rows": [
        {
          "feature": "Free plan",
          "statuses": {
            "shortcut": "available",
            "teamwork": "available",
            "wrike": "available"
          },
          "note": "Shortcut's free plan covers up to 10 users, Teamwork's covers up to 5 users and 5 projects, and Wrike's free plan supports unlimited users on basic boards and tables."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of these three is best for software engineering teams?",
      "answer": "Shortcut, since it is purpose-built around Kanban Stories, sprint-style Iterations, and native GitHub, GitLab, and Figma integrations rather than general cross-functional work management."
    },
    {
      "question": "Which tool is best suited to agencies that bill clients for time?",
      "answer": "Teamwork, because it pairs project and task tracking with native time tracking, budgeting, and invoicing that syncs to Xero and QuickBooks."
    },
    {
      "question": "Which has the most integrations?",
      "answer": "Wrike, which connects to more than 400 external tools including Slack, Microsoft Teams, Salesforce, Jira, GitHub, Tableau, and an especially deep, bidirectional Adobe Creative Cloud integration."
    },
    {
      "question": "Do all three include AI features?",
      "answer": "Wrike includes AI Agents and an AI Priority Inbox on every plan including Free, and Teamwork AI is included on Teamwork's paid plans. Shortcut's publicly documented feature set does not include a comparable AI assistant."
    },
    {
      "question": "Which has the most generous free plan?",
      "answer": "It depends on what you need. Wrike's free plan allows unlimited users but only basic boards and tables, Shortcut's free plan supports up to 10 users with fuller functionality, and Teamwork's free plan is capped at 5 users and 5 projects."
    },
    {
      "question": "Which tool is best for managing dependencies across many concurrent projects?",
      "answer": "Wrike, whose Gantt charts include drag-and-drop dependencies and automatic critical path recalculation, plus resource management for balancing capacity across teams. Teamwork also offers Gantt-style timelines and resource planning on its higher tiers, while Shortcut does not document comparable dependency tracking."
    }
  ]
};

export default shortcutVsTeamworkVsWrikeContent;

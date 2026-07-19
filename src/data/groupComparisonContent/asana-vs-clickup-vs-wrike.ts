import type { GroupComparisonContent } from './types';

const asanaVsClickupVsWrikeContent: GroupComparisonContent = {
  "verdict": "Asana, ClickUp, and Wrike are all mature work and project management platforms built around multiple task views, dashboards, and growing AI layers, but they optimize for different priorities. ClickUp packs the broadest feature set (docs, whiteboards, chat, native time tracking) into its lowest-priced paid tiers, Wrike leans hardest into Gantt-chart depth, resource management, and creative-team proofing with AI now bundled free on every plan, and Asana emphasizes a cleaner Work Graph data model plus structured AI Teammates for cross-functional goal and portfolio tracking. None is a universal best choice; the right pick depends on whether a team values breadth, scheduling depth, or governance-friendly simplicity most.",
  "bestFor": {
    "asana": "Cross-functional teams that want structured goals, portfolios, and pre-built AI Teammates layered on a clean, enterprise-friendly data model.",
    "clickup": "Startups and lean teams that want to replace several separate tools (docs, chat, time tracking, whiteboards) with one highly configurable, lower-cost platform.",
    "wrike": "Creative and operations teams that need deep Gantt/dependency scheduling, resource management, and Adobe Creative Cloud-grade proofing, with AI included on every plan."
  },
  "highlights": [
    {
      "title": "AI pricing approach differs sharply",
      "description": "Wrike bundles AI Agents and a Priority Inbox into every plan at no extra cost, explicitly undercutting rivals that charge $20-$40 per user per month for comparable AI add-ons. ClickUp instead sells its AI layer, ClickUp Brain, as a separate add-on starting around $9/user/month with a higher 'Everything AI' tier near $28/user/month. Asana includes AI Teammates and AI Studio within its plan structure, with deeper AI Studio credits reserved for Advanced and Enterprise tiers.",
      "toolSlugs": [
        "wrike",
        "clickup",
        "asana"
      ]
    },
    {
      "title": "ClickUp is the most all-in-one and lowest cost to start paying",
      "description": "ClickUp's paid tier starts at $7/user/month (annual) and bundles docs, whiteboards, chat, native time tracking, and goals directly into the core product, aiming to replace multiple point tools rather than just manage tasks.",
      "toolSlugs": [
        "clickup"
      ]
    },
    {
      "title": "Wrike leads on scheduling depth and creative workflows",
      "description": "Wrike's Gantt charts include automatic critical path recalculation, and its resource management and proofing tools (plus a deep, bidirectional Adobe Creative Cloud integration) are built specifically for teams juggling capacity across concurrent projects and creative review cycles.",
      "toolSlugs": [
        "wrike"
      ]
    },
    {
      "title": "Asana centers structured goal and portfolio tracking",
      "description": "Asana's Work Graph links goals, portfolios, projects, and tasks, and its Advanced plan adds unlimited portfolios, goals management, and workload tracking, backed by three consecutive years as a Gartner Magic Quadrant Leader for Collaborative Work Management.",
      "toolSlugs": [
        "asana"
      ]
    },
    {
      "title": "Free plans differ meaningfully in who they fit",
      "description": "Asana's free Personal plan is now capped at 2 users for new accounts, Wrike's free plan supports unlimited users but only basic boards and tables, and ClickUp's Free Forever plan allows unlimited tasks and members but caps storage at 60MB, so the best free option depends on whether team size or storage is the bigger constraint.",
      "toolSlugs": [
        "asana",
        "wrike",
        "clickup"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Core planning and views",
      "rows": [
        {
          "feature": "Gantt/timeline view",
          "statuses": {
            "asana": "available",
            "clickup": "available",
            "wrike": "available"
          },
          "note": "Wrike's Gantt charts include automatic critical path recalculation; Asana and ClickUp offer timeline/Gantt views as part of their view sets."
        },
        {
          "feature": "Board, list, and calendar views",
          "statuses": {
            "asana": "available",
            "clickup": "available",
            "wrike": "available"
          }
        },
        {
          "feature": "Goals and portfolio tracking",
          "statuses": {
            "asana": "available",
            "clickup": "available",
            "wrike": "limited"
          },
          "note": "Asana's Work Graph is built around goals and portfolios; ClickUp offers Goals from its Unlimited plan up; Wrike's roadmap emphasizes dashboards and resource views over dedicated goal-tracking."
        }
      ]
    },
    {
      "group": "Collaboration and content",
      "rows": [
        {
          "feature": "Native docs/whiteboards",
          "statuses": {
            "asana": "limited",
            "clickup": "available",
            "wrike": "not-documented"
          },
          "note": "ClickUp bundles Docs and Whiteboards natively; Asana's core strength is task/project data rather than a dedicated docs product."
        },
        {
          "feature": "Proofing and creative approvals",
          "statuses": {
            "asana": "limited",
            "clickup": "not-documented",
            "wrike": "available"
          },
          "note": "Wrike's proofing tools and Adobe Creative Cloud integration are purpose-built for creative review; Asana offers approvals/proofing on its Advanced plan."
        },
        {
          "feature": "Native time tracking",
          "statuses": {
            "asana": "not-documented",
            "clickup": "available",
            "wrike": "available"
          },
          "note": "ClickUp includes native time tracking from its Unlimited plan; Wrike includes time tracking as a core capability."
        }
      ]
    },
    {
      "group": "AI and automation",
      "rows": [
        {
          "feature": "Built-in AI agents/assistant",
          "statuses": {
            "asana": "available",
            "clickup": "available",
            "wrike": "available"
          },
          "note": "Wrike includes AI Agents and Priority Inbox on all plans at no extra cost; Asana offers AI Teammates and AI Studio within its plan tiers; ClickUp sells ClickUp Brain as a paid add-on."
        },
        {
          "feature": "Workflow automations",
          "statuses": {
            "asana": "available",
            "clickup": "available",
            "wrike": "available"
          },
          "note": "All three offer rule-based automations, with usage limits that scale by plan."
        }
      ]
    },
    {
      "group": "Access and integrations",
      "rows": [
        {
          "feature": "Free plan available",
          "statuses": {
            "asana": "available",
            "clickup": "available",
            "wrike": "available"
          },
          "note": "Asana's free plan is capped at 2 users for new accounts; ClickUp's free plan caps storage at 60MB; Wrike's free plan supports unlimited users on basic boards and tables."
        },
        {
          "feature": "Third-party integration breadth",
          "statuses": {
            "asana": "available",
            "clickup": "not-documented",
            "wrike": "available"
          },
          "note": "Asana lists 200+ integrations and Wrike lists 400+, including a deep Adobe Creative Cloud connection; ClickUp integrates with major tools like Slack and GitHub but does not publish a comparable integration count."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which of Asana, ClickUp, and Wrike has the most generous free plan?",
      "answer": "It depends on the constraint that matters most. Wrike's free plan allows unlimited users but only basic boards and tables. ClickUp's free plan allows unlimited tasks and members but caps storage at 60MB. Asana's free Personal plan is limited to 2 users for new accounts, making it the most restrictive of the three for teams larger than a pair of collaborators."
    },
    {
      "question": "Which tool includes AI features without an extra fee?",
      "answer": "Wrike stands out here: as of January 2026, its AI Agents and AI Priority Inbox are included on all plans at no additional cost. ClickUp sells its AI layer, ClickUp Brain, as a separate add-on starting around $9/user/month. Asana includes AI Teammates and AI Studio as part of its plan structure, though deeper AI Studio credits are tied to its Advanced and Enterprise tiers."
    },
    {
      "question": "Which platform is best for creative teams that need approval workflows?",
      "answer": "Wrike is the strongest fit for creative review, thanks to its dedicated proofing and approval tools and a deep, bidirectional Adobe Creative Cloud integration. Asana offers approvals/proofing on its Advanced plan, while ClickUp does not document a comparable native proofing feature."
    },
    {
      "question": "How do entry-level paid plans compare on price?",
      "answer": "ClickUp's Unlimited plan starts at $7/user/month billed annually, the lowest entry point of the three. Wrike's Team plan starts at $9.80/user/month billed annually. Asana's Starter plan starts at $10.99/user/month billed annually ($13.49 billed monthly)."
    },
    {
      "question": "Which tool is best for a team that wants one app to replace several separate tools?",
      "answer": "ClickUp is the most explicitly all-in-one of the three, bundling tasks, Docs, Whiteboards, Chat, Goals, Dashboards, and an AI assistant into a single workspace to reduce the number of separate subscriptions a team needs."
    },
    {
      "question": "Which platform is most oriented toward large, enterprise-scale goal and portfolio tracking?",
      "answer": "Asana's Work Graph data model and its multi-year run as a Gartner Magic Quadrant Leader for Collaborative Work Management, combined with 85% of Fortune 100 companies reportedly using the platform, make it a strong option for organizations that prioritize structured goals, portfolios, and workload tracking across many teams."
    }
  ]
};

export default asanaVsClickupVsWrikeContent;

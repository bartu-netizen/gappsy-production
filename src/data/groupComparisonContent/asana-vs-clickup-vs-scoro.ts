import type { GroupComparisonContent } from './types';

const asanaVsClickupVsScoroContent: GroupComparisonContent = {
  "verdict": "Asana and ClickUp are general-purpose work management platforms built to flex across almost any team, while Scoro is a professional-services automation platform purpose-built for agencies and consultancies that need quoting, invoicing, and profitability reporting baked into the same system as project management. Asana leans on AI Teammates and enterprise governance, ClickUp bets on breadth with docs, chat, and whiteboards bundled in, and Scoro trades a free tier and low seat count for financial tooling neither competitor offers natively.",
  "bestFor": {
    "asana": "Cross-functional teams that want AI-assisted workflow automation and enterprise-grade governance layered onto flexible task views.",
    "clickup": "Teams wanting to consolidate docs, chat, whiteboards, and tasks into a single, highly configurable, budget-friendly workspace.",
    "scoro": "Agencies and consultancies that want project management bundled with quoting, invoicing, and profitability reporting in one system, and can meet the 5-seat minimum."
  },
  "highlights": [
    {
      "title": "Billing and Invoicing Built In",
      "description": "Scoro combines quoting, invoicing, and financial reporting directly with project management, letting agencies skip a separate billing tool that Asana and ClickUp don't offer natively.",
      "toolSlugs": [
        "scoro"
      ]
    },
    {
      "title": "All-in-One Workspace",
      "description": "ClickUp bundles Docs, Whiteboards, Chat, Goals, and Dashboards alongside tasks in a single configurable workspace.",
      "toolSlugs": [
        "clickup"
      ]
    },
    {
      "title": "AI Agents in Core Workflows",
      "description": "Asana's AI Teammates and AI Studio let teams build custom automations and agents directly inside projects rather than bolting on a separate tool.",
      "toolSlugs": [
        "asana"
      ]
    },
    {
      "title": "5-Seat Minimum and No Free Tier",
      "description": "Every Scoro plan requires a minimum of 5 user seats and offers only a 14-day free trial, unlike Asana and ClickUp which both have permanent free plans.",
      "toolSlugs": [
        "scoro"
      ]
    },
    {
      "title": "Free Plans for Small Teams",
      "description": "Asana and ClickUp both let small teams get started at no cost, while Scoro's per-seat pricing with a 5-user minimum targets established agencies rather than solo users.",
      "toolSlugs": [
        "asana",
        "clickup"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Task and Project Views",
      "rows": [
        {
          "feature": "Gantt or timeline view",
          "statuses": {
            "asana": "available",
            "clickup": "available",
            "scoro": "available"
          }
        },
        {
          "feature": "Free plan",
          "statuses": {
            "asana": "available",
            "clickup": "available",
            "scoro": "unavailable"
          },
          "note": "Scoro offers a 14-day free trial with no credit card required, but no permanent free tier, and every plan requires a minimum of 5 seats."
        }
      ]
    },
    {
      "group": "Financial and Agency Tools",
      "rows": [
        {
          "feature": "Invoicing and quoting",
          "statuses": {
            "asana": "not-documented",
            "clickup": "not-documented",
            "scoro": "available"
          }
        },
        {
          "feature": "Resource planning and utilization reporting",
          "statuses": {
            "asana": "available",
            "clickup": "not-documented",
            "scoro": "available"
          },
          "note": "Asana's workload tracking is available on its Advanced plan; Scoro's resource planner and utilization reports are available from Performance and above."
        },
        {
          "feature": "Retainer and budget management",
          "statuses": {
            "asana": "not-documented",
            "clickup": "not-documented",
            "scoro": "available"
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
            "asana": "available",
            "clickup": "available",
            "scoro": "not-documented"
          },
          "note": "ClickUp Brain is priced as an add-on rather than bundled into base plans."
        }
      ]
    },
    {
      "group": "Enterprise Controls",
      "rows": [
        {
          "feature": "SSO or single sign-on",
          "statuses": {
            "asana": "available",
            "clickup": "available",
            "scoro": "available"
          },
          "note": "Available on each platform's top Enterprise tier."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Scoro have a free plan?",
      "answer": "No. Scoro offers a 14-day free trial with no credit card required, but there is no permanent free tier, and every plan requires a minimum of 5 user seats."
    },
    {
      "question": "Which is best for agencies that need built-in invoicing?",
      "answer": "Scoro, since it combines quoting, invoicing, and financial reporting directly with project management. Neither Asana nor ClickUp document native invoicing features."
    },
    {
      "question": "Which is the cheapest option for a small team?",
      "answer": "Asana and ClickUp both offer free plans for small teams. Scoro's Core plan starts at $19.90 per user per month, and with its 5-seat minimum that works out to roughly $99.50 per month at minimum, making it the most expensive entry point of the three."
    },
    {
      "question": "Do Asana and ClickUp offer billing tools like Scoro?",
      "answer": "Not natively. Neither Asana's nor ClickUp's documented feature set includes built-in quoting, invoicing, or retainer management, which are core to Scoro's professional-services automation positioning."
    },
    {
      "question": "Which of the three has AI features?",
      "answer": "Asana includes AI Teammates and AI Studio, and ClickUp offers ClickUp Brain as a paid add-on. Scoro's feature set does not document a built-in AI assistant."
    },
    {
      "question": "Do all three support single sign-on?",
      "answer": "Yes, all three offer SSO on their top-tier Enterprise plans: Asana Enterprise, ClickUp Enterprise, and Scoro Enterprise."
    }
  ]
};

export default asanaVsClickupVsScoroContent;

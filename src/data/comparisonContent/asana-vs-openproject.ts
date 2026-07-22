import type { ToolComparisonContent } from './types';

const asanaVsOpenprojectContent: ToolComparisonContent = {
  "verdict": "Asana is a cloud SaaS work management platform where the same tasks can be viewed as a list, board, timeline, or calendar, with AI Studio and modular enterprise add-ons layered onto paid tiers. OpenProject is an open-source project management tool emphasizing Gantt charts and agile boards, with a genuinely free, self-hostable Community Edition and paid tiers with published per-user pricing that require minimum user counts. The choice largely comes down to SaaS flexibility with AI features versus open-source ownership and self-hosting.",
  "bestForToolA": "Teams that want a flexible SaaS tool where the same task data can be viewed as list, board, timeline, or calendar, plus built-in AI Studio (on Starter tier and above) and modular enterprise add-ons like AI Teammates and Compliance Management without forcing a jump to Enterprise.",
  "bestForToolB": "Teams wanting a genuinely free, open-source, self-hostable project management tool with Gantt charts and agile Scrum/Kanban boards, particularly where data residency or avoiding per-seat SaaS costs matters.",
  "whoNeedsBoth": "An organization might run Asana for smaller, cross-functional teams that benefit from AI Studio and flexible views, while a separate engineering group standardizes on self-hosted OpenProject for Gantt-heavy, data-sovereign project tracking; this is more a case of different teams choosing different tools than one team needing both simultaneously.",
  "keyDifferences": [
    {
      "title": "Free Plan Depth",
      "toolA": "Asana's Personal plan is free but capped at 2 users, aimed at individuals rather than teams.",
      "toolB": "OpenProject's Community Edition is free, open source, self-hosted, with no user cap at all.",
      "whyItMatters": "A 2-user cap means real team use on Asana requires an immediate jump to a paid tier, while OpenProject's free tier scales to any team size.",
      "benefitsWho": "Larger teams on a budget benefit from OpenProject's uncapped free tier; individuals or 2-person teams can stay on Asana's free Personal plan."
    },
    {
      "title": "Deployment Model",
      "toolA": "Asana is a cloud-only SaaS platform; self-hosting is not documented.",
      "toolB": "OpenProject offers both a free self-hosted Community Edition and paid Enterprise Cloud SaaS tiers (Basic €5.95, Professional €10.95, Premium €15.95 per user/month).",
      "whyItMatters": "Organizations with data residency or infrastructure control requirements need a self-hosting option, which only one of these tools offers.",
      "benefitsWho": "Regulated industries or organizations requiring on-premises data control benefit from OpenProject's self-hosted option."
    },
    {
      "title": "AI Features",
      "toolA": "Asana includes AI Studio on paid tiers (Starter and above) with a monthly AI credit allowance.",
      "toolB": "OpenProject does not document any AI features.",
      "whyItMatters": "AI-assisted workflow features are increasingly expected in work management tools for tasks like automation and summarization.",
      "benefitsWho": "Teams wanting AI-assisted task automation and insights built into their PM tool."
    },
    {
      "title": "Views vs. Gantt/Agile Focus",
      "toolA": "Asana emphasizes multiple views of the same underlying tasks: list, board, timeline, and calendar, without duplicating information.",
      "toolB": "OpenProject emphasizes Gantt charts, Scrum/Kanban agile boards, and a Team Planner for visualizing workload across the team.",
      "whyItMatters": "Teams have different visualization preferences: flexible multi-view task management versus schedule-centric Gantt planning.",
      "benefitsWho": "Cross-functional teams wanting flexible views benefit from Asana; teams doing detailed schedule/dependency planning benefit from OpenProject's Gantt charts."
    },
    {
      "title": "Enterprise Add-On Model",
      "toolA": "Asana sells modular enterprise add-ons (AI Teammates, Timesheets & Budgets, Compliance Management, Permissions Management) that can attach to any plan rather than requiring a full Enterprise-tier jump.",
      "toolB": "OpenProject's enterprise features are bundled into fixed tiers (Basic/Professional/Premium/Corporate) with rising per-user prices and user minimums of 25+ (Basic/Professional), 100+ (Premium), or 250+ (Corporate).",
      "whyItMatters": "Modular add-ons let teams buy only the enterprise capability they need, while tiered bundling can force paying for features that come packaged with a user minimum.",
      "benefitsWho": "Mid-sized teams needing just one enterprise capability (like compliance) benefit from Asana's a la carte add-ons."
    }
  ],
  "featureMatrix": [
    {
      "group": "Task & Project Views",
      "rows": [
        {
          "feature": "List/board/timeline/calendar views",
          "toolA": "available",
          "toolB": "not-documented"
        },
        {
          "feature": "Gantt charts",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Agile Scrum/Kanban boards",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Team workload planner",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "OpenProject: Team Planner"
        }
      ]
    },
    {
      "group": "Pricing & Deployment",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "limited",
          "toolB": "available",
          "note": "Asana Personal capped at 2 users; OpenProject Community has no user cap"
        },
        {
          "feature": "Self-hosted option",
          "toolA": "unavailable",
          "toolB": "available"
        },
        {
          "feature": "Entry paid tier price",
          "toolA": "available",
          "toolB": "available",
          "note": "Asana Starter $10.99/user/mo annual; OpenProject Basic €5.95/user/mo (25-user minimum)"
        },
        {
          "feature": "Free trial for paid tiers",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "OpenProject: 14-day trial"
        }
      ]
    },
    {
      "group": "AI & Enterprise Add-ons",
      "rows": [
        {
          "feature": "AI-assisted features",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Asana: AI Studio on Starter tier and above"
        },
        {
          "feature": "Modular enterprise add-ons",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "Asana: AI Teammates, Timesheets & Budgets, Compliance, Permissions"
        },
        {
          "feature": "Open API for customization",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Is Asana free for individuals?",
      "answer": "Yes, the Personal plan is free but limited to 2 users, aimed at individuals rather than teams."
    },
    {
      "question": "Is OpenProject free?",
      "answer": "Yes, the Community Edition is free and open source under GPL v3, with no minimum user count, unlike Asana's 2-user-capped free plan."
    },
    {
      "question": "Does OpenProject have AI features like Asana's AI Studio?",
      "answer": "This is not documented. Asana includes AI Studio on paid tiers (Starter and above) with a monthly AI credit allowance; OpenProject's feature list does not mention any AI capability."
    },
    {
      "question": "Can OpenProject be self-hosted while Asana cannot?",
      "answer": "OpenProject explicitly supports self-hosting via its free Community Edition. Asana's documented facts don't mention a self-hosting option, consistent with it being a cloud SaaS product."
    },
    {
      "question": "What are the minimum user requirements for OpenProject's paid tiers?",
      "answer": "Basic and Professional require a minimum of 25 users, Premium requires 100+, and Corporate requires 250+. Asana has no documented user minimum on its Starter or Advanced tiers."
    },
    {
      "question": "How does pricing compare at scale?",
      "answer": "Asana's Starter tier is $10.99/user/month and Advanced is $24.99/user/month, both billed annually. OpenProject's Basic tier is €5.95/user/month and Professional is €10.95/user/month, but both require a minimum of 25 users, so the effective monthly floor is higher than a per-user comparison alone suggests."
    }
  ]
};

export default asanaVsOpenprojectContent;

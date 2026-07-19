import type { ToolComparisonContent } from './types';

const asanaVsTrelloContent: ToolComparisonContent = {
  "verdict": "Asana and Trello both offer free tiers and paid plans that scale into enterprise territory, but they are built around different mental models. Asana organizes work around tasks that can be viewed as list, board, timeline, or calendar without duplicating data, and layers on AI Studio plus modular enterprise add-ons like AI Teammates, Timesheets and Budgets, Compliance Management, and Permissions Management that can be attached to any plan rather than requiring a jump to Enterprise. That makes Asana a fit for teams managing structured, cross-functional work who want to add specific enterprise capabilities incrementally. Trello centers on Kanban-style boards with cards that move across customizable lists, plus card mirroring that keeps one task visible and updated on several boards at once, and Butler automation with unlimited runs on Premium and above. Its additional Calendar, Timeline, Table, and Map views sit on top of that same board-first card data on Premium plans and up. Trello suits teams who think visually in boards first and want lightweight automation without adopting a full task-management system. Neither tool strictly beats the other: Asana is the more structured work-management platform, while Trello is the more visual, board-centric tool with its own automation and multi-board sync features. The right choice depends on whether a team's primary mental model is tasks with multiple views, or boards with cards moving across lists.",
  "bestForToolA": "Asana fits teams that need the same underlying tasks viewable as list, board, timeline, and calendar, and that want to add specific enterprise capabilities like AI Teammates, Timesheets and Budgets, or Compliance Management without upgrading to a full Enterprise plan.",
  "bestForToolB": "Trello fits teams that think in Kanban boards first and want a single card to stay synced across multiple boards, paired with Butler automation to cut down on manual card handling.",
  "whoNeedsBoth": "A larger organization might run Asana for structured, cross-functional project tracking with timelines and enterprise add-ons while individual teams keep lightweight Trello boards for simple, visual task tracking on specific workflows.",
  "keyDifferences": [
    {
      "title": "Core organizing model",
      "toolA": "Tasks are the base unit, viewable as list, board, timeline, and calendar without duplicating data",
      "toolB": "Cards on customizable lists within Kanban-style boards are the base unit",
      "whyItMatters": "Teams that need multiple perspectives on the same work without re-entering data will find one model more natural than the other",
      "benefitsWho": "Cross-functional project teams benefit from Asana's multi-view task model, while visually oriented teams benefit from Trello's board-first card model"
    },
    {
      "title": "Cross-board task sync",
      "toolA": "Not documented as a distinct feature in Asana's provided facts",
      "toolB": "One card can mirror onto several boards at once and remains synced everywhere it appears",
      "whyItMatters": "Teams juggling overlapping projects need a way to avoid manually duplicating the same task in several places",
      "benefitsWho": "Teams running many boards for related workstreams benefit most from Trello's card mirroring"
    },
    {
      "title": "Built-in automation",
      "toolA": "Not documented as a distinct feature in Asana's provided facts",
      "toolB": "Butler automation engine, with unlimited runs on Premium and above",
      "whyItMatters": "Automation reduces manual card or task upkeep as volume grows",
      "benefitsWho": "Teams with repetitive board maintenance benefit from Trello's Butler automation on paid tiers"
    },
    {
      "title": "AI features",
      "toolA": "AI Studio included on paid tiers, Starter and above, with a monthly AI credit allowance",
      "toolB": "Not documented as a distinct feature in Trello's provided facts",
      "whyItMatters": "Built-in AI assistance can speed up planning and reporting work directly inside the tool",
      "benefitsWho": "Teams wanting AI-assisted work management benefit from Asana's AI Studio on Starter and higher plans"
    },
    {
      "title": "Enterprise add-on modularity",
      "toolA": "AI Teammates, Timesheets and Budgets, Compliance Management, and Permissions Management are available as add-ons to any plan",
      "toolB": "Not documented as modular add-ons in Trello's provided facts; Enterprise tier bundles Atlassian Guard Standard",
      "whyItMatters": "Modular add-ons let a team pick up one enterprise capability without paying for a full enterprise upgrade",
      "benefitsWho": "Growing teams that need one enterprise feature, such as compliance or budgeting, benefit from Asana's add-on model"
    },
    {
      "title": "Free plan user limit",
      "toolA": "Personal plan is free but capped at 2 users",
      "toolB": "Free plan supports up to 10 collaborators and 10 boards per Workspace",
      "whyItMatters": "The free tier ceiling determines how long a small team can operate before needing to pay",
      "benefitsWho": "Small teams and solo users get more free headroom with Trello than with Asana"
    },
    {
      "title": "Free plan board or project limit",
      "toolA": "Not documented as a specific project cap beyond the 2-user limit",
      "toolB": "Free plan is capped at 10 boards per Workspace",
      "whyItMatters": "Teams running many concurrent projects on a free plan will hit Trello's board ceiling before hitting a project ceiling in Asana",
      "benefitsWho": "Teams with many small parallel projects need to watch Trello's 10-board Workspace limit"
    },
    {
      "title": "Entry paid tier price",
      "toolA": "Starter plan is 10.99 dollars per user per month, billed annually",
      "toolB": "Standard plan runs 5 dollars per user, per month, under annual billing",
      "whyItMatters": "Entry-level paid pricing affects total cost for teams that outgrow the free tier",
      "benefitsWho": "Cost-sensitive teams needing just a step above free get a lower entry price from Trello's Standard plan"
    },
    {
      "title": "Mid-tier paid price",
      "toolA": "Advanced plan is 24.99 dollars per user per month, billed annually",
      "toolB": "Premium plan costs 10 dollars per user monthly on an annual plan, and unlocks Calendar, Timeline, Table, and Map views plus unlimited Butler runs",
      "whyItMatters": "Mid-tier pricing shows the cost of unlocking deeper views and automation in each tool",
      "benefitsWho": "Teams wanting more views and automation at lower cost benefit from Trello's Premium tier pricing"
    },
    {
      "title": "Enterprise tier pricing structure",
      "toolA": "Enterprise plan uses custom pricing",
      "toolB": "Enterprise plan pricing is quoted at 17.50 dollars for each user every month, on an annual billing plan, and includes Atlassian Guard Standard",
      "whyItMatters": "A published Enterprise price versus custom quoting affects how easily a buyer can budget upfront",
      "benefitsWho": "Buyers wanting transparent enterprise pricing without a sales negotiation benefit from Trello's published Enterprise rate"
    }
  ],
  "featureMatrix": [
    {
      "group": "Views and layout",
      "rows": [
        {
          "feature": "List view",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Part of Asana's core list, board, timeline, calendar set"
        },
        {
          "feature": "Board or Kanban view",
          "toolA": "available",
          "toolB": "available",
          "note": "Trello's board is the core product; Asana's board is one of four views on the same tasks"
        },
        {
          "feature": "Timeline view",
          "toolA": "available",
          "toolB": "available",
          "note": "Trello's Timeline view is on Premium and above"
        },
        {
          "feature": "Calendar view",
          "toolA": "available",
          "toolB": "available",
          "note": "Trello's Calendar view is on Premium and above"
        },
        {
          "feature": "Table view",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Trello Premium and above"
        },
        {
          "feature": "Map view",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Trello Premium and above"
        }
      ]
    },
    {
      "group": "Task and card mechanics",
      "rows": [
        {
          "feature": "Unlimited tasks",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Stated directly in Asana's description"
        },
        {
          "feature": "Card mirroring across boards",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "Automation",
      "rows": [
        {
          "feature": "Built-in workflow automation",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Butler automation, unlimited runs on Premium and above"
        }
      ]
    },
    {
      "group": "AI capabilities",
      "rows": [
        {
          "feature": "In-product AI features",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Asana AI Studio included on Starter tier and above with monthly AI credits"
        }
      ]
    },
    {
      "group": "Enterprise and governance",
      "rows": [
        {
          "feature": "AI Teammates add-on",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Available as an add-on to any Asana plan"
        },
        {
          "feature": "Timesheets and budgets add-on",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Available as an add-on to any Asana plan"
        },
        {
          "feature": "Compliance management add-on",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Available as an add-on to any Asana plan"
        },
        {
          "feature": "Permissions management add-on",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Available as an add-on to any Asana plan"
        },
        {
          "feature": "Security or governance suite in Enterprise tier",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Trello Enterprise includes Atlassian Guard Standard"
        }
      ]
    },
    {
      "group": "Pricing and plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "limited",
          "toolB": "limited",
          "note": "Asana Personal caps at 2 users; Trello Free allows up to 10 collaborators, capped at 10 boards in each Workspace"
        },
        {
          "feature": "Entry paid plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Asana Starter at 10.99 dollars per user per month vs Trello Standard at 5 dollars per user per month, both billed annually"
        },
        {
          "feature": "Mid paid plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Asana Advanced at 24.99 dollars per user per month vs Trello Premium at 10 dollars per user per month, both billed annually"
        },
        {
          "feature": "Enterprise plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Asana Enterprise uses custom pricing; Trello Enterprise pricing is published at 17.50 dollars for each user every month on an annual plan"
        }
      ]
    },
    {
      "group": "Ownership and ecosystem",
      "rows": [
        {
          "feature": "Part of a larger software suite",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Trello is an Atlassian product"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Asana or Trello?",
      "answer": "Trello is cheaper at every published paid tier: Standard is 5 dollars per user per month versus Asana's Starter at 10.99 dollars, and Premium is 10 dollars versus Asana's Advanced at 24.99 dollars, both billed annually; Trello's Enterprise tier also has a published 17.50 dollar per user per month rate while Asana's Enterprise uses custom pricing."
    },
    {
      "question": "Is Asana or Trello better for beginners?",
      "answer": "Trello is generally easier to start with since its entire product is built around a single, visual Kanban board with cards moving across lists, while Asana asks users to work with tasks across four different views, list, board, timeline, and calendar, which carries more initial setup."
    },
    {
      "question": "Can Trello do what Asana does?",
      "answer": "Trello covers board-based task tracking with card mirroring and Butler automation, but its documented feature set does not include Asana's AI Studio or its modular enterprise add-ons like Timesheets and Budgets or Compliance Management, so it is not a full substitute for Asana's broader work-management feature set."
    },
    {
      "question": "Can Asana do what Trello does?",
      "answer": "Asana includes a board view among its four views on the same task data, but its provided facts do not document a card-mirroring feature or a built-in automation engine equivalent to Trello's Butler, so teams relying specifically on those Trello features would not find a documented equivalent in Asana."
    },
    {
      "question": "Does Asana or Trello have better AI features?",
      "answer": "Asana is the one with documented AI features, offering AI Studio on paid tiers, Starter and above, with a monthly AI credit allowance; Trello's provided facts do not document any specific AI feature set."
    },
    {
      "question": "Which has a better free plan, Asana or Trello?",
      "answer": "Trello's free plan supports up to 10 collaborators and 10 boards per Workspace, while Asana's free Personal plan is capped at just 2 users, making Trello the more usable free option for small teams rather than solo individuals."
    }
  ]
};

export default asanaVsTrelloContent;

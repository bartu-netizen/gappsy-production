import type { ToolComparisonContent } from './types';

const asanaVsClickupContent: ToolComparisonContent = {
  "verdict": "Asana and ClickUp are both freemium work management platforms built around tasks, but they solve different problems. Asana centers on a single set of tasks that can be viewed as list, board, timeline, or calendar without duplicating data, and it layers enterprise capabilities like AI Teammates, Timesheets and Budgets, Compliance Management, and Permissions Management as add-ons any plan can purchase, rather than forcing a jump to a full Enterprise contract. That suits teams that want one clean data model with optional enterprise depth added later. ClickUp bundles task management, Kanban boards, Gantt charts, calendar views, and built-in collaborative docs into one platform, so teams that want project tracking and documentation in the same place, without stitching together separate apps, may prefer it. ClickUp AI (Brain AI, Everything AI) runs on a pricing track separate from the core plan, so total AI-inclusive cost is less predictable than Asana AI Studio, which is included in the paid tier price with a monthly credit allowance. Budget-conscious individuals should note Asana Personal tops out at 2 users, while ClickUp Free Forever supports unlimited tasks with 60MB storage regardless of team size. Neither tool is a strict upgrade over the other: the decision comes down to whether a buyer values Asana unified multi-view task model plus modular enterprise add-ons, or ClickUp all-in-one docs-plus-tasks bundle plus a separately scalable AI track.",
  "bestForToolA": "Asana fits teams that want one set of tasks viewable across list, board, timeline, and calendar, plus the option to bolt on enterprise features like AI Teammates or Compliance Management without upgrading the whole plan.",
  "bestForToolB": "ClickUp fits teams that want task management and document collaboration combined in a single platform, and that are comfortable managing AI feature costs on a track separate from the core subscription.",
  "whoNeedsBoth": "Larger organizations piloting different work management approaches by department might run Asana where modular enterprise add-ons like Compliance Management matter, while using ClickUp elsewhere for teams that need built-in docs alongside tasks, comparing the two before standardizing on one.",
  "keyDifferences": [
    {
      "title": "Free plan ceiling",
      "toolA": "Asana Personal is free but capped at 2 users",
      "toolB": "ClickUp Free Forever includes unlimited tasks with 60MB storage",
      "whyItMatters": "Determines whether a team can actually run real project work on the free tier or must upgrade immediately",
      "benefitsWho": "Small teams and solo users leaning toward a genuinely usable free tier benefit from ClickUp; Asana free tier only suits a single individual"
    },
    {
      "title": "AI pricing model",
      "toolA": "AI Studio is included on paid tiers, Starter and above, with a monthly AI credit allowance bundled into the plan price",
      "toolB": "AI features, Brain AI and Everything AI, are billed on a separate pricing track independent of the core platform plan",
      "whyItMatters": "Affects how predictable total monthly cost is once AI usage is factored in",
      "benefitsWho": "Buyers who want one flat price benefit from Asana; teams that want to opt out of AI spend entirely may prefer ClickUp separating it out"
    },
    {
      "title": "Entry-tier paid price",
      "toolA": "Starter costs 10.99 dollars per user per month, billed annually",
      "toolB": "Unlimited costs 7 dollars per user per month, billed yearly",
      "whyItMatters": "Sets the minimum cost of moving past the free plan for a growing team",
      "benefitsWho": "Cost-sensitive teams comparing entry-level pricing lean toward ClickUp's lower starting price"
    },
    {
      "title": "Mid-tier paid price",
      "toolA": "Advanced costs 24.99 dollars per user per month, billed annually",
      "toolB": "Business costs 12 dollars per user per month, billed yearly",
      "whyItMatters": "The gap widens at the mid tier, roughly double for Asana, which matters for teams scaling past entry features",
      "benefitsWho": "Growing teams watching per-seat cost as headcount rises benefit from ClickUp's lower mid-tier price"
    },
    {
      "title": "Modular enterprise add-ons",
      "toolA": "AI Teammates, Timesheets and Budgets, Compliance Management, and Permissions Management are available as add-ons to any plan",
      "toolB": "Not documented as separately purchasable add-ons; enterprise capability scaling is not detailed beyond the custom-priced Enterprise tier",
      "whyItMatters": "Lets a team buy exactly the enterprise capability it needs, like compliance controls, without paying for a full Enterprise contract",
      "benefitsWho": "Mid-size teams that need one specific enterprise feature, such as timesheets or permissions, without full Enterprise cost benefit from Asana"
    },
    {
      "title": "Built-in document collaboration",
      "toolA": "Not documented as a built-in feature in the provided facts",
      "toolB": "Collaborative docs are built into the platform alongside task management",
      "whyItMatters": "Affects whether a team needs to pair the tool with a separate docs product",
      "benefitsWho": "Teams that want docs and tasks unified in one subscription benefit from ClickUp"
    },
    {
      "title": "Named planning views",
      "toolA": "Offers a timeline view alongside list, board, and calendar, all on the same underlying tasks",
      "toolB": "Offers Gantt charts alongside Kanban boards and calendar views, on the same task data",
      "whyItMatters": "Timeline and Gantt both support scheduling-style planning but are described differently and are not confirmed to be interchangeable feature for feature",
      "benefitsWho": "Teams that specifically want Gantt-style dependency charts should verify that need against ClickUp's named view; teams wanting a lighter timeline view lean toward Asana"
    },
    {
      "title": "Core product bundle",
      "toolA": "Positioned as a work management platform for organizing, tracking, and collaborating on projects, with AI Studio as an included layer",
      "toolB": "Positioned as task management combined with docs and multiple view types, with AI on a separate track",
      "whyItMatters": "Signals what is bundled by default versus what requires an additional purchase or tool",
      "benefitsWho": "Teams prioritizing a single unified tasks-plus-docs product lean ClickUp; teams prioritizing one flexible task view model with optional enterprise add-ons lean Asana"
    },
    {
      "title": "Cost predictability as a stated drawback",
      "toolA": "Documented con is that the free plan is capped at 2 users, pushing real teams to a paid tier right away",
      "toolB": "Documented con is that AI pricing on a separate track makes total monthly cost less straightforward to estimate",
      "whyItMatters": "Each tool has a different documented weak point that affects budgeting in a different way",
      "benefitsWho": "Teams that plan to pay for a tool from day one are less affected by Asana's free cap; teams wanting one predictable invoice should factor in ClickUp's separate AI billing"
    }
  ],
  "featureMatrix": [
    {
      "group": "Task views and data model",
      "rows": [
        {
          "feature": "List view",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "One of Asana's four views on the same task set"
        },
        {
          "feature": "Board or Kanban view",
          "toolA": "available",
          "toolB": "available",
          "note": "Asana calls it board view, ClickUp calls it Kanban boards"
        },
        {
          "feature": "Timeline view",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "ClickUp's provided facts describe Gantt charts, not a timeline view specifically"
        },
        {
          "feature": "Gantt chart",
          "toolA": "not-documented",
          "toolB": "available",
          "note": ""
        },
        {
          "feature": "Calendar view",
          "toolA": "available",
          "toolB": "available",
          "note": ""
        }
      ]
    },
    {
      "group": "AI capabilities",
      "rows": [
        {
          "feature": "AI assistant or credits",
          "toolA": "available",
          "toolB": "available",
          "note": "Asana AI Studio on paid tiers; ClickUp Brain AI and Everything AI on a separate track"
        },
        {
          "feature": "AI cost included in core plan price",
          "toolA": "available",
          "toolB": "unavailable",
          "note": "ClickUp AI is billed independently of the core platform plan regardless of tier"
        }
      ]
    },
    {
      "group": "Documents and collaboration",
      "rows": [
        {
          "feature": "Built-in docs",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Described as collaborative docs alongside task management"
        },
        {
          "feature": "Project-level collaboration",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Stated directly in Asana's product description"
        }
      ]
    },
    {
      "group": "Enterprise add-ons",
      "rows": [
        {
          "feature": "AI Teammates",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Add-on to any Asana plan"
        },
        {
          "feature": "Timesheets and Budgets",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Add-on to any Asana plan"
        },
        {
          "feature": "Compliance Management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Add-on to any Asana plan"
        },
        {
          "feature": "Permissions Management",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Add-on to any Asana plan"
        }
      ]
    },
    {
      "group": "Pricing tiers",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Asana Personal at 0 dollars; ClickUp Free Forever at 0 dollars"
        },
        {
          "feature": "Entry paid tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Asana Starter at 10.99 dollars per user per month billed annually; ClickUp Unlimited at 7 dollars per user per month billed yearly"
        },
        {
          "feature": "Mid paid tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Asana Advanced at 24.99 dollars per user per month billed annually; ClickUp Business at 12 dollars per user per month billed yearly"
        },
        {
          "feature": "Enterprise tier",
          "toolA": "available",
          "toolB": "available",
          "note": "Both list Enterprise at custom pricing"
        }
      ]
    },
    {
      "group": "Free plan specifics",
      "rows": [
        {
          "feature": "User cap on free plan",
          "toolA": "limited",
          "toolB": "not-documented",
          "note": "Asana Personal is capped at 2 users; ClickUp's user cap is not specified in the provided facts"
        },
        {
          "feature": "Storage cap on free plan",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "ClickUp Free Forever includes 60MB storage; Asana storage limit is not specified in the provided facts"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Asana or ClickUp?",
      "answer": "ClickUp is cheaper at every documented paid tier: Unlimited starts at 7 dollars per user per month versus Asana Starter at 10.99 dollars, and ClickUp Business is 12 dollars versus Asana Advanced at 24.99 dollars, both billed annually, though ClickUp AI features add separate-track cost that Asana AI Studio does not since it is bundled into the plan price."
    },
    {
      "question": "Is Asana or ClickUp better for a free-plan team of more than 2 people?",
      "answer": "ClickUp is the better fit for a free-plan team larger than 2 people, since its Free Forever plan includes unlimited tasks with 60MB storage, while Asana's free Personal plan is capped at 2 users and aimed at individuals rather than teams."
    },
    {
      "question": "Does ClickUp include AI features in its core plan price like Asana does?",
      "answer": "No, ClickUp AI features, Brain AI and Everything AI, are billed on a separate pricing track independent of the core platform plan, while Asana bundles AI Studio credits into the paid plan price starting at the Starter tier."
    },
    {
      "question": "Can Asana do what ClickUp does with built-in docs?",
      "answer": "The provided facts do not document a built-in docs feature for Asana, whereas ClickUp explicitly includes collaborative docs alongside its task management, so a team that needs native docs has ClickUp confirmed and Asana unconfirmed on this point."
    },
    {
      "question": "Which tool offers more enterprise add-on flexibility?",
      "answer": "Asana documents more enterprise add-on flexibility, offering AI Teammates, Timesheets and Budgets, Compliance Management, and Permissions Management as add-ons to any plan tier, while ClickUp's facts do not document equivalent standalone add-ons outside its custom-priced Enterprise tier."
    },
    {
      "question": "Is ClickUp or Asana easier to budget for as a growing team?",
      "answer": "Asana is easier to budget for as a growing team since its AI credits are included in a single per-tier price, whereas ClickUp's core plan pricing is lower but its AI features run on a separate billed track that adds an additional, less predictable line item."
    }
  ]
};

export default asanaVsClickupContent;

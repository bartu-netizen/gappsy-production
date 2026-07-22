import type { ToolComparisonContent } from './types';

const asanaVsMondayContent: ToolComparisonContent = {
  "verdict": "Asana and monday.com both start as freemium work management tools capped at two users on their free tiers, but they scale in different directions. Asana is built around a single project data model, tasks that can be viewed as a list, board, timeline, or calendar without duplicating information, and layers optional add-ons (AI Teammates, Timesheets and Budgets, Compliance Management, Permissions Management) onto any pricing tier, so a team can add enterprise-grade governance without jumping to a full Enterprise contract. monday.com takes a broader platform approach, offering separate Work Management, CRM, Service, and Dev product lines on the same underlying system, letting a company pay only for the products it actually uses rather than one bundled suite. Both bake AI into their paid plans through a monthly credit allotment rather than unlimited AI usage. On price, monday.com's entry-level Basic plan (9 dollars per seat per month, billed annually) undercuts Asana's Starter plan (10.99 dollars per user per month, billed annually), while Asana's Advanced tier (24.99 dollars per user per month, billed annually) sits above monday.com's documented Pro tier (19 dollars per seat per month, billed annually). The right choice depends on the shape of the need: teams wanting one deeply modeled project tool with add-on enterprise controls should lean Asana, while teams wanting CRM, service, or dev tracking alongside project work in one connected platform should lean monday.com.",
  "bestForToolA": "Asana suits teams that want a single, deeply modeled project management tool with flexible add-on enterprise controls like AI Teammates, Timesheets and Budgets, Compliance Management, and Permissions Management, rather than switching to a broader multi-product platform.",
  "bestForToolB": "monday.com suits organizations that want work management, CRM, service, and dev tracking on one connected platform and would rather buy only the product lines they actually need.",
  "whoNeedsBoth": "Organizations with a core project team standardized on Asana and a sales or service team already relying on monday.com's CRM or Service product lines may reasonably end up running both instead of migrating everyone to a single tool.",
  "keyDifferences": [
    {
      "title": "Entry-level paid pricing",
      "toolA": "Starter plan is 10.99 dollars per user per month, billed annually",
      "toolB": "Basic plan is 9 dollars per seat per month, billed annually",
      "whyItMatters": "The lowest paid tier sets the real cost of moving a team off the free plan, and monday.com's entry point is documented lower than Asana's",
      "benefitsWho": "Budget-conscious small teams benefit from monday.com's lower entry price"
    },
    {
      "title": "Free plan limits",
      "toolA": "Personal plan is free but capped at 2 users, with no documented board limit",
      "toolB": "Free plan is capped at 2 seats and 3 boards",
      "whyItMatters": "A board limit stacked on top of a seat limit restricts monday.com's free plan more concretely for real project use",
      "benefitsWho": "Solo users or pairs get slightly more headroom on Asana's free plan since no board cap is documented"
    },
    {
      "title": "Task view flexibility",
      "toolA": "Offers list, board, timeline, and calendar views of the same underlying tasks",
      "toolB": "Documented around customizable boards, without list, timeline, or calendar views specified",
      "whyItMatters": "Teams that plan across time, using timelines or calendars, need those views natively rather than approximating them on a single board layout",
      "benefitsWho": "Teams needing multiple visualizations of the same task data benefit from Asana's documented view range"
    },
    {
      "title": "Platform breadth beyond project management",
      "toolA": "Focused on work management with modular add-ons for AI Teammates, Timesheets and Budgets, Compliance Management, and Permissions Management",
      "toolB": "Offers separate Work Management, CRM, Service, and Dev product lines on one platform",
      "whyItMatters": "A company needing CRM or service-desk functionality alongside project tracking can stay on one platform with monday.com instead of adopting a second tool",
      "benefitsWho": "Companies wanting CRM, service, and dev tools alongside project management benefit from monday.com's multi-product structure"
    },
    {
      "title": "Enterprise-grade add-ons on any plan",
      "toolA": "AI Teammates, Timesheets and Budgets, Compliance Management, and Permissions Management are available as add-ons to any plan, not only Enterprise",
      "toolB": "No equivalent modular enterprise add-on system is documented",
      "whyItMatters": "Being able to add one specific enterprise control without upgrading the entire plan avoids overpaying for a full Enterprise contract",
      "benefitsWho": "Mid-market teams that need a single enterprise capability, like compliance, but not a full Enterprise plan benefit from Asana's add-on model"
    },
    {
      "title": "AI feature delivery",
      "toolA": "AI Studio is included on paid tiers, Starter and above, with a monthly AI credit allowance",
      "toolB": "AI credit system with monthly allotments that scale by tier",
      "whyItMatters": "Both meter AI usage through credits rather than offering unlimited AI, so buyers should expect usage caps on either platform",
      "benefitsWho": "Teams with light AI usage needs are served comparably well by either tool's credit-based model"
    },
    {
      "title": "Top documented self-serve plan price",
      "toolA": "Advanced plan is 24.99 dollars per user per month, billed annually, below a custom-priced Enterprise tier",
      "toolB": "Highest documented self-serve plan is Pro at 19 dollars per seat per month, billed annually",
      "whyItMatters": "Comparing the highest self-serve tiers shows Asana's documented ceiling is priced higher before requiring a custom Enterprise quote",
      "benefitsWho": "Teams wanting to stay on self-serve pricing as long as possible may find monday.com's Pro tier a cheaper ceiling"
    },
    {
      "title": "Product identity and structure",
      "toolA": "Single work management platform organized around tasks with modular add-ons",
      "toolB": "Positioned as a work operating system with distinct product lines for different departments",
      "whyItMatters": "The two tools are built on different philosophies, one deep and unified, one broad and modular by department",
      "benefitsWho": "Teams standardizing one workflow benefit from Asana's unified model, while multi-department organizations benefit from monday.com's per-product structure"
    }
  ],
  "featureMatrix": [
    {
      "group": "Pricing and Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Asana Personal plan capped at 2 users; monday.com Free plan capped at 2 seats and 3 boards"
        },
        {
          "feature": "Custom-priced Enterprise tier",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Asana lists an Enterprise plan with custom pricing; no equivalent tier price is documented for monday.com"
        }
      ]
    },
    {
      "group": "Views and Task Display",
      "rows": [
        {
          "feature": "List view",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Board view",
          "toolA": "available",
          "toolB": "available",
          "note": "Customizable boards are monday.com's core interface"
        },
        {
          "feature": "Timeline view",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        },
        {
          "feature": "Calendar view",
          "toolA": "available",
          "toolB": "not-documented",
          "note": ""
        }
      ]
    },
    {
      "group": "AI Features",
      "rows": [
        {
          "feature": "AI feature set",
          "toolA": "available",
          "toolB": "available",
          "note": "Asana AI Studio and monday.com's AI credit system both use monthly credit allotments"
        },
        {
          "feature": "AI included on free plan",
          "toolA": "unavailable",
          "toolB": "not-documented",
          "note": "Asana AI Studio is included on paid tiers, Starter and above"
        }
      ]
    },
    {
      "group": "Product Scope",
      "rows": [
        {
          "feature": "Dedicated CRM product line",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "monday.com offers a separate CRM product line on the same platform"
        },
        {
          "feature": "Dedicated Dev or Service product line",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "monday.com offers separate Dev and Service product lines"
        },
        {
          "feature": "Core work or project management",
          "toolA": "available",
          "toolB": "available",
          "note": "monday.com's version is its Work Management product line"
        }
      ]
    },
    {
      "group": "Enterprise and Compliance Add-ons",
      "rows": [
        {
          "feature": "AI Teammates add-on",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Available as an add-on to any Asana plan"
        },
        {
          "feature": "Timesheets and Budgets add-on",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Available as an add-on to any Asana plan"
        },
        {
          "feature": "Compliance Management add-on",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Available as an add-on to any Asana plan"
        },
        {
          "feature": "Permissions Management add-on",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Available as an add-on to any Asana plan"
        }
      ]
    },
    {
      "group": "Collaboration and Team Size Limits",
      "rows": [
        {
          "feature": "Free tier user or seat cap",
          "toolA": "limited",
          "toolB": "limited",
          "note": "Asana Personal capped at 2 users; monday.com Free capped at 2 seats"
        },
        {
          "feature": "Free tier board or project cap",
          "toolA": "not-documented",
          "toolB": "limited",
          "note": "monday.com Free plan is capped at 3 boards"
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Which is cheaper, Asana or monday.com?",
      "answer": "monday.com's entry-level Basic plan is cheaper at 9 dollars per seat per month billed annually, compared to Asana's Starter plan at 10.99 dollars per user per month billed annually, though at the higher end Asana's Advanced plan (24.99 dollars per user per month) sits above monday.com's documented Pro plan (19 dollars per seat per month)."
    },
    {
      "question": "Does Asana or monday.com have a better free plan?",
      "answer": "Both free plans are capped at 2 users or seats, but monday.com's Free plan also caps usage at 3 boards, while Asana's Personal plan documents no separate board limit, making Asana's free tier slightly less restrictive on paper for a pair of users."
    },
    {
      "question": "Can monday.com replace a separate CRM tool?",
      "answer": "Yes, monday.com documents a dedicated CRM product line alongside its Work Management, Service, and Dev product lines, all on the same underlying platform."
    },
    {
      "question": "Does Asana offer enterprise features without requiring the Enterprise plan?",
      "answer": "Yes, Asana documents AI Teammates, Timesheets and Budgets, Compliance Management, and Permissions Management as add-ons available on any plan, not only on Enterprise."
    },
    {
      "question": "Do Asana and monday.com both include AI features?",
      "answer": "Yes, both include AI through a monthly credit system, Asana Studio on paid tiers starting at Starter, and monday.com's AI credit allotments that scale by tier."
    },
    {
      "question": "Is Asana or monday.com better for a small team just starting out?",
      "answer": "Both cap free usage at 2 users or seats, so a small team beyond that size will need a paid plan on either tool, with monday.com's Basic plan being the lower-priced starting point at 9 dollars per seat per month billed annually."
    }
  ]
};

export default asanaVsMondayContent;

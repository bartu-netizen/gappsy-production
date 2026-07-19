import type { GroupComparisonContent } from './types';

const basecampVsNtaskVsPaymoContent: GroupComparisonContent = {
  "verdict": "Basecamp, nTask, and Paymo all organize team work but solve for different priorities: Basecamp trades time tracking and invoicing for a calmer, flat-rate communication hub built around message boards and check-ins, nTask undercuts both on price while adding native risk and issue tracking, and Paymo is the only one of the three that turns tracked time directly into client invoices. Teams choosing between them are really choosing between simplicity, governance features, and billing workflow rather than raw feature count.",
  "bestFor": {
    "basecamp": "Teams that want a simple, flat-rate hub for to-do lists, async discussion, and file sharing without needing time tracking or invoicing.",
    "ntask": "Cost-conscious small teams that want task management bundled with native risk and issue tracking at a low per-user price.",
    "paymo": "Freelancers and small agencies that need time tracking to flow directly into client invoices without a separate billing tool."
  },
  "highlights": [
    {
      "title": "Flat-rate pricing for unlimited users",
      "description": "Basecamp offers a flat monthly fee that covers unlimited team members, unlike the per-user pricing that nTask and Paymo use on their paid tiers.",
      "toolSlugs": [
        "basecamp"
      ]
    },
    {
      "title": "Native risk and issue management",
      "description": "nTask includes a built-in risk register and issue tracking on its Business plan, a governance feature that is uncommon at this price point.",
      "toolSlugs": [
        "ntask"
      ]
    },
    {
      "title": "Time tracking that becomes an invoice",
      "description": "Paymo lets teams log billable hours against tasks and generate client invoices directly from that tracked time, without a separate app.",
      "toolSlugs": [
        "paymo"
      ]
    },
    {
      "title": "Low-cost entry points",
      "description": "nTask and Paymo both offer usable free plans for very small teams, while Basecamp relies on a 30-day free trial instead of a permanent free tier.",
      "toolSlugs": [
        "ntask",
        "paymo"
      ]
    }
  ],
  "featureMatrix": [
    {
      "group": "Task and Project Views",
      "rows": [
        {
          "feature": "Kanban boards",
          "statuses": {
            "basecamp": "not-documented",
            "ntask": "available",
            "paymo": "available"
          }
        },
        {
          "feature": "Gantt or timeline views",
          "statuses": {
            "basecamp": "not-documented",
            "ntask": "available",
            "paymo": "available"
          }
        }
      ]
    },
    {
      "group": "Time Tracking and Billing",
      "rows": [
        {
          "feature": "Native time tracking",
          "statuses": {
            "basecamp": "unavailable",
            "ntask": "available",
            "paymo": "available"
          }
        },
        {
          "feature": "Time-to-invoice workflow",
          "statuses": {
            "basecamp": "unavailable",
            "ntask": "not-documented",
            "paymo": "available"
          }
        }
      ]
    },
    {
      "group": "Collaboration",
      "rows": [
        {
          "feature": "Built-in team chat",
          "statuses": {
            "basecamp": "available",
            "ntask": "not-documented",
            "paymo": "not-documented"
          },
          "note": "Basecamp's Campfire chat is a core feature; nTask and Paymo focus on task comments rather than dedicated chat."
        },
        {
          "feature": "Message boards for async discussion",
          "statuses": {
            "basecamp": "available",
            "ntask": "not-documented",
            "paymo": "not-documented"
          }
        }
      ]
    },
    {
      "group": "Governance and Pricing",
      "rows": [
        {
          "feature": "Risk and issue management",
          "statuses": {
            "basecamp": "not-documented",
            "ntask": "available",
            "paymo": "not-documented"
          }
        },
        {
          "feature": "Permanent free plan",
          "statuses": {
            "basecamp": "unavailable",
            "ntask": "available",
            "paymo": "available"
          },
          "note": "Basecamp offers only a 30-day free trial rather than an always-free tier."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Does Basecamp include time tracking?",
      "answer": "No. Basecamp focuses on to-do lists, message boards, schedules, and chat; it has no native time tracking, so teams that need to log billable hours generally look at nTask or Paymo instead."
    },
    {
      "question": "Which of the three is cheapest for a very small team?",
      "answer": "nTask has the lowest cost of entry, with a free plan for up to 5 members and paid plans starting at $3 per user per month, undercutting Paymo's paid tiers and Basecamp's $15-per-user pricing."
    },
    {
      "question": "Can Paymo generate client invoices from tracked time?",
      "answer": "Yes. Paymo's time-to-invoice workflow lets teams turn logged billable hours directly into client invoices without connecting a separate invoicing app."
    },
    {
      "question": "Does nTask offer risk management on every plan?",
      "answer": "No. Risk and issue management in nTask is available starting on the Business plan; the Free and Premium plans focus on core task and project management."
    },
    {
      "question": "Is there a flat-rate option for unlimited users among these three?",
      "answer": "Basecamp is the only one of the three with a flat-rate unlimited-user plan; nTask and Paymo both scale their paid tiers by number of users."
    },
    {
      "question": "Which tool suits agencies that bill clients hourly?",
      "answer": "Paymo is built around that workflow, combining time tracking with invoicing so agencies can bill clients directly from logged hours."
    }
  ]
};

export default basecampVsNtaskVsPaymoContent;

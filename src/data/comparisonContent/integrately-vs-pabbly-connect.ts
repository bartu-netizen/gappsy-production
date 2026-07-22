import type { ToolComparisonContent } from './types';

const integratelyVsPabblyConnectContent: ToolComparisonContent = {
  "verdict": "Integrately and Pabbly Connect are both freemium no-code integration platforms, but they optimize for different things: Integrately leans on a library of 20M+ pre-built, one-click automations across 1,500+ apps so you rarely build a flow from scratch, while Pabbly Connect leans on a flat, tiered task-quota model where triggers, filters, routers, and formatters don't consume your monthly quota, plus built-in JavaScript/Python code steps. Neither is a strict upgrade over the other.",
  "bestForToolA": "Teams that want to activate ready-made, single-purpose automations in a few clicks (select, connect, activate) via SmartConnect, and don't need custom code steps or a fully unlimited-task plan.",
  "bestForToolB": "Teams running high-volume, filter-and-router-heavy workflows who want those internal steps to stay free of charge, want built-in JavaScript/Python code steps, and want the option of a flat-rate Unlimited tasks plan (~$60/month) instead of paying more per task tier.",
  "whoNeedsBoth": "Organizations mid-migration between the two platforms, or with different departments that already standardized on different tools, may run both simultaneously rather than one replacing the other outright.",
  "keyDifferences": [
    {
      "title": "Pre-built automations vs. custom workflow building",
      "toolA": "Ships 20M+ pre-built, one-click automations across 1,500+ apps, activated in three steps (select, connect, activate) via SmartConnect.",
      "toolB": "Provides a no-code workflow builder plus JavaScript and Python code steps for custom logic within a workflow.",
      "whyItMatters": "Pre-built automations get common integrations running faster, while custom code steps give more control over complex, non-standard logic.",
      "benefitsWho": "Teams wanting speed-to-first-automation favor Integrately; teams with developers who want to write custom logic favor Pabbly Connect."
    },
    {
      "title": "What counts against your task quota",
      "toolA": "Task consumption is tied to the plan's monthly task allowance (100 tasks free, up to 150,000/month on Business).",
      "toolB": "Triggers, filters, routers, and formatters are explicitly free and don't consume the monthly task quota — only action steps count.",
      "whyItMatters": "Workflows heavy in conditional routing or filtering can burn through a task quota much faster on a platform that counts every step.",
      "benefitsWho": "Teams building complex, filter-heavy multi-step automations benefit most from Pabbly Connect's free-internal-steps model."
    },
    {
      "title": "Branching and conditional logic availability",
      "toolA": "Branching, iterators, and auto-retry are reserved for the Professional plan and above; Free and Starter plans lack branching logic.",
      "toolB": "Advanced routing — path routers, iterators, schedulers, delays, and email parsing — is part of the platform's feature set.",
      "whyItMatters": "Access to conditional branching determines whether you can build multi-path workflows without upgrading tiers.",
      "benefitsWho": "Budget-conscious users on entry-level plans who need branching logic without paying for Integrately's Professional tier."
    },
    {
      "title": "Ceiling on task-based pricing",
      "toolA": "Tiered plans scale up to 150,000 tasks/month at $239/month (Business) — pricing stays tied to task volume even at the top tier.",
      "toolB": "Offers a flat-rate Unlimited plan at ₹4,999/month (~$60) with unlimited tasks, capping cost regardless of volume.",
      "whyItMatters": "High-volume automation users face very different cost ceilings depending on whether pricing is metered or flat.",
      "benefitsWho": "High-task-volume teams benefit from Pabbly Connect's flat Unlimited plan; teams with predictable, moderate task volumes may prefer Integrately's tiered structure."
    },
    {
      "title": "Trial vs. guarantee model",
      "toolA": "Offers a 14-day free trial on paid plans plus 24/5 live chat support on the free plan.",
      "toolB": "Backs paid plans with a 30-day money-back guarantee rather than a time-limited trial.",
      "whyItMatters": "A trial lets you test before paying; a money-back guarantee lets you pay and get a refund if it doesn't work out — different risk models for evaluation.",
      "benefitsWho": "Buyers who prefer to try before committing lean toward Integrately's trial; buyers comfortable paying upfront with a safety net lean toward Pabbly Connect's guarantee."
    }
  ],
  "featureMatrix": [
    {
      "group": "Core Automation Features",
      "rows": [
        {
          "feature": "Pre-built one-click automations",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Integrately lists 20M+ ready-made automations across 1,500+ apps."
        },
        {
          "feature": "Custom code steps (JavaScript/Python)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "Branching / conditional logic",
          "toolA": "limited",
          "toolB": "available",
          "note": "Integrately requires Professional plan or above for branching."
        },
        {
          "feature": "Advanced routing (path routers, schedulers, delays)",
          "toolA": "not-documented",
          "toolB": "available"
        },
        {
          "feature": "App integration count",
          "toolA": "available",
          "toolB": "available",
          "note": "Integrately: 1,500+ apps. Pabbly Connect: 2,000+ apps."
        }
      ]
    },
    {
      "group": "Pricing & Plans",
      "rows": [
        {
          "feature": "Free plan",
          "toolA": "available",
          "toolB": "available",
          "note": "Both cap the free plan at 100 tasks/month; Integrately's is single-step, Pabbly Connect's is 2-step."
        },
        {
          "feature": "Flat-rate unlimited-tasks tier",
          "toolA": "unavailable",
          "toolB": "available",
          "note": "Pabbly Connect's Unlimited plan is ~$60/month; Integrately's top published tier is metered at 150,000 tasks/month for $239/month."
        },
        {
          "feature": "Free/internal steps excluded from task quota",
          "toolA": "not-documented",
          "toolB": "available"
        }
      ]
    },
    {
      "group": "Trust & Support",
      "rows": [
        {
          "feature": "Free trial on paid plans",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Integrately offers a 14-day free trial."
        },
        {
          "feature": "Money-back guarantee",
          "toolA": "not-documented",
          "toolB": "available",
          "note": "Pabbly Connect offers a 30-day money-back guarantee."
        },
        {
          "feature": "Live chat support on free plan",
          "toolA": "available",
          "toolB": "not-documented",
          "note": "Integrately's free plan includes 24/5 live chat support."
        }
      ]
    }
  ],
  "faqs": [
    {
      "question": "Do Integrately and Pabbly Connect both have free plans?",
      "answer": "Yes. Both offer a free plan with 100 tasks per month — Integrately's is limited to single-step automations, while Pabbly Connect's is limited to 2-step workflows."
    },
    {
      "question": "Which platform has more app integrations?",
      "answer": "Pabbly Connect lists 2,000+ integrations, slightly more than Integrately's 1,500+ apps."
    },
    {
      "question": "Do triggers count against the task quota on either platform?",
      "answer": "On Pabbly Connect, no — triggers, filters, routers, and formatters are free and don't consume the monthly task quota. Integrately's task consumption isn't broken down this way in its documentation."
    },
    {
      "question": "Which platform supports custom code?",
      "answer": "Pabbly Connect includes built-in JavaScript and Python code steps for custom logic. This isn't documented as a feature of Integrately."
    },
    {
      "question": "Is there a flat-rate unlimited plan on either platform?",
      "answer": "Pabbly Connect offers an Unlimited plan at ₹4,999/month (~$60) with unlimited tasks. Integrately's highest published tier, Business, is metered at 150,000 tasks/month for $239/month."
    },
    {
      "question": "Do both platforms offer a trial or guarantee?",
      "answer": "Integrately offers a 14-day free trial on paid plans. Pabbly Connect instead backs paid plans with a 30-day money-back guarantee."
    }
  ]
};

export default integratelyVsPabblyConnectContent;
